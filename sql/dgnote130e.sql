-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2014 at 12:53 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dgnote130e`
--
CREATE DATABASE IF NOT EXISTS `dgnote130e` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dgnote130e`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `genre` enum('fantasy','mystery','nonfiction') NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `genre`, `description`) VALUES
(1, 'The Lord of the Rings', 'fantasy', 'The Lord of the Rings is an epic fantasy novel written by philologist and University of Oxford professor J. R. R. Tolkien (from Wikipedia).\r\ndg'),
(2, 'The Maltese Falcon', 'mystery', 'The Maltese Falcon is a 1930 detective novel by Dashiell Hammett, originally serialized in the magazine Black Mask (from Wikipedia). z'),
(3, 'Economics in One Lesson', 'nonfiction', 'Economics in One Lesson is an introduction to free market economics written by Henry Hazlitt and published in 1946, based on FrÃ©dÃ©ric Bastiat''s essay Ce qu''on voit et ce qu''on ne voit pas (English: "What is Seen and What is Not Seen") (from Wikipedia).\r\na');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard`
--

CREATE TABLE IF NOT EXISTS `dashboard` (
  `dashboard_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dataface__failed_logins`
--

CREATE TABLE IF NOT EXISTS `dataface__failed_logins` (
  `attempt_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `time_of_attempt` int(11) NOT NULL,
  PRIMARY KEY (`attempt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dataface__modules`
--

CREATE TABLE IF NOT EXISTS `dataface__modules` (
  `module_name` varchar(255) NOT NULL,
  `module_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dataface__mtimes`
--

CREATE TABLE IF NOT EXISTS `dataface__mtimes` (
  `name` varchar(255) NOT NULL,
  `mtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dataface__mtimes`
--

INSERT INTO `dataface__mtimes` (`name`, `mtime`) VALUES
('books', 1395678417),
('dashboard', 1395678417),
('dataface__failed_logins', 1395678501),
('dataface__modules', 1395678417),
('dataface__mtimes', 1395678423),
('dataface__preferences', 1395678742),
('dataface__record_mtimes', 1395678704),
('dataface__version', 1395678417),
('nte_about_this_app', 1395678417),
('nte_note', 1395679111),
('nte_tags', 1395678417),
('states', 1395678417),
('users', 1395678417),
('vw_nte_note', 1395678703);

-- --------------------------------------------------------

--
-- Table structure for table `dataface__preferences`
--

CREATE TABLE IF NOT EXISTS `dataface__preferences` (
  `pref_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `table` varchar(128) NOT NULL,
  `record_id` varchar(255) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`pref_id`),
  KEY `username` (`username`),
  KEY `table` (`table`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dataface__record_mtimes`
--

CREATE TABLE IF NOT EXISTS `dataface__record_mtimes` (
  `recordhash` varchar(32) NOT NULL,
  `recordid` varchar(255) NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`recordhash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dataface__record_mtimes`
--

INSERT INTO `dataface__record_mtimes` (`recordhash`, `recordid`, `mtime`) VALUES
('633d232a236ecda41d92e2a5e80e3263', 'nte_note?note_id=3357', 1395679111);

-- --------------------------------------------------------

--
-- Table structure for table `dataface__version`
--

CREATE TABLE IF NOT EXISTS `dataface__version` (
  `version` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dataface__version`
--

INSERT INTO `dataface__version` (`version`) VALUES
(0);

-- --------------------------------------------------------

--
-- Table structure for table `nte_about_this_app`
--

CREATE TABLE IF NOT EXISTS `nte_about_this_app` (
  `id` int(11) NOT NULL,
  `about_fld` text,
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nte_about_this_app`
--

INSERT INTO `nte_about_this_app` (`id`, `about_fld`, `createdtime`, `updatedtime`) VALUES
(1, 'this the notes database for g..', '2012-06-03 04:54:35', '2012-06-07 13:04:48'),
(2, 'history enabled now.\r\n2012-06-06_Jun_Wed-10.17-AM ', '2012-06-06 18:17:23', NULL),
(3, 'a', '2013-04-11 17:21:59', '2013-04-11 13:21:59'),
(4, 'test 2', '2013-04-29 20:10:13', '2013-04-30 11:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `nte_note`
--

CREATE TABLE IF NOT EXISTS `nte_note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_fld` text,
  `tags_fld` varchar(244) DEFAULT NULL,
  `state_fld` varchar(99) DEFAULT NULL,
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedtime` datetime DEFAULT NULL,
  `datenote` datetime DEFAULT NULL,
  `active` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3358 ;

--
-- Dumping data for table `nte_note`
--

INSERT INTO `nte_note` (`note_id`, `note_fld`, `tags_fld`, `state_fld`, `createdtime`, `updatedtime`, `datenote`, `active`) VALUES
(2836, '<p>a</p>', NULL, '', '2012-07-16 16:38:16', '2012-07-16 12:38:16', NULL, NULL),
(2837, '<p>b</p>', NULL, '', '2012-07-16 16:38:59', '2012-07-16 12:38:59', NULL, NULL),
(2838, 'a', NULL, '', '2012-07-16 17:01:01', '2013-04-15 11:55:51', NULL, NULL),
(2839, '<p>e</p>', NULL, '', '2012-07-16 17:04:29', '2012-07-16 13:09:20', NULL, NULL),
(2840, '2013-04-08_Mon_11.49-AM', NULL, '', '2013-04-08 15:49:08', '2013-04-15 11:49:15', NULL, NULL),
(2841, NULL, NULL, '', '2013-04-08 15:50:09', '2013-04-08 11:50:09', NULL, NULL),
(2842, '11:56AM', NULL, '', '2013-04-08 15:56:29', '2013-04-15 11:53:44', NULL, 'No'),
(2843, '2013-04-08_Mon_12.01-PM', NULL, '', '2013-04-08 16:01:39', '2013-04-15 11:49:37', NULL, NULL),
(2844, '<p>tagger1.</p>\r\n<p>2013-04-08_Mon_12.04-PM</p>', NULL, '', '2013-04-08 16:04:21', '2013-04-08 12:05:29', NULL, NULL),
(2845, '2845\r\n', NULL, '', '2013-04-08 19:13:48', '2013-04-24 15:43:18', NULL, 'No'),
(2846, NULL, NULL, '', '2013-04-08 19:53:15', '2013-04-08 15:53:15', NULL, NULL),
(2847, '2013-04-09_Tue_08.26-AM', NULL, '', '2013-04-09 12:26:16', '2013-06-26 23:06:21', NULL, 'No'),
(2848, NULL, NULL, '', '2013-04-09 12:31:02', '2013-04-09 08:32:07', '2013-04-09 11:31:23', 'Yes'),
(2849, NULL, NULL, '', '2013-04-09 12:47:16', '2013-04-10 09:19:50', '2013-04-09 08:47:23', 'Yes'),
(2850, 'q', NULL, '', '2013-04-15 18:16:23', '2013-04-15 14:16:56', '2013-04-10 14:16:23', NULL),
(2851, 'Either spotting a gap in the market or just out of loyalty to its best buddy Microsoft, Dell has released its own Windows RT slate. Aimed at business users, the 10.1-inch Dell XPS 10 is another transformer-style laptop-tablet hybrid, shipping with an attachable keyboard that turns it into a laptop for working on the move.\r\nThe Dell XPS 10 falls into a crowded market, with a host of devices aiming to please similar needs. The Asus VivoTab, Samsung Ativ Tab and of course the Microsoft Surface RT are all offering the same USP, and there are other hybrids such as the Lenovo IdeaPad Yoga 11 too.\r\nWhile there''s no shortage of big players in the market, Dell''s late arrival doesn''t mean it''s too far behind; no RT device has gained any traction to date.\r\n\r\nBuying Guide\r\n\r\n10 best tablet PCs in the world today\r\nThe XPS 10 fits perfectly into Dell''s line up of high end machines, joining its XPS 12, XPS 13 and XPS 15 siblings. It looks like an XPS, with a soft black finish and a rubberised texture, and the same rounded chiclet keys adorning the base station.\r\nThe XPS range is certainly high quality, and each component of the 10-inch RT tablet follows this design ethos to a tee.\r\nCompared to some notable offenders, Dell has managed to keep the price down to a reasonable level. The base level 32GB device without the keyboard costs ┬ú299/US$449.99, the 32GB version with the keyboard dock costs ┬ú409/US$599.99, the 64GB without a keyboard costs ┬ú339/US$499.99, while the 64GB version with the dock is ┬ú444/US$649.99.\r\n', NULL, '', '2013-04-18 15:12:59', '2013-04-18 11:49:54', NULL, NULL),
(2852, 'test mail send', NULL, '', '2013-04-19 18:09:18', '2013-04-19 14:09:18', '2013-04-19 14:09:23', NULL),
(2853, 'test tags', NULL, '', '2013-04-19 18:09:53', '2013-04-19 14:09:53', NULL, NULL),
(2854, '04:00PM', NULL, '', '2013-04-19 20:00:52', '2013-04-19 16:00:52', NULL, NULL),
(2855, '04:27PM', NULL, '', '2013-04-19 20:27:08', '2013-04-19 16:27:08', NULL, NULL),
(2856, '2013-04-19_Fri_16.29-PM\r\ntest note.\r\n.\r\nx', NULL, '', '2013-04-19 20:30:11', '2013-04-19 16:30:11', NULL, NULL),
(2857, '2013-04-22_Mon_10.30-AM test csd email', NULL, '', '2013-04-22 14:30:55', '2013-04-22 10:30:55', '2013-04-22 10:30:23', 'Yes'),
(2858, 'a', NULL, '', '2013-04-22 14:33:43', '2013-04-22 10:33:43', '2013-04-22 10:33:23', 'No'),
(2859, 'test double email', NULL, '', '2013-04-22 14:40:15', '2013-04-22 10:40:15', '2013-04-22 10:40:23', 'Yes'),
(2860, 'cleaned up', NULL, '', '2013-04-22 15:03:50', '2013-04-22 11:03:50', '2013-04-22 11:03:23', 'Yes'),
(2861, 'Get Involved\r\n\r\nIf you want to help contribute to Ubuntu then you''ve come to the right place. Keep reading to learn how.\r\n\r\nYou have just taken your first step toward getting involved. Before you get started, we ask that you please observe the Ubuntu Code of Conduct, it''s not very long and it will help you get started.\r\n\r\nNow that''s done. To find out the best way to get started, you should check out our community page.\r\n\r\nTeams\r\n\r\nThe Teams page contains a listing of all the various Community Teams, links to their Wiki Home Pages and\r\n\r\nMost Teams'' Wiki Home Pages provide information about who they are, what they do, when their meetings are and how to contact them. Using these pages, teammates are able communicate and coordinate projects.\r\n\r\nGovernance and Membership\r\n\r\nLike most communities, we have our rules and governing body.\r\n\r\nAnyone can join and participate in most, if not all, of our Teams and Projects. But if you want an "@ubuntu.com" e-mail address, it has to be earned. Find out how in our Membership section.\r\n\r\nCommunity Links\r\n\r\nAs an active member of our community, you probably should check out what else is going on in the world of Ubuntu:\r\n\r\nThe Fridge posts all the latest News and Upcoming Events.\r\nPlanet Ubuntu is a collection of community blogs.\r\nAlso you can help at Ubuntu Brainstorm by submitting your ideas to make Ubuntu better OS for everyone.\r\n\r\nIf you are interested to get to know other Ubuntu users or see a list of Ubuntu teams outside the general Ubuntu world, check out our social network page.\r\n\r\nReleases', NULL, '', '2013-04-22 15:07:43', '2013-04-22 11:07:43', '2013-04-22 11:07:23', 'Yes'),
(2862, 'b', NULL, '', '2013-04-22 15:11:08', '2013-04-22 11:11:08', '2013-04-22 11:11:23', 'Yes'),
(2863, 'Weiss\r\n', NULL, '', '2013-04-22 15:28:44', '2013-04-22 11:28:44', '2013-04-22 11:28:23', 'Yes'),
(2864, 'email on?', NULL, '', '2013-04-24 16:04:36', '2013-04-24 12:04:36', '2013-04-24 12:04:23', 'Yes'),
(2865, '2013-04-24_Wed_14.22-PM test with filter. 03:48PM', NULL, '', '2013-04-24 18:22:42', '2013-04-24 15:48:41', '2013-04-24 14:22:23', 'Yes'),
(2866, 'moved default filter to index.php', NULL, '', '2013-04-24 19:34:19', '2013-04-24 15:34:19', '2013-04-24 15:34:23', NULL),
(2867, 'moved default filter to index.php', NULL, '', '2013-04-24 19:35:00', '2013-04-24 15:35:00', '2013-04-24 15:34:23', NULL),
(2868, 'a', NULL, '', '2013-04-24 19:35:31', '2013-04-24 15:35:31', '2013-04-24 15:35:23', 'Yes'),
(2869, 'a', NULL, '', '2013-04-24 19:35:34', '2013-04-24 15:35:34', '2013-04-24 15:35:23', 'Yes'),
(2870, 'test index.php filter', NULL, '', '2013-04-24 19:37:08', '2013-04-24 15:37:08', '2013-04-24 15:37:23', 'No'),
(2871, 'a', NULL, '', '2013-04-24 19:41:51', '2013-04-24 15:41:51', '2013-04-24 15:41:23', 'Yes'),
(2872, '2013-04-25_Thu_09.58-AM', NULL, '', '2013-04-25 13:59:01', '2013-04-25 09:59:01', '2013-04-25 09:58:23', 'Yes'),
(2873, '  2013-04-25_Thu_10.29-AM \r\ndefault sort in sql in fields.ini\r\nline 3  ', NULL, '', '2013-04-25 14:29:35', '2013-09-10 23:06:34', NULL, 'Yes'),
(2874, '2013-04-25_Thu_10.36-AM test view add', NULL, '', '2013-04-25 14:36:50', '2013-04-25 10:36:50', '2013-04-25 10:36:23', 'Yes'),
(2875, '2013-04-25_Thu_10.41-AM test view add', NULL, '', '2013-04-25 14:41:22', '2013-04-25 10:41:22', '2013-04-25 10:41:23', NULL),
(2876, '2013-04-25_Thu_10.49-AM', NULL, '', '2013-04-25 14:49:23', '2013-04-25 10:49:23', '2013-04-25 10:49:23', 'Yes'),
(2877, '  2013-04-25_Thu_10.53-AM\r\n2\r\nline3\r\n  ', NULL, '', '2013-04-25 14:53:35', '2013-09-11 22:16:52', NULL, 'Yes'),
(2878, '  ', NULL, '', '2013-04-25 14:54:14', '2013-09-11 22:12:33', '2013-09-11 04:00:00', 'Yes'),
(2879, ' test email from filtered table ', NULL, '', '2013-04-29 13:12:21', '2013-09-12 23:27:09', '2013-04-29 09:12:23', NULL),
(2880, NULL, NULL, '', '2013-04-29 18:31:54', '2013-08-30 22:59:15', '2013-04-29 14:31:23', 'Yes'),
(2881, 'test bcc cc. 2013-04-30_Tue_11.18-AM', NULL, '', '2013-04-29 18:36:27', '2013-04-30 11:18:48', '2013-04-29 14:36:23', 'Yes'),
(2882, ' 2013-05-02_Thu_13.22-PM test offline ', NULL, '', '2013-05-02 17:24:06', '2013-09-11 22:59:42', '2013-05-02 13:22:23', 'Yes'),
(2883, '     fedc2013-04-25_Thu_10.53-AM2line3		\r\nHey\r\nWhy x\r\nTester\r\n						     ', 'Fed c', '', '2013-05-02 19:37:30', '2013-09-15 21:53:33', '2013-09-15 23:00:00', 'Yes'),
(2884, '  testing mysql copy with xcopy  ', NULL, '', '2013-05-03 13:27:11', '2013-09-11 22:58:11', '2013-09-11 04:00:00', 'Yes'),
(3333, NULL, NULL, '', '2013-07-19 01:34:30', '2013-08-30 22:58:15', NULL, 'Yes'),
(3334, NULL, ' tag1,', '', '2013-08-28 01:50:22', '2013-08-30 22:55:55', NULL, 'Yes'),
(3335, 'Equip', NULL, '', '2013-09-16 01:10:10', '2013-09-15 21:10:10', NULL, NULL),
(3336, 'Wow', NULL, '', '2013-09-16 01:11:02', '2013-09-15 21:11:02', NULL, NULL),
(3337, '           Soy ab\r\nC d\r\n           ', 'who', '', '2013-09-16 01:11:42', '2013-09-15 21:48:55', '2013-09-15 23:11:00', 'Yes'),
(3338, 'A', NULL, '', '2013-09-16 01:53:54', '2013-09-15 21:53:54', '2013-09-16 00:53:00', NULL),
(3339, ' Dua  Gary', 'the', '', '2013-09-16 03:15:29', '2013-09-19 23:56:19', '2013-09-16 02:15:00', 'No'),
(3340, 'Funk', 'eh', '', '2013-09-16 03:18:31', '2013-09-15 23:18:31', '2013-09-16 02:18:00', 'No'),
(3341, '      Who  e  b c ', 'ergo', '', '2013-09-16 03:21:38', '2013-09-16 22:19:34', '2013-09-17 01:16:00', 'No'),
(3342, 'Add', 'ok', '', '2013-09-16 03:27:20', '2013-09-15 23:27:20', '2013-09-16 02:27:00', 'Yes'),
(3343, 'a 2013-09-17_Tue_22.07-PM', 'artsy', '', '2013-09-18 02:09:07', '2013-09-17 22:09:07', '2013-09-17 22:07:00', 'Yes'),
(3344, NULL, NULL, 'mi', '2013-09-18 02:22:48', '2013-09-21 22:32:21', '2013-09-17 22:22:00', 'Yes'),
(3345, '3', '3', 'Alaska', '2013-09-18 02:53:47', '2013-09-17 22:53:47', '2013-09-17 22:53:00', 'Yes'),
(3346, 'q', 'Quite', 'Delaware', '2013-09-18 03:07:56', '2013-09-17 23:07:56', '2013-09-17 23:07:00', 'Yes'),
(3347, 'w', 'whob', 'Delaware', '2013-09-18 03:09:50', '2013-09-17 23:09:50', '2013-09-17 23:09:00', 'Yes'),
(3348, 'note\r\nnote', NULL, NULL, '2013-09-22 02:17:45', '2013-09-21 22:17:45', '2013-09-21 22:17:00', 'Yes'),
(3349, 'not what i want', NULL, NULL, '2013-09-22 02:35:58', '2013-09-21 22:35:58', NULL, NULL),
(3350, '09:04PM 10:23PM', 'ergo', 'New Jersey', '2013-09-24 01:05:09', '2013-09-25 22:23:08', '2013-09-23 21:04:00', 'Yes'),
(3351, 'after tortoise', NULL, 'Delaware', '2013-09-27 02:21:12', '2013-09-26 22:21:12', '2013-09-26 22:20:00', 'Yes'),
(3352, 'a', 'a', 'a', '2013-12-10 20:36:33', '2013-12-10 15:36:33', '2013-12-10 15:36:00', 'No'),
(3353, 'a', 'computer problem, ', 'Michigan', '2013-12-10 20:37:56', '2013-12-10 15:37:56', '2013-12-10 15:37:00', 'Yes'),
(3354, 'a', NULL, NULL, '2013-12-10 20:42:14', '2013-12-10 15:42:14', NULL, 'Yes'),
(3355, NULL, 'computer problem, work, gustin, ', NULL, '2014-03-20 17:52:09', '2014-03-20 13:52:09', NULL, NULL),
(3356, NULL, 'computer problem, ew', NULL, '2014-03-24 16:31:43', '2014-03-24 12:31:43', NULL, NULL),
(3357, NULL, 'computer problem, word, ', NULL, '2014-03-24 16:38:31', '2014-03-24 12:38:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nte_tags`
--

CREATE TABLE IF NOT EXISTS `nte_tags` (
  `tags_id` int(11) NOT NULL,
  `tags_list` varchar(234) NOT NULL,
  PRIMARY KEY (`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nte_tags`
--

INSERT INTO `nte_tags` (`tags_id`, `tags_list`) VALUES
(0, 'new2'),
(1, 'computer problem'),
(2, 'gustin'),
(3, 'home'),
(4, 'log'),
(5, 'money'),
(6, 'testnote'),
(7, 'word'),
(8, 'work'),
(9, 'xataface'),
(10, 'co'),
(11, 'new'),
(12, 'newtag');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK: Unique state ID',
  `state` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'State name with first letter capital',
  `abbrev` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional state abbreviation (US is 2 capital letters)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state`, `abbrev`) VALUES
(1, 'Alabama', 'AL'),
(2, 'Alaska', 'AK'),
(3, 'Arizona', 'AZ'),
(4, 'Arkansas', 'AR'),
(5, 'California', 'CA'),
(6, 'Colorado', 'CO'),
(7, 'Connecticut', 'CT'),
(8, 'Delaware', 'DE'),
(9, 'District of Columbia', 'DC'),
(10, 'Florida', 'FL'),
(11, 'Georgia', 'GA'),
(12, 'Hawaii', 'HI'),
(13, 'Idaho', 'ID'),
(14, 'Illinois', 'IL'),
(15, 'Indiana', 'IN'),
(16, 'Iowa', 'IA'),
(17, 'Kansas', 'KS'),
(18, 'Kentucky', 'KY'),
(19, 'Louisiana', 'LA'),
(20, 'Maine', 'ME'),
(21, 'Maryland', 'MD'),
(22, 'Massachusetts', 'MA'),
(23, 'Michigan', 'MI'),
(24, 'Minnesota', 'MN'),
(25, 'Mississippi', 'MS'),
(26, 'Missouri', 'MO'),
(27, 'Montana', 'MT'),
(28, 'Nebraska', 'NE'),
(29, 'Nevada', 'NV'),
(30, 'New Hampshire', 'NH'),
(31, 'New Jersey', 'NJ'),
(32, 'New Mexico', 'NM'),
(33, 'New York', 'NY'),
(34, 'North Carolina', 'NC'),
(35, 'North Dakota', 'ND'),
(36, 'Ohio', 'OH'),
(37, 'Oklahoma', 'OK'),
(38, 'Oregon', 'OR'),
(39, 'Pennsylvania', 'PA'),
(40, 'Rhode Island', 'RI'),
(41, 'South Carolina', 'SC'),
(42, 'South Dakota', 'SD'),
(43, 'Tennessee', 'TN'),
(44, 'Texas', 'TX'),
(45, 'Utah', 'UT'),
(46, 'Vermont', 'VT'),
(47, 'Virginia', 'VA'),
(48, 'Washington', 'WA'),
(49, 'West Virginia', 'WV'),
(50, 'Wisconsin', 'WI'),
(51, 'Wyoming', 'WY');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(32) NOT NULL,
  `password` varchar(244) NOT NULL,
  `Role` enum('READ ONLY','NO ACCESS','EDIT','DELETE','OWNER','USER','ADMIN','REGISTER') DEFAULT 'READ ONLY',
  `comment_fld1` text,
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `Role`, `comment_fld1`, `createdtime`, `updatedtime`) VALUES
('dave', 'a', 'ADMIN', NULL, '2012-06-06 06:58:40', NULL),
('user', 'user', 'EDIT', NULL, '2012-06-06 06:56:06', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_nte_note`
--
CREATE TABLE IF NOT EXISTS `vw_nte_note` (
`note_id` int(11)
,`note_fld` text
,`tags_fld` varchar(244)
,`state_fld` varchar(99)
,`createdtime` timestamp
,`updatedtime` datetime
,`datenote` datetime
,`active` enum('Yes','No')
);
-- --------------------------------------------------------

--
-- Structure for view `vw_nte_note`
--
DROP TABLE IF EXISTS `vw_nte_note`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_nte_note` AS select `nte_note`.`note_id` AS `note_id`,`nte_note`.`note_fld` AS `note_fld`,`nte_note`.`tags_fld` AS `tags_fld`,`nte_note`.`state_fld` AS `state_fld`,`nte_note`.`createdtime` AS `createdtime`,`nte_note`.`updatedtime` AS `updatedtime`,`nte_note`.`datenote` AS `datenote`,`nte_note`.`active` AS `active` from `nte_note`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
