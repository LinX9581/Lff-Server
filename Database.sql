-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 16, 2019 at 03:33 AM
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
  `image` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `achievement`
--

INSERT INTO `achievement` (`activity_id`, `title`, `location`, `date`, `content`, `category`, `achieve_condition`, `image`) VALUES
(16, '金瑪莉用餐', '金瑪莉', '2019-10-03', '到金瑪莉點選任一餐點，並發布貼文、上傳照片', '美食類', '獲得5個支持', 'shop'),
(17, '古拉爵用餐', '古拉爵', '2019-10-20', '到任一古拉爵分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_2'),
(18, '遊動物園', '臺北市立動物園', '2019-10-23', '在動物園拍任一張照片上傳', '旅遊類', '拍照地點在臺北市立動物園', 'zoo'),
(19, '歷史類', NULL, NULL, 'question_history', '益智類', 'no_condition', 'history'),
(20, '遊世新', '世新大學管理學院', '2019-12-12', '拍一張照片上傳', '旅遊類', '拍照地點在世新大學', 'taipei_101'),
(21, '遊三角冰', '三角冰', '2019-12-31', '拍一張照片上傳', '旅遊類', '拍照地點在三角冰', 'ice_shop'),
(22, '魷魚大叔用餐', '魷魚大叔', NULL, '到任一家魷魚大叔分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_3'),
(23, '起家雞用餐', '起家雞', NULL, '到任一家起家雞分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_4'),
(24, '銷魂麵舖用餐', '銷魂麵舖', NULL, '到任一家銷魂麵舖用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_5'),
(25, '米朗琪用餐', '米朗琪', NULL, '到任一家米朗琪分店用餐，並發布貼文、上傳圖片', '美食類', '獲得5個支持', 'shop_6'),
(26, '科學類', 'NULL', NULL, 'question_science', '益智類', 'no_condition', 'science');

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
(1, 16, '0914', 'complete'),
(2, 17, 'Bill', 'complete'),
(10, 16, 'Amy', 'complete'),
(11, 16, 'toolmanhsu', 'complete'),
(13, 16, 'Ally', 'complete'),
(17, 17, 'BiboBibo', 'complete'),
(18, 17, 'Ally5520', 'complete'),
(19, 17, '0914', 'complete'),
(20, 24, 'Ally5520', 'complete'),
(21, 22, '0914', 'processing'),
(22, 16, 'Yanky5572', 'processing'),
(29, 21, '0914', 'complete');

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
('0914', '0914', '0914/0914.jpg'),
('Ally', 'Ally', 'Ally/Ally.jpg'),
('Ally5520', 'Ally5520', 'Ally5520/Ally5520.jpg'),
('BiboBibo', 'BiboBibo', 'BiboBibo/BiboBibo.jpg'),
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
  `image_uri` varchar(30) NOT NULL DEFAULT 'default/logo.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `activity_id`, `user_id`, `title`, `date`, `content`, `image_uri`) VALUES
(1, 16, '0914', '金瑪莉用餐', '2019-11-11', '平價高CP值義大利麵', '0914/16_0914.jpg'),
(3, 23, 'Ally', '起家雞用餐', '2019-11-11', '餐點美味、讓人停不下來', 'Ally/23_Ally.jpg'),
(4, 16, 'toolmanhsu', '金瑪莉用餐', '2019-10-19', '還是金瑪莉最對味', 'toolmanhsu/16_toolmanhsu.jpg'),
(5, 17, 'BiboBibo', '古拉爵用餐', '2019-10-22', '燈光美、氣氛佳', 'BiboBibo/17_BiboBibo.jpg'),
(6, 16, 'Ally5520', '古拉爵用餐', '2019-10-05', '餐點佳、飲料甜而不膩', 'Ally5520/17_Ally5520.jpg'),
(7, 24, 'Ally5520', '銷魂麵鋪用餐', '2019-10-19', '湯頭濃郁、麵條Q彈', 'Ally5520/24_Ally5520.jpg'),
(8, 16, 'admin', '金瑪莉用餐', '2019-10-19', '123', 'default/logo.png'),
(9, 17, '0914', '古拉爵用餐', '2019-10-19', '用餐環境佳、服務快速', '0914/17_0914.jpg'),
(10, 22, '0914', '魷魚大叔用餐', '2019-10-19', '', '0914/22_0914.jpg'),
(11, 16, 'Yanky5572', '金瑪莉用餐', '2019-10-19', '', 'Yanky5572/16_Yanky5572.jpg');

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
(14, 2, '0914', 1),
(56, 3, '0914', 1),
(61, 6, 'admin', 1),
(62, 6, 'admin', 1),
(63, 6, 'admin', 1),
(64, 6, 'admin', 1),
(65, 7, 'admin', 1),
(66, 9, 'admin', 1),
(69, 3, 'admin', 1),
(70, 3, 'admin', 1),
(78, 6, '0914', 1),
(133, 9, 'Yanky5572', 1),
(134, 7, 'Yanky5572', 1),
(135, 1, 'Yanky5572', 1),
(141, 1, '0914', 1),
(142, 5, '0914', 1),
(143, 7, '0914', 1);

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
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `achievement_task`
--
ALTER TABLE `achievement_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `medal`
--
ALTER TABLE `medal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `statistic_praise`
--
ALTER TABLE `statistic_praise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
