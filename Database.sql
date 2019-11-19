-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 19, 2019 at 08:18 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `react_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievement`
--

CREATE TABLE `achievement` (
  `activity_id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` varchar(80) NOT NULL,
  `category` varchar(10) NOT NULL,
  `achieve_condition` varchar(30) NOT NULL DEFAULT 'no_condition',
  `image` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `achievement`
--

INSERT INTO `achievement` (`activity_id`, `title`, `location`, `date`, `content`, `category`, `achieve_condition`, `image`) VALUES
(16, '金瑪莉用餐', '金瑪莉', '2019-10-03', '到金瑪莉點選任一餐點，並發布貼文、上傳照片', '美食類', '獲得5個支持', 'shop'),
(17, '古拉爵用餐', '古拉爵', '2019-10-20', '到任一古拉爵分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_2'),
(18, '遊動物園', '臺北市立動物園', '2019-10-23', '在動物園拍任一張照片上傳', '旅遊類', '拍照地點在臺北市立動物園', 'zoo'),
(19, '歷史類', NULL, NULL, 'question_history', '益智類', 'no_condition', 'history'),
(20, '遊世新', '世新大學管理學院', '2019-12-12', '拍一張照片上傳', '旅遊類', '拍照地點在世新大學', 'shu'),
(22, '魷魚大叔用餐', '魷魚大叔', NULL, '到任一家魷魚大叔分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_3'),
(23, '起家雞用餐', '起家雞', NULL, '到任一家起家雞分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_4'),
(24, '銷魂麵舖用餐', '銷魂麵舖', NULL, '到任一家銷魂麵舖用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_5'),
(25, '米朗琪用餐', '米朗琪', NULL, '到任一家米朗琪分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_6'),
(26, '科學類', 'NULL', NULL, 'question_science', '益智類', 'no_condition', 'science'),
(27, '遊公館夜市', '公館夜市', '2019-10-30', '在公館夜市拍任一張照片上傳', '旅遊類', '拍照地點在公館夜市', 'Market_2'),
(28, '遊景美夜市', '景美夜市', '2019-10-30', '在景美夜市拍任一張照片上傳', '旅遊類', '拍照地點在景美夜市', 'Market_1'),
(29, '遊中正紀念堂', '中正紀念堂', '2019-10-30', '在中正紀念堂拍任一張照片上傳', '旅遊類', '拍照地點在中正紀念堂', 'Memorial_hall'),
(30, '遊台北101', '台北101', '2019-10-30', '在台北101拍任一張照片上傳', '旅遊類', '拍照地點在台北101', 'Taipei_101'),
(31, '遊國父紀念館', '國立國父紀念館', '2019-10-30', '在國父紀念館拍任一張照片上傳', '旅遊類', '拍照地點在國父紀念館', 'Memorial'),
(32, '遊松山文創園區', '松山文創園區', '2019-10-30', '在松山文創園區拍任一張照片上傳', '旅遊類', '拍照地點在松山文創園區', 'Park'),
(33, '遊華山文創園區', '華山1914文化創意產業園區', '2019-10-30', '在華山文創園區拍任一張照片上傳', '旅遊類', '拍照地點在華山文創園區', 'Park_2'),
(34, '遊兒童新樂園', '臺北市兒童新樂園區', '2019-10-30', '在兒童新樂園拍任一張照片上傳', '旅遊類', '拍照地點在兒童新樂園', 'Paradise'),
(35, '遊科教館', '國立臺灣科學教育館', '2019-10-30', '在科教館拍任一張照片上傳', '旅遊類', '拍照地點在科教館', 'Education_hall'),
(36, '遊故宮博物院', '國立故宮博物院', '2019-10-30', '在故宮博物院拍任一張照片上傳', '旅遊類', '拍照地點在故宮博物院', 'Forbidden_city'),
(37, '遊士林花園官邸', '士林花園官邸', '2019-10-30', '在士林花園官邸拍任一張照片上傳', '旅遊類', '拍照地點在士林花園官邸', 'Shilin'),
(38, '鼎泰豐用餐', '鼎泰豐', '2019-10-10', '到任一鼎泰豐分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_7'),
(39, '田季發爺用餐', '田季發爺', '2019-10-10', '到任一田季發爺分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_8'),
(40, '春水堂用餐', '春水堂', '2019-10-10', '到任一春水堂分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_9'),
(41, '莫凡彼用餐', '莫凡彼咖啡館', '2019-10-10', '到任一莫凡彼咖啡館分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_10'),
(42, '杏子豬排用餐', '銀座杏仔日式豬排', '2019-10-10', '到任一杏子豬排分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_11');

-- --------------------------------------------------------

--
-- Table structure for table `achievement_task`
--

CREATE TABLE `achievement_task` (
  `id` int(11) NOT NULL,
  `activity_id` int(5) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `achievement_task`
--

INSERT INTO `achievement_task` (`id`, `activity_id`, `user_id`, `status`) VALUES
(1, 16, '0914', 'processing'),
(2, 17, 'Bill', 'complete'),
(10, 16, 'Amy', 'processing'),
(11, 16, 'toolmanhsu', 'processing'),
(13, 16, 'Ally', 'processing'),
(17, 17, 'BiboBibo', 'complete'),
(19, 17, '0914', 'complete'),
(20, 24, 'Ally5520', 'complete'),
(21, 22, '0914', 'processing'),
(22, 16, 'Yanky5572', 'processing'),
(30, 25, 'Ally5520', 'processing'),
(32, 25, 'John0914', 'processing'),
(33, 20, 'John0914', 'complete'),
(34, 17, 'Ally5520', 'complete'),
(38, 20, '105221051', 'complete'),
(39, 16, 'Ally5520', 'processing'),
(40, 24, '105221051', 'processing'),
(41, 20, 'Ally5520', 'complete'),
(42, 19, '105221051', 'complete'),
(43, 26, '105221051', 'complete'),
(44, 19, 'Ally5520', 'complete'),
(46, 20, 'linxlinx', 'complete');

-- --------------------------------------------------------

--
-- Table structure for table `medal`
--

CREATE TABLE `medal` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `describe_medal` varchar(15) NOT NULL,
  `image` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medal`
--

INSERT INTO `medal` (`id`, `activity_id`, `describe_medal`, `image`) VALUES
(3, 16, '金瑪莉用餐', 'food.png');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `head_sticker` varchar(50) NOT NULL DEFAULT 'default/logo.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`account`, `password`, `head_sticker`) VALUES
('105221051', '12345678', '105221051/105221051.jpg'),
('Ally5520', 'Ally5520', 'Ally5520/Ally5520.jpg'),
('Ally75000', 'Ally75000', 'Ally75000/Ally75000.jpg'),
('BiboBibo', 'BiboBibo', 'BiboBibo/BiboBibo.jpg'),
('John0914', 'John0914', 'John0914/John0914.jpg'),
('linxlinx', 'linxlinx', 'linxlinx/linxlinx.jpg'),
('toolmanhsu', 'toolmanhsu', 'toolmanhsu/toolmanhsu.jpg'),
('Yanky5572', 'Yanky5572', 'Yanky5572/Yanky5572.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `activity_id` int(6) NOT NULL,
  `user_id` varchar(20) NOT NULL DEFAULT 'admin',
  `title` varchar(20) NOT NULL,
  `date` date NOT NULL DEFAULT '2019-10-19',
  `content` varchar(50) NOT NULL,
  `image_uri` varchar(60) NOT NULL DEFAULT 'default/logo.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `activity_id`, `user_id`, `title`, `date`, `content`, `image_uri`) VALUES
(1, 16, 'John0914', '金瑪莉用餐', '2019-10-19', '平價高CP值義大利麵', 'John0914/16_John0914.jpg'),
(3, 23, 'Ally75000', '起家雞用餐', '2019-10-19', '餐點美味、讓人停不下來', 'Ally75000/23_Ally75000.jpg'),
(4, 16, 'toolmanhsu', '金瑪莉用餐', '2019-10-19', '還是金瑪莉最對味', 'toolmanhsu/16_toolmanhsu.jpg'),
(5, 17, 'BiboBibo', '古拉爵用餐', '2019-10-19', '燈光美、氣氛佳', 'BiboBibo/17_BiboBibo.jpg'),
(7, 24, 'Ally5520', '銷魂麵鋪用餐', '2019-10-19', '湯頭濃郁、麵條Q彈', 'Ally5520/24_Ally5520.jpg'),
(9, 17, 'John0914', '古拉爵用餐', '2019-10-19', '用餐環境佳、服務快速', 'John0914/17_John0914.jpg'),
(10, 22, 'John0914', '魷魚大叔用餐', '2019-10-19', '香氣十足，醬汁入味', 'John0914/22_John0914.jpg'),
(12, 25, 'Ally5520', '米朗琪用餐', '2019-10-19', '美味鬆餅，讓人停不下來', 'Ally5520/25_Ally5520.jpg'),
(16, 25, 'John0914', '米朗琪用餐', '2019-11-17', '', 'John0914/25_John0914.jpg'),
(19, 0, 'John0914', '陽明山一日遊', '2019-11-18', '美好的天氣，美好的一日', 'John0914/6d9f2989-5b01-4402-860c-31017c9b7b44.jpg'),
(20, 0, 'Ally5520', '陽明山一日遊', '2019-11-18', '空氣清晰、讓人放鬆的好去處', 'Ally5520/d4b4a282-36c0-4c6e-b523-142b6c45daf7.jpg'),
(21, 17, 'Ally5520', '古拉爵用餐', '2019-11-19', '香味十足', 'Ally5520/17_Ally5520.jpg'),
(22, 0, '105221051', '2019新北耶誕城', '2019-11-19', '2019 X’mas', '105221051/89df3adb-90d3-401b-84f3-e870dbaee94b.jpg'),
(23, 0, 'linxlinx', '珍珠披薩', '2019-11-19', '越吃越怪？！', 'linxlinx/3cd5adac-ab93-44a1-a308-3278941a348e.jpg'),
(24, 0, 'linxlinx', 'Goshare', '2019-11-19', '看了不想租r', 'linxlinx/36c58f2e-b844-41cf-9639-874d6f61fefb.jpg'),
(26, 0, '105221051', '大地球', '2019-11-19', '出現在信義區街頭的大地球', '105221051/5aef5850-1e07-468c-bd55-1f15a39b888b.jpg'),
(27, 16, 'Ally5520', '金瑪莉用餐', '2019-11-19', '昨天吃的', 'Ally5520/16_Ally5520.jpg'),
(28, 24, '105221051', '銷魂麵舖用餐', '2019-11-19', '排好久', '105221051/24_105221051.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `statistic_praise`
--

CREATE TABLE `statistic_praise` (
  `id` int(11) NOT NULL,
  `post_id` int(6) NOT NULL,
  `giver` varchar(20) NOT NULL,
  `praise` int(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statistic_praise`
--

INSERT INTO `statistic_praise` (`id`, `post_id`, `giver`, `praise`) VALUES
(14, 2, 'John0914', 1),
(56, 3, 'John0914', 1),
(65, 7, 'admin', 1),
(66, 9, 'admin', 1),
(69, 3, 'admin', 1),
(70, 3, 'admin', 1),
(133, 9, 'Yanky5572', 1),
(134, 7, 'Yanky5572', 1),
(135, 1, 'Yanky5572', 1),
(142, 5, 'John0914', 1),
(143, 7, 'John0914', 1),
(144, 13, 'John0914', 1),
(145, 17, 'John0914', 1),
(146, 1, 'John0914', 1),
(147, 9, 'John0914', 1),
(148, 14, 'John0914', 1),
(149, 4, 'John0914', 1),
(150, 10, 'John0914', 1),
(151, 16, 'John0914', 1),
(152, 19, 'John0914', 1),
(153, 7, 'Ally5520', 1),
(154, 6, 'Ally5520', 1),
(155, 12, 'Ally5520', 1),
(158, 4, 'Ally5520', 1),
(159, 3, 'Ally5520', 1),
(160, 5, 'Ally5520', 1),
(161, 19, 'Ally5520', 1),
(162, 16, 'Ally5520', 1),
(163, 1, 'Ally5520', 1),
(164, 10, 'Ally5520', 1),
(166, 20, 'Ally5520', 1),
(167, 21, 'Ally5520', 1),
(168, 21, 'admin', 1),
(169, 21, 'admin', 1),
(170, 21, 'admin', 1),
(171, 21, 'admin', 1),
(172, 21, 'admin', 1),
(176, 7, 'linxlinx', 1),
(177, 27, 'Ally5520', 1),
(178, 26, 'Ally5520', 1),
(179, 23, 'Ally5520', 1),
(180, 28, '105221051', 1),
(181, 9, 'Ally5520', 1),
(182, 22, 'Ally5520', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievement`
--
ALTER TABLE `achievement`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `achievement_task`
--
ALTER TABLE `achievement_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medal`
--
ALTER TABLE `medal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`account`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `statistic_praise`
--
ALTER TABLE `statistic_praise`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievement`
--
ALTER TABLE `achievement`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `achievement_task`
--
ALTER TABLE `achievement_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `medal`
--
ALTER TABLE `medal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `statistic_praise`
--
ALTER TABLE `statistic_praise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
