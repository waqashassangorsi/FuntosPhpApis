-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2021 at 01:05 AM
-- Server version: 10.3.29-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coviknow_challengeit`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` text NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `parent_id`, `status`) VALUES
(1, 'Entertainment', 0, 'Active'),
(2, 'Art', 0, 'Active'),
(3, 'Talent', 0, 'Active'),
(4, 'Religious', 0, 'Active'),
(5, 'Technology', 0, 'Active'),
(433, 'Skill', 0, 'Active'),
(436, 'Food', 0, 'Active'),
(437, 'Travelling', 0, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE `challenges` (
  `challenge_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `challengename` text NOT NULL,
  `privacy` enum('Public','Private') NOT NULL DEFAULT 'Public',
  `type` enum('Open','Specific') NOT NULL DEFAULT 'Open',
  `location` text NOT NULL,
  `chlng_lati` text NOT NULL,
  `chlng_longi` text NOT NULL,
  `category` int(11) NOT NULL,
  `post_date` datetime NOT NULL,
  `file` text NOT NULL,
  `thumbnail` text NOT NULL,
  `response_of` int(11) NOT NULL,
  `is_hide` enum('Yes','No') NOT NULL DEFAULT 'No',
  `user_specific_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`challenge_id`, `u_id`, `challengename`, `privacy`, `type`, `location`, `chlng_lati`, `chlng_longi`, `category`, `post_date`, `file`, `thumbnail`, `response_of`, `is_hide`, `user_specific_id`) VALUES
(27, 1, 'Dbsksbsj', 'Public', 'Open', 'Johar Town', '31.469693', '74.27284610000001', 1, '2020-10-23 10:01:25', 'uploads/vid_1603465277551.mp4', '', 0, 'No', NULL),
(28, 1, 'Zaid', 'Public', 'Open', 'G 6 Markaz', '33.7165657', '73.08401409999999', 1, '2020-10-24 02:20:43', 'uploads/vid_1603524038909.mp4', '', 0, 'No', NULL),
(29, 1, 'Xgmgkzzgj', 'Private', 'Open', 'Zaida Bypass Rd, Zaida, Swabi, Khyber Pakhtunkhwa, Pakistan', '34.0510509', '72.4723236', 436, '2020-10-27 00:13:31', 'uploads/vid_1603775602543.mp4', '', 0, 'No', NULL),
(30, 1, 'Xgmgkzzgj', 'Private', 'Open', 'Zaida Bypass Rd, Zaida, Swabi, Khyber Pakhtunkhwa, Pakistan', '34.0510509', '72.4723236', 436, '2020-10-27 00:13:31', 'uploads/vid_1603775606803.mp4', '', 0, 'No', NULL),
(31, 1, 'Xgmgkzzgj', 'Private', 'Open', 'Zaida Bypass Rd, Zaida, Swabi, Khyber Pakhtunkhwa, Pakistan', '34.0510509', '72.4723236', 436, '2020-10-27 00:13:32', 'uploads/vid_1603775605702.mp4', '', 0, 'No', NULL),
(32, 1, 'Hhuvhjgu', 'Private', 'Open', 'Faisalabad, Punjab, Pakistan', '31.45036619999999', '73.13496049999999', 436, '2020-10-27 00:14:38', 'uploads/vid_1603775673965.mp4', '', 0, 'No', NULL),
(33, 1, 'waqdfasdf', 'Private', 'Open', 'Pir Sohawa Road, Sangada, Haripur, Khyber Pakhtunkhwa, Pakistan', '33.8081535', '73.1259599', 4, '2020-10-27 00:19:36', 'uploads/vid_1603775971367.mp4', '', 0, 'No', NULL),
(34, 1, 'Hdkgxkzgj', 'Private', 'Open', 'Karachi, Karachi City, Sindh, Pakistan', '24.8607343', '67.0011364', 436, '2020-10-27 00:21:34', 'uploads/vid_1603776089847.mp4', '', 0, 'No', NULL),
(35, 1, 'Khdgxkkzg', 'Private', 'Open', 'Bahria Town, Lahore, Punjab, Pakistan', '31.3694884', '74.1768412', 4, '2020-10-27 00:23:07', 'uploads/vid_1603776157957.mp4', '', 0, 'No', NULL),
(36, 1, 'Khdgxkkzg', 'Private', 'Open', 'Bahria Town, Lahore, Punjab, Pakistan', '31.3694884', '74.1768412', 4, '2020-10-27 00:24:59', 'uploads/vid_1603776269884.mp4', '', 0, 'No', NULL),
(37, 1, 'Khdgxkkzg', 'Private', 'Open', 'Bahria Town, Lahore, Punjab, Pakistan', '31.3694884', '74.1768412', 4, '2020-10-27 00:25:14', 'uploads/vid_1603776279275.mp4', '', 0, 'No', NULL),
(38, 1, 'Khdgxkkzg', 'Private', 'Open', 'Bahria Town, Lahore, Punjab, Pakistan', '31.3694884', '74.1768412', 4, '2020-10-27 00:25:28', 'uploads/vid_1603776300712.mp4', '', 0, 'No', NULL),
(39, 1, 'Khdgxkkzg', 'Private', 'Open', 'Bahria Town, Lahore, Punjab, Pakistan', '31.3694884', '74.1768412', 4, '2020-10-27 00:27:08', 'uploads/vid_1603776402053.mp4', '', 0, 'No', NULL),
(40, 1, 'Gvj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:28:46', 'uploads/vid_1603776519185.mp4', '', 0, 'No', NULL),
(41, 1, 'Gvj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:28:50', 'uploads/vid_1603776525304.mp4', '', 0, 'No', NULL),
(42, 1, 'Gvj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:28:52', 'uploads/vid_1603776527522.mp4', '', 0, 'No', NULL),
(43, 1, 'Gvj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:28:56', 'uploads/vid_1603776532161.mp4', '', 0, 'No', NULL),
(44, 1, 'Gvj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:28:58', 'uploads/vid_1603776533976.mp4', '', 0, 'No', NULL),
(45, 1, 'Gvhb', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 1, '2020-10-27 00:29:46', 'uploads/vid_1603776580284.mp4', '', 0, 'No', NULL),
(46, 1, 'Gvhb', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 1, '2020-10-27 00:30:34', 'uploads/vid_1603776627425.mp4', '', 0, 'No', NULL),
(47, 1, 'Gvhb', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 1, '2020-10-27 00:34:13', 'uploads/vid_1603776844693.mp4', '', 0, 'No', NULL),
(48, 1, 'Jdjdj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:52:40', 'uploads/vid_1603777955433.mp4', '', 0, 'No', NULL),
(49, 1, 'Jdjdj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:52:57', 'uploads/vid_1603777973295.mp4', '', 0, 'No', NULL),
(50, 1, 'Jdjdj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:53:14', 'uploads/vid_1603777990436.mp4', '', 0, 'No', NULL),
(51, 1, 'Jdjdj', 'Public', 'Open', 'Gujranwala, Punjab, Pakistan', '32.1876919', '74.1944529', 1, '2020-10-27 00:53:23', 'uploads/vid_1603777999707.mp4', '', 0, 'No', NULL),
(52, 1, 'Hdhd', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 5, '2020-10-27 01:04:06', 'uploads/vid_1603778614879.mp4', '', 0, 'No', NULL),
(53, 1, 'Hdhd', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 5, '2020-10-27 01:05:41', 'uploads/vid_1603778716211.mp4', '', 0, 'No', NULL),
(54, 1, 'Hdhd', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 5, '2020-10-27 01:06:12', 'uploads/vid_1603778747162.mp4', '', 0, 'No', NULL),
(55, 1, 'Hdhd', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 5, '2020-10-27 01:06:22', 'uploads/vid_1603778755832.mp4', '', 0, 'No', NULL),
(56, 1, 'Gjhhh', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 5, '2020-10-27 01:07:47', 'uploads/vid_1603778851103.mp4', '', 0, 'No', NULL),
(57, 1, 'Gjhhh', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 5, '2020-10-27 01:10:36', 'uploads/vid_1603779018824.mp4', '', 0, 'No', NULL),
(58, 1, 'Gjj', 'Public', 'Open', 'University Rd, Block 14 Gulshan-e-Iqbal, Karachi, Karachi City, Sindh, Pakistan', '24.8994201', '67.0726186', 1, '2020-10-27 01:13:38', 'uploads/vid_1603779213551.mp4', '', 0, 'No', NULL),
(59, 1, 'Gjj', 'Public', 'Open', 'University Rd, Block 14 Gulshan-e-Iqbal, Karachi, Karachi City, Sindh, Pakistan', '24.8994201', '67.0726186', 1, '2020-10-27 01:14:42', 'uploads/vid_1603779278758.mp4', '', 0, 'No', NULL),
(60, 1, 'Gjj', 'Public', 'Open', 'University Rd, Block 14 Gulshan-e-Iqbal, Karachi, Karachi City, Sindh, Pakistan', '24.8994201', '67.0726186', 1, '2020-10-27 01:14:53', 'uploads/vid_1603779288939.mp4', '', 0, 'No', NULL),
(61, 1, 'Gjj', 'Public', 'Open', 'University Rd, Block 14 Gulshan-e-Iqbal, Karachi, Karachi City, Sindh, Pakistan', '24.8994201', '67.0726186', 1, '2020-10-27 01:15:24', 'uploads/vid_1603779320983.mp4', '', 0, 'No', NULL),
(62, 1, 'Bdjdkdj', 'Public', 'Open', 'Civic Center Bahria Town Civic Center Bahria Town, Rawalpindi, Punjab, Pakistan', '33.5495307', '73.12389619999999', 1, '2020-10-27 01:19:22', 'uploads/vid_1603779555188.mp4', '', 0, 'No', NULL),
(63, 1, 'Hdhdjd', 'Public', 'Open', 'Head Marala, Sialkot, Punjab, Pakistan', '32.6723991', '74.4643879', 1, '2020-10-27 01:22:52', 'uploads/vid_1603779763803.mp4', '', 0, 'No', NULL),
(64, 1, 'Hdkdj', 'Public', 'Open', 'Floor 5, Noor Trade Center, University Rd, Block 1 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Pakistan', '24.9290421', '67.11453589999999', 437, '2020-10-27 01:24:43', 'uploads/vid_1603779877963.mp4', '', 0, 'No', NULL),
(65, 1, 'Gjj', 'Public', 'Open', 'Head Marala, Sialkot, Punjab, Pakistan', '32.6723991', '74.4643879', 1, '2020-10-27 01:30:02', 'uploads/vid_1603780191196.mp4', '', 0, 'No', NULL),
(66, 1, 'Ggh', 'Public', 'Open', 'Head Muhammad Wala, Muzaffargarh, Punjab, Pakistan', '30.2963509', '71.3442278', 1, '2020-10-27 01:41:11', 'uploads/vid_1603780868293.mp4', '', 0, 'No', NULL),
(67, 1, 'Vkvg', 'Public', 'Open', 'University Rd, Block 14 Gulshan-e-Iqbal, Karachi, Karachi City, Sindh, Pakistan', '24.8994201', '67.0726186', 1, '2020-10-27 01:41:57', 'uploads/vid_1603780912545.mp4', '', 0, 'No', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `challenge_views`
--

CREATE TABLE `challenge_views` (
  `view_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `claps`
--

CREATE TABLE `claps` (
  `clap_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `claps`
--

INSERT INTO `claps` (`clap_id`, `u_id`, `challenge_id`) VALUES
(125, 1, 4),
(126, 1, 31),
(129, 1, 30),
(130, 1, 28),
(131, 1, 35);

-- --------------------------------------------------------

--
-- Table structure for table `collectiopns`
--

CREATE TABLE `collectiopns` (
  `collection_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `file` text NOT NULL,
  `date` date NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collectiopns`
--

INSERT INTO `collectiopns` (`collection_id`, `name`, `file`, `date`, `u_id`) VALUES
(7, 'Banay_Ga_Naya_Pakistan_Whatsapp_Status_|_PM_Imran_Khan_|_Imran_Khan_Today(256k).mp3', 'uploads/Banay_Ga_Naya_Pakistan_Whatsapp_Status_|_PM_Imran_Khan_|_Imran_Khan_Today(256k)1.mp3', '2020-12-30', 1),
(8, 'Bekhayali_Full_Song_|_Kabir_Singh_|_Shahid_K,Kiara_A|Sandeep_Reddy_Vanga_|_Sachet-Parampara_|_Irshad(256k).mp3', 'uploads/Bekhayali_Full_Song_|_Kabir_Singh_|_Shahid_K,Kiara_A|Sandeep_Reddy_Vanga_|_Sachet-Parampara_|_Irshad(256k).mp3', '2021-01-01', 1),
(9, 'Perfect.mp3', 'uploads/Perfect.mp3', '2021-03-03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `download_clap`
--

CREATE TABLE `download_clap` (
  `download_clap_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `download_clap`
--

INSERT INTO `download_clap` (`download_clap_id`, `u_id`, `challenge_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 2),
(7, 1, 2),
(8, 1, 2),
(9, 1, 2),
(10, 1, 2),
(11, 1, 2),
(12, 1, 2),
(13, 1, 2),
(14, 1, 2),
(15, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `follow_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `who_following` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`follow_id`, `u_id`, `who_following`) VALUES
(2, 48, 23),
(6, 57, 57),
(10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `general`
--

CREATE TABLE `general` (
  `id` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general`
--

INSERT INTO `general` (`id`, `image`, `status`) VALUES
(1, 'assets/images/logo@2x.png', 'logo'),
(3, '1234', '123'),
(4, NULL, '4565'),
(5, NULL, 'asdf'),
(6, NULL, 'qwer'),
(7, NULL, 'ghfjhg fjhfgjhgf jh');

-- --------------------------------------------------------

--
-- Table structure for table `hide_challenge`
--

CREATE TABLE `hide_challenge` (
  `hide_challenge_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hide_challenge`
--

INSERT INTO `hide_challenge` (`hide_challenge_id`, `challenge_id`, `u_id`) VALUES
(1, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Interest`
--

CREATE TABLE `Interest` (
  `Id` int(11) NOT NULL,
  `Interest` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Interest`
--

INSERT INTO `Interest` (`Id`, `Interest`) VALUES
(1, 'Rafting'),
(2, 'Trekking'),
(3, 'Surfing'),
(4, 'Racing'),
(5, 'Hunting'),
(6, 'Fishing'),
(7, 'Boating'),
(8, 'Traveling'),
(9, 'Cooking'),
(10, 'Painting'),
(11, 'Creative Writing'),
(12, 'Dancing'),
(13, 'Singing'),
(14, 'Model Building'),
(15, 'Photography'),
(16, 'Cloud Watching'),
(17, 'Reading'),
(18, 'Computer Games'),
(19, 'Social Networking'),
(20, 'test'),
(21, 'test'),
(22, 'Hdjsbssk'),
(23, 'Zaid'),
(24, 'test'),
(25, 'Syszozph'),
(26, 'Himboxhhoxohz'),
(27, 'Uhibk'),
(28, 'Hmmmm'),
(29, 'Y8c8ycyyc'),
(30, 'Rafting'),
(31, 'Rafting'),
(32, 'Travelingw');

-- --------------------------------------------------------

--
-- Table structure for table `main_menu`
--

CREATE TABLE `main_menu` (
  `id` int(2) NOT NULL,
  `pagename` varchar(25) NOT NULL,
  `icon` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_menu`
--

INSERT INTO `main_menu` (`id`, `pagename`, `icon`) VALUES
(1, 'Dashboard', 'entypo-gauge'),
(2, 'Configurations', 'glyphicon glyphicon-cog'),
(3, 'Purchase', 'glyphicon glyphicon-shopping-cart'),
(4, 'Sale/Order', 'glyphicon glyphicon-shopping-cart'),
(6, 'Payment/Receipt', 'glyphicon glyphicon-cog'),
(7, 'Reports', 'glyphicon glyphicon-cog'),
(8, 'Settings', 'glyphicon glyphicon-cog');

-- --------------------------------------------------------

--
-- Table structure for table `msgs`
--

CREATE TABLE `msgs` (
  `msg_id` int(11) NOT NULL,
  `recv_id` int(11) NOT NULL,
  `send_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msgs`
--

INSERT INTO `msgs` (`msg_id`, `recv_id`, `send_id`, `content`, `date`) VALUES
(13, 1, 61, 'Hey', '2020-06-02 01:36:30'),
(84, 61, 1, 'Gjsgjsgsn', '2020-10-29 05:28:32'),
(199, 1, 62, 'Gjsgjsgsn', '2020-10-29 05:28:32'),
(200, 1, 1, 'Xhdjnd', '2020-10-29 06:59:24'),
(201, 1, 1, 'Bdjdnd', '2020-10-29 07:00:07'),
(202, 1, 1, 'Bdjsjsbs', '2020-10-29 07:00:12'),
(203, 61, 1, 'Hdjdndjd', '2020-10-29 07:00:45'),
(204, 61, 1, 'Bdjsdjdbdb', '2020-10-29 07:02:00'),
(205, 61, 1, 'Vddnsbsisbsksbs', '2020-10-29 07:02:02'),
(206, 61, 1, 'Hekw skswbiwks', '2020-10-29 07:02:04'),
(207, 61, 1, 'Bxmsnsiwonwbs', '2020-10-29 07:02:06'),
(208, 61, 1, 'Uwbsmsms', '2020-10-29 07:02:08'),
(209, 61, 1, 'Vsjsowhs', '2020-10-29 07:02:10'),
(210, 61, 1, 'Bxnxkwovd', '2020-10-29 07:02:12'),
(211, 1, 61, 'Hdbxksiwh', '2020-10-29 07:02:14'),
(212, 61, 1, 'Xxfujcjcjx', '2020-10-29 07:02:44'),
(213, 61, 1, 'Bxjsbsj', '2020-10-29 07:03:47'),
(214, 61, 1, 'Hi', '2020-11-02 06:29:32'),
(215, 61, 1, 'Hello', '2020-11-02 06:29:35'),
(216, 61, 1, 'Are you there', '2020-11-02 06:29:45'),
(217, 61, 1, 'Xchhhc', '2020-11-02 23:57:54'),
(218, 61, 1, 'Jddn', '2020-11-02 23:57:57'),
(219, 61, 1, 'Gzj', '2020-11-03 00:59:00'),
(220, 61, 1, 'Du', '2020-11-03 00:59:01'),
(221, 61, 1, 'Xh', '2020-11-03 00:59:04'),
(222, 61, 1, 'O', '2020-11-03 00:59:44'),
(223, 61, 1, 'U', '2020-11-03 00:59:46'),
(224, 61, 1, 'Y', '2020-11-03 00:59:48'),
(225, 61, 1, 'V', '2020-11-03 00:59:50'),
(226, 61, 1, 'Ylxwyix', '2020-11-03 00:59:53'),
(227, 61, 1, 'Tizzit', '2020-11-03 00:59:54'),
(228, 61, 1, 'Gzkitz', '2020-11-03 00:59:55'),
(229, 61, 1, 'Tzktiz', '2020-11-03 00:59:56'),
(230, 61, 1, 'FUFU', '2020-11-03 00:59:57'),
(231, 61, 1, 'Fuzfiz', '2020-11-03 00:59:58'),
(232, 61, 1, 'Fh&7\"', '2020-11-03 00:59:59'),
(233, 61, 1, 'Tiztiz', '2020-11-03 01:00:00'),
(234, 1, 1, 'Hi there', '2021-03-03 00:12:32'),
(235, 1, 1, 'Hello', '2021-03-03 00:14:33'),
(236, 61, 1, 'Hello', '2021-03-03 00:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `my_searches`
--

CREATE TABLE `my_searches` (
  `search_id` int(11) NOT NULL,
  `text_searched` text NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `noti_id` int(11) NOT NULL,
  `notification` text NOT NULL,
  `noti_date` datetime NOT NULL,
  `noti_recvr_id` int(11) NOT NULL,
  `noti_sender_id` int(11) NOT NULL,
  `is_read` enum('Yes','No') NOT NULL DEFAULT 'No',
  `link` text NOT NULL,
  `is_hide` enum('Yes','No') NOT NULL DEFAULT 'No',
  `not_status` enum('clap','shared') NOT NULL DEFAULT 'clap',
  `challenge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`noti_id`, `notification`, `noti_date`, `noti_recvr_id`, `noti_sender_id`, `is_read`, `link`, `is_hide`, `not_status`, `challenge_id`) VALUES
(3, 'Waqas Hassan has clapped on your challenge', '2021-01-18 07:41:34', 1, 1, 'Yes', '', 'No', 'clap', 4),
(4, 'Waqas Hassan has clapped on your challenge', '2021-03-03 01:48:50', 1, 1, 'No', '', 'No', 'clap', 31),
(7, 'Waqas Hassan has clapped on your challenge', '2021-03-03 03:57:20', 1, 1, 'No', '', 'No', 'clap', 30),
(8, 'Waqas Hassan has clapped on your challenge', '2021-03-03 04:14:57', 1, 1, 'No', '', 'No', 'clap', 28),
(9, 'Waqas Hassan has clapped on your challenge', '2021-03-03 04:57:00', 1, 1, 'No', '', 'No', 'clap', 35);

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `allplaylist_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`allplaylist_id`, `u_id`, `playlist_id`, `challenge_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 6, 1),
(4, 1, 19, 2),
(7, 1, 1, 1),
(8, 1, 2, 1),
(9, 1, 1, 1),
(10, 1, 1, 1),
(11, 1, 20, 3),
(12, 1, 22, 2),
(13, 1, 5, 2),
(14, 1, 6, 2),
(15, 1, 7, 2),
(16, 1, 25, 2),
(17, 1, 26, 1),
(18, 1, 1, 27),
(19, 1, 2, 27),
(20, 1, 27, 27);

-- --------------------------------------------------------

--
-- Table structure for table `playlist_names`
--

CREATE TABLE `playlist_names` (
  `playlist_id` int(11) NOT NULL,
  `playlist_name` text NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlist_names`
--

INSERT INTO `playlist_names` (`playlist_id`, `playlist_name`, `u_id`) VALUES
(1, 'test playlist', 1),
(2, 'test playlist 2', 1),
(3, 'test name', 1),
(4, 'test name', 1),
(5, 'test name', 1),
(6, 'test name1', 1),
(7, 'Hegdv', 1),
(8, 'Hegdvsf', 1),
(9, 'test name', 1),
(10, 'test name', 1),
(11, 'Dgdhgd', 1),
(12, 'Hello', 1),
(13, 'Hello', 1),
(14, 'Hello', 1),
(15, 'Tyuu', 1),
(16, 'Tyuu', 1),
(17, 'Titiir', 1),
(18, 'Hello', 1),
(19, 'Hi there', 1),
(20, 'Kgsksggzkhks', 1),
(21, 'Errr', 1),
(22, 'Gzkgkzhzk', 1),
(23, 'Hdndjsnsb', 1),
(24, 'Testing', 1),
(25, 'Jfjddhhsj', 1),
(26, 'Bddndjdb', 1),
(27, 'Hi there this is Zai', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reports_challenge`
--

CREATE TABLE `reports_challenge` (
  `report_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `reasons` text NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports_challenge`
--

INSERT INTO `reports_challenge` (`report_id`, `challenge_id`, `note`, `reasons`, `u_id`) VALUES
(1, 1, 'this is the note', 'Nudity', 1),
(2, 1, 'this is the note', 'violene', 1),
(3, 1, 'this is the note', 'Nudity', 1),
(4, 1, 'this is the note', 'violene', 1),
(5, 1, 'this is the note', 'Nudity', 1),
(6, 1, 'this is the note', 'Nudity', 1),
(7, 1, 'this is the note', 'violene', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
  `share_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shares`
--

INSERT INTO `shares` (`share_id`, `challenge_id`, `u_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1),
(10, 1, 1),
(11, 2, 1),
(12, 2, 1),
(13, 2, 1),
(14, 2, 0),
(15, 2, 0),
(16, 2, 0),
(17, 2, 0),
(18, 2, 0),
(19, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE `submenu` (
  `id` int(3) NOT NULL,
  `parentid` int(3) NOT NULL,
  `subpagename` varchar(30) NOT NULL,
  `pageurl` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`id`, `parentid`, `subpagename`, `pageurl`) VALUES
(1, 2, 'Company Information', 'Company'),
(2, 2, 'User Management', 'Employee'),
(3, 4, 'Sale Return', 'Sale/Returns'),
(4, 2, 'Category', 'Category'),
(5, 2, 'Activity', 'Activity'),
(6, 2, 'Product', 'Product'),
(7, 2, 'Vendor', 'Vendor'),
(8, 2, 'Customers', 'Customers'),
(9, 2, 'Area', 'Area'),
(10, 3, 'Purchase', 'Purchase'),
(11, 4, 'Sale', 'Sale'),
(12, 2, 'Cash Opening', 'Cashopening'),
(14, 2, 'Banks', 'Banks'),
(15, 6, 'Cash payment', 'Cashpayment'),
(16, 6, 'Cash Receive', 'Cashreceive'),
(17, 6, 'Bank Payment', 'Bankpayment'),
(18, 6, 'Bank Receive', 'Bankreceive'),
(19, 7, 'Sale B/w Date', 'Saledatereport'),
(20, 7, 'Summary', 'Summary'),
(21, 4, 'Order', 'Orders'),
(22, 6, 'Chart of accounts', 'COA'),
(23, 2, 'Accounts', 'Accounts'),
(24, 8, 'Site Settings', 'Sitesettings'),
(25, 2, 'Rate', 'Rate'),
(26, 7, 'Customer ledger', 'Customerledger');

-- --------------------------------------------------------

--
-- Table structure for table `trans_detail`
--

CREATE TABLE `trans_detail` (
  `trans_detail_id` int(11) NOT NULL,
  `vdate` date NOT NULL,
  `vno` varchar(20) NOT NULL,
  `camount` text NOT NULL,
  `damount` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=''Opening Balance'',''1''=''Normal''',
  `acode` bigint(11) NOT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `vtype` varchar(20) NOT NULL,
  `rcvd_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_detail`
--

INSERT INTO `trans_detail` (`trans_detail_id`, `vdate`, `vno`, `camount`, `damount`, `company_id`, `type`, `acode`, `remarks`, `created_by`, `vtype`, `rcvd_by`) VALUES
(9, '2020-03-17', '2-Purchase', '6400', '0', 7, '1', 18, 'Bulk Purchase #:2, Array@Array', 14, 'BP', 0),
(10, '2020-03-17', '2-Purchase', '0', '6400', 7, '1', 25, 'Bulk Purchase #:2, Array@Array', 14, 'BP', 0),
(19, '2019-01-01', '', '0', '2564', 1, '0', 5, 'Opening Balance', 1, 'OPNGBL', 0),
(20, '2019-01-01', '', '2541', '0', 1, '0', 14, 'Opening Balance', 1, 'OPNGBL', 0),
(21, '2020-03-19', '1-Sale', '0', '4815', 1, '1', 15, '', 1, 'BS', 0),
(22, '2020-03-19', '1-Sale', '4815', '0', 1, '1', 7, '', 1, 'BS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trans_master`
--

CREATE TABLE `trans_master` (
  `trans_id` int(11) NOT NULL,
  `vno` text NOT NULL,
  `vtype` varchar(10) NOT NULL,
  `trans_date` date NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `party_name` bigint(11) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `remarks` text NOT NULL,
  `rcvd_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_master`
--

INSERT INTO `trans_master` (`trans_id`, `vno`, `vtype`, `trans_date`, `company_id`, `created_by`, `party_name`, `amount`, `remarks`, `rcvd_by`) VALUES
(1, '2-Purchase', 'BP', '2020-03-17', 7, 14, 18, '6400', 'this is just remarks', 0),
(5, '1-Sale', 'BS', '2020-03-19', 1, 1, 15, '4815', 'dfgh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `f_name` varchar(40) NOT NULL,
  `l_name` text NOT NULL,
  `username` text NOT NULL,
  `gender` text NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` text NOT NULL,
  `Joining_date` date NOT NULL,
  `status` enum('Active','InActive') NOT NULL,
  `dashboard` enum('0','1') NOT NULL COMMENT '0=Show,1=Hide',
  `token` text DEFAULT NULL,
  `login_time` int(250) NOT NULL,
  `user_status` enum('0','1','2','3') NOT NULL COMMENT '0=User,1=Admin,2=Employee,3=Vendor',
  `dp` text NOT NULL,
  `auth` text NOT NULL,
  `email_verified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `login_with` text DEFAULT NULL,
  `otp` text NOT NULL,
  `bio` text NOT NULL,
  `lati` text DEFAULT NULL,
  `longi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `f_name`, `l_name`, `username`, `gender`, `email`, `pass`, `Joining_date`, `status`, `dashboard`, `token`, `login_time`, `user_status`, `dp`, `auth`, `email_verified`, `login_with`, `otp`, `bio`, `lati`, `longi`) VALUES
(1, 'Waqas Hassan', '', 'abc', '', 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2019-08-08', 'Active', '0', 'c3nHxca4TBG9HLm6-Ol7oO:APA91bGkT3rkAcVIlU93EP4lRpuLUi4P8kTfo5Q1N2gAL26Vj0aTOozGxW6rrPO4tY5yarAMS5QWhnrV_Ia4D699oeBpTOU1rP2HvFKS2ytM660bRbyEP0j_2Ofx-75NtdnTfyGUNmPJ', 0, '1', 'uploads/image', 'c4ca4238a0b923820dcc509a6f75849b', 'Yes', NULL, '', 'Jkjk', '33.5564735', '73.0231761'),
(61, 'Zaheer', 'Hasan', 'Zaheer', 'male', 'zaheer_hasan1@yahoo.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2020-10-15', 'Active', '0', 'frnqsUFUSzGqU1vRHe-7Zx:APA91bGooWkVPFwg88TDGw3WerHgWJ8Cg9X8ES0a_GJMCL4ehpgU8ha_LZMgnKSHGHbz8HoM54WclvrLJ__sNle11cnMEIiVyBt_wyNDSOrWTWHPoSRuSlIOED0g6LXPFjpCdvUzPaua', 0, '0', 'assets/images/dp.png', '', 'No', NULL, '', '', NULL, NULL),
(62, 'Zaid', 'ali', 'Zaheer', 'male', 'zaidali@yahoo.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2020-10-15', 'Active', '0', 'frnqsUFUSzGqU1vRHe-7Zx:APA91bGooWkVPFwg88TDGw3WerHgWJ8Cg9X8ES0a_GJMCL4ehpgU8ha_LZMgnKSHGHbz8HoM54WclvrLJ__sNle11cnMEIiVyBt_wyNDSOrWTWHPoSRuSlIOED0g6LXPFjpCdvUzPaua', 0, '0', 'assets/images/dp.png', '', 'No', NULL, '', '', NULL, NULL),
(63, 'hamza', 'atta', 'hamatta', 'male', 'hami@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2020-11-05', 'Active', '0', '1234567890', 123, '0', 'amb.png', '1234', 'No', NULL, '123', 'se', 'xy', 'jjjj'),
(64, 'Zeeshan', 'Shahid', 'zeeshanshahid.dawahsoft', 'male', 'zeeshanshahid.dawahsoft@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2020-11-26', 'Active', '0', 'cqww7ClNTYyPdhW7oiLNSc:APA91bG_HSKuRZGWMYDqrI5cuNTyIb0oTUaLOpMrFb5iUn7otoSlQr4D0A2L3nK7aA3pSrV96iMa8CkB9dljlqtsBajuXH4MWYnKLPSHpoNRGVST5Ho0yHQN9hntymwaN8YM1gTJqoyt', 0, '0', 'assets/images/dp.png', '', 'No', NULL, '', '', NULL, NULL),
(65, 'Zeeshan', 'Manzoor', 'zeeshanmanzoor', 'male', 'zeeshanmanzoor2010@gmail.com', '7f9fc64d99e6fbf59c8924246381718cd3e9ea80', '2020-12-03', 'Active', '0', 'd6n8AapDSfatJ1-4t6i51Z:APA91bGHXdQZHb3xTQLjUUe97YMyJFKYzoEsn2i7Frs750MY2WAzq5JWtYmB0uOfkt3P9CoNFHgUCR6mz7sXvxBWI_qH3GuV2FX0qoR7Kwtxvfx9CGmnTRYAM8JQtSDoeAIyezR0nneq', 0, '0', 'assets/images/dp.png', '', 'No', NULL, '', '', NULL, NULL),
(66, 'Kashif ', 'Mustafa ', 'Kashif214', 'male', 'Kashifmustafa213@gmail.com', '7c65320e1af3d12623e7eb5588d3a0321404122a', '2020-12-06', 'Active', '0', 'fk2TJ3d_STOqTOZ5aO9KHn:APA91bGz1wMJEZP51x9TdtoNmC9eq6KhIfknxko7-2ha1TIfVfOcbq4goJiKPn3wOn2Sxvt7tqdOsaDGe3te5w-F8U8cC_AUzKUjjI74HpFBjpmTtxS9lsh8C9ohOpWT7qThliwGGl3B', 0, '0', 'assets/images/dp.png', '', 'No', NULL, '', '', NULL, NULL),
(67, 'Waqas', 'Hasan', 'Waqashassna', 'male', 'waqashassan100@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2021-01-19', 'Active', '0', 'eotspEatTtiAOZGqnhp7JD:APA91bG0-Xm9Av2xOZKQrl3bUHkDAIINzbJ8FkwLVPwj512KWcSy0w_CMMJDx-5BJTMTPBeyJ8fpGwYjA1qBdfw-Jgs_R9f9CydqJOmKnaInBZ7SuAnINlojRnI5buQZjCBhR3VNE1QX', 0, '0', 'assets/images/dp.png', '', 'No', NULL, '', '', NULL, NULL),
(68, 'Ik', 'Jk', 'Ik.jk12', 'male', 'khanahmedhassaan@gmail.com', 'b406a05d19007690d0f3b7197abcf6e21ad7046f', '2021-01-21', 'Active', '0', 'dI9YwF4lRxii8cIk8_BMvy:APA91bG23tqf6aaQ9sFX15JG_nanq_C2Vb5FWdjFQXJwnqF1jsAcDbzVQdWd0ifCUk_Pbrr1yBVvMj502d5jpu98sgEEwH-83r0QkuucN8WZQgLYa_-UTHyL_SZzIeQleKJTa1AM0_64', 0, '0', 'assets/images/dp.png', '', 'No', NULL, '', '', NULL, NULL),
(69, 'Zaid', 'Qureshi', 'Zaid', 'male', 'Zaid@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2021-03-02', 'Active', '0', NULL, 0, '0', 'assets/images/dp.png', '', 'No', NULL, '', '', '37.785834', '-122.406417');

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `user_interest_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_interests`
--

INSERT INTO `user_interests` (`user_interest_id`, `Id`, `u_id`) VALUES
(19, 1, 42),
(20, 2, 42),
(21, 4, 42),
(22, 2, 42),
(23, 3, 42),
(24, 4, 42),
(25, 12, 42),
(26, 24, 42);

-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE `user_rights` (
  `id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_rights`
--

INSERT INTO `user_rights` (`id`, `u_id`, `page_id`) VALUES
(71, 3, 1),
(72, 3, 2),
(73, 3, 3),
(85, 10, 2),
(87, 14, 1),
(88, 14, 2),
(89, 14, 4),
(90, 14, 5),
(91, 14, 6),
(92, 14, 7),
(93, 14, 8),
(94, 14, 9),
(95, 14, 12),
(96, 14, 14),
(97, 14, 23),
(98, 14, 10),
(99, 14, 3),
(100, 14, 11),
(101, 14, 21),
(102, 14, 15),
(103, 14, 16),
(104, 14, 17),
(105, 14, 18),
(106, 14, 22),
(107, 14, 19),
(108, 14, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
  ADD PRIMARY KEY (`challenge_id`);

--
-- Indexes for table `challenge_views`
--
ALTER TABLE `challenge_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Indexes for table `claps`
--
ALTER TABLE `claps`
  ADD PRIMARY KEY (`clap_id`);

--
-- Indexes for table `collectiopns`
--
ALTER TABLE `collectiopns`
  ADD PRIMARY KEY (`collection_id`);

--
-- Indexes for table `download_clap`
--
ALTER TABLE `download_clap`
  ADD PRIMARY KEY (`download_clap_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`follow_id`);

--
-- Indexes for table `general`
--
ALTER TABLE `general`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hide_challenge`
--
ALTER TABLE `hide_challenge`
  ADD PRIMARY KEY (`hide_challenge_id`);

--
-- Indexes for table `Interest`
--
ALTER TABLE `Interest`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `main_menu`
--
ALTER TABLE `main_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `msgs`
--
ALTER TABLE `msgs`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `my_searches`
--
ALTER TABLE `my_searches`
  ADD PRIMARY KEY (`search_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`noti_id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`allplaylist_id`);

--
-- Indexes for table `playlist_names`
--
ALTER TABLE `playlist_names`
  ADD PRIMARY KEY (`playlist_id`);

--
-- Indexes for table `reports_challenge`
--
ALTER TABLE `reports_challenge`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`share_id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_detail`
--
ALTER TABLE `trans_detail`
  ADD PRIMARY KEY (`trans_detail_id`);

--
-- Indexes for table `trans_master`
--
ALTER TABLE `trans_master`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD PRIMARY KEY (`user_interest_id`);

--
-- Indexes for table `user_rights`
--
ALTER TABLE `user_rights`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;

--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges`
  MODIFY `challenge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `challenge_views`
--
ALTER TABLE `challenge_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `claps`
--
ALTER TABLE `claps`
  MODIFY `clap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `collectiopns`
--
ALTER TABLE `collectiopns`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `download_clap`
--
ALTER TABLE `download_clap`
  MODIFY `download_clap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `general`
--
ALTER TABLE `general`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hide_challenge`
--
ALTER TABLE `hide_challenge`
  MODIFY `hide_challenge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Interest`
--
ALTER TABLE `Interest`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `main_menu`
--
ALTER TABLE `main_menu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `msgs`
--
ALTER TABLE `msgs`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `my_searches`
--
ALTER TABLE `my_searches`
  MODIFY `search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `noti_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `allplaylist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `playlist_names`
--
ALTER TABLE `playlist_names`
  MODIFY `playlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `reports_challenge`
--
ALTER TABLE `reports_challenge`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shares`
--
ALTER TABLE `shares`
  MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `trans_detail`
--
ALTER TABLE `trans_detail`
  MODIFY `trans_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `trans_master`
--
ALTER TABLE `trans_master`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `user_interest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_rights`
--
ALTER TABLE `user_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
