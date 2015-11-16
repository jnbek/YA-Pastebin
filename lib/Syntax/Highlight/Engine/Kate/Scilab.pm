# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'sci.xml' file of the syntax highlight
# engine of the kate text editor (http://www.kate-editor.org

#kate xml version 1.03
#kate version 2.3
#generated: Sun Feb  3 22:02:06 2008, localtime

package Syntax::Highlight::Engine::Kate::Scilab;

our $VERSION = '0.06';

use strict;
use warnings;
use base('Syntax::Highlight::Engine::Kate::Template');

sub new {
   my $proto = shift;
   my $class = ref($proto) || $proto;
   my $self = $class->SUPER::new(@_);
   $self->attributes({
      'Comment' => 'Comment',
      'Constants-keyword' => 'Variable',
      'Control-keywords' => 'Operator',
      'Decimal' => 'DecVal',
      'Float' => 'Float',
      'Function-keywords' => 'Function',
      'Normal Text' => 'Normal',
      'String' => 'String',
      'Structure-keywords' => 'Keyword',
      'Warning-keywords' => 'Others',
      'functions' => 'Function',
   });
   $self->listAdd('Constants-keyword',
      '$',
      '%F',
      '%T',
      '%e',
      '%eps',
      '%f',
      '%i',
      '%inf',
      '%io',
      '%nan',
      '%pi',
      '%s',
      '%t',
      '%z',
      'MSDOS',
   );
   $self->listAdd('Control-keywords',
      'abort',
      'break',
      'pause',
      'quit',
      'resume',
      'return',
   );
   $self->listAdd('Function-keywords',
      'endfunction',
      'function',
   );
   $self->listAdd('Structure-keywords',
      'do',
      'else',
      'elseif',
      'end',
      'for',
      'if',
      'select',
      'then',
      'while',
   );
   $self->listAdd('Warning-keywords',
      'error',
      'warning',
   );
   $self->listAdd('functions',
      '%asn',
      '%helps',
      '%k',
      '%sn',
      'ABSBLK_f',
      'AFFICH_f',
      'ANDLOG_f',
      'ANIMXY_f',
      'AdCommunications',
      'BIGSOM_f',
      'CLINDUMMY_f',
      'CLKINV_f',
      'CLKIN_f',
      'CLKOUTV_f',
      'CLKOUT_f',
      'CLKSOMV_f',
      'CLKSOM_f',
      'CLKSPLIT_f',
      'CLOCK_f',
      'CLR_f',
      'CLSS_f',
      'CONST_f',
      'COSBLK_f',
      'CURV_f',
      'Communications',
      'CreateLink',
      'DELAYV_f',
      'DELAY_f',
      'DEMUX_f',
      'DLRADAPT_f',
      'DLR_f',
      'DLSS_f',
      'DestroyLink',
      'EVENTSCOPE_f',
      'EVTDLY_f',
      'EVTGEN_f',
      'EXPBLK_f',
      'Example',
      'ExecAppli',
      'ExecScilab',
      'ExeclScilab',
      'GAINBLK_f',
      'GAIN_f',
      'GENERAL_f',
      'GENERIC_f',
      'GENSIN_f',
      'GENSQR_f',
      'G_make',
      'GetMsg',
      'Graphics',
      'HALT_f',
      'IFTHEL_f',
      'INTEGRAL_f',
      'INTRP2BLK_f',
      'INTRPLBLK_f',
      'INVBLK_f',
      'IN_f',
      'LOGBLK_f',
      'LOOKUP_f',
      'MAX_f',
      'MCLOCK_f',
      'MFCLCK_f',
      'MIN_f',
      'MUX_f',
      'Matplot',
      'Matplot1',
      'NEGTOPOS_f',
      'OUT_f',
      'POSTONEG_f',
      'POWBLK_f',
      'PROD_f',
      'QUANT_f',
      'RAND_f',
      'READC_f',
      'REGISTER_f',
      'RELAY_f',
      'RFILE_f',
      'SAMPLEHOLD_f',
      'SAT_f',
      'SAWTOOTH_f',
      'SCOPE_f',
      'SCOPXY_f',
      'SELECT_f',
      'SINBLK_f',
      'SOM_f',
      'SPLIT_f',
      'STOP_f',
      'SUPER_f',
      'ScilabEval',
      'SendMsg',
      'Sfgrayplot',
      'Sgrayplot',
      'TANBLK_f',
      'TCLSS_f',
      'TEXT_f',
      'TIME_f',
      'TK_EvalFile',
      'TK_EvalStr',
      'TK_GetVar',
      'TK_SetVar',
      'TRASH_f',
      'WFILE_f',
      'WRITEC_f',
      'WaitMsg',
      'ZCROSS_f',
      'abcd',
      'abinv',
      'abs',
      'acos',
      'acosh',
      'acoshm',
      'acosm',
      'add_edge',
      'add_node',
      'addcolor',
      'addf',
      'addinter',
      'addmenu',
      'adj2sp',
      'adj_lists',
      'aff2ab',
      'alufunctions',
      'amell',
      'analpf',
      'analyze',
      'and',
      'ans',
      'apropos',
      'arc_graph',
      'arc_number',
      'argn',
      'arhnk',
      'arl2',
      'arma',
      'arma2p',
      'armac',
      'armax',
      'armax1',
      'arsimul',
      'artest',
      'articul',
      'ascii',
      'asin',
      'asinh',
      'asinhm',
      'asinm',
      'atan',
      'atanh',
      'atanhm',
      'atanm',
      'augment',
      'auread',
      'auwrite',
      'backslash',
      'balanc',
      'balreal',
      'bandwr',
      'bdiag',
      'besseli',
      'besselj',
      'besselk',
      'bessely',
      'best_match',
      'bezout',
      'bifish',
      'bilin',
      'binomial',
      'black',
      'bloc2exp',
      'bloc2ss',
      'bode',
      'bool2s',
      'boolean',
      'boucle',
      'bstap',
      'buttmag',
      'bvode',
      'c_link',
      'cainv',
      'calerf',
      'calfrq',
      'call',
      'canon',
      'casc',
      'ccontrg',
      'cdfbet',
      'cdfbin',
      'cdfchi',
      'cdfchn',
      'cdff',
      'cdffnc',
      'cdfgam',
      'cdfnbn',
      'cdfnor',
      'cdfpoi',
      'cdft',
      'ceil',
      'cepstrum',
      'chain_struct',
      'chaintest',
      'champ',
      'champ1',
      'chart',
      'chdir',
      'cheb1mag',
      'cheb2mag',
      'check_graph',
      'chepol',
      'chfact',
      'chol',
      'chsolve',
      'circuit',
      'classmarkov',
      'clean',
      'clear',
      'clearfun',
      'clearglobal',
      'close',
      'cls2dls',
      'cmb_lin',
      'cmndred',
      'code2str',
      'coeff',
      'coff',
      'coffg',
      'colcomp',
      'colcompr',
      'colinout',
      'colnew',
      'colon',
      'colormap',
      'colregul',
      'comp',
      'companion',
      'con_nodes',
      'cond',
      'conj',
      'connex',
      'cont_frm',
      'cont_mat',
      'contour',
      'contour2d',
      'contour2di',
      'contourf',
      'contr',
      'contract_edge',
      'contrss',
      'convex_hull',
      'convol',
      'convstr',
      'copfac',
      'corr',
      'cos',
      'cosh',
      'coshm',
      'cosm',
      'cotg',
      'coth',
      'cothm',
      'csim',
      'cspect',
      'ctr_gram',
      'cumprod',
      'cumsum',
      'curblock',
      'cycle_basis',
      'czt',
      'dasrt',
      'dassl',
      'datafit',
      'date',
      'dbphi',
      'dcf',
      'ddp',
      'debug',
      'dec2hex',
      'deff',
      'degree',
      'delbpt',
      'delete_arcs',
      'delete_nodes',
      'delip',
      'delmenu',
      'demos',
      'denom',
      'derivat',
      'derivative-',
      'des2ss',
      'des2tf',
      'det',
      'determ',
      'detr',
      'dft',
      'dhnorm',
      'diag',
      'diary',
      'diophant',
      'disp',
      'dispbpt',
      'dispfile',
      'dlgamma',
      'dot',
      'double',
      'dragrect',
      'drawaxis',
      'driver',
      'dscr',
      'dsimul',
      'dt_ility',
      'dtsi',
      'edge_number',
      'edit',
      'edit_curv',
      'eigenmarkov',
      'ell1mag',
      'empty',
      'emptystr',
      'eqfir',
      'eqiir',
      'equal',
      'equil',
      'equil1',
      'ereduc',
      'erf',
      'erfc',
      'erfcx',
      'errbar',
      'errcatch',
      'errclear',
      'error',
      'eval',
      'eval3d',
      'eval3dp',
      'evans',
      'evstr',
      'excel2sci',
      'exec',
      'execstr',
      'exists',
      'exit',
      'exp',
      'expm',
      'external',
      'extraction',
      'eye',
      'fac3d',
      'factors',
      'faurre',
      'fchamp',
      'fcontour',
      'fcontour2d',
      'fec',
      'feedback',
      'feval',
      'ffilt',
      'fft',
      'fgrayplot',
      'figure',
      'file',
      'fileinfo',
      'filter',
      'find',
      'find_freq',
      'find_path',
      'findm',
      'findobj',
      'fit_dat',
      'fix',
      'floor',
      'flts',
      'format',
      'formatman',
      'fort',
      'fourplan',
      'fplot2d',
      'fplot3d',
      'fplot3d1',
      'fprintf',
      'fprintfMat',
      'frep2tf',
      'freq',
      'freson',
      'frexp',
      'frfit',
      'frmag',
      'fscanf',
      'fscanfMat',
      'fsfirlin',
      'fsolve',
      'fspecg',
      'fstabst',
      'fstair',
      'full',
      'fullrf',
      'fullrfk',
      'fun2string',
      'funcprot',
      'funptr',
      'fusee',
      'g_margin',
      'gainplot',
      'gamitg',
      'gamma',
      'gammaln',
      'gcare',
      'gcd',
      'gcf',
      'gen_net',
      'genfac3d',
      'genlib',
      'genmarkov',
      'geom3d',
      'get',
      'get_function_path',
      'getblocklabel',
      'getcolor',
      'getcwd',
      'getd',
      'getdate',
      'getenv',
      'getf',
      'getfield',
      'getfont',
      'getio',
      'getlinestyle',
      'getmark',
      'getpid',
      'getscicosvars',
      'getsymbol',
      'getvalue',
      'getversion',
      'gfare',
      'gfrancis',
      'girth',
      'givens',
      'glever',
      'glist',
      'global',
      'gpeche',
      'gr_menu',
      'graduate',
      'grand',
      'graph-list',
      'graph_2_mat',
      'graph_center',
      'graph_complement',
      'graph_diameter',
      'graph_power',
      'graph_simp',
      'graph_sum',
      'graph_union',
      'graycolormap',
      'grayplot',
      'graypolarplot',
      'grep',
      'group',
      'gschur',
      'gsort',
      'gspec',
      'gstacksize',
      'gtild',
      'h2norm',
      'h_cl',
      'h_inf',
      'h_inf_st',
      'h_norm',
      'halt',
      'hamilton',
      'hank',
      'hankelsv',
      'hat',
      'havewindow',
      'help',
      'hermit',
      'hess',
      'hex2dec',
      'hilb',
      'hist3d',
      'histplot',
      'horner',
      'host',
      'hotcolormap',
      'householder',
      'hrmt',
      'htrianr',
      'hypermat',
      'hypermatrices',
      'iconvert',
      'ieee',
      'iir',
      'iirgroup',
      'iirlp',
      'ilib_build',
      'ilib_compile',
      'ilib_for_link',
      'ilib_gen_Make',
      'ilib_gen_gateway',
      'ilib_gen_loader',
      'im_inv',
      'imag',
      'impl',
      'imrep2ss',
      'input',
      'insertion',
      'int',
      'int16',
      'int2d',
      'int32',
      'int3d',
      'int8',
      'intc',
      'intdec',
      'integrate',
      'interp',
      'interpln',
      'intersci',
      'intersect',
      'intg',
      'intl',
      'intppty',
      'intsplin',
      'inttrap',
      'inttype',
      'inv',
      'inv_coeff',
      'invr',
      'invsyslin',
      'is_connex',
      'isdef',
      'iserror',
      'isglobal',
      'isinf',
      'isnan',
      'isoview',
      'isreal',
      'jmat',
      'kalm',
      'karmarkar',
      'kernel',
      'keyboard',
      'knapsack',
      'kpure',
      'krac2',
      'kron',
      'kroneck',
      'lasterror',
      'lattn',
      'lattp',
      'lcf',
      'lcm',
      'lcmdiag',
      'ldiv',
      'ldivf',
      'leastsq',
      'left',
      'legends',
      'length',
      'leqr',
      'less',
      'lev',
      'levin',
      'lex_sort',
      'lft',
      'lgfft',
      'lib',
      'lin',
      'lin2mu',
      'lindquist',
      'line_graph',
      'lines',
      'linf',
      'linfn',
      'link',
      'linpro',
      'linsolve',
      'linspace',
      'list',
      'lmisolver',
      'lmitool',
      'load',
      'load_graph',
      'loadwave',
      'locate',
      'log',
      'log10',
      'log2',
      'logm',
      'logspace',
      'lotest',
      'lqe',
      'lqg',
      'lqg2stan',
      'lqg_ltr',
      'lqr',
      'lsslist',
      'lstcat',
      'ltitr',
      'lu',
      'ludel',
      'lufact',
      'luget',
      'lusolve',
      'lyap',
      'm_circle',
      'macglov',
      'macr2lst',
      'macro',
      'macrovar',
      'make_graph',
      'man',
      'manedit',
      'mapsound',
      'markp2ss',
      'mat_2_graph',
      'matrices',
      'matrix',
      'max',
      'max_cap_path',
      'max_clique',
      'max_flow',
      'maxi',
      'mclearerr',
      'mclose',
      'mean',
      'median',
      'meof',
      'mese',
      'mesh2d',
      'metanet',
      'metanet_sync',
      'mfft',
      'mfile2sci',
      'mfprintf',
      'mfscanf',
      'mget',
      'mgeti',
      'mgetl',
      'mgetstr',
      'milk_drop',
      'min',
      'min_lcost_cflow',
      'min_lcost_flow1',
      'min_lcost_flow2',
      'min_qcost_flow',
      'min_weight_tree',
      'mine',
      'mini',
      'minreal',
      'minss',
      'minus',
      'mlist',
      'mode',
      'modulo',
      'mopen',
      'mprintf',
      'mps2linpro',
      'mput',
      'mputl',
      'mputstr',
      'mrfit',
      'mscanf',
      'mseek',
      'msprintf',
      'msscanf',
      'mtell',
      'mtlb_load',
      'mtlb_mode',
      'mtlb_save',
      'mtlb_sparse',
      'mu2lin',
      'mulf',
      'names',
      'narsimul',
      'nehari',
      'neighbors',
      'netclose',
      'netwindow',
      'netwindows',
      'newest',
      'newfun',
      'nf3d',
      'nlev',
      'nnz',
      'node_number',
      'nodes_2_path',
      'nodes_degrees',
      'noisegen',
      'norm',
      'not',
      'null',
      'numer',
      'nyquist',
      'obs_gram',
      'obscont',
      'obscont1',
      'observer',
      'obsv_mat',
      'obsvss',
      'ode',
      'ode_discrete',
      'ode_root',
      'odedc',
      'odedi',
      'odeoptions',
      'oldload',
      'oldsave',
      'ones',
      'optim',
      'or',
      'orth',
      'overloading',
      'p_margin',
      'param3d',
      'param3d1',
      'paramfplot2d',
      'parents',
      'parrot',
      'part',
      'path_2_nodes',
      'pbig',
      'pdiv',
      'pen2ea',
      'pencan',
      'penlaur',
      'percent',
      'perfect_match',
      'pertrans',
      'pfss',
      'phasemag',
      'phc',
      'pinv',
      'pipe_network',
      'playsnd',
      'plot',
      'plot2d',
      'plot2d1',
      'plot2d2',
      'plot2d3',
      'plot2d4',
      'plot3d',
      'plot3d1',
      'plot3d2',
      'plot3d3',
      'plot_graph',
      'plotframe',
      'plotprofile',
      'plus',
      'plzr',
      'pmodulo',
      'pol2des',
      'pol2str',
      'pol2tex',
      'polar',
      'polarplot',
      'polfact',
      'poly',
      'portr3d',
      'portrait',
      'power',
      'ppol',
      'prbs_a',
      'predecessors',
      'predef',
      'print',
      'printf',
      'printf_conversion',
      'printing',
      'prod',
      'profile',
      'proj',
      'projsl',
      'projspec',
      'psmall',
      'pspect',
      'pvm',
      'pvm_addhosts',
      'pvm_bcast',
      'pvm_bufinfo',
      'pvm_config',
      'pvm_delhosts',
      'pvm_error',
      'pvm_exit',
      'pvm_get_timer',
      'pvm_getinst',
      'pvm_gsize',
      'pvm_halt',
      'pvm_joingroup',
      'pvm_kill',
      'pvm_lvgroup',
      'pvm_mytid',
      'pvm_probe',
      'pvm_recv',
      'pvm_reduce',
      'pvm_sci2f77',
      'pvm_send',
      'pvm_set_timer',
      'pvm_spawn',
      'pvm_spawn_independent',
      'pvm_start',
      'pvm_tidtohost',
      'pvmd3',
      'pwd',
      'qassign',
      'qr',
      'quapro',
      'quaskro',
      'quit',
      'quote',
      'rand',
      'randpencil',
      'range',
      'rank',
      'rat',
      'rational',
      'rcond',
      'rdivf',
      'read',
      'read4b',
      'readb',
      'readc_',
      'readmps',
      'real',
      'recur',
      'reglin',
      'remez',
      'remezb',
      'repfreq',
      'replot',
      'residu',
      'ric_desc',
      'ricc',
      'riccati',
      'rlist',
      'roots',
      'rotate',
      'round',
      'routh_t',
      'rowcomp',
      'rowcompr',
      'rowinout',
      'rowregul',
      'rowshuff',
      'rpem',
      'rref',
      'rtitr',
      'salesman',
      'save',
      'save_graph',
      'savewave',
      'scaling',
      'scanf',
      'scanf_conversion',
      'schur',
      'sci2exp',
      'sci2for',
      'sci2map',
      'sciargs',
      'scicos',
      'scicos_block',
      'scicos_cpr',
      'scicos_graphics',
      'scicos_link',
      'scicos_main',
      'scicos_menus',
      'scicos_model',
      'scicosim',
      'scifunc_block',
      'scilab',
      'scilink',
      'sd2sci',
      'secto3d',
      'semi',
      'semicolumn',
      'semidef',
      'sensi',
      'set',
      'setbpt',
      'setfield',
      'setmenu',
      'setscicosvars',
      'sfact',
      'sgrid',
      'shortest_path',
      'show_arcs',
      'show_graph',
      'show_nodes',
      'showprofile',
      'sign',
      'signm',
      'simp',
      'simp_mode',
      'sin',
      'sinc',
      'sincd',
      'sinh',
      'sinhm',
      'sinm',
      'size',
      'slash',
      'sm2des',
      'sm2ss',
      'smooth',
      'solve',
      'sort',
      'sound',
      'sp2adj',
      'spaninter',
      'spanplus',
      'spantwo',
      'sparse',
      'spchol',
      'spcompack',
      'spec',
      'specfact',
      'speye',
      'spget',
      'splin',
      'split_edge',
      'spones',
      'sprand',
      'sprintf',
      'spzeros',
      'sqroot',
      'sqrt',
      'sqrtm',
      'square',
      'squarewave',
      'srfaur',
      'srkf',
      'ss2des',
      'ss2ss',
      'ss2tf',
      'sscanf',
      'sskf',
      'ssprint',
      'ssrand',
      'st_deviation',
      'st_ility',
      'stabil',
      'stacksize',
      'standard_define',
      'standard_draw',
      'standard_input',
      'standard_origin',
      'standard_output',
      'star',
      'startup',
      'str2code',
      'strcat',
      'strindex',
      'string',
      'strings',
      'stripblanks',
      'strong_con_nodes',
      'strong_connex',
      'strsubst',
      'subf',
      'subgraph',
      'subplot',
      'successors',
      'sum',
      'supernode',
      'sva',
      'svd',
      'svplot',
      'sylm',
      'sylv',
      'symbols',
      'sysconv',
      'sysdiag',
      'sysfact-',
      'syslin',
      'syssize',
      'system',
      'systems',
      'systmat',
      'tan',
      'tangent',
      'tanh',
      'tanhm',
      'tanm',
      'tdinit',
      'testmatrix',
      'texprint',
      'tf2des',
      'tf2ss',
      'tilda',
      'time_id',
      'timer',
      'titlepage',
      'tlist',
      'toeplitz',
      'trace',
      'trans',
      'trans_closure',
      'translatepaths',
      'trfmod',
      'trianfml',
      'tril',
      'trisolve',
      'triu',
      'trzeros',
      'type',
      'typename',
      'typeof',
      'ui_observer',
      'uicontrol',
      'uimenu',
      'uint16',
      'uint32',
      'uint8',
      'ulink',
      'union',
      'unique',
      'unix',
      'unix_g',
      'unix_s',
      'unix_w',
      'unix_x',
      'unobs',
      'unsetmenu',
      'user',
      'varargin',
      'varargout',
      'varn',
      'warning',
      'wavread',
      'wavwrite',
      'wfir',
      'what',
      'where',
      'whereami',
      'whereis',
      'who',
      'whos',
      'wiener',
      'wigner',
      'window',
      'winsid',
      'writb',
      'write',
      'write4b',
      'x_choices',
      'x_choose',
      'x_dialog',
      'x_matrix',
      'x_mdialog',
      'x_message',
      'x_message_modeless',
      'xarc',
      'xarcs',
      'xarrows',
      'xaxis',
      'xbasc',
      'xbasimp',
      'xbasr',
      'xchange',
      'xclea',
      'xclear',
      'xclick',
      'xclip',
      'xdel',
      'xend',
      'xfarc',
      'xfarcs',
      'xfpoly',
      'xfpolys',
      'xfrect',
      'xget',
      'xgetech',
      'xgetfile',
      'xgetmouse',
      'xgraduate',
      'xgrid',
      'xinfo',
      'xinit',
      'xlfont',
      'xload',
      'xname',
      'xnumb',
      'xpause',
      'xpoly',
      'xpolys',
      'xrect',
      'xrects',
      'xrpoly',
      'xs2fig',
      'xsave',
      'xsegs',
      'xselect',
      'xset',
      'xsetech',
      'xsetm',
      'xstring',
      'xstringb',
      'xstringl',
      'xtape',
      'xtitle',
      'yulewalk',
      'zeropen',
      'zeros',
      'zgrid',
      'zpbutt',
      'zpch1',
      'zpch2',
      'zpell',
   );
   $self->contextdata({
      'main' => {
         callback => \&parsemain,
         attribute => 'Normal Text',
      },
   });
   $self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\|\\%|\\$');
   $self->basecontext('main');
   $self->keywordscase(0);
   $self->initialize;
   bless ($self, $class);
   return $self;
}

sub language {
   return 'scilab';
}

sub parsemain {
   my ($self, $text) = @_;
   # String => 'Structure-keywords'
   # attribute => 'Structure-keywords'
   # context => '#stay'
   # type => 'keyword'
   if ($self->testKeyword($text, 'Structure-keywords', 0, undef, 0, '#stay', 'Structure-keywords')) {
      return 1
   }
   # String => 'Control-keywords'
   # attribute => 'Control-keywords'
   # context => '#stay'
   # type => 'keyword'
   if ($self->testKeyword($text, 'Control-keywords', 0, undef, 0, '#stay', 'Control-keywords')) {
      return 1
   }
   # String => 'Function-keywords'
   # attribute => 'Function-keywords'
   # context => '#stay'
   # type => 'keyword'
   if ($self->testKeyword($text, 'Function-keywords', 0, undef, 0, '#stay', 'Function-keywords')) {
      return 1
   }
   # String => 'Warning-keywords'
   # attribute => 'Warning-keywords'
   # context => '#stay'
   # type => 'keyword'
   if ($self->testKeyword($text, 'Warning-keywords', 0, undef, 0, '#stay', 'Warning-keywords')) {
      return 1
   }
   # String => 'Constants-keyword'
   # attribute => 'Constants-keyword'
   # context => '#stay'
   # type => 'keyword'
   if ($self->testKeyword($text, 'Constants-keyword', 0, undef, 0, '#stay', 'Constants-keyword')) {
      return 1
   }
   # String => 'functions'
   # attribute => 'functions'
   # context => '#stay'
   # type => 'keyword'
   if ($self->testKeyword($text, 'functions', 0, undef, 0, '#stay', 'functions')) {
      return 1
   }
   # attribute => 'Float'
   # context => '#stay'
   # type => 'Float'
   if ($self->testFloat($text, 0, undef, 0, '#stay', 'Float')) {
      return 1
   }
   # attribute => 'Decimal'
   # context => '#stay'
   # type => 'Int'
   if ($self->testInt($text, 0, undef, 0, '#stay', 'Decimal')) {
      return 1
   }
   # String => '//.*$'
   # attribute => 'Comment'
   # context => '#stay'
   # type => 'RegExpr'
   if ($self->testRegExpr($text, '//.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
      return 1
   }
   # attribute => 'String'
   # char => '"'
   # char1 => '"'
   # context => '#stay'
   # type => 'RangeDetect'
   if ($self->testRangeDetect($text, '"', '"', 0, 0, undef, 0, '#stay', 'String')) {
      return 1
   }
   return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Scilab - a Plugin for scilab syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Scilab;
 my $sh = new Syntax::Highlight::Engine::Kate::Scilab([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Scilab is a  plugin module that provides syntax highlighting
for scilab to the Syntax::Haghlight::Engine::Kate highlighting engine.

This code is generated from the syntax definition files used
by the Kate project.
It works quite fine, but can use refinement and optimization.

It inherits Syntax::Higlight::Engine::Kate::Template. See also there.

=cut

=head1 AUTHOR

Hans Jeuken (haje <at> toneel <dot> demon <dot> nl)

=cut

=head1 BUGS

Unknown. If you find any, please contact the author

=cut
