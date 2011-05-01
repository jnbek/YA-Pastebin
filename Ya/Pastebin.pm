package Ya::Pastebin;

#===============================================================================
#
#         FILE:  Pastebin.pm
#
#  DESCRIPTION:  Yet Another Pastebin CGI-Ex style!!
#
#       AUTHOR:  John D Jones III (jnbek at yahoo dot com),
#      VERSION:  0.14
#      CREATED:  03/29/2010 03:55:56 PM
#===============================================================================

use strict;
use warnings;

use base qw(CGI::Ex::App);
use CGI::Ex::Dump qw(debug);

use FindBin;
our $base_path = $FindBin::RealBin;

use Syntax::Highlight::Engine::Kate;
use DBI;

our $VERSION = "0.14";
sub template_path {$base_path.'/templates'}

#sub post_navigate { debug shift->dump_history; }
sub main_hash_swap {
    my $self = shift;
    my $f    = $self->form;
    my $dbh  = $self->_dbh;
    $self->_chk_tree;
    $self->_expire_pastes;
    my ($paste, $the_code);
    delete $f->{'p'} if $f->{'p'} !~ m/[[:alnum:]]/g;
    if ($f->{'p'}) {
        $paste = $self->_get_paste($f->{'p'});
    }
    my $cfg = $self->_config;
    my $hl  = new Syntax::Highlight::Engine::Kate();
    my $ext = $hl->extensions;
    #$self->_dump $ext; #TODO: make this work better.
    my (@e, @ph, @recent_pastes);
    foreach my $l (values %$ext) {
        push @e, @$l;
    }
    my @langs = keys %{{ map { $_ => 1 } @e }};
    @langs = sort(@langs);

    my $sb_sql = $self->_query_db('recent_pastes');
    my $sth    = $dbh->prepare($sb_sql);
    $sth->execute;
    while (my $row = $sth->fetchrow_hashref) {
        my $rd = $self->_unix2date($row->{'date'});
        $row->{'date'} = $rd->{'date'};
        my $exp_h   = $self->_unix2date($row->{'expires'});
        my $expires = $exp_h->{'date'} . ' ' . $exp_h->{'time'};
        $row->{'expires'} = $expires;
        push @recent_pastes, $row;
    }
    if ($paste->{'code'} && $paste->{'filetype'}) {
        $the_code = $self->_hl_file($paste->{'code'}, $paste->{'filetype'});
    }
    else {
        $the_code = "<h3>This paste has expired and no longer exists.</h3>";
    }
    return {
        langs         => \@langs,
        recent_pastes => \@recent_pastes,
        code          => $paste->{'code'},
        hl_code       => $the_code,
        filename      => $paste->{'file'},
        language      => $paste->{'filetype'},
        version       => $VERSION,
        site_name     => $cfg->{'site_name'},
        site_slogan   => $cfg->{'site_slogan'},
        year          => $self->_unix2date(time,1),
    };
}

sub main_hash_validation {
    my $self = shift;
    return {
        filename => {
            required   => 1,
            min_length => 4,
            max_length => 254,
        },
        password => {
            required   => 0,
            min_length => 4,
            max_length => 32,
        },
    };
}

# filename language password expires the_code  <<--- form
# filetype paste_password date hash_id file expires <<--- db
# (?,?,?,?,UNIX_TIMESTAMP(),?,?)
sub main_finalize {
    my $self = shift;
    my $f    = $self->form;
    my $t    = time;
    my $sql  = $self->_query_db('insert');
    my $dbh  = $self->_dbh;
    my $cfg = $self->_config;
    use Digest::SHA qw(sha512_hex);
    my $hash_id = $self->_gen_id($cfg->{'hash_id_size'});

    # In case user has JS off dbl check filename.
    if (!$f->{'filename'} || length($f->{'filename'}) > 254) {
        $self->_dump({general_error => "Illegal Filename Provided. Please try again."});
        return 0;
    }
    my $paste_password;
    if ($f->{'password'}) {
        $paste_password = sha512_hex($f->{'password'});
    }
    my $expires = $t + $f->{'expires'};
    my $sth     = $dbh->prepare($sql);
    my $user;    #TODO: Decide if we're going to do logins
    eval {
        $sth->execute($f->{'language'}, $user, $paste_password, $t, $hash_id, $f->{'filename'},
            $expires);
    };
    if ($@) {
        $self->_dump({general_error => $DBI::errstr});
        $self->_dump($DBI::errstr);
        return 0;
    }
    $dbh->disconnect;
    $self->_save_file($f->{'filename'}, $f->{'the_code'});
    $self->add_to_form({p => $hash_id});
    $self->append_path('success');
    $self->set_ready_validate(0);
    return 1;
}

sub success_run_step {
    my $self = shift;
    $self->goto_step('main');
    return 1;
}

sub css_hash_swap {
    my $self  = shift;
    my $dir   = "$base_path/assets/css";
    my @files = glob($dir . '/*.css');
    my $content;
    foreach my $file (@files) {
        open my $FH, '<', $file || die $!;
        while (<$FH>) {
            $content .= $_;
        }
        close $FH;
    }

    $self->cgix->print_content_type('text/css');
    return {css_content => $content};
}

sub javascript_hash_swap {
    my $self  = shift;
    my $dir   = "$base_path/assets/js";
    my @files = glob($dir . '/*.js');
    my $content;
    foreach my $file (@files) {
        open my $FH, '<', $file || die $!;
        while (<$FH>) {
            $content .= $_;
        }
        close $FH; 
    }       

    $self->cgix->print_content_type('application/x-javascript');
    return {js_content => $content};
}

sub css_file_print {
    my $css = qq{[% css_content %]};
    return \$css;
}

sub javascript_file_print {
    my $js = qq{[% js_content %]};
    return \$js;
}

sub _get_paste {
    my $self = shift;
    my $p    = shift;
    my $sql  = $self->_query_db('get_paste');
    my $dbh  = $self->_dbh;
    my $cfg  = $self->_config;
    my $dir  = qq{$cfg->{'base_path'}/$cfg->{'storage_path'}};
    my $sth  = $dbh->prepare($sql);
    $sth->execute($p);
    my $paste = $sth->fetchrow_hashref || undef;
    $sth = undef;
    $dbh->disconnect;

    if ($paste->{'file'}) {
        $paste->{'code'} = do { local (@ARGV, $/) = qq{$dir/$paste->{'file'}}; <> };
    }
    else {
        $paste->{'code'} = undef;
    }
    return $paste;
}

sub _expire_pastes {
    my $self = shift;
    my $sql  = $self->_query_db('do_expire');
    my $dbh  = $self->_dbh;
    my $cfg  = $self->_config;
    my $now  = time;
    my $dir  = qq{$cfg->{'base_path'}/$cfg->{'storage_path'}};

    #delete the actual filename
    opendir(my $dh, $dir) || $self->_dump("Can't open $dir: $!",{fatal => 1});
    while (my $file = readdir($dh)) {
        next if $file =~ m/^\./;
        my @stat      = stat("$dir/$file");
        my $r_expired = $self->_query_db('r_expired');
        my $sth_exp   = $dbh->prepare($r_expired);
        $sth_exp->execute($file);
        my $ex = $sth_exp->fetchrow_hashref;
        if (-f "$dir/$ex->{'file'}") {

            # If there's a file and no DB entry delete it too.
            if (!$ex->{'expires'} || $now >= $ex->{'expires'}) {
                unlink "$dir/$file" || $self->_dump("Couldn't Remove $file: $!");
            }
        }
        $sth_exp = undef;

    }
    closedir $dh;
    my $sth = $dbh->prepare($sql);
    eval { $sth->execute($now) };
    if ($@) {
        $self->_dump($@);
        $self->_dump({general_error => $DBI::errstr});
        return 0;
    }
    $sth = undef;
    $dbh->disconnect;
    return 1;
}

sub _gen_id {
    my $self   = shift;
    my $size   = shift;
    my @an     = ('a' .. 'z', 'A' .. 'Z', 0 .. 9);
    my $str = join '', (map { $an[rand @an] } @an)[0 .. $size];
    if ($self->_get_paste($str)->{'code'}) {
        $self->_gen_id($size);
    }
    return $str;
}

sub _config {
    my $self = shift;
    require config;
    my $cfg = config->config;
    return $cfg;
}

sub _dbh {
    my $self   = shift;
    my $cfg    = $self->_config;
    my $dbname = $cfg->{'dbname'};
    my $dbuser = $cfg->{'dbuser'};
    my $dbpass = $cfg->{'dbpass'};
    my $dbhost = $cfg->{'dbhost'};
    my $dbport = $cfg->{'dbport'};
    my $dsn    = "dbi:mysql:database=$dbname;host=$dbhost;port=$dbport";
    my $dbh    = DBI->connect($dsn, $dbuser, $dbpass, {RaiseError => 1, AutoCommit => 1})
      || $self->_dump($DBI::errstr);
    return $dbh;
}

sub _query_db {
    my $self          = shift;
    my $q             = shift;
    my @pastes_schema = qw( filetype user paste_password date hash_id file expires );
    my $sql           = {
        insert =>
          'INSERT INTO pastes ( filetype, user, paste_password, date, hash_id, file, expires ) VALUES (?,?,?,?,?,?,?)',
        get_paste     => 'SELECT * FROM pastes WHERE hash_id = ?',
        recent_pastes => 'SELECT * FROM pastes ORDER BY date DESC LIMIT 10',
        users         => 'SELECT * FROM users',
        do_expire     => 'DELETE FROM pastes WHERE expires <= ?',
        r_expired     => 'SELECT file,expires from pastes WHERE file = ?',
    };
    return $sql->{$q};
}

sub _save_file {
    my $self      = shift;
    my $file      = shift;
    my $code      = shift;
    my $cfg       = $self->_config;
    my $directory = qq{$cfg->{'base_path'}/$cfg->{'storage_path'}};
    $self->_dump("$directory doesn't exist. Please create it and continue") if !-e $directory;
    $self->_dump("$directory isn't writable. Please correct this problem.") if !-w $directory;
    open my $FH, '>', "$directory/$file" || $self->_dump("Failed to open $directory/$file: $!");
    print $FH $code;
    close($FH);

    return 1;
}


sub _unix2date {
    my $self = shift;
    my $unix = shift;    #UNIX Epoch
    my $yr   = shift;    #pass for year only
    my $h    = {};
    my @months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
    my ($sec, $min, $hour, $day, $month, $year) = (localtime($unix))[0, 1, 2, 3, 4, 5, 6];
    return $year+1900 if $yr;
    my $date = "$day-$months[$month]-" . ($year + 1900);
    my $time = "$hour:$min:$sec";
    $h->{'date'} = $date;
    $h->{'time'} = $time;
    return $h;
}
sub _chk_tree {
    my $self = shift;
    my $cfg  = $self->_config;
    if (!-e $cfg->{'base_path'}) {
        mkdir $cfg->{'base_path'} || $self->_dump(qq{Could not create $cfg->{'base_path'}: $!},{fatal => 1});
    }
    if (!-e $cfg->{'base_path'}."/".$cfg->{'storage_path'}) {
        mkdir $cfg->{'base_path'}."/".$cfg->{'storage_path'} ||
            $self->_dump(qq{Could not create $cfg->{'base_path'}/$cfg->{'storage_path'}: $!},{fatal => 1});
    }
    else {
        return 0;
    }
}
sub _dump {
    my $self = shift;
    my @error = @_;
    my $die = pop @error if ref $error[$#error] eq 'HASH';
    debug @error;
    if ($die->{'fatal'}){
        exit(0);
    }
    return 0;
}
sub _hl_file {
    my $self = shift;
    my ($file, $type) = @_;
    my $hl = new Syntax::Highlight::Engine::Kate(
        language      => ucfirst($type),
        substitutions => {
            "<"  => "&lt;",
            ">"  => "&gt;",
            "&"  => "&amp;",
            " "  => "&nbsp;",
            "\t" => "&nbsp;&nbsp;&nbsp;&nbsp;",
            "\n" => "",
        },
        format_table => {
            Alert        => ["<span class='alert'>",        "</span>"],
            BaseN        => ["<span class='basen'>",        "</span>"],
            BString      => ["<span class='bstring'>",      "</span>"],
            Char         => ["<span class='char'>",         "</span>"],
            Comment      => ["<span class='comment'>",      "</span>"],
            DataType     => ["<span class='datatype'>",     "</span>"],
            DecVal       => ["<span class='decval'>",       "</span>"],
            Error        => ["<span class='error'>",        "</span>"],
            Float        => ["<span class='float'>",        "</span>"],
            Function     => ["<span class='function'>",     "</span>"],
            IString      => ["<span class='istring'>",      "</span>"],
            Keyword      => ["<span class='keyword'>",      "</span>"],
            Normal       => ["<span class='normal'>",       "</span>"],
            Operator     => ["<span class='operator'>",     "</span>"],
            Others       => ["<span class='others'>",       "</span>"],
            RegionMarker => ["<span class='regionmarker'>", "</span>"],
            Reserved     => ["<span class='reserved'>",     "</span>"],
            String       => ["<span class='string'>",       "</span>"],
            Variable     => ["<span class='variable'>",     "</span>"],
            Warning      => ["<span class='warning'>",      "</span>"],
        },
    );
    return $hl->highlightText($file);
}    # ----------  end of subroutine hl_file  ----------
1;
__END__

=head1 Ya::Pastebin

Ya::Pastebin - Yet Another Pastebin

=head1 SYNOPSIS

    #!/usr/bin/perl -w

    use strict;
    use warnings;
    use Ya::Pastebin;

    Ya::Pastebin->navigate;
    exit;

=head1 DESCRIPTION

A CGI::Ex powered pastebin written using, well CGI::Ex, Template::Alloy, and Syntax::Hightlight::Engine::Kate with a MySQL backend.
Written mostly becuase I hate PHP, and more importantly, there aren't enough Open Source applications written with CGI::Ex. This
is very sad, so this is my first stab at an Open Source App.

=head1 SEE ALSO

    CGI::Ex::App
    Template::Alloy
    DBI
    Syntax::Highlight::Engine::Kate

=head1 AUTHOR

John D Jones III, E<lt>jnbek at yahoo dot comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by John D Jones III

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=head1 THANKS

Thanks to Paul Seamons for writing CGI::Ex and being a really really nice guy!! :)
=cut
