SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE DATABASE ya-pastebin;

DROP TABLE IF EXISTS `pastes`;
CREATE TABLE IF NOT EXISTS `pastes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `filetype` varchar(25) collate utf8_unicode_ci NOT NULL,
  `user` varchar(25) collate utf8_unicode_ci NOT NULL default 'Anonymous',
  `paste_password` varchar(128) collate utf8_unicode_ci default NULL,
  `date` int(12) unsigned NOT NULL,
  `hash_id` varchar(40) collate utf8_unicode_ci NOT NULL,
  `file` varchar(254) collate utf8_unicode_ci NOT NULL,
  `expires` int(12) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
