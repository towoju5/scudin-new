-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2023 at 01:02 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scudin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_role_id` bigint NOT NULL DEFAULT '2',
  `image` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '08137757328', 1, '2022-06-17-62acdf101c9eb.png', 'towojuads@gmail.com', NULL, '$2y$10$DjIQAYnHLLjSpsjS8UtfWeJ3KgUFfQm3PIx2JZr9.XiD4E2Lsx.kK', 'o7YyQSg93gqTIhbeQ6vV2HplXjv0RZ1e9m628pYhYmRMHA8TdQKcQqcL0C4p', NULL, '2022-11-04 00:41:00'),
(3, 'Eta Vouxera', '8176185015', 3, '2022-10-28-635b70289d11d.png', 'info@scudin.com', NULL, '$2y$10$YqSWdr431i4Sr5sonHH2Ruqa4TjXWPlfajdSmiZKNs5DaILeY9KMS', NULL, '2022-10-28 06:01:12', '2022-10-28 06:01:12'),
(4, 'test', '07065184234', 2, '2022-11-03-6363531154a75.png', 'test@gmail.com', NULL, '$2y$10$4cMz/UgZ6c7x8kr0oKaxc.aZOScoT8WUN9jzYgigUPEkucK3jkCl.', NULL, '2022-11-03 05:35:13', '2022-11-03 05:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_access` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(2, 'Employee', '[\"product\",\"order\",\"category\",\"brand\",\"employee\",\"coupon\",\"messages\",\"banner\",\"attribute\"]', 1, NULL, '2021-03-07 21:52:50'),
(3, 'product manager', '[\"product\",\"order\",\"category\"]', 1, '2020-12-05 19:39:57', '2021-03-07 18:18:19'),
(4, 'banner manager', '[\"messages\",\"banner\"]', 1, '2021-03-08 15:46:47', '2021-03-08 15:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `withdrawn` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `balance`, `withdrawn`, `created_at`, `updated_at`) VALUES
(1, 1, '999999.99', '0.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallet_histories`
--

INSERT INTO `admin_wallet_histories` (`id`, `admin_id`, `amount`, `order_id`, `product_id`, `payment`, `created_at`, `updated_at`) VALUES
(1, 1, '53.01', 100011, 5, 'received', '2022-06-09 17:46:49', '2022-06-09 17:46:49'),
(2, 1, '53.01', 100015, 5, 'received', '2022-06-10 00:36:21', '2022-06-10 00:36:21'),
(3, 1, '3750.00', 100012, 4, 'received', '2022-06-10 00:36:39', '2022-06-10 00:36:39'),
(4, 1, '53.01', 100010, 5, 'received', '2022-06-10 00:36:53', '2022-06-10 00:36:53'),
(5, 1, '5196.00', 100001, 9, 'received', '2022-08-28 18:10:58', '2022-08-28 18:10:58');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2022-07-23 01:16:46', '2022-07-23 01:16:46'),
(2, 'Storage', '2022-07-23 01:17:29', '2022-07-23 01:17:29'),
(4, 'New', '2022-08-09 05:35:51', '2022-08-09 05:35:51'),
(5, 'Used', '2022-08-09 05:36:16', '2022-08-09 05:36:16'),
(6, 'Millage', '2022-08-09 05:37:15', '2022-08-09 05:37:15'),
(7, 'Publisher', '2022-08-16 14:06:31', '2022-08-16 14:06:31'),
(8, 'Published Date', '2022-08-16 14:06:39', '2022-08-16 14:06:39'),
(9, 'ISBN', '2022-08-16 14:13:33', '2022-08-16 14:13:33'),
(11, 'Author', '2022-08-16 16:13:25', '2022-08-16 16:13:25'),
(12, 'Rental', '2022-08-16 16:13:39', '2022-08-16 16:13:39'),
(15, 'Language', '2022-08-16 18:24:25', '2022-08-16 18:24:25'),
(16, 'Printing Type', '2022-08-16 18:30:07', '2022-08-16 19:08:28'),
(17, 'Service Embedded', '2022-08-19 20:14:23', '2022-08-19 20:14:23'),
(18, 'Warranty', '2022-08-19 23:08:34', '2022-08-19 23:08:34'),
(20, 'Charging', '2022-09-01 03:36:15', '2022-09-01 03:36:15'),
(21, 'Power', '2022-09-01 03:36:51', '2022-09-01 03:36:51'),
(22, 'Speaker', '2022-09-01 03:37:30', '2022-09-01 03:37:30'),
(23, 'Dad Size', '2022-09-05 19:15:57', '2022-09-05 19:15:57'),
(24, 'Mom Size', '2022-09-05 19:16:19', '2022-09-05 19:16:19'),
(25, 'Kids Size', '2022-09-05 19:17:36', '2022-09-05 19:17:36'),
(26, 'Memory', '2022-11-02 22:16:13', '2022-11-02 22:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`) VALUES
(1, '/storage/app/public/banner/e6d22cc2fca3b7c29d2e3ebb750f5106a78542a5.jpg', 'Main Banner', 1, '2022-08-30 18:13:25', '2022-09-25 14:56:09', '<h1>Welcome to Scudin</h1>'),
(2, '/storage/app/public/banner/6e3f20682da0bc3570e8f55a174576e5fab5f4c3.jpg', 'Main Banner', 1, '2022-08-30 20:14:11', '2022-10-30 13:27:29', '<h1>With Scudin Ethos Free Shipping Account</h1>'),
(3, '/storage/app/public/banner/081e7fd7e636c75a5bdfb703325a1d11f7d0f252.jpg', 'Main Banner', 1, '2022-08-31 04:37:21', '2022-09-25 03:55:12', '.'),
(4, '/storage/app/public/banner/e3ff1db7f47d2fdbe80dc6f2156252971ec6f804.jpg', 'Main Banner', 1, '2022-08-31 04:42:38', '2022-09-25 03:55:28', '.'),
(8, '/storage/app/public/banner/845c88a8209fe4c94c46a8088ffe753aae45ed71.jpg', 'Main Banner', 1, '2022-09-28 03:01:59', '2022-09-28 03:01:59', '.'),
(9, '/storage/app/public/banner/166143f9a34c66fff4459b19e3ad898e7d581a74.jpg', 'Main Banner', 1, '2022-09-28 03:02:29', '2022-09-28 03:02:29', '.');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int NOT NULL,
  `author` int NOT NULL,
  `title` varchar(1000) NOT NULL,
  `body` longtext NOT NULL,
  `slug` varchar(255) NOT NULL,
  `blog_image` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `author`, `title`, `body`, `slug`, `blog_image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'The Feasibility Trend in The Fashion Industry', '<p class=\"MsoNormal\"><strong><span style=\"font-size: 14.0pt; line-height: 107%;\">Is There a Viable Market for the Fashion Industry?</span></strong></p>\n<p class=\"MsoNormal\">Fashion industry is boomingly attractive because of the constant trends in demand for the fashion products in the industry. Because people are always interested in the business of improving their looks, they can go to any length and breadth to make sure they appear in their best style and costume in every of their social gathering they are involved in&mdash;on and offline. That can be seen on the recent social media trends and on so many dress codes: the office dress, at home dress, in the party and wedding dress, meeting attire, etc. In fact, some consumers are willing to pay the price to achieve their best looks&mdash;looking trendy and appealing to the next beholder.</p>\n<p class=\"MsoNormal\">&nbsp;</p>\n<p class=\"MsoNormal\">Clearly, fashion sells. Because using the consumer response data in the global fashion ecommerce industry, there is a huge market for it and anyone who wants to get into the industry can benefit in the predictable increase in its compounding growth. All you need to do is make proper research and know the numbers, then choose your niche market and products within the industry&mdash;you are set!</p>\n<p class=\"MsoNormal\">In this report, we try to provide firsthand data and insights for the online strategists, entrepreneurs, digital marketers, vendors and store managers, who are interested in selling fashion products online with the vital information they need to assess and tap into the global ecommerce fashion market.</p>\n<p class=\"MsoNormal\">&nbsp;</p>\n<p class=\"MsoNormal\"><strong><span style=\"font-size: 14.0pt; line-height: 107%;\">How Much Is the Fashion Industry Worth in 2021?</span></strong></p>\n<p class=\"MsoNormal\">We will compare different data result from two reputable sources about the potential increase evidenced in the fashion industry.</p>\n<p class=\"MsoNormal\">According to the data released by <a href=\"https://www.businesswire.com/news/home/20210524005342/en/Global-Fast-Fashion-Market-Report-2021-to-2030---COVID-19-Growth-and-Change---ResearchAndMarkets.com\">BusinessWire</a>: The global fashion market is expected to grow from $25.09 billion in 2020 to $30.58 billion in 2021 at a compound annual growth rate (CAGR) of 21.9%. The growth is mainly due to the companies resuming their operations and adapting to the new normal while recovering from the COVID-19 impact, which had earlier led to restrictive containment measures involving social distancing, remote working, and the closure of commercial activities that resulted in operational challenges. The market is expected to reach $39.84 billion in 2025 at a CAGR of 7%.</p>\n<p class=\"MsoNormal\">According to <a href=\"https://www.shopify.com/enterprise/ecommerce-fashion-industry\">Shopify</a> data released on Mar 29, 2021, on the fashion Industry Insight and Trend, the global fashion ecommerce industry was expected to decline from $531.25 billion in 2019 to $485.62 billion in 2020. And the data further revealed that the negative compound seen in the annual growth rate (CAGR) of -8.59% was largely because of the coronavirus pandemic. Yet, the fashion ecommerce market is set to recover and hit $672.71 billion by 2023.</p>\n<p class=\"MsoNormal\">Record shows that in the US alone, the ecommerce fashion industry was accounted for 29.5% of fashion retail sales in 2020. Even though the value of the US market is projected to increase to take a sizable chunk out of global predictions, reaching $100 billion by 2021.</p>\n<p class=\"MsoNormal\">&nbsp;</p>\n<p class=\"MsoNormal\"><strong><span style=\"font-size: 14.0pt; line-height: 107%;\">What are these two data telling us?</span></strong></p>\n<p class=\"MsoNormal\">It means that there is potential market growth in the fashion industry, with increase in the buyer&rsquo;s demand for all line of fashion products. So, how does one leverage on this to tap on the huge gain the industry presents? Well, the answer could be found on your ability to find your niche market within the fashion industry.</p>\n<p class=\"MsoNormal\">There are different niche markets you can choose to focus on if you are interested in selling online. They include children apparel, men apparel, and women apparel.</p>\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -.25in; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin;\"><span style=\"mso-list: Ignore;\">1.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong>You can choose to sell children clothing</strong>: Find manufacturers you can buy from, or you can dropship if you so wish to sell online&mdash;it depends on what you want. There are varieties of places you can get children cloths online, in a wholesale price and retail them online as well or through a storefront. The demand for children clothing is pretty huge.</p>\n<p class=\"MsoListParagraphCxSpMiddle\">&nbsp;</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin;\"><span style=\"mso-list: Ignore;\">2.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong>You can choose to sell women clothing</strong>: In most cases, people tend to sell women apparel as a niche to simplify and identify their own brand. Women apparel has a potential for continuous increase in demand because the consumers are constantly spending to improve their looks either online or social media.</p>\n<p class=\"MsoListParagraphCxSpMiddle\">&nbsp;</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin;\"><span style=\"mso-list: Ignore;\">3.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong>You can sell only men&rsquo;s clothing</strong>: You will have the option to choose from different products within men&rsquo;s apparel that you want to sell. All men&rsquo;s apparel you choose here has a potential to sell within the fashion industry with good ROI when you do the work.</p>\n<p class=\"MsoListParagraphCxSpLast\">&nbsp;</p>\n<p class=\"MsoNormal\"><strong><span style=\"font-size: 12.0pt; line-height: 107%;\">These are different types of products you can choose to sell within the different collections in the fashion industry.</span></strong></p>\n<p class=\"MsoNormal\">WOMEN COLLECTIONS</p>\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Underwear</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Shorts</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Pants</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Activewear</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Blouses &amp; Shirts</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Dress Shoes</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Sports &amp; Active Shoes</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Jeans</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Knit Tops</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Ties &amp; Knots</p>\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Outerwear</p>\n<p class=\"MsoNormal\">&nbsp;</p>\n<p class=\"MsoNormal\">MEN COLLECTIONS</p>\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Underwear</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Shorts</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Activewear</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Shirts &amp; Tops</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Dress Shoes</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Sport &amp; Active Shoes</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Jeans</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Knit Tops</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Ties &amp; Knots</p>\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Pants</p>\n<p class=\"MsoNormal\">&nbsp;</p>\n<p class=\"MsoNormal\">CHILDREN COLLECTIONS</p>\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -.25in; mso-list: l1 level1 lfo4;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->All boys&rsquo; clothing</p>\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l1 level1 lfo4;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->All girls&rsquo; clothing</p>\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent: -.25in; mso-list: l1 level1 lfo4;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->All kid&rsquo;s Accessories including sucks, hat, etc.</p>\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent: -.25in; mso-list: l1 level1 lfo4;\">&nbsp;</p>\n<p class=\"MsoNormal\">There are other products that are not included on here. But you can make your on research to find what works best for you.</p>', 'the-feasibility-trend-in-the-fashion-industry-1ENSC', '/storage/app/public/blog/7b53055022c0ca6e33a6956bd3b79037ec76333d.jpg', '2022-09-29 22:02:47', '2023-02-14 01:57:21', NULL),
(2, 1, 'Test Blog Post', '<div class=\"jan-article__content\">\r\n<h2 id=\"what-does-lorem-ipsum-mean\" class=\"mb-3\" role=\"heading\" aria-level=\"2\">What Does Lorem Ipsum Mean?</h2>\r\n<p>Lorem ipsum, in graphical and textual context, refers to filler text that is placed in a document or visual presentation. Lorem ipsum is derived from the Latin \"dolorem ipsum\" roughly translated as \"pain itself.\"</p>\r\n<p>Lorem ipsum presents the sample font and orientation of writing on web pages and other software applications where content is not the main concern of the developer.</p>\r\n</div>\r\n<div class=\"jan-article__content\">\r\n<h2 id=\"techopedia-explains-lorem-ipsum\" class=\"mb-3\" role=\"heading\" aria-level=\"2\">Techopedia Explains Lorem Ipsum</h2>\r\n<p dir=\"ltr\">Lorem ipsum is the filler text that typically demonstrates the font and style of a text in a document or visual demonstration. It serves as a place holder indicating where the text will be in the final iteration.</p>\r\n<p dir=\"ltr\">Originally from Latin, Lorem ipsum has no intelligible meaning. It is simply a display of letters to be viewed as a sample with given graphical elements in a file.</p>\r\n<p dir=\"ltr\">\"Lipsum\" (a portmanteau of lorem and ipsum) generators are commonly used to form generic text in a file. The words are adequately like normal text to demonstrate a font, without distracting the reader with its content.</p>\r\n<p dir=\"ltr\">It has been used by printers as placeholder text since the 16th century.</p>\r\n<p dir=\"ltr\">Richard McClintock discovered the origins of the words Lorem Ipsum back in 1982, who published his findings in 1994 in a letter to the editor of<em>&nbsp;Before &amp; After</em>&nbsp;magazine who wrongly claimed that the passage had no meaning.</p>\r\n<p dir=\"ltr\">In fact, it originates from a treatise on the theory of ethics written by Cicero in 45 BC: \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil).</p>\r\n<p dir=\"ltr\">The passage that is usually used is the one below:</p>\r\n<blockquote>\r\n<p dir=\"ltr\">&ldquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.&rdquo;</p>\r\n</blockquote>\r\n<p dir=\"ltr\">However, although it looks like Latin, the original words from Cicero have been scrambled and interjected with meaningless filler text for reasons that defy history.</p>\r\n<p dir=\"ltr\">According to McClintock, but it&rsquo;s just a theory, a part of the original text was scrambled by 15th century typesetter who needed placeholder text to mockup various fonts for a type specimen book.</p>\r\n<p dir=\"ltr\">No matter what the true history may be, today Lorem ipsum is widely used since it closely resembles English more than Latin, creating a natural looking block of text that doesn&rsquo;t distract the reader from the layout.</p>\r\n<p dir=\"ltr\">The passage became popularized in the 1960s when Letraset used it to advertise their dry-transfer sheets. It reached the digital world between the 1980s and 1990s when Aldus bundled the text in the word-processing templates of their desktop publishing software PageMaker.</p>\r\n<p dir=\"ltr\">Later on, it was widely adopted by other word processors, such as Microsoft Word; and by content management system tools, such as Wordpress for stock websites, page templates, and themes.</p>\r\n<p dir=\"ltr\">Today, a large number of variations of Lorem ipsum actually exist.</p>\r\n<p dir=\"ltr\">On the Internet, there are many generators that repeat predefined chunks and combine them with model sentences to create believable structures.</p>\r\n<p dir=\"ltr\">Some of them inject the random text with random Latin words, humor or even profanities.</p>\r\n<p dir=\"ltr\">In fact, it can be argued that Lorem Ipsum generators are the first true generator that ever hit the Internet.</p>\r\n</div>', 'test-blog-post-6RnIa', '/storage/app/public/blog/43f14eb84d5b6eb39c77a4ca0b217e5ff0663e9a.jpg', '2022-10-17 01:00:23', '2023-02-14 01:56:49', NULL),
(3, 1, 'Testing blog', '<p>Testing body&nbsp;</p>', 'testing-blog-nj34', 'https://scudin.com/storage/app/public/blog/1666546663_440.jpg', '2022-10-23 17:37:43', '2023-02-14 01:56:53', NULL),
(4, 1, 'The Feasibility Trend in The Fashion Industry', '<p class=\"MsoNormal\"><strong><span style=\"font-size: 14.0pt; line-height: 107%;\">Is There a Viable Market for the Fashion Industry?</span></strong></p>\r\n<p class=\"MsoNormal\">Fashion industry is boomingly attractive because of the constant trends in demand for the fashion products in the industry. Because people are always interested in the business of improving their looks, they can go to any length and breadth to make sure they appear in their best style and costume in every of their social gathering they are involved in&mdash;on and offline. That can be seen on the recent social media trends and on so many dress codes: the office dress, at home dress, in the party and wedding dress, meeting attire, etc. In fact, some consumers are willing to pay the price to achieve their best looks&mdash;looking trendy and appealing to the next beholder.</p>\r\n<p class=\"MsoNormal\">&nbsp;</p>\r\n<p class=\"MsoNormal\">Clearly, fashion sells. Because using the consumer response data in the global fashion ecommerce industry, there is a huge market for it and anyone who wants to get into the industry can benefit in the predictable increase in its compounding growth. All you need to do is make proper research and know the numbers, then choose your niche market and products within the industry&mdash;you are set!</p>\r\n<p class=\"MsoNormal\">In this report, we try to provide firsthand data and insights for the online strategists, entrepreneurs, digital marketers, vendors and store managers, who are interested in selling fashion products online with the vital information they need to assess and tap into the global ecommerce fashion market.</p>\r\n<p class=\"MsoNormal\">&nbsp;</p>\r\n<p class=\"MsoNormal\"><strong><span style=\"font-size: 14.0pt; line-height: 107%;\">How Much Is the Fashion Industry Worth in 2021?</span></strong></p>\r\n<p class=\"MsoNormal\">We will compare different data result from two reputable sources about the potential increase evidenced in the fashion industry.</p>\r\n<p class=\"MsoNormal\">According to the data released by <a href=\"https://www.businesswire.com/news/home/20210524005342/en/Global-Fast-Fashion-Market-Report-2021-to-2030---COVID-19-Growth-and-Change---ResearchAndMarkets.com\">BusinessWire</a>: The global fashion market is expected to grow from $25.09 billion in 2020 to $30.58 billion in 2021 at a compound annual growth rate (CAGR) of 21.9%. The growth is mainly due to the companies resuming their operations and adapting to the new normal while recovering from the COVID-19 impact, which had earlier led to restrictive containment measures involving social distancing, remote working, and the closure of commercial activities that resulted in operational challenges. The market is expected to reach $39.84 billion in 2025 at a CAGR of 7%.</p>\r\n<p class=\"MsoNormal\">According to <a href=\"https://www.shopify.com/enterprise/ecommerce-fashion-industry\">Shopify</a> data released on Mar 29, 2021, on the fashion Industry Insight and Trend, the global fashion ecommerce industry was expected to decline from $531.25 billion in 2019 to $485.62 billion in 2020. And the data further revealed that the negative compound seen in the annual growth rate (CAGR) of -8.59% was largely because of the coronavirus pandemic. Yet, the fashion ecommerce market is set to recover and hit $672.71 billion by 2023.</p>\r\n<p class=\"MsoNormal\">Record shows that in the US alone, the ecommerce fashion industry was accounted for 29.5% of fashion retail sales in 2020. Even though the value of the US market is projected to increase to take a sizable chunk out of global predictions, reaching $100 billion by 2021.</p>\r\n<p class=\"MsoNormal\">&nbsp;</p>\r\n<p class=\"MsoNormal\"><strong><span style=\"font-size: 14.0pt; line-height: 107%;\">What are these two data telling us?</span></strong></p>\r\n<p class=\"MsoNormal\">It means that there is potential market growth in the fashion industry, with increase in the buyer&rsquo;s demand for all line of fashion products. So, how does one leverage on this to tap on the huge gain the industry presents? Well, the answer could be found on your ability to find your niche market within the fashion industry.</p>\r\n<p class=\"MsoNormal\">There are different niche markets you can choose to focus on if you are interested in selling online. They include children apparel, men apparel, and women apparel.</p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -.25in; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin;\"><span style=\"mso-list: Ignore;\">1.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong>You can choose to sell children clothing</strong>: Find manufacturers you can buy from, or you can dropship if you so wish to sell online&mdash;it depends on what you want. There are varieties of places you can get children cloths online, in a wholesale price and retail them online as well or through a storefront. The demand for children clothing is pretty huge.</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\">&nbsp;</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin;\"><span style=\"mso-list: Ignore;\">2.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong>You can choose to sell women clothing</strong>: In most cases, people tend to sell women apparel as a niche to simplify and identify their own brand. Women apparel has a potential for continuous increase in demand because the consumers are constantly spending to improve their looks either online or social media.</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\">&nbsp;</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"mso-bidi-font-family: Calibri; mso-bidi-theme-font: minor-latin;\"><span style=\"mso-list: Ignore;\">3.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong>You can sell only men&rsquo;s clothing</strong>: You will have the option to choose from different products within men&rsquo;s apparel that you want to sell. All men&rsquo;s apparel you choose here has a potential to sell within the fashion industry with good ROI when you do the work.</p>\r\n<p class=\"MsoListParagraphCxSpLast\">&nbsp;</p>\r\n<p class=\"MsoNormal\"><strong><span style=\"font-size: 12.0pt; line-height: 107%;\">These are different types of products you can choose to sell within the different collections in the fashion industry.</span></strong></p>\r\n<p class=\"MsoNormal\">WOMEN COLLECTIONS</p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Underwear</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Shorts</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Pants</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Activewear</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Blouses &amp; Shirts</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Dress Shoes</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Sports &amp; Active Shoes</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Jeans</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Knit Tops</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Ties &amp; Knots</p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent: -.25in; mso-list: l3 level1 lfo2;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Women Outerwear</p>\r\n<p class=\"MsoNormal\">&nbsp;</p>\r\n<p class=\"MsoNormal\">MEN COLLECTIONS</p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Underwear</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Shorts</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Activewear</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Shirts &amp; Tops</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Dress Shoes</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Sport &amp; Active Shoes</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Jeans</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Knit Tops</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Ties &amp; Knots</p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent: -.25in; mso-list: l2 level1 lfo3;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Men Pants</p>\r\n<p class=\"MsoNormal\">&nbsp;</p>\r\n<p class=\"MsoNormal\">CHILDREN COLLECTIONS</p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent: -.25in; mso-list: l1 level1 lfo4;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->All boys&rsquo; clothing</p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent: -.25in; mso-list: l1 level1 lfo4;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->All girls&rsquo; clothing</p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent: -.25in; mso-list: l1 level1 lfo4;\"><!-- [if !supportLists]--><span style=\"font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->All kid&rsquo;s Accessories including sucks, hat, etc.</p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent: -.25in; mso-list: l1 level1 lfo4;\">&nbsp;</p>\r\n<p class=\"MsoNormal\">There are other products that are not included on here. But you can make your on research to find what works best for you.</p>', 'the-feasibility-trend-in-the-fashion-industry-1ENSCT', '/storage/app/public/blog/7b53055022c0ca6e33a6956bd3b79037ec76333d.jpg', '2022-09-29 22:02:47', '2022-10-24 13:32:20', NULL),
(5, 1, 'Test Blog Post', '<div class=\"jan-article__content\">\r\n<h2 id=\"what-does-lorem-ipsum-mean\" class=\"mb-3\" role=\"heading\" aria-level=\"2\">What Does Lorem Ipsum Mean?</h2>\r\n<p>Lorem ipsum, in graphical and textual context, refers to filler text that is placed in a document or visual presentation. Lorem ipsum is derived from the Latin \"dolorem ipsum\" roughly translated as \"pain itself.\"</p>\r\n<p>Lorem ipsum presents the sample font and orientation of writing on web pages and other software applications where content is not the main concern of the developer.</p>\r\n</div>\r\n<div class=\"jan-article__content\">\r\n<h2 id=\"techopedia-explains-lorem-ipsum\" class=\"mb-3\" role=\"heading\" aria-level=\"2\">Techopedia Explains Lorem Ipsum</h2>\r\n<p dir=\"ltr\">Lorem ipsum is the filler text that typically demonstrates the font and style of a text in a document or visual demonstration. It serves as a place holder indicating where the text will be in the final iteration.</p>\r\n<p dir=\"ltr\">Originally from Latin, Lorem ipsum has no intelligible meaning. It is simply a display of letters to be viewed as a sample with given graphical elements in a file.</p>\r\n<p dir=\"ltr\">\"Lipsum\" (a portmanteau of lorem and ipsum) generators are commonly used to form generic text in a file. The words are adequately like normal text to demonstrate a font, without distracting the reader with its content.</p>\r\n<p dir=\"ltr\">It has been used by printers as placeholder text since the 16th century.</p>\r\n<p dir=\"ltr\">Richard McClintock discovered the origins of the words Lorem Ipsum back in 1982, who published his findings in 1994 in a letter to the editor of<em>&nbsp;Before &amp; After</em>&nbsp;magazine who wrongly claimed that the passage had no meaning.</p>\r\n<p dir=\"ltr\">In fact, it originates from a treatise on the theory of ethics written by Cicero in 45 BC: \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil).</p>\r\n<p dir=\"ltr\">The passage that is usually used is the one below:</p>\r\n<blockquote>\r\n<p dir=\"ltr\">&ldquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.&rdquo;</p>\r\n</blockquote>\r\n<p dir=\"ltr\">However, although it looks like Latin, the original words from Cicero have been scrambled and interjected with meaningless filler text for reasons that defy history.</p>\r\n<p dir=\"ltr\">According to McClintock, but it&rsquo;s just a theory, a part of the original text was scrambled by 15th century typesetter who needed placeholder text to mockup various fonts for a type specimen book.</p>\r\n<p dir=\"ltr\">No matter what the true history may be, today Lorem ipsum is widely used since it closely resembles English more than Latin, creating a natural looking block of text that doesn&rsquo;t distract the reader from the layout.</p>\r\n<p dir=\"ltr\">The passage became popularized in the 1960s when Letraset used it to advertise their dry-transfer sheets. It reached the digital world between the 1980s and 1990s when Aldus bundled the text in the word-processing templates of their desktop publishing software PageMaker.</p>\r\n<p dir=\"ltr\">Later on, it was widely adopted by other word processors, such as Microsoft Word; and by content management system tools, such as Wordpress for stock websites, page templates, and themes.</p>\r\n<p dir=\"ltr\">Today, a large number of variations of Lorem ipsum actually exist.</p>\r\n<p dir=\"ltr\">On the Internet, there are many generators that repeat predefined chunks and combine them with model sentences to create believable structures.</p>\r\n<p dir=\"ltr\">Some of them inject the random text with random Latin words, humor or even profanities.</p>\r\n<p dir=\"ltr\">In fact, it can be argued that Lorem Ipsum generators are the first true generator that ever hit the Internet.</p>\r\n</div>', 'test-blog-post-6RnIaB', '/storage/app/public/blog/43f14eb84d5b6eb39c77a4ca0b217e5ff0663e9a.jpg', '2022-10-17 01:00:23', '2022-10-24 08:13:24', NULL),
(6, 1, 'Testing blog', '<p>Testing body&nbsp;</p>', 'testing-blog-nj34b8', 'https://scudin.com/storage/app/public/blog/1666546663_440.jpg', '2022-10-23 17:37:43', '2023-02-14 01:32:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '1', '2020-10-11 07:43:44', '2022-08-26 16:27:09'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"code\":\"en\",\"status\":1}]', '2020-10-11 07:53:02', '2021-05-28 23:34:09'),
(3, 'mail_config', '{\"name\":\"Scudin\",\"host\":\"smtp-relay.gmail.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"dev.support@scudin.com\",\"email_id\":\"dev.support@scudin.com\",\"encryption\":\"TLS\",\"password\":\"jeyedgybfhambssn\"}', '2020-10-12 10:29:18', '2022-10-20 18:02:16'),
(4, 'cash_on_delivery', '{\"status\":\"0\"}', NULL, '2022-05-21 08:55:52'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":\"custo5cc042f7abf4c\",\"store_password\":\"custo5cc042f7abf4c@ssl\"}', '2020-11-09 08:36:51', '2021-03-01 13:58:38'),
(7, 'paypal', '{\"status\":\"1\",\"paypal_client_id\":\"AUidNKOfecdra4abF2rtCD4-wKJpZ11ODK9ELRgiKVouRm4w3cbap9kKZMt8zvbWLs7syc0ZE1kqv0Ab\",\"paypal_secret\":\"EGMjfHaZUirLOGz6pYnLeAuXTxKjwZbBLvgdsOOZDmgXl997M20mUAwboq16ESqtPU80jYfPYb4DrtPz\"}', '2020-11-09 08:51:39', '2022-10-30 21:46:21'),
(8, 'stripe', '{\"status\":\"1\",\"api_key\":\"sk_test_4eC39HqLyjWDarjtT1zdp7dc\",\"published_key\":\"pk_test_TYooMQauvdEDq54NiTphI7jx\"}', '2020-11-09 09:01:47', '2022-11-01 22:33:16'),
(9, 'paytm', '{\"status\":\"0\",\"paytm_merchant_id\":\"dbzfb\",\"paytm_merchant_key\":\"sdfbsdfb\",\"paytm_merchant_website\":\"dsfbsdf\",\"paytm_channel\":\"sdfbsdf\",\"paytm_industry_type\":\"sdfb\"}', '2020-11-09 09:19:08', '2020-11-09 09:19:56'),
(10, 'company_phone', '+1 (972) 332-5707', NULL, '2022-08-12 22:10:26'),
(11, 'company_name', 'Scudin', NULL, '2022-07-22 23:08:00'),
(12, 'company_web_logo', 'https://scudin.com/storage/app/public/company//96e698dfe07f0d9ab59ac19139acadbcc23f1118.jpg', NULL, '2022-10-20 23:19:07'),
(13, 'company_mobile_logo', '/storage/app/public/company//11081dafa582e9c5cadda449d60e224622bb6075.jpg', NULL, '2022-10-20 23:19:35'),
(14, 'terms_condition', '<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Terms and Condition of Use | Updated 8/29/2022</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Who We Are</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Welcome to&nbsp;Scudin.com. Scudin.com is an Online Store and/or Online Marketplace. Our website address is: <a href=\"../../\">https://scudin.com</a>&nbsp;or <a href=\"http://www.scudin.com\">www.scudin.com</a> the mobile application (the \"<strong>Site</strong>\") for your online shopping and other E-Commerce related services. Please review our Privacy Notice, which also governs your visit to and use of the Site, to understand our practices.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">This terms and conditions of use (\"<strong>Policy</strong>\") describes how www.scudin.com and its subsidiaries or affiliates (\"We\", \"we\", \"us\", &ldquo;our Online Store&rdquo;, our Online Marketplace&rdquo;, &ldquo;our Vendors&rdquo;, &ldquo;our Sellers&rdquo;, or \"Scudin.com\") may use and disclose information that we may collect about you through the Site when you interact with it through your registration, online purchases and shopping experience.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">What Personal Data We Collect and Why We Collect It</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 4; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Comments</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">When visitors leave comments on the site, we collect the data shown in the comments form, and also the visitor&rsquo;s IP address and browser user agent string to help spam detection.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 4; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Media</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Contact Forms</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If we provide any contact form on the site, you may choose to fill out a contact form. We collect information from you when you complete a form to receive information through our site. We may use the information we collect from you when you sign up to receive information, respond to marketing communications, surf the website, or use certain other site features to optimize your experience and help you make informed decisions about your technology.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 4; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Collection and Use of Personal Information: </span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">When you use the Site to register, shop, or to apply for jobs on www.scudin.com, we may collect certain &ldquo;<strong>Personal Information</strong>,&rdquo; which is information that identifies you as an individual or relates to an identifiable individual. The categories of Personal Information we may collect include: your name and contact information (email, address and phone number, including but not limited to your credit card information), your product search criteria and preferences, your shopping experiences, including your shopping lifestyle and history, your job history: for career purposes, your skills, reference information, background information, other information contained in your resume, or any login ID or email address and password created and provided by you. By providing your mobile phone number, email, and other Personal Information to us, you opt in and consent to receive marketing communication updates through text messages and email messages from us, which includes but is not limited to text messages or email messages sent through an automatic telephone dialing system or automated email system to you for shipping confirmation status, product delivery status, and returns confirmation updates. Consent to receive marketing text messages or emails is not required as a condition of purchasing any products or services from us. If you do not wish to receive marketing communication text messages and emails, do not provide us with your mobile phone number or email or other identifiable Personal Information for marketing and communication purposes.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">We use Personal Information to register you with the Site, to provide you with information regarding your online shopping experience with Scudin.com as well as for employment opportunities and career-related information, and to otherwise provide you with requested information for our online products or services. We may from time to time use your Personal Information to send you automated email messages, text messages (message and data rates may apply), or marketing materials regarding our Vendor products and services or the newer products updates in our Online Store. We also use your Personal Information to update you from the recent online purchases and experiences you had with the Site. Other communications may be employment information where necessary. We may also use Personal Information for our business purposes, such as data analysis, audits, and for the purpose of improving our products and services delivery system processes.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Disclosures of Personal Information</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 4; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Who we share your data with: </span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Scudin.com may disclose Personal Information to third parties in the following circumstances: (1) to our third-party service providers who perform business functions and services on our behalf; (2) to comply with applicable laws, the service of legal process, or if we reasonably believe that such action is necessary to (a) comply with the law requiring such disclosure; (b) protect the rights or property of Scudin.com or its affiliated companies; (c) prevent a crime, such as credit card fraud, unauthorized purchases, and/or any Vendor abuse of the use of our Online Marketplace, and to protect national security; or (d) protect the personal safety of the users, our customers, and Vendors or the public. We also may disclose or transfer information to a third party in the event of any reorganization, merger, sale, joint venture, assignment, transfer or other disposition of all or any portion of our business, assets or stock (including in connection with any bankruptcy or similar proceedings where necessary to facilitate our corporate business practices).</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Collection and Use of Other Information</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">&ldquo;<strong>Other Information</strong>&rdquo; is any information that does not reveal your specific identity or does not directly relate to an identifiable individual. We may collect Other Information in a variety of ways, including but not limited to:</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Social Media Platform</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">: We may collect certain information about you when you follow us on any social media platform, including Facebook, Pinterest, Instagram, LinkedIn, Twitter, YouTube, Vendor sites, Scudin.com, Google (such as when you review our products and services), and other affiliated marketing platforms. The information we collect through these social media platforms are used to update the quality of our products and services and to improve our business practices to give you the best shopping experience when you shop at Scudin.com.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Through your browser or device</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">: Certain information is collected by most browsers or automatically through your device, such as your Media Access Control (MAC) address, computer type (Windows or Macintosh), screen resolution, operating system name and version, device manufacturer and model, language, and Internet browser type and version. We use this information to ensure that the Site functions properly.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Using cookies</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">: Cookies are pieces of information stored on the computer that you are using. Cookies allow us to collect information such as browser type, time spent on the Site, pages visited, registrations, submissions, items you viewed, purchases, demographics, information requests, language preferences, and other traffic data. We use the information for security purposes, to facilitate navigation, to display information more effectively, and to personalize your experience. We also gather statistical information about your use of the Site to enhance its functionality, understand how it is used and assist us with resolving questions about it in relation to your online shopping experience. We may also use cookies and other technologies in online advertising campaigns to track responses to our ads.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If you do not want information collected through the use of cookies, most browsers allow you to automatically decline cookies, or be given the choice of declining or accepting a particular cookie (or cookies) from a particular site. If, however, you do not accept cookies, you may experience some inconvenience in your use of the Site.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Using pixel tags and other similar technologies</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">: Pixel tags (also known as web beacons and clear GIFs) may be used to, among other things, track the actions of Site users and email recipients, market our services to you, measure the success of our marketing campaigns and compile statistics about Site usage and response rates.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Analytics</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">. We use third-party analytics providers such as Google Analytics, on the Site. Google Analytics uses cookies and similar technologies to collect and analyze information about use of the Services and report on activities and trends. Google Analytics may also collect information regarding the use of other websites, apps and online resources. You can learn about Google&rsquo;s practices by going to&nbsp;</span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; color: black; mso-color-alt: windowtext;\"><a href=\"http://www.google.com/policies/privacy/partners/\"><span style=\"mso-fareast-font-family: \'Times New Roman\'; color: #464646; text-decoration: none; text-underline: none;\">www.google.com/policies/privacy/partners/</span></a></span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">, and opt out by downloading the Google Analytics opt-out browser add-on, available at&nbsp;</span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; color: black; mso-color-alt: windowtext;\"><a href=\"https://tools.google.com/dlpage/gaoptout\"><span style=\"mso-fareast-font-family: \'Times New Roman\'; color: #464646; text-decoration: none; text-underline: none;\">https://tools.google.com/dlpage/gaoptout</span></a></span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">IP Address</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">: Your IP Address is a number that is automatically assigned to your computer by your Internet Service Provider. An IP Address may be identified and logged automatically in our server log files whenever a user accesses the Site, along with the time of the visit and the pages visited. We use IP Addresses for purposes such as calculating usage levels, diagnosing server problems, and administering the Site. We may also derive your approximate location from your IP Address.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Please note that we may use and disclose Other Information for our business purposes.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Other Tracking Cookies</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &ldquo;Remember Me&rdquo;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 4; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Embedded content from other websites</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Articles on this site may include embedded content (e.g., videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Analytics</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">We are using some inbuilt analytic technology on the Site including Google Analytics and Facebook Pixel technology for data collection and aggregation to better understand and remarket to our visitors. Your use of the site mean you consent to the Terms and Conditions of Use of the site without option to opt out of these services. Please visit the Scudin.com Privacy policy page for more information.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 4; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Who We Share Your Data With</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">We keep up with compliance by keeping your online privacy private. Thus, we do not sell, trade, or otherwise transfer to outside parties your personally identifiable information unless we provide you with advance notice. This does not include website hosting partners and other parties who assist us in operating our website, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others&rsquo; rights, property, or safety.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 4; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">How long we retain your data</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 4; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">What rights you have over your data</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you by sending us a data deletion request ticket under support ticket on your account dashboard. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 3; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Where We Send Your Data</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">As best practices and to keep the Site safe, visitor comments may be checked through an automated spam detection service. The Fair Information Practices Principles form the backbone of privacy law in the United States and the concepts they include have played a significant role in the development of data protection laws around the globe. Understanding the Fair Information Practice Principles and how they should be implemented is critical to comply with the various privacy laws that protect personal information.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Your contact information</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">If you have any questions or concerns about this Terms and Conditions of use of the site and Privacy Policy, the practices of this site, or your dealings with this site or the U.S. Fair Information Practices and the GDPR compliance, please contact us by submitting a support ticket webmaster and that will be reviewed by Scudin.com compliance team.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Additional information</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Your acceptance of these terms and condition of use of Scudin.com Online Marketplace: By using this site, you signify your acceptance of this policy and terms of service. If you do not agree to this policy, please do not use our site. Your continued use of the site following the posting of changes to this policy will be deemed your acceptance of those changes.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">How we protect your data</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">We protect you and your data while using Scudin.com means: Sensitive and private data exchange between the Site and its Users happens over a SSL secured socket communication channel and is encrypted and protected with digital signatures. Our site is also in compliance with both HIPAA vulnerability standards to keep your protected health information secure, and with PCI vulnerability standards to keep your payment card data secure in order to create a risk-free environment as possible for users on the platform.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">What data breach procedures we have in place</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">To meet the standards of regulatory compliance procedure on data breach occurrence, Scudin.com will notify the users of the site via email within 7 business days should a data breach occur. We also agree to the individual redress principle, which requires that individuals have a right to pursue legally enforceable rights against data collectors and processors who fail to adhere to the law. This principle requires not only that individuals have enforceable rights against data users, but also that individuals have recourse to courts or a government agency to investigate and/or prosecute non-compliance by data processors.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">What third parties we receive data from</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Occasionally, we receive data about users from third parties, including advertisers. This information is included within the section of your privacy policy dealing with third party data. For more information on third party data, visit our privacy policy page.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">What automated decision making we make with user data</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">We do use cookies, as referenced above. Cookies are small files that a site or its service provider transfers to your computer&rsquo;s hard drive through your Web browser (if you accept or allow) that enables the site&rsquo;s or service provider&rsquo;s systems to recognize your browser and capture and remember certain information. They are also used to help us understand your preferences based on previous or current site activity, which enables us to provide you with improved services. We also use cookies to help us compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future to serve all our users better.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Changes To This Policy</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Scudin.com has the express right and discretion to update this terms and conditions of use of the site contents at any time, and any changes made will be in accordance with the U.S. Fair Information Practices and the GDPR. We encourage users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this policy periodically and become aware of any subsequent modifications we make on the policy.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">GDPR Statement</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; line-height: normal; mso-outline-level: 5; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">Information &amp; disclosures of personal data under GDPR: </span></strong><span style=\"font-size: 12.0pt; line-height: 107%; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #100f0f;\">GDPR compliance requires that personal data from the EEA is subject to special protection. GDPR also provides EU-based individuals with certain individual rights with respect to their personal information. We will make all reasonable efforts to abide by GDPR and provide at least the same level of data protection for personal data received and processed from the EU as the privacy protections set forth in Scudin.com terms of use including our privacy policy. We will also make reasonable attempts to accommodate requests by Data Subjects to exercise GDPR rights. Where necessary and appropriate, we have implemented organizational and technical measures that include internal data protection policies and maintaining documentation on our processing activities to make sure the GDPR compliance standards are kept by us.</span></p>', NULL, '2022-10-31 20:22:04'),
(15, 'about_us', '<p>Scudin.com is the largest one-stop shopping destination in USA, Nigeria and around the world. Launched in 2021, the online store offers the widest range of products in categories ranging from electronics to household appliances, latest smart phones, Camera, Computing &amp; accessories fashion, health equipment, and makeup.</p>', NULL, '2022-08-10 14:13:10'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'support@scudin.com', NULL, '2021-05-24 19:21:30'),
(18, 'colors', '{\"primary\":\"#7367f0\",\"secondary\":\"#ffffff\"}', '2020-10-11 13:53:02', '2022-08-06 16:36:49'),
(19, 'company_footer_logo', '2021-05-24-60aba98037575.png', NULL, '2021-05-24 19:26:24'),
(20, 'company_copyright_text', 'Copyright © 2022 Scudin.com, Inc. All Rights Reserved.', NULL, '2022-07-22 21:38:34'),
(21, 'download_app_apple_stroe', '{\"status\":\"0\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2022-07-18 09:33:05'),
(22, 'download_app_google_stroe', '{\"status\":\"0\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2022-07-18 09:33:09'),
(23, 'company_fav_icon', '/storage/app/public/company/1659752973_119.png', '2020-10-11 13:53:02', '2022-08-06 02:29:33'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'demo', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pending message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order Failed Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order Processing Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order Returned Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order Delivered Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":\"rzp_test_Vio27YvAonerHa\",\"razor_secret\":\"92BIuLdPAkDYx7Bbc9IzqSES\"}', NULL, '2022-05-21 08:56:02'),
(33, 'sales_commission', '15', NULL, '2021-05-24 19:28:31'),
(34, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(35, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(36, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(37, 'terms_and_conditions', '', NULL, NULL),
(38, 'minimum_order_value', '1', NULL, NULL),
(40, 'seller_registration', '1', NULL, '2022-08-29 12:08:19');
INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(41, 'privacy_policy', '<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Privacy Policy | Updated 8/29/2022</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Welcome to&nbsp;Scudin.com&nbsp;or </span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"http://www.scudin.com\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">www.scudin.com</span></a></span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: black; mso-color-alt: windowtext;\"> </span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">the mobile application (the \"<strong>Site</strong>\") for your online shopping and other E-Commerce related services. Please review our Privacy Notice, which also governs your visit to and use of the Site, to understand our practices.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">This privacy policy (\"<strong>Policy</strong>\") describes how www.scudin.com and its subsidiaries or affiliates (\"We\", \"we\", \"us\", &ldquo;our Online Store&rdquo;, our Online Marketplace&rdquo;, &ldquo;our Vendors&rdquo;, &ldquo;our Sellers&rdquo;, or \"Scudin.com\") may use and disclose information that we may collect about you through the Site when you interact with it through your online purchases and shopping experience.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Collection and Use of Personal Information</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">When you use the Site to register, shop, or to apply for jobs on www.scudin.com, we may collect certain &ldquo;<strong>Personal Information</strong>,&rdquo; which is information that identifies you as an individual or relates to an identifiable individual. The categories of Personal Information we may collect include: your name and contact information (email, address and phone number, including but not limited to your credit card information), your product search criteria and preferences, your shopping experiences, including your shopping lifestyle and history, your job history: for career purposes, your skills, reference information, background information, other information contained in your resume, or any login ID or email address and password created and provided by you. By providing your mobile phone number, email, and other Personal Information to us, you opt in and consent to receive marketing communication updates through text messages and email messages from us, which includes but is not limited to text messages or email messages sent through an automatic telephone dialing system or automated email system to you for shipping confirmation status, product delivery status, and returns confirmation updates. Consent to receive marketing text messages or emails is not required as a condition of purchasing any products or services from us. If you do not wish to receive marketing communication text messages and emails, do not provide us with your mobile phone number or email or other identifiable Personal Information for marketing and communication purposes.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">We use Personal Information to register you with the Site, to provide you with information regarding your online shopping experience with Scudin.com as well as for employment opportunities and career-related information, and to otherwise provide you with requested information for our online products or services. We may from time to time use your Personal Information to send you automated email messages, text messages (message and data rates may apply), or marketing materials regarding our Vendor products and services or the newer products updates in our Online Store or Marketplace. We also use your Personal Information to update you from the recent online purchases and experiences you had with the Site. Other communications may be employment information where necessary. We may also use Personal Information for our business purposes, such as data analysis, audits, and for the purpose of improving our products and services delivery system processes.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Disclosures of Personal Information</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Scudin.com may disclose Personal Information to third parties in the following circumstances: (1) to our third-party service providers who perform business functions and services on our behalf; (2) to comply with applicable laws, the service of legal process, or if we reasonably believe that such action is necessary to (a) comply with the law requiring such disclosure; (b) protect the rights or property of Scudin.com or its affiliated companies; (c) prevent a crime, such as credit card fraud, unauthorized purchases, and Vendor abuse of the use of our Online Marketplace or protect national security; or (d) protect the personal safety of the users or the public. We also may disclose or transfer information to a third party in the event of any reorganization, merger, sale, joint venture, assignment, transfer or other disposition of all or any portion of our business, assets or stock (including in connection with any bankruptcy or similar proceedings where necessary to facilitate our corporate business practices).</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Collection and Use of Other Information</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&ldquo;<strong>Other Information</strong>&rdquo; is any information that does not reveal your specific identity or does not directly relate to an identifiable individual. We may collect Other Information in a variety of ways, including:</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Social Media Platform</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">: We may collect certain information about you when you follow us on any social media platform, including Facebook, Pinterest, Instagram, LinkedIn, Twitter, YouTube, Vendor sites, Scudin.com, Google (such as when you review our products and services), and other affiliated marketing platforms. The information we collect through these social media platforms are used to update the quality of our products and services and to improve our business practices.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Social Login:</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\"> We collect personal information which is any information used or intended to be used to identify a particular individual; and this includes name, address, telephone number, email address, financial account information, and government issued identifier. We collect several types of information from and about users of our Online Marketplace, including:</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"margin-bottom: 0in; text-indent: -0.25in; line-height: normal; background: white; padding-left: 40px;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\"><span style=\"mso-list: Ignore;\">1<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; &nbsp;&nbsp;</span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Personal information and other information you provide to us when you register for or use any of Scudin.com services (including social media or interactive features of our Online Marketplace and others services), including to transact with us, or subscribe to contents we offer. For example, we may collect information such as your first name and last name, address (including street name and name of city or town), email address, telephone number, and other identifiers that permit physical or online contact.</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-bottom: 0in; mso-add-space: auto; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"margin-bottom: 0in; text-indent: -0.25in; line-height: normal; background: white; padding-left: 40px;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\"><span style=\"mso-list: Ignore;\">2<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; &nbsp;&nbsp;</span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Automatically collected information from your devices in connection with your online activity (including, in some cases, specific location information or information that enables us to identify you across devices).</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraph\" style=\"margin-bottom: 0in; text-indent: -0.25in; line-height: normal; background: white; padding-left: 40px;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\"><span style=\"mso-list: Ignore;\">3<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp; &nbsp;</span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Information you provide outside this application to other companies (such as Scudin.com sellers and vendors, or payment services companies including PayPal, Stripe, etc., and/or other social media platforms, including Facebook, Twitter, Google, or GitHub, etc.) that you associate with your Scudin.com account, or which you voluntarily consent or direct we associates with your account. We may combine the information we gather, including in combination with information from third parties. For example, when a user signs up for or in to Scudin.com application using a login feature through another company (like Facebook or Google&rsquo;s login features), we receive information like the user&rsquo;s email address and name.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Through your browser or device</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">: Certain information is collected by most browsers or automatically through your device, such as your Media Access Control (MAC) address, computer type (Windows or Macintosh), screen resolution, operating system name and version, device manufacturer and model, language, and Internet browser type and version. We use this information to ensure that the Site functions properly.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Using cookies</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">: Cookies are pieces of information stored on the computer that you are using. Cookies allow us to collect information such as browser type, time spent on the Site, pages visited, registrations, submissions, purchases, demographics, information requests, language preferences, and other traffic data. We use the information for security purposes, to facilitate navigation, to display information more effectively, and to personalize your experience. We also gather statistical information about your use of the Site to enhance its functionality, understand how it is used and assist us with resolving questions about it in relation to your online shopping experience. We may also use cookies and other technologies in online advertising campaigns to track responses to our ads.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">If you do not want information collected through the use of cookies, most browsers allow you to automatically decline cookies, or be given the choice of declining or accepting a particular cookie (or cookies) from a particular site. If, however, you do not accept cookies, you may experience some inconvenience in your use of the Site.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Using pixel tags and other similar technologies</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">: Pixel tags (also known as web beacons and clear GIFs) may be used to, among other things, track the actions of Site users and email recipients, market our services to you, measure the success of our marketing campaigns and compile statistics about Site usage and response rates.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Analytics</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">. We use third-party analytics providers such as Google Analytics, on the Site. Google Analytics uses cookies and similar technologies to collect and analyze information about use of the Services and report on activities and trends. Google Analytics may also collect information regarding the use of other websites, apps and online resources. You can learn about Google&rsquo;s practices by going to&nbsp;</span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"http://www.google.com/policies/privacy/partners/\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #9f1c35;\">www.google.com/policies/privacy/partners/</span></a></span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">, and opt out by downloading the Google Analytics opt-out browser add-on, available at&nbsp;</span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"https://tools.google.com/dlpage/gaoptout\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #9f1c35;\">https://tools.google.com/dlpage/gaoptout</span></a></span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">IP Address</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">: Your IP Address is a number that is automatically assigned to your computer by your Internet Service Provider. An IP Address may be identified and logged automatically in our server log files whenever a user accesses the Site, along with the time of the visit and the pages visited. We use IP Addresses for purposes such as calculating usage levels, diagnosing server problems, and administering the Site. We may also derive your approximate location from your IP Address.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Please note that we may use and disclose Other Information for our business purposes.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Retargeting</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">We may use third-party advertising companies to serve ads regarding our services when you access and use other websites, based on information relating to your use of the Site. To do so, these companies may place or recognize a unique cookie on your browser (including through use of pixel tags). By utilizing the Site, you consent to the use of cookie or other tracking technologies to serve you retargeted advertising. Data collected may be shared with our third-party Vendors for cross device linking and advertising purposes. If you would like to learn more about cross device linking or opt out of Vendors advertising, please visit:&nbsp;</span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"https://www.facebook.com/privacy/explanation\">https://www.facebook.com/privacy/explanation</a> </span><span class=\"MsoHyperlink\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">or </span></span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"https://policy.pinterest.com/en/privacy-policy\">https://policy.pinterest.com/en/privacy-policy</a></span><span class=\"MsoHyperlink\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"> you can review the <strong>&ldquo;Collection and Use of Other Information&rdquo;</strong> above under <strong>&ldquo;Social Media Platform&rdquo;</strong>. Visit: </span></span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"https://help.instagram.com/519522125107875\">https://help.instagram.com/519522125107875</a></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">If you would like more information about opting out of this advertising in desktop and mobile browsers on the particular device on which you are accessing this Policy or this type of advertising, please visit&nbsp;</span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"http://www.networkadvertising.org/managing/opt_out.asp\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #9f1c35;\">http://www.networkadvertising.org/managing/opt_out.asp</span></a></span><u><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #9f1c35;\"> </span></u><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">and&nbsp;</span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"http://www.aboutads.info/\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #9f1c35;\">http://www.aboutads.info/</span></a></span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Third Party Services</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">This Policy does not address, and we are not responsible for, the privacy, information or other practices of any third parties, including any third party operating any site or service to which the Site links, such as Vendor sites, inaccurate description of listed products or items by Vendors on </span><span style=\"color: black; mso-color-alt: windowtext;\"><a href=\"http://www.scudin.com\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">www.scudin.com</span></a></span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\"> or its affiliates websites or Online Store or Marketplace.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Security</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">We use reasonable organizational, technical and administrative measures designed to protect Personal Information within our organization. Unfortunately, no data transmission or storage system can be guaranteed to be 100% secure. If you have reason to believe that your interaction with us is no longer secure, please immediately notify us in accordance with the &ldquo;Contacting Us&rdquo; section below. </span><span style=\"color: black; mso-color-alt: windowtext;\">https://scudin.com/account-tickets.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Choices</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">If you no longer want to receive marketing-related emails from us on a going-forward basis, you may opt-out by using the mechanism contained in each such email. If you no longer wish to receive marketing-related texts from us on a going-forward basis, you may opt-out by texting &ldquo;STOP&rdquo; to us at any time. You may text &ldquo;HELP&rdquo; to us or call (972) 332-5707 for assistance relating to text messages we send. For more information, you may also text HELP to (972) 332-5707.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Use of Site by Minors</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">The Site is not directed to individuals under the age of eighteen (18) and we do not knowingly collect Personal Information from individuals under 18. If you are a resident of Texas or any part of the US territory, under 18 and a registered user of Scudin.com, you may ask us to remove contents or information that you have posted or submitted to the Site by logging in and submitting a support ticket to&nbsp;</span><span style=\"color: black; mso-color-alt: windowtext;\">us</span><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">. Please note that your request does not ensure complete or comprehensive removal of the content or information, as, for example, some of your content may have been reposted by another user through social media or through affiliated Vendors&rsquo; sites.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Jurisdictional Issues</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">The Site is controlled and operated by us from the United States and is not intended to subject us to the laws or jurisdiction of any state, country or territory other than that of the United States.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Revisions to the Policy</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Scudin.com has the right to change this policy contents. If we change this Privacy Policy, we will post any updates here for your review. The &ldquo;Last Updated&rdquo; line at the top of this page indicates when this Policy was last revised. Any changes will become effective when we post the revised Policy on the Site. Your use of the Site following these changes means that you accept the revised Policy and that you agree to the terms and conditions herein.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">Contacting Us</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0in; line-height: normal; background: white;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\'; color: #292b2c;\">If you have any questions about this website privacy policy, or if you would like to update any personal information you have provided to us, please contact us using a support ticket on your user dashboard and we will review and help you make the changes where necessary.</span></p>', NULL, '2022-08-29 13:05:04');
INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(42, 'return_policy', '<p class=\"MsoNormal\" style=\"line-height: normal;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Customer Terms of Service and Conditions of Sale | Updated 8/29/2022</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">All listed products and sales by Scudin.com, its subsidiaries or affiliates (\"Seller\", &ldquo;Vendor&rdquo; or &ldquo;Their&rdquo;) to you (&ldquo;You&rdquo; &ldquo;the Buyer&rdquo; &ldquo;Customer&rdquo; or &ldquo;Your&rdquo;) are all subject to these terms and conditions (&ldquo;Terms&rdquo;). Thus, the Terms herein are deemed an offer and a dismissal of any other terms or conditions contained in any of Your purchased order or documents (which, if interpreted to be an offer, is hereby rebuffed). This transaction with Scudin.com, Seller or Vendor is expressly made conditional on Your consent to the Terms set forth herein below, which by reasons are binding to the exclusion of any additional or different terms contained in any other document, any course of dealing or performance, and any trade custom or usage. Your acceptance of any product You purchase, or service offered to You, shall manifest Your acceptance to these Terms.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Terms of Payment</span></strong></p>\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">1.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Vendor:</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\"> Terms of payment are automatic when seller&rsquo;s account is set up properly and verified, or through net 30 days from invoice date or after delivery date, whichever that apply; That is, a Seller can withdraw automatically with a minimum balance of $50 after sales is made or delivery order is completed if the Seller\'s account is setup properly and verified. Otherwise, when any purchase order is placed by the Buyer and the order is shipped and delivered, the Seller is then allowed to withdraw 50% of the Seller total commission for the purchased item, and the remaining 50% will be paid after 30 days from the delivery date. Items or products prices are set by individual Seller; and prices do not include any taxes, shipment, handling, duty (including but not limited to any tariffs involved) or other similar charges and payment of which will be solely Your responsibility. Scudin.com reserves the right to modify any payment terms for shipment rate, or cancel fulfilment order prior to shipment of any purchased orders from a Seller with Ethos subscription for the reason of a cancelled subscription, late payment, and/or for product weight not subject to the agreed weight for the fulfilment subscription pack. </span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">2.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Return Period:</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\"> Scudin.com return policy is between 2 weeks to 30 days of purchase, depending on each product category You ordered. A Seller has the express discretion at will to set Their own return period based on Their business model, product category, and the durability of the items the Seller is selling. But all individual Seller&rsquo;s return policy must be made and communicated to Scudin.com and made visible to the Buyer during purchase. Any contrary to the later statement is subject to the default 30 days return period.</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">3.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">For Scudin.com <strong>Technology Services</strong>, prices are conditioned upon timely payment and any past due balance will accrue interest at the monthly rate of 1.7%. All prices shown are \"Cash discount prices\" and reflect a 2.5% discount for payment made by cash, company check, bank money order, certified check or wire transfer. However, Payment by any other means other than the mentioned payment methodology above, may not qualify Your purchase for the cash discount price. Shipment and handling charges may not reflect actual costs. Scudin.com reserves the right to modify any payment terms prior to shipment, require payment in advance, or delay/cancel any shipment or order for any reason including Your creditworthiness or beyond the scope of Scudin.com business and this legal binding.</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">4.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\"><span style=\"mso-spacerun: yes;\">&nbsp;</span>Unless otherwise agreed on Scudin.com Ethos Account terms, Seller may choose Their own carrier. Seller\'s responsibility for any loss or damage ends, and title passes on transit, when products (including computers, electronics, software, and other items, hereafter referred to as, &ldquo;Products&rdquo;) are delivered to the carrier, by the Seller to You, or to Your agent or Customer, whichever occurs first. You as a Buyer will pay for storage or shipment charges if Seller ships Products at Your request when the seller has no Ethos Account with Scudin.com or has no free shipping attached to the sales of the Product (or as otherwise agreed in a Scudin.com Ethos Account subscription package) and You agree to accept delivery of Products upon completion of such shipment terms and condition or period. In the event Your order is delivered, the Seller will retain a purchase money security of 50% in Products sold to You, and in the proceeds of the total sales of such Products, until Seller&rsquo;s return policy period elapses, the Seller will then receive invoice for the remaining 50% of the Seller commission for the Product sold to You, which will be deemed to have been paid in full and complete for the purchased order.</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">5.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\"><span style=\"mso-spacerun: yes;\">&nbsp;</span>During the 30 days after delivery period (again, it depends on the Seller return policy period for each Product category), Seller&rsquo;s Products warrantee is applied; and this is subject to cost for reassembling or customization by Seller against defects caused solely by mishandling on transit during delivery, faulty assembly or customization and that any services performed exclusively by it were performed in accordance with industry standards. To the extent provided by Seller&rsquo;s supplier(s) (&ldquo;Supplier(s)&rdquo;), all other Products, services and the components and materials utilized in any assembled or customized Products or services are subject to Supplier&rsquo;s standard warranty, which is expressly in lieu of any other warranty, express or implied, by Seller or Supplier. Your exclusive remedy, if any, under these warranties is limited, at Seller\'s election, to: (a) refund of Your purchase price, (b) repair or reperformance by Seller or Supplier(s) of any Products or services found to be defective, or (c) replacement of any such Product. If there is no Supplier warranty, You will take all such Products and services &ldquo;as-is&rdquo; without any warranty. You acknowledge that except as specifically set forth herein, <strong>there are no representations or default warranties of any kind by seller, express or implied, as to the condition or performance of any products or services, their merchantability, fitness for a particular purpose or use, noninfringement, or otherwise. The Seller hereby assumes no responsibility or liability for Suppliers&rsquo; Product or services specifications or the performance including adequacy of any design appropriateness of the Product or specification provided to the Seller. </strong></span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">6.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">You as a Customer or Buyer has the express right to purchase a separate warranty either from Scudin.com, the Supplier or from the original Manufacturer of the Product You purchased, to cover Your purchased item, when You buy a Product that does not come with the Supplier&rsquo;s or Manufacturer&rsquo;s warranty. <span style=\"mso-spacerun: yes;\">&nbsp;</span>Seller&rsquo;s rights and remedies will be cumulative and not exclusive. You are responsible for all losses, costs and expenses, including attorney&rsquo;s fees, incurred by Seller in collecting any sums You paid or owed. Seller shall have the right to offset against any amounts owed by Seller to You. These Terms, and any matter arising out of or related thereto, are governed solely by the laws of the State of Texas, without regard to its conflict of law principles. No provisions of the United Nations Convention on Contracts for International Sale of Goods, including any amendments thereto, will apply. Any proceeding arising out of or related to this Agreement must be commenced in any court of competent jurisdiction located in any Texas County in the State of Texas. The parties hereby submit to the exclusive jurisdiction of such court and waive (a) any right to a jury trial or (b) defense of lack of personal jurisdiction in such court. <strong>Each of the parties irrevocably waive, to the fullest extent permitted by law, any objection that they may now or hereafter have to the laying of venue of any such proceeding in such courts has been brought in any inconvenient forum</strong>. Each party agrees that a final judgment in any such proceeding is conclusive and may be enforced in other jurisdictions by suit on the judgment or in any other manner provided by law.</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">7.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Furthermore, Products or services are deemed accepted by You unless You notify Seller of shortages, damage or defects in writing within 12 days of delivery of Products or performance of services. All returns or refunds must comply with Seller&rsquo;s returns or refunds policy. If You refuse to accept tender or delivery of any Products or return any Products without authorization from Seller, Seller will hold such Products awaiting Your instructions for 15 days, after which Seller may deem the Products abandoned and dispose of them, without crediting Your account. You warrant that any Products returned are the original Products Seller shipped to You and are unaltered. All returns are subject to a restocking fee up to 50% of the value of the Products being returned.</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">8.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Seller will not be liable for any damages due to any failure or delay in its performance as result of any events beyond its reasonable control. Seller may cancel without liability any order delayed by any such cause(s). In its sole discretion, Seller may allocate, defer, delay, or cancel the shipment of any Product which is in short supply.</span></p>\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"margin-left: .25in; mso-add-space: auto; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1;\"><!-- [if !supportLists]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\"><span style=\"mso-list: Ignore;\">9.<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]--><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">These Terms are subject to change and are effective upon Seller posting the updated Terms to its website (<a href=\"https://www.scudin.com/pricing/\">https://www.scudin.com/pricing/</a>).</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">10. As mentioned herein in paragraph (5), <strong>NEITHER SELLER NOR SUPPLIER(S) WILL HAVE ANY LIABILITY OR OBLIGATION TO YOU OR ANY OTHER PERSON FOR ANY CLAIM, LOSS, DAMAGE, OR EXPENSE CAUSED IN WHOLE OR IN PART BY (a) ANY INADEQUACY, DEFICIENCY, OR DEFECT IN ANY PRODUCTS OR SERVICES (WHETHER OR NOT COVERED BY ANY WARRANTY), (b) THE USE OR PERFORMANCE OF ANY PRODUCTS OR SERVICES, OR (c) ANY FAILURE OR DELAY IN SELLER\'S PERFORMANCE HEREUNDER, OR FOR ANY SPECIAL, INDIRECT, INCIDENTAL, COST OF REPLACEMENT GOODS OR SERVICES, REWORK, LOSS OF DATA, CONSEQUENTIAL, EXEMPLARY OR PUNITIVE DAMAGES, HOWSOEVER CAUSED, INCLUDING VIA SELLER&rsquo;S OR SUPPLIER&rsquo;S NEGLIGENCE, WHETHER OR NOT YOU HAVE INFORMED SELLER OF THE POSSIBILITY OR LIKELIHOOD OF ANY SUCH DAMAGES. IN NO EVENT WILL SELLER&rsquo;S LIABILITY, REGARDLESS OF BASIS, EXCEED THE PRICE PAID FOR THE PRODUCTS OR SERVICES GIVING RISE TO THE CLAIM.</strong></span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">11. Nevertheless paragraph 5, the performance of any value-added service may void Supplier&rsquo;s warranty. Orders incorporating such services may become non-cancelable and the Products non-returnable depending on the Product category. Any third-party value-added service provider is deemed to be the Your responsibility. Seller shall have no liability for any technical advice offered or given.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">12. All rights in intellectual property owned or licensed by Seller or Supplier are hereby reserved and deemed restricted or limited. Seller makes no representation or warranty with respect to such rights and will have no liability in connection with them. You agree to comply with all requirements with regard to any intellectual property (including any requirement to enter into a separate license agreement and prohibitions against duplicating, reverse engineering or disclosing the same), even if Seller has broken the seal on any &ldquo;shrink wrapped&rdquo; software. If You provide Seller with any intellectual property, You warrant that You have all necessary legal rights to such intellectual property. You will indemnify Seller against and defend and hold it harmless from all liability, cost or expense arising out of or relating to any (a) breach or alleged breach of these terms and conditions, or (b) Your use or sale of the Products or services, including infringement claims that arise from Your use of Products or services in combination with other Products or services.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">13. None of Your orders may be cancelled, rescheduled, reconfigured, or assigned without Seller\'s prior written authorization and, in such event, You will be liable to Seller for any additional costs and expenses incurred by Seller. Prices are subject to change by Seller for any reason, including (a) upon Your rescheduling a shipment or reconfiguration of orders, or (b) in response to Supplier&rsquo;s price increases or if a price has been quoted in error, whereupon You may cancel the undelivered portion of any affected order by delivering written notice to Seller prior to the shipment thereof and within 10 days of Your receipt of notice of the price increase. Seller may assign its accounts receivable. In order to defray the cost of Your account administration, any amount owed to You during return period, which remains unclaimed by You for a period of 6 months will become the property of the Seller.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">14. In the event any of the terms or provisions set forth herein is deemed to be invalid, illegal or unenforceable in any jurisdiction, such invalidity, illegality or unenforceability shall not affect any other term or provision or invalidate or render unenforceable such term or provision in any other jurisdiction. Upon a determination that any term or provision is invalid, illegal or unenforceable, the court may modify these terms and conditions to affect our original intent as closely as possible in order that the transactions contemplated hereby be consummated to the greatest extent possible as originally contemplated by Scudin.com. </span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Your purchases and the use of Scudin.com is also subject to any applicable Scudin.com Terms and Conditions of Use and Privacy Policy available here:</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\"><span style=\"mso-spacerun: yes;\">&nbsp;</span><a href=\"https://www.scudin.com/privacy-policy/\">https://www.scudin.com/privacy-policy/</a></span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\"><a href=\"https://www.scudin.com/terms\">https://www.scudin.com/conditions-of-use/</a></span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Scudin.com also has the right to update any part of this policy (s) at any time to conform with its business model and operations and in the company&rsquo;s effort to continue its innovation and serve You better.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">WHAT YOU NEED TO KNOW</span></strong></p>\r\n<ul style=\"margin-top: 0in;\" type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"line-height: normal; mso-list: l1 level1 lfo2; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">During the Subscription Term, you may choose to cancel your subscription early, provided that, we will not provide any refunds where necessary as declared on the Terms and Conditions statement and you will promptly pay all unpaid fees due through the end of the Subscription Term.</span></li>\r\n<li class=\"MsoNormal\" style=\"line-height: normal; mso-list: l1 level1 lfo2; tab-stops: list .5in;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">We do not provide refunds</span></strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">&nbsp;if you decide to stop using the Scudin.com Ethos subscription during your Subscription Term.</span></li>\r\n<li class=\"MsoNormal\" style=\"line-height: normal; mso-list: l1 level1 lfo2; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Your Subscription Term will automatically renew for the period indicated above, unless you tell us that you don\'t want to renew by providing notice as required in the Customer Terms of Service.</span></li>\r\n<li class=\"MsoNormal\" style=\"line-height: normal; mso-list: l1 level1 lfo2; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">If you do not have any subscription account activated in your Scudin.com portal, then we will activate it upon your purchase any of the subscription plans we have.</span></li>\r\n<li class=\"MsoNormal\" style=\"line-height: normal; mso-list: l1 level1 lfo2; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Upon renewal, we may increase the fees to reflect future changes to our list prices. If this increase applies to you, we will notify you at least five (5) days in advance of your renewal. See the &lsquo;Fee Adjustments at Renewal&rsquo; section of our Price and Fees Terms of Service for more details.</span></li>\r\n</ul>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">Your recurring fees are subject to increase based on usage. Fees are also subject to increase to reflect future changes to our list price, as documented in Product and Services Catalog. See the&nbsp;<strong>Scudin Customer Terms of Service</strong>&nbsp;and FAQ page for more details.</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">During the Subscription Term, your data will be stored in the following data hosting location:&nbsp;North America</span></p>\r\n<p class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif;\">I have read, understand and accept the&nbsp;<strong>Scudin.com Customer Terms of Service</strong>;&nbsp;<strong>Scudin.com Privacy Policy</strong>; and&nbsp;<strong>Scudin.com Acceptable Use and Return Policy</strong>. By clicking \"Complete Purchase\" below any product on this platform, I agree that Scudin.com is authorized to charge me for all fees associated with the purchased item(s) or those affixed on subscriptions plans due during the Subscription Term and any renewal term. I certify that I am authorized to sign and enter into this binding legal contract eighter on individual basis or for the company or organization I represent making this purchase.</span></p>', NULL, '2022-08-31 04:12:16'),
(43, 'company_address', 'ThemesGround, Anytown, CA 12345 USA', NULL, '2022-05-21 10:04:04'),
(44, 'password_reset_success', '<p>Your password has been changed and successfully updated. You can login to your account with your new password. At this time, no action is required from you.&nbsp;</p>\r\n<p style=\"margin: 12.0pt 0in 0in 0in;\">The request for this change originated from;</p>\r\n<p style=\"margin: 0in;\">IP address: !IP_Address.&nbsp;</p>\r\n<p style=\"margin: 0in;\">Location: !City_Name, !State, !Country</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<p style=\"margin: 0in;\">Please contact support at +1 (972) 332-5707 if you do not recognize this change of password request.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', NULL, '2022-11-03 15:02:32'),
(45, 'password_reset', '<p>You requested for a password change to your account. Please use the following link to reset your password: !link</p>\r\n<p style=\"margin: 12.0pt 0in 0in 0in;\">The request for this change originated from;</p>\r\n<p style=\"margin: 0in;\">IP address: !IP_Address.&nbsp;</p>\r\n<p style=\"margin: 0in;\">Location: !City_Name, !State, !Country</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<p style=\"margin: 0in;\">If you did not request for a password change, please feel free to ignore this message. You can contact support at +1 (972) 332-5707 if you do not recognize this change of password request and have any concerns or questions about the requested change.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', NULL, '2022-11-03 15:02:32'),
(46, 'user_registration', '<p>Your account registration request has been verified. You can now complete your Scudin Account registration. Click the link below to activate and login to your account.</p>\r\n<p style=\"margin: 12.0pt 0in 0in 0in;\">The request for this access originated from;</p>\r\n<p style=\"margin: 0in;\">IP address: !IP_Address.&nbsp;</p>\r\n<p style=\"margin: 0in;\">Location: !City_Name, !State, !Country</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<p style=\"margin: 0in;\">Please contact support at +1 (972) 332-5707 if you do not recognize this account registration request. Welcome to our community of online sellers and shoppers. We are happy to have you on board.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', NULL, '2022-11-03 15:02:32'),
(47, 'seller_reg_email', '<p>Your account registration request has been verified. You can now navigate to the next step to complete your Scudin Account registration and set up your seller\'s account. If you haven&rsquo;t done that already, click the link below to activate your account signup process.</p>\r\n<p style=\"margin: 12.0pt 0in 0in 0in;\">The request for this access originated from;</p>\r\n<p style=\"margin: 0in;\">IP address: !IP_Address.&nbsp;</p>\r\n<p style=\"margin: 0in;\">Location: !City_Name, !State, !Country</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<p style=\"margin: 0in;\">Please contact support at +1 (972) 332-5707 if you do not recognize this account registration request. Welcome to our community of online sellers connected to millions of shoppers worldwide. We are happy to have you on board.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', NULL, '2022-11-03 15:02:32'),
(48, 'subscription_plan', '<p>Thank you for your subscription plan purchase for !plan. Your subscription account is now active and your benefits extension has been processed. At this time, no action is required from you. We appreciate your business and we are happy you continue to enjoy using Scudin platform for all your ecommerce needs.</p>\r\n<p style=\"margin: 12.0pt 0in 0in 0in;\">The request for this change originated from;</p>\r\n<p style=\"margin: 0in;\">IP address: !IP_Address.&nbsp;</p>\r\n<p style=\"margin: 0in;\">Location: !City_Name, !State, !Country</p>\r\n<p>Please contact support at +1 (972) 332-5707 or through the support ticket link on your account dashboard if you do not recognize this change of subscrption plan request.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', '2022-08-09 21:03:08', '2022-11-03 15:02:32'),
(49, 'plan_expiration', '<p>Your plan has been successfully changed to !plan and activated for the current billing cycle. And your account subscription benefits extension has been processed. At this time, no action is required from you. We appreciate your business and we are happy you continue to enjoy using our platform for all your ecommerce needs.</p>\r\n<p style=\"margin: 12.0pt 0in 0in 0in;\">The request for this change originated from;</p>\r\n<p style=\"margin: 0in;\">IP address: !IP_Address.&nbsp;</p>\r\n<p style=\"margin: 0in;\">Location: !City_Name, !State, !Country</p>\r\n<p>Please contact support at +1 (972) 332-5707 or through the support ticket link on your account dashboard if you do not recognize this change of subscrption plan request.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', '2022-08-09 21:03:08', '2022-11-03 15:02:32'),
(50, 'plan_expiration_notice', '<p>This email notification is to inform you that your !plan subscription plan is due to be renewed automatically on !date. You made a great choice by enrolling in the !plan Automatic Renewal Service when you chose to sell on Scudin or signed up for any of our subscription services. Now, no action is required from you at the moment to maintain your subscription account, and you won&rsquo;t experience any lapses in coverage or any service interruptions if you do nothing to change your plan before the renewal date.</p>\r\n<p style=\"margin: 0in;\">Please contact support from your account dashboard if you have any questions.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', '2022-08-09 21:03:08', '2022-11-03 15:02:32'),
(51, 'general_invoice', '<p>Thank you for your purchase. Your order with invoice ID: !invoice_ID has been processed successfully.</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<table style=\"border-collapse: collapse; width: 100%; border-width: 1px; margin-left: auto; margin-right: auto;\" border=\"1\"><colgroup><col style=\"width: 50.0568%;\"><col style=\"width: 49.9432%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td style=\"border-width: 1px;\" colspan=\"2\">ORDER ID:&nbsp; &nbsp;!invoice_ID</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-width: 1px;\" colspan=\"2\">!item_info</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-width: 1px;\" colspan=\"2\">TOTAL PRICE: !total_price</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-width: 1px;\" colspan=\"2\">Buyer : !receive_address</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-width: 1px;\" colspan=\"2\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center; border-width: 1px;\" colspan=\"2\">IP address: !IP_Address.&nbsp; &nbsp; <br>Location: !City_Name, !State, !Country</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br>Please contact support at +1 (972) 332-5707 or through the support ticket link on your account dashboard if you do not recognize this purchase.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', '2022-08-28 20:58:25', '2022-11-03 15:02:32'),
(52, 'plan_expired', '<p>This email notification is to inform you that your !plan subscription has expired. You can login to your account dashboard to renew your !plan and reactivate your subscription plan account in order to continue enjoying all the benefits associated with your plan.</p>\r\n<p style=\"margin: 0in;\">Please contact support at +1 (972) 332-5707 or through the support ticket link from your account dashboard if you have any questions about your subscription plan and all the numerous benefits that come with it.</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<p style=\"margin: 0in;\">&nbsp;</p>\r\n<hr>\r\n<p>CONFIDENTIALITY NOTICE: The information contained in and accompanying this communication may be privileged or confidential and is intended solely for the use of the intended recipient. If you are not the intended recipient of this communication please delete and destroy all copies immediately.</p>', '2022-08-09 21:03:08', '2022-11-03 15:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '/default.png',
  `parent_id` int NOT NULL,
  `position` int NOT NULL,
  `p_type` enum('car','tech','others','pc') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'others',
  `commision_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flat` decimal(10,2) DEFAULT '0.00',
  `percentage` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `p_type`, `commision_type`, `flat`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 'Automotive', 'automotive', '/storage/app/public/category/1659809522_391.png', 0, 0, 'car', 'combined_fee', '2.00', '11.00', '2022-08-05 16:25:49', '2022-08-06 18:12:02'),
(2, 'SUVs', 'suvs', '/storage/app/public/category/1cb1ace87938544decb1a35cc70c10258d91fdea.jpg', 1, 1, 'others', '', '0.00', '0.00', '2022-08-05 16:28:07', '2022-08-29 14:59:59'),
(3, 'Trucks & Trailers', 'trucks-trailers', '/storage/app/public/category/1659718756_864.png', 1, 1, 'others', '', '0.00', '0.00', '2022-08-05 16:38:04', '2022-08-05 16:59:16'),
(4, 'Cars & Sedans', 'cars-sedans', '/storage/app/public/category/1659717710_384.png', 1, 1, 'others', '', '0.00', '0.00', '2022-08-05 16:41:50', '2022-08-05 16:41:50'),
(5, 'Computer', 'computer', '/storage/app/public/category/1659900948_182.png', 0, 0, 'tech', 'combined_fee', '1.60', '14.00', '2022-08-05 17:09:44', '2022-08-07 19:35:48'),
(6, 'Desktops', 'desktops', '/storage/app/public/category/1659722907_550.png', 5, 1, 'others', '', '0.00', '0.00', '2022-08-05 17:12:06', '2022-08-05 18:08:27'),
(7, 'Laptops', 'laptops', '/storage/app/public/category/1659723002_951.png', 5, 1, 'others', '', '0.00', '0.00', '2022-08-05 17:13:41', '2022-08-05 18:10:02'),
(8, 'Tablets', 'tablets', '/storage/app/public/category/1659722968_66.jpg', 5, 1, 'others', '', '0.00', '0.00', '2022-08-05 17:14:57', '2022-08-05 18:09:28'),
(9, 'Apparel', 'apparel', '/storage/app/public/category/1659901357_23.jpg', 0, 0, 'others', 'combined_fee', '0.69', '16.00', '2022-08-05 18:40:54', '2022-08-07 19:42:37'),
(10, 'Men\'s Fashion', 'mens-fashion', '/storage/app/public/category/1659725327_856.PNG', 9, 1, 'others', '', '0.00', '0.00', '2022-08-05 18:48:47', '2022-08-05 18:48:47'),
(11, 'Women\'s Fashion', 'womens-fashion', '/storage/app/public/category/1659725416_875.JPG', 9, 1, 'others', '', '0.00', '0.00', '2022-08-05 18:50:16', '2022-08-05 18:50:16'),
(12, 'Shop for Boys', 'shop-for-boys', '/storage/app/public/category/1660598443_21.jpg', 30, 1, 'others', '', '0.00', '0.00', '2022-08-05 18:55:59', '2022-08-15 21:20:43'),
(13, 'Software', 'software', '/storage/app/public/category/1659727359_738.png', 5, 1, 'others', '', '0.00', '0.00', '2022-08-05 19:05:36', '2022-08-05 19:22:39'),
(14, 'Video Games', 'video-games', '/storage/app/public/category/1659726493_100.png', 5, 1, 'others', '', '0.00', '0.00', '2022-08-05 19:08:13', '2022-08-05 19:08:13'),
(19, 'Vans', 'vans', '/storage/app/public/category/1659903942_67.png', 1, 1, 'others', '', '0.00', '0.00', '2022-08-07 20:25:42', '2022-08-07 20:25:42'),
(20, 'Baby Products', 'baby-products', '/storage/app/public/category/d6f1ba07d71680f75197ec39af6986caa633b40b.jpg', 0, 0, 'others', 'combined_fee', '0.69', '1.84', '2022-08-09 21:00:09', '2022-09-26 17:21:44'),
(21, 'Beauty', 'beauty', '/storage/app/public/category/5e5b7d6817d7f97a2f88a870c5dbadf3801075f6.jpg', 0, 0, 'others', 'combined_fee', '0.69', '7.14', '2022-08-09 21:31:51', '2022-09-26 17:11:49'),
(22, 'Books & Office Supplies', 'books', '/storage/app/public/category/c7a579b713af09741626d10efd89c3149196b8cc.jpg', 0, 0, 'others', 'combined_fee', '1.65', '14.00', '2022-08-09 21:55:49', '2022-10-15 05:55:14'),
(23, 'Skincare Products', 'skincare-products', '/storage/app/public/category/8074e18374fab256c69e2705f72d38d280f7688c.jpg', 21, 1, 'others', '', '0.00', '0.00', '2022-08-09 22:18:29', '2022-09-01 01:30:52'),
(24, 'Cosmetics', 'cosmetics', '/storage/app/public/category/1660083636_18.png', 21, 1, 'others', '', '0.00', '0.00', '2022-08-09 22:20:36', '2022-08-09 22:20:36'),
(25, 'Shop for Beauty Products', 'shop-for-beauty-products', '/storage/app/public/category/1660084134_548.png', 21, 1, 'others', '', '0.00', '0.00', '2022-08-09 22:28:54', '2022-08-09 22:28:54'),
(26, 'Camera & Photo', 'camera-photo', '/storage/app/public/category/1660084953_136.png', 0, 0, 'others', 'combined_fee', '0.69', '7.00', '2022-08-09 22:42:33', '2022-08-09 22:42:33'),
(27, 'Cell Phone & Devices', 'cell-phone-devices', '/storage/app/public/category/1660086464_933.png', 0, 0, 'others', 'combined_fee', '0.69', '7.00', '2022-08-09 23:07:44', '2022-08-09 23:07:44'),
(28, 'Cell Phones', 'cell-phones', '/storage/app/public/category/1660091809_571.png', 27, 1, 'others', '', '0.00', '0.00', '2022-08-10 00:36:49', '2022-08-10 00:36:49'),
(29, 'Phone Accessories', 'phone-accessories', '/storage/app/public/category/4b62303a340d721f088bdf25f45c06f58882c9e2.jpg', 27, 1, 'others', '', '0.00', '0.00', '2022-08-10 00:59:55', '2022-08-29 14:55:40'),
(30, 'Children\'s Clothes', 'kids-clothes', '/storage/app/public/category/1660598138_651.jpg', 0, 0, 'others', 'combined_fee', '0.69', '16.00', '2022-08-15 21:14:14', '2022-08-15 21:15:38'),
(31, 'Shop for Girls', 'shop-for-girls', '/storage/app/public/category/1660598546_583.jpg', 30, 1, 'others', '', '0.00', '0.00', '2022-08-15 21:22:26', '2022-08-15 21:22:26'),
(32, 'Superheroes', 'superheroes', '/storage/app/public/category/1660599630_241.png', 30, 1, 'others', '', '0.00', '0.00', '2022-08-15 21:40:30', '2022-08-15 21:40:30'),
(33, 'Shop for New Born', 'shop-for-new-born', '/storage/app/public/category/1660600299_287.png', 30, 1, 'others', '', '0.00', '0.00', '2022-08-15 21:51:39', '2022-08-15 21:51:39'),
(34, 'Kid\'s Toys & Games', 'kids-toys-games', '/storage/app/public/category/3c7cf002758920bf018eeaece21caf7e31926775.jpg', 30, 1, 'others', '', '0.00', '0.00', '2022-08-15 22:51:02', '2022-09-12 04:30:44'),
(35, 'Digital Cameras', 'digital-cameras', '/storage/app/public/category/1660604966_411.png', 26, 1, 'others', '', '0.00', '0.00', '2022-08-15 23:09:26', '2022-08-15 23:09:26'),
(36, 'Video & DVD, Audio', 'video-dvd-audio', '/storage/app/public/category/1660605937_825.png', 0, 0, 'others', 'combined_fee', '1.60', '14.00', '2022-08-15 23:25:37', '2022-08-15 23:25:37'),
(37, 'Wireless Speakers', 'wireless-speakers', '/storage/app/public/category/505d8a1fbcd843e2b06a6b571d8813b319c1f5b8.jpg', 36, 1, 'others', '', '0.00', '0.00', '2022-08-16 00:34:24', '2022-08-29 19:07:15'),
(38, 'Shop for Textbooks', 'shop-for-textbooks', '/storage/app/public/category/0c5c317a441c5f623f850d07ed826ac5ebea6551.jpg', 22, 1, 'others', '', '0.00', '0.00', '2022-08-16 13:53:19', '2022-09-02 02:21:02'),
(39, 'Electronics & TVs', 'electronics-tvs', '/storage/app/public/category/7b7bf3017ef668729caef9457ee6cc2c35b208c4.jpg', 0, 0, 'tech', 'combined_fee', '0.69', '8.00', '2022-08-16 19:38:26', '2022-09-01 03:18:04'),
(40, 'Electronics & TVs', 'electronics-tvs', '/storage/app/public/category/b235b5e8aadce6b0f56d2570ce867f3547f899ee.jpg', 39, 1, 'others', '', '0.00', '0.00', '2022-08-16 19:42:28', '2022-08-30 04:59:11'),
(41, 'Baby Diapers', 'baby-diapers', '/storage/app/public/category/6e467ad5affab3de55351d20d2a4293e26bc7c72.jpg', 20, 1, 'others', '', '0.00', '0.00', '2022-08-17 16:51:03', '2022-09-01 01:41:35'),
(42, 'Powersports', 'powersports', '/storage/app/public/category/bce85f472341ad5f993bc4f9ab0e582208aeda86.jpg', 1, 1, 'others', '', '0.00', '0.00', '2022-08-29 15:28:26', '2022-08-29 15:28:26'),
(43, 'Men Accessories', 'men-accessories', '/storage/app/public/category/983400d3a30592f5fad35e073970dd056efcccd9.jpg', 9, 1, 'others', '', '0.00', '0.00', '2022-08-29 17:50:34', '2022-08-29 17:59:25'),
(44, 'Women Accessories', 'women-accessories', '/storage/app/public/category/c28d79e5fe0f947c39fa13776f68e6860993329d.jpg', 9, 1, 'others', '', '0.00', '0.00', '2022-08-29 17:52:24', '2022-08-29 17:57:41'),
(45, 'Shop for Belt', 'shop-for-belt', '/storage/app/public/category/a835d123d0c0319e9e7567bed5ba371ff588cd89.jpg', 43, 2, 'others', '', '0.00', '0.00', '2022-08-29 18:44:30', '2022-08-29 18:44:30'),
(46, 'Footwear', 'footwear', '/storage/app/public/category/f7ed8541d2124d57cf43a8cd228b7d979187e801.jpg', 0, 0, 'others', 'combined_fee', '0.69', '1.42', '2022-08-29 19:37:35', '2022-10-13 04:55:23'),
(47, 'Shoes for Men', 'shoes-for-men', '/storage/app/public/category/2f82c4cef155904621dd1bf269324774f3a2a511.jpg', 46, 1, 'others', '', '0.00', '0.00', '2022-08-29 19:40:08', '2022-08-29 19:40:08'),
(48, 'Shoes for Women', 'shoes-for-women', '/storage/app/public/category/f98a8a7c6d7e3299deb48d7ea9bcb0520902cbd7.jpg', 46, 1, 'others', '', '0.00', '0.00', '2022-08-29 19:41:48', '2022-08-29 19:41:48'),
(49, 'Video Game Console', 'video-game-console', '/storage/app/public/category/f5b1c57f4bb964bd442e07b79a090e98f69a4f27.jpg', 0, 0, 'others', 'combined_fee', '2.30', '7.00', '2022-08-29 20:00:18', '2022-08-29 20:00:18'),
(50, 'Game Consoles', 'game-consoles', '/storage/app/public/category/c5abf116f97eb9c228da5fecec2047fdf86b2f61.jpg', 49, 1, 'others', '', '0.00', '0.00', '2022-08-29 20:06:21', '2022-08-29 20:06:21'),
(51, 'Game Accessories', 'game-accessories', '/storage/app/public/category/7df0ef1812f34b091d80878d8909117f94e79c35.jpg', 49, 1, 'others', '', '0.00', '0.00', '2022-08-29 20:13:57', '2022-08-29 20:13:57'),
(52, 'Auto Parts & Wheels', 'auto-parts-wheels', '/storage/app/public/category/8474c6a3d94380afae062a190e87fc8b50178ee6.jpg', 0, 0, 'others', 'combined_fee', '2.00', '9.00', '2022-08-30 00:17:49', '2022-08-30 00:17:49'),
(53, 'Parts & Wheels', 'parts-wheels', '/storage/app/public/category/2f5f81c7002fda5ba1d7e93617a8f38b4e7100d2.jpg', 52, 1, 'others', '', '0.00', '0.00', '2022-08-30 00:19:31', '2022-08-30 00:19:31'),
(54, 'Tires', 'tires', '/storage/app/public/category/db0f18cf66500a0967ee44dcccbb7c7155c3aa5a.jpg', 52, 1, 'others', '', '0.00', '0.00', '2022-08-30 00:26:55', '2022-08-30 00:26:55'),
(55, 'Auto Batteries', 'auto-batteries', '/storage/app/public/category/df8e623936acb73655befb787f0eae451903e3d0.jpg', 52, 1, 'others', '', '0.00', '0.00', '2022-08-30 01:00:44', '2022-08-30 01:00:44'),
(56, 'Shoes for Boys', 'shoes-for-boys', '/storage/app/public/category/66fd8eec46df67a9d4e90b385f14c753589cd14e.jpg', 46, 1, 'others', '', '0.00', '0.00', '2022-08-30 02:21:28', '2022-08-30 02:21:28'),
(57, 'Shoes for Girls', 'shoes-for-girls', '/storage/app/public/category/7d6e52867e750d2ef99391eccd2a17a0d7f28cc2.jpg', 46, 1, 'others', '', '0.00', '0.00', '2022-08-30 02:24:03', '2022-08-30 02:24:03'),
(58, 'Shoes for Newborns', 'shoes-for-newborns', '/storage/app/public/category/e47aa66476192cc60274b0a388f7d1585407f567.jpg', 46, 1, 'others', '', '0.00', '0.00', '2022-08-30 02:36:35', '2022-08-30 02:36:35'),
(59, 'Computer Accessories', 'computer-accessories', '/storage/app/public/category/686add6cd16fefc028ad1c356548a216e349fae9.jpg', 5, 1, 'others', '', '0.00', '0.00', '2022-08-30 02:56:59', '2022-08-30 02:56:59'),
(60, 'Audio Accessories', 'audio-accessories', '/storage/app/public/category/3f4a3288b6eaac625d66b6feef9c767852e067a4.jpg', 36, 1, 'others', '', '0.00', '0.00', '2022-08-30 03:41:10', '2022-08-30 03:41:10'),
(61, 'Camera Accessories', 'camera-accessories', '/storage/app/public/category/91ff631f2197a661b8a85fdcbbb1ecee32c6006d.jpg', 26, 1, 'others', '', '0.00', '0.00', '2022-08-30 04:09:28', '2022-08-30 04:09:28'),
(62, 'Refrigerator', 'refrigerator', '/storage/app/public/category/b473f0ef6255b49c4e255444fcc2505945b73663.jpg', 39, 1, 'others', '', '0.00', '0.00', '2022-08-30 04:43:16', '2022-08-30 04:43:16'),
(63, 'Microwave Oven', 'microwave-oven', '/storage/app/public/category/0beebdc1fc048a73e7e0d2287cccc7a1ad965c05.jpg', 39, 1, 'others', '', '0.00', '0.00', '2022-08-30 04:44:20', '2022-08-30 04:44:20'),
(66, 'Blouses & Tops', 'blouses-tops', '/storage/app/public/category/bd3d3f8e351464a34e2591f591a9f79d3d9d1b36.jpg', 11, 2, 'others', '', '0.00', '0.00', '2022-09-01 18:27:31', '2022-09-01 18:27:31'),
(67, 'Coats', 'coats', '/storage/app/public/category/89f1f0eb9ea6e4c2171510095fd3500ced554393.jpg', 11, 2, 'others', '', '0.00', '0.00', '2022-09-01 18:58:31', '2022-09-01 18:58:31'),
(68, 'DVD Players', 'dvd-players', '/storage/app/public/category/ed0433cffce00de94ea95e5b9e9fe7ca9a0c71da.jpg', 36, 1, 'others', '', '0.00', '0.00', '2022-09-02 00:39:25', '2022-09-02 00:43:20'),
(69, 'Digital Audio Player', 'digital-audio-player', '/storage/app/public/category/b3f092891ea95d817860766ea801f843ae034244.jpg', 36, 1, 'others', '', '0.00', '0.00', '2022-09-02 01:08:44', '2022-09-02 01:19:00'),
(70, 'Novels', 'novels', '/storage/app/public/category/1ec49a9baa4a8c508c0b61229853e59191511c1c.jpg', 22, 1, 'others', '', '0.00', '0.00', '2022-09-02 02:17:26', '2022-09-02 03:15:19'),
(71, 'School Supplies', 'school-supplies', '/storage/app/public/category/59cdc7ec07bd529d37d409eb5f9379308aa681f8.jpg', 22, 1, 'others', '', '0.00', '0.00', '2022-09-02 02:59:12', '2022-09-02 03:08:15'),
(72, 'Jumpsuits', 'jumpsuits', '/storage/app/public/category/97927bdb836ff77c628ba8a0dbc803062fa6fad4.jpg', 11, 2, 'others', '', '0.00', '0.00', '2022-09-02 14:50:12', '2022-09-02 14:50:12'),
(73, 'Gowns & Dresses', 'gowns-dresses', '/storage/app/public/category/9bf6e37d91a4660330abad3f384bb8108335ab11.jpg', 11, 2, 'others', '', '0.00', '0.00', '2022-09-02 19:11:50', '2022-09-02 19:11:50'),
(74, 'Swimsuits & Rompers', 'swimsuits-rompers', '/storage/app/public/category/7c1db72b64d35cbf568bdd18095a6df2c429fe30.jpg', 11, 2, 'others', '', '0.00', '0.00', '2022-09-02 21:17:59', '2022-09-02 21:17:59'),
(77, 'Home Improvement & Parts', 'home-improvement-parts', '/storage/app/public/category/2bc89e8d06b0cf78fc2e35feea2a77f057837741.jpg', 0, 0, 'others', 'combined_fee', '0.69', '14.00', '2022-09-04 14:10:05', '2022-09-04 14:38:49'),
(78, 'Plumbing Materials', 'plumbing-materials', '/storage/app/public/category/de59cf6caff82b7aa702dd990e5271de052f5c52.jpg', 77, 1, 'others', '', '0.00', '0.00', '2022-09-04 14:15:42', '2022-09-04 14:15:42'),
(79, 'Roofing Materials', 'roofing-materials', '/storage/app/public/category/f036b9f68572e429cf1e5db6171da72297d4443b.jpg', 77, 1, 'others', '', '0.00', '0.00', '2022-09-04 14:24:50', '2022-09-04 14:24:50'),
(80, 'Tiles & Marbles', 'tiles-marbles', '/storage/app/public/category/cec0186dafb893ef7c5558bce1cd27401c4999a9.jpg', 77, 1, 'others', '', '0.00', '0.00', '2022-09-04 14:39:43', '2022-09-04 14:39:43'),
(81, 'Cements, Concretes, Woods & Paints', 'cements-concretes-woods-paints', '/storage/app/public/category/4fa20c000f2d5ec40391332ea7310aa9110f2a35.jpg', 77, 1, 'others', '', '0.00', '0.00', '2022-09-04 15:13:58', '2022-09-04 15:13:58'),
(82, 'Coats', 'coats', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-04 21:26:49', '2022-09-04 21:26:49'),
(83, 'Cements', 'cements', '/default.png', 81, 2, 'others', '', '0.00', '0.00', '2022-09-05 15:13:28', '2022-09-05 15:13:28'),
(84, 'Concretes & Sands', 'concretes-sands', '/default.png', 81, 2, 'others', '', '0.00', '0.00', '2022-09-05 15:14:58', '2022-09-05 15:14:58'),
(85, 'Woods', 'woods', '/default.png', 81, 2, 'others', '', '0.00', '0.00', '2022-09-05 15:16:07', '2022-09-05 15:16:07'),
(86, 'Doors & Windows', 'doors-windows', '/default.png', 81, 2, 'others', '', '0.00', '0.00', '2022-09-05 15:18:23', '2022-09-05 15:18:23'),
(87, 'Paints & Primers', 'paints-primers', '/default.png', 81, 2, 'others', '', '0.00', '0.00', '2022-09-05 15:19:52', '2022-09-05 15:19:52'),
(88, 'Traditional Wears', 'traditional-wears', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-06 03:07:13', '2022-09-06 03:07:13'),
(89, 'Traditional Wears', 'traditional-wears', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-06 03:07:34', '2022-09-06 03:07:34'),
(90, 'Jeans', 'jeans', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-06 03:18:52', '2022-09-06 03:18:52'),
(91, 'Jeans', 'jeans', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-06 03:19:17', '2022-09-06 03:19:17'),
(92, 'Jeans', 'jeans', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-06 03:19:58', '2022-09-06 03:19:58'),
(93, 'Tools', 'tools', '/storage/app/public/category/d2c06273e63538052cf2d3653140b1a589bd3bd0.jpg', 77, 1, 'others', '', '0.00', '0.00', '2022-09-06 16:21:10', '2022-09-06 16:21:10'),
(94, 'Musical Instruments & Parts', 'musical-instruments-parts', '/storage/app/public/category/21568ef82ac220b70fef22ade1352c00dc468123.jpg', 0, 0, 'others', 'combined_fee', '1.60', '14.00', '2022-09-06 17:25:21', '2022-09-06 17:25:21'),
(95, 'Musical Instruments', 'musical-instruments', '/storage/app/public/category/eba1b9abaa3711707a7c5c86e8423025978e632d.jpg', 94, 1, 'others', '', '0.00', '0.00', '2022-09-06 17:46:07', '2022-09-06 17:46:07'),
(96, 'Parts & Accessories', 'parts-accessories', '/storage/app/public/category/b5c21fabd103271f0a1bf7ba68077728791c8ed3.jpg', 94, 1, 'others', '', '0.00', '0.00', '2022-09-06 17:58:13', '2022-09-06 17:58:13'),
(97, 'Baby Oil & Lotion', 'baby-oil-lotion', '/storage/app/public/category/0dcef7631d39f546d9b2a5409349ad591ac4ea0b.jpg', 20, 1, 'others', '', '0.00', '0.00', '2022-09-06 18:13:58', '2022-09-06 18:13:58'),
(98, 'Baby Blankets', 'baby-blankets', '/storage/app/public/category/e4baca715e844f358db0b6f9b374bd2b39f80af6.jpg', 20, 1, 'others', '', '0.00', '0.00', '2022-09-06 18:19:17', '2022-09-06 18:48:06'),
(99, 'Baby Accessories', 'baby-accessories', '/storage/app/public/category/ca28b7b216e229f7ce05cb626156df35b25bc65d.jpg', 20, 1, 'others', '', '0.00', '0.00', '2022-09-06 18:25:58', '2022-09-06 18:25:58'),
(100, 'Gowns & Dresses', 'gowns-dresses', '/storage/app/public/category/a963c5a4965f027624cc53cabb7a37b9f0ae040d.jpg', 31, 2, 'others', '', '0.00', '0.00', '2022-09-07 03:25:17', '2022-09-07 03:25:17'),
(101, 'Tops & Skirts', 'tops-skirts', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-07 03:58:10', '2022-09-07 03:58:10'),
(103, 'Tops & Shirts', 'tops-shirts', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-07 13:58:34', '2022-09-07 13:58:34'),
(104, 'Hoodies & Coats', 'hoodies-coats', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-07 14:00:19', '2022-09-07 14:00:19'),
(105, 'Pants & Trousers', 'pants-trousers', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-07 14:01:18', '2022-09-07 14:01:18'),
(106, 'Jackets', 'jackets', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 18:53:27', '2022-09-11 18:53:27'),
(107, 'Leggings', 'leggings', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 18:54:58', '2022-09-11 18:54:58'),
(108, 'Outfits', 'outfits', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 18:55:56', '2022-09-11 18:55:56'),
(109, 'Shirts', 'shirts', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 18:56:42', '2022-09-11 18:56:42'),
(110, 'Shorts', 'shorts', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 18:57:43', '2022-09-11 18:57:43'),
(111, 'Skirts', 'skirts', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 18:58:26', '2022-09-11 18:58:26'),
(112, 'Sleeveless T-Shirts', 'sleeveless-t-shirts', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 18:59:55', '2022-09-11 18:59:55'),
(113, 'Suits', 'suits', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 19:01:00', '2022-09-11 19:01:00'),
(114, 'Sweaters', 'sweaters', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 19:02:13', '2022-09-11 19:02:13'),
(115, 'Sweatshirts', 'sweatshirts', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 19:03:24', '2022-09-11 19:03:24'),
(116, 'T-shirts', 't-shirts', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 19:06:20', '2022-09-11 19:06:20'),
(117, 'Trousers & Pants', 'trousers-pants', '/default.png', 11, 2, 'others', '', '0.00', '0.00', '2022-09-11 19:09:20', '2022-09-11 19:09:20'),
(119, 'Active Wears & Bodies', 'active-wears-bodies', '/default.png', 44, 2, 'others', '', '0.00', '0.00', '2022-09-11 19:21:39', '2022-09-11 19:21:39'),
(120, 'Boxers', 'boxers', '/default.png', 44, 2, 'others', '', '0.00', '0.00', '2022-09-11 19:31:27', '2022-09-11 19:31:27'),
(121, 'Panties', 'panties', '/default.png', 44, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:00:33', '2022-09-11 20:00:33'),
(122, 'Socks', 'socks', '/default.png', 44, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:01:34', '2022-09-11 20:01:34'),
(123, 'Stockings', 'stockings', '/default.png', 44, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:02:36', '2022-09-11 20:02:36'),
(124, 'Tights', 'tights', '/default.png', 44, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:03:20', '2022-09-11 20:03:20'),
(125, 'Swimsuits', 'swimsuits', '/default.png', 44, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:03:51', '2022-09-11 20:03:51'),
(126, 'Outfits', 'outfits', '/default.png', 44, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:07:13', '2022-09-11 20:07:13'),
(127, 'Costumes', 'costumes', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:16:19', '2022-09-11 20:16:19'),
(128, 'Cropped Pants', 'cropped-pants', '/default.png', 9, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:16:53', '2022-09-11 20:33:57'),
(129, 'Jackets', 'jackets', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:18:17', '2022-09-11 20:18:17'),
(130, 'Polos', 'polos', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:19:49', '2022-09-11 20:19:49'),
(131, 'Suits', 'suits', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:21:20', '2022-09-11 20:21:20'),
(132, 'Shirts', 'shirts', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:21:34', '2022-09-11 20:21:34'),
(133, 'Shorts', 'shorts', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:22:07', '2022-09-11 20:22:07'),
(134, 'Sleeveless t-shirts', 'sleeveless-t-shirts', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:22:54', '2022-09-11 20:22:54'),
(135, 'Sweaters', 'sweaters', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:23:24', '2022-09-11 20:23:24'),
(136, 'Sweatshirts', 'sweatshirts', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:24:43', '2022-09-11 20:24:43'),
(137, 'T-shirts', 't-shirts', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:25:10', '2022-09-11 20:25:10'),
(138, 'Trousers & Pants', 'trousers-pants', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:26:04', '2022-09-11 20:26:04'),
(139, 'Vests', 'vests', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:27:24', '2022-09-11 20:27:24'),
(140, 'Waistcoats', 'waistcoats', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-11 20:28:41', '2022-09-11 20:28:41'),
(141, 'Garden & Pets Supplies', 'garden-pets-supplies', '/storage/app/public/category/535680e504675e1151688b0d803d93adfeaeb0cd.jpg', 0, 0, 'others', 'combined_fee', '0.69', '14.00', '2022-09-11 21:02:30', '2022-09-11 21:02:30'),
(142, 'Home Garden', 'home-garden', '/storage/app/public/category/90fc5eb6a9b134ff3afbe9c4654f88754d987d61.jpg', 141, 1, 'others', '', '0.00', '0.00', '2022-09-11 21:08:53', '2022-09-11 21:08:53'),
(143, 'Pets Supplies', 'pets-supplies', '/storage/app/public/category/422606c2d01fece30e8e150d1f3b7216779eddc5.jpg', 141, 1, 'others', '', '0.00', '0.00', '2022-09-11 21:09:37', '2022-09-11 21:09:37'),
(144, 'Industrial Machines', 'industrial-machines-equipment', '/storage/app/public/category/ccfec33253cc458fb8f0c2022837072e8acece7f.jpg', 0, 0, 'others', 'combined_fee', '0.69', '11.00', '2022-09-11 22:08:43', '2022-09-11 22:15:16'),
(145, 'Industrial Machines', 'industrial-machines', '/storage/app/public/category/a2d578d897ca13d42a9615ac4e7eed4f7b56ff66.jpg', 144, 1, 'others', '', '0.00', '0.00', '2022-09-11 22:11:19', '2022-09-11 22:11:19'),
(146, 'Parts & Accessories', 'parts-accessories', '/storage/app/public/category/bbfcc9202a89fe02ecd4168bf94ed44bd7c4ce0f.jpg', 144, 1, 'others', '', '0.00', '0.00', '2022-09-11 22:12:39', '2022-09-11 22:12:39'),
(147, 'Food Services', 'food-services', '/default.png', 145, 2, 'others', '', '0.00', '0.00', '2022-09-11 22:26:41', '2022-09-11 22:26:41'),
(148, 'Janitorial & Sanitation', 'janitorial-sanitation', '/default.png', 145, 2, 'others', '', '0.00', '0.00', '2022-09-11 22:27:16', '2022-09-11 22:27:16'),
(149, 'Power & Energy', 'power-energy', '/default.png', 145, 2, 'others', '', '0.00', '0.00', '2022-09-11 22:28:27', '2022-09-11 22:28:27'),
(150, 'Automation', 'automation', '/default.png', 145, 2, 'others', '', '0.00', '0.00', '2022-09-11 22:31:17', '2022-09-11 22:31:17'),
(151, 'IoT Manufacturing Equipment', 'iot-manufacturing-equipment', '/default.png', 145, 2, 'others', '', '0.00', '0.00', '2022-09-11 22:35:05', '2022-09-11 22:35:05'),
(152, 'Sports & Outdoors', 'sports-outdoors', '/storage/app/public/category/dc30ce914f371abbe4063cd1b1f28f9f15a618e0.jpg', 0, 0, 'others', 'combined_fee', '0.69', '14.00', '2022-09-11 23:04:51', '2022-09-11 23:04:51'),
(153, 'Sports Equipment', 'sports-equipment', '/storage/app/public/category/25a6a5d79f5722c2d36f60556f08167dcf1a64b6.jpg', 152, 1, 'others', '', '0.00', '0.00', '2022-09-11 23:06:56', '2022-09-11 23:06:56'),
(155, 'Outdoors', 'outdoors', '/storage/app/public/category/288c7ad7a9fabf63013fcd27d09d5135522c25d9.jpg', 152, 1, 'others', '', '0.00', '0.00', '2022-09-11 23:08:23', '2022-09-11 23:13:29'),
(156, 'Kitchen Equipment', 'kitchen-equipment', '/storage/app/public/category/e2d35c1dad6adc84f49cfdb830e6f65c45e6b4ce.jpg', 0, 0, 'others', 'combined_fee', '0.69', '14.00', '2022-09-12 00:35:22', '2022-09-12 00:35:22'),
(157, 'Food Preparation', 'food-preparation', '/storage/app/public/category/0dba7ce747aaa22e821930d413f48482b198905d.jpg', 156, 1, 'others', '', '0.00', '0.00', '2022-09-12 00:39:30', '2022-09-12 00:41:06'),
(158, 'Cooking Utensils', 'cooking-utensils', '/storage/app/public/category/6387683847fec84ccedb3b8a7176cf04f3036977.jpg', 156, 1, 'others', '', '0.00', '0.00', '2022-09-12 00:47:41', '2022-09-12 00:47:41'),
(159, 'Dress Shoes', 'dress-shoes', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:52:19', '2022-09-12 02:52:19'),
(161, 'Brogues', 'brogues', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:53:49', '2022-09-12 02:53:49'),
(162, 'Derby', 'derby', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:54:21', '2022-09-12 02:54:21'),
(163, 'Flip-flops', 'flip-flops', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:54:58', '2022-09-12 02:54:58'),
(164, 'Loafers', 'loafers', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:55:30', '2022-09-12 02:55:30'),
(165, 'Sandals', 'sandals', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:56:05', '2022-09-12 02:56:05'),
(166, 'Slip-on', 'slip-on', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:56:47', '2022-09-12 02:56:47'),
(167, 'Sneakers', 'sneakers', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:57:28', '2022-09-12 02:57:28'),
(169, 'Ballet Shoes', 'ballet-shoes', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 02:59:20', '2022-09-12 02:59:20'),
(170, 'Espadrilles', 'espadrilles', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:00:37', '2022-09-12 03:00:37'),
(171, 'Loafers', 'loafers', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:01:20', '2022-09-12 03:01:20'),
(172, 'Mules', 'mules', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:01:50', '2022-09-12 03:01:50'),
(173, 'Platform Shoes', 'platform-shoes', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:02:44', '2022-09-12 03:02:44'),
(174, 'Pumps', 'pumps', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:03:32', '2022-09-12 03:03:32'),
(175, 'Sandals', 'sandals', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:04:18', '2022-09-12 03:04:18'),
(176, 'Sneakers', 'sneakers', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:04:52', '2022-09-12 03:04:52'),
(177, 'Ankle Boots', 'ankle-boots', '/default.png', 47, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:08:29', '2022-09-12 03:08:29'),
(178, 'Ankle Boots', 'ankle-boots', '/default.png', 48, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:08:47', '2022-09-12 03:08:47'),
(179, 'Coats', 'coats', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:39:56', '2022-09-12 03:39:56'),
(180, 'Jumpsuits', 'jumpsuits', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:40:42', '2022-09-12 03:40:42'),
(181, 'Jeans', 'jeans', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:44:11', '2022-09-12 03:44:11'),
(182, 'Leggings', 'leggings', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:44:56', '2022-09-12 03:44:56'),
(183, 'Outfits', 'outfits', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:45:36', '2022-09-12 03:45:36'),
(184, 'Shirts', 'shirts', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:46:14', '2022-09-12 03:46:14'),
(185, 'Shorts', 'shorts', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:47:05', '2022-09-12 03:47:05'),
(186, 'Sweaters', 'sweaters', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:47:49', '2022-09-12 03:47:49'),
(187, 'Sweatshirts', 'sweatshirts', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:48:23', '2022-09-12 03:48:23'),
(188, 'Tights', 'tights', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:48:56', '2022-09-12 03:48:56'),
(189, 'T-shirts', 't-shirts', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:49:30', '2022-09-12 03:49:30'),
(190, 'Vests', 'vests', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:51:41', '2022-09-12 03:51:41'),
(191, 'Waistcoats', 'waistcoats', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:52:25', '2022-09-12 03:52:25'),
(192, 'Activewear', 'activewear', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:57:07', '2022-09-12 03:57:07'),
(193, 'Jackets', 'jackets', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:57:55', '2022-09-12 03:57:55'),
(194, 'Down jackets', 'down-jackets', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:58:32', '2022-09-12 03:58:32'),
(195, 'Outfits', 'outfits', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 03:59:10', '2022-09-12 03:59:10'),
(196, 'Waistcoats', 'waistcoats', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:00:00', '2022-09-12 04:00:00'),
(197, 'Sweaters', 'sweaters', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:00:38', '2022-09-12 04:00:38'),
(198, 'Shorts', 'shorts', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:01:43', '2022-09-12 04:01:43'),
(199, 'Sweatshirts', 'sweatshirts', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:02:35', '2022-09-12 04:02:35'),
(200, 'T-shirts', 't-shirts', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:03:07', '2022-09-12 04:03:07'),
(201, 'Vests', 'vests', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:04:32', '2022-09-12 04:04:32'),
(202, 'Swimwear', 'swimwear', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:05:40', '2022-09-12 04:05:40'),
(203, 'Swimwear', 'swimwear', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:06:00', '2022-09-12 04:06:00'),
(204, 'Socks', 'socks', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:07:24', '2022-09-12 04:07:24'),
(205, 'Socks', 'socks', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:07:42', '2022-09-12 04:07:42'),
(206, 'Accessories', 'accessories', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:08:39', '2022-09-12 04:08:39'),
(207, 'Accessories', 'accessories', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:09:04', '2022-09-12 04:09:04'),
(208, 'Marvel Avengers', 'marvel-avengers', '/default.png', 32, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:13:01', '2022-09-12 04:13:01'),
(209, 'Starwars', 'starwars', '/default.png', 32, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:13:48', '2022-09-12 04:13:48'),
(210, 'Captain America', 'captain-america', '/default.png', 32, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:14:34', '2022-09-12 04:14:34'),
(211, 'Spiderman', 'spiderman', '/default.png', 32, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:15:04', '2022-09-12 04:15:04'),
(212, 'Black Panther', 'black-panther', '/default.png', 32, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:18:01', '2022-09-12 04:18:01'),
(213, 'Frozen', 'frozen', '/default.png', 32, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:18:58', '2022-09-12 04:18:58'),
(214, 'Lady Bug', 'lady-bug', '/default.png', 32, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:19:56', '2022-09-12 04:19:56'),
(215, 'Toy Cars', 'toy-cars', '/default.png', 34, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:34:03', '2022-09-12 04:34:03'),
(216, 'Minions', 'minions', '/default.png', 34, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:35:16', '2022-09-12 04:35:16'),
(217, 'Peppa Pigs', 'peppa-pigs', '/default.png', 34, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:36:32', '2022-09-12 04:36:32'),
(218, 'Paw Patrol', 'paw-patrol', '/default.png', 34, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:37:20', '2022-09-12 04:37:20'),
(219, 'Wild Kratts', 'wild-kratts', '/default.png', 34, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:39:40', '2022-09-12 04:39:40'),
(220, 'Belts', 'belts', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:42:18', '2022-09-12 04:42:18'),
(221, 'Belts', 'belts', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:42:48', '2022-09-12 04:42:48'),
(222, 'Scarves', 'scarves', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:44:14', '2022-09-12 04:44:14'),
(223, 'Hats', 'hats', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:44:41', '2022-09-12 04:44:41'),
(224, 'Hats', 'hats', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:45:11', '2022-09-12 04:45:11'),
(225, 'Caps', 'caps', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:45:52', '2022-09-12 04:45:52'),
(226, 'Onesies & Bodysuits', 'onesies-bodysuits', '/default.png', 33, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:51:23', '2022-09-12 04:51:23'),
(227, 'Sleepwear', 'sleepwear', '/default.png', 33, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:52:28', '2022-09-12 04:52:28'),
(228, 'Outfits & Sets', 'outfits-sets', '/default.png', 33, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:53:42', '2022-09-12 04:53:42'),
(229, 'Accessories', 'accessories', '/default.png', 33, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:54:23', '2022-09-12 04:54:23'),
(230, 'Bibs & Burp Cloths', 'bibs-burp-cloths', '/default.png', 33, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:55:08', '2022-09-12 04:55:08'),
(231, 'Socks', 'socks', '/default.png', 33, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:56:16', '2022-09-12 04:56:16'),
(232, 'Underwear', 'underwear', '/default.png', 12, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:59:01', '2022-09-12 04:59:01'),
(233, 'Underwear', 'underwear', '/default.png', 31, 2, 'others', '', '0.00', '0.00', '2022-09-12 04:59:38', '2022-09-12 04:59:38'),
(234, 'Underwear', 'underwear', '/default.png', 10, 2, 'others', '', '0.00', '0.00', '2022-09-12 05:03:23', '2022-09-12 05:03:23'),
(235, 'Hats', 'hats', '/default.png', 43, 2, 'others', '', '0.00', '0.00', '2022-09-12 05:23:11', '2022-09-12 05:23:11'),
(236, 'Caps', 'caps', '/default.png', 43, 2, 'others', '', '0.00', '0.00', '2022-09-12 05:23:49', '2022-09-12 05:23:49'),
(237, 'Wallets', 'wallets', '/default.png', 43, 2, 'others', '', '0.00', '0.00', '2022-09-12 13:09:56', '2022-09-12 13:09:56'),
(238, 'Printing Paper', 'printing-paper', '/storage/app/public/category/c43ce5b07c31af6dfc07028af28da5bd6fe4d538.jpg', 22, 1, 'others', '', '0.00', '0.00', '2022-09-28 22:14:22', '2022-09-28 22:14:22'),
(239, 'Furniture, Arts, & Décor', 'furniture-decor', '/storage/app/public/category/1c3ccc70b7a5e79e0459b4f89500883f339e308a.jpg', 0, 0, 'others', 'combined_fee', '0.69', '14.00', '2022-10-13 03:03:36', '2022-10-13 15:45:10'),
(240, 'Furniture & Décor', 'furniture-decor', '/storage/app/public/category/e3c56eddfa107fe38b9ebe19da7fa7db6a84cdd6.jpg', 239, 1, 'others', '', '0.00', '0.00', '2022-10-13 03:06:01', '2022-10-13 15:54:33'),
(241, 'Mattresses', 'mattresses', '/storage/app/public/category/c85798edc82abf1b96232537206ab798674adc5e.jpg', 239, 1, 'others', '', '0.00', '0.00', '2022-10-13 03:06:54', '2022-10-13 03:27:43'),
(242, 'Grocery & Food Produce', 'grocery-food-produce', '/storage/app/public/category/941b2c5a53a348759bd90742d49fdaa643514dbe.jpg', 0, 0, 'others', 'percentage', '0.00', '1.84', '2022-10-13 03:45:02', '2022-10-13 03:45:02'),
(243, 'Food Produce', 'food-produce', '/storage/app/public/category/64f4cfb582c8c1328c188f4e2f9540b1dc3df407.jpg', 242, 1, 'others', '', '0.00', '0.00', '2022-10-13 03:48:17', '2022-10-13 03:48:17'),
(244, 'Grocery & Gourmet', 'grocery-gourmet', '/storage/app/public/category/8a5ce528001f982505f38664a47384379f091c5d.jpg', 242, 1, 'others', '', '0.00', '0.00', '2022-10-13 04:11:18', '2022-10-13 12:53:26'),
(245, 'Luggage & Accessories', 'luggage-travel-accessories', '/storage/app/public/category/dcbb2ed2cb64767ab9e9b128c281d9b7b4b76ecf.jpg', 0, 0, 'others', 'combined_fee', '0.69', '14.00', '2022-10-13 04:27:16', '2022-10-13 04:29:47'),
(246, 'Luggage', 'luggage', '/storage/app/public/category/024244322120fa675c509ded7952c561262316ee.jpg', 245, 1, 'others', '', '0.00', '0.00', '2022-10-13 04:28:09', '2022-10-13 04:28:09'),
(247, 'Travel Accessories', 'travel-accessories', '/storage/app/public/category/6135a8c1dfb138b4be76be274596e74a6669ebf4.jpg', 245, 1, 'others', '', '0.00', '0.00', '2022-10-13 04:42:41', '2022-10-13 04:42:41'),
(248, 'Handbags & Sunglasses', 'handbags-watches-sunglasses', '/storage/app/public/category/f28821764cf3f92603c132a172ca40ef94f36a27.jpg', 0, 0, 'others', 'combined_fee', '0.69', '1.42', '2022-10-13 05:14:58', '2022-10-13 12:49:45'),
(249, 'Bags & Watches', 'bags-watches', '/storage/app/public/category/2cc6bcd63b6820a6b62df9e75f0aef5bda25ddb8.jpg', 248, 1, 'others', '', '0.00', '0.00', '2022-10-13 05:17:40', '2022-10-13 12:44:04'),
(250, 'Sunglasses', 'sunglasses', '/storage/app/public/category/a0dd14cec27f16464460aa9b8d3e54c74aae3fcb.jpg', 248, 1, 'others', '', '0.00', '0.00', '2022-10-13 05:25:39', '2022-10-13 12:46:42'),
(251, 'Handbags', 'handbags', '/default.png', 249, 2, 'others', '', '0.00', '0.00', '2022-10-13 13:49:26', '2022-10-13 13:49:26'),
(252, 'Purses', 'purses', '/default.png', 249, 2, 'others', '', '0.00', '0.00', '2022-10-13 13:50:17', '2022-10-13 13:50:17'),
(253, 'Watches', 'watches', '/default.png', 249, 2, 'others', '', '0.00', '0.00', '2022-10-13 13:51:21', '2022-10-13 13:51:21'),
(254, 'Sunglasses', 'sunglasses', '/default.png', 250, 2, 'others', '', '0.00', '0.00', '2022-10-13 13:53:34', '2022-10-13 13:53:34'),
(255, 'Fine Arts', 'fine-arts', '/default.png', 240, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:01:12', '2022-10-13 16:01:12'),
(256, 'Hand-Made Decorative', 'hand-made-decorative', '/default.png', 240, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:04:49', '2022-10-13 16:04:49'),
(257, 'Curtains & Blinds', 'curtains-blinds', '/default.png', 240, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:05:40', '2022-10-13 16:05:40'),
(258, 'Sofas & Couches', 'sofas-couches', '/default.png', 240, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:09:46', '2022-10-13 16:09:46'),
(259, 'Rice', 'rice', '/default.png', 244, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:12:32', '2022-10-13 16:12:32'),
(260, 'Beans', 'beans', '/default.png', 244, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:12:58', '2022-10-13 16:12:58'),
(261, 'Condiments', 'condiments', '/default.png', 244, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:15:35', '2022-10-13 16:15:35'),
(262, 'Non-Alcoholic Beverages', 'non-alcoholic-beverages', '/default.png', 244, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:18:25', '2022-10-13 16:18:25'),
(263, 'Bed & Accessories', 'bed-accessories', '/default.png', 241, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:24:29', '2022-10-13 16:24:29'),
(264, 'Mattresses', 'mattresses', '/default.png', 241, 2, 'others', '', '0.00', '0.00', '2022-10-13 16:25:38', '2022-10-13 16:25:38'),
(265, 'Home Appliances', 'home-appliances', '/storage/app/public/category/1db495c9b9a6ed23dac20d0efdf0da91bb47b744.jpg', 39, 1, 'others', '', '0.00', '0.00', '2022-10-15 04:58:53', '2022-10-15 05:40:04'),
(266, 'ThinkCentre', 'thinkcentre', '/default.png', 6, 2, 'others', '', '0.00', '0.00', '2022-11-02 19:38:03', '2022-11-02 19:38:03'),
(267, 'Chromebook', 'chromebook', '/default.png', 7, 2, 'others', '', '0.00', '0.00', '2022-11-02 19:39:41', '2022-11-02 19:39:41'),
(268, 'ThinkPad', 'thinkpad', '/default.png', 7, 2, 'others', '', '0.00', '0.00', '2022-11-02 19:41:10', '2022-11-02 19:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT '0',
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT '0',
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT '1',
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chattings`
--

INSERT INTO `chattings` (`id`, `user_id`, `seller_id`, `message`, `sent_by_customer`, `sent_by_seller`, `seen_by_customer`, `seen_by_seller`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 1, 1, 'test information', 1, 0, 0, 1, 1, '2022-08-29 06:38:51', '2022-08-29 06:38:51', 1),
(2, 1, 1, 'Hey Omega store', 1, 0, 0, 1, 1, '2022-08-29 05:40:09', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(148, 'BlueGreen', '#2d667e', '2022-09-04 23:46:55', '2022-09-04 23:46:55'),
(149, 'CosmeticPeach', '#ffc3b1', '2022-09-05 22:14:32', '2022-09-05 22:14:32'),
(150, 'DustyPeach', '#bc5c58', '2022-09-05 22:16:24', '2022-09-05 22:16:24'),
(151, 'NipponPeach', '#f99273', '2022-09-05 22:19:59', '2022-09-05 22:19:59'),
(152, 'Peach', '#ffe5b4', '2022-09-05 22:23:38', '2022-09-05 22:23:38'),
(153, 'TemsilPeach', '#ffcba4', '2022-09-05 22:25:59', '2022-09-05 22:25:59'),
(154, 'Burgundy', '#800020', '2022-09-05 22:29:46', '2022-09-05 22:29:46'),
(155, 'Mauve', '#eeb5b5', '2022-09-05 22:34:10', '2022-09-05 22:34:10'),
(156, 'RosePink', '#ff66cc', '2022-09-06 03:54:17', '2022-09-06 03:54:17'),
(157, 'OrangeYellow', '#f5bd1f', '2022-09-06 03:59:53', '2022-09-06 03:59:53'),
(159, 'Champagne', '#f7e7ce', '2022-09-07 03:31:07', '2022-09-07 03:31:07'),
(160, 'Denim Blue', '#6f8faf', '2022-09-28 03:35:00', '2022-09-28 03:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `feedback` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `shop_id`, `created_at`, `updated_at`) VALUES
(1, 'discount_on_purchase', 'Thanksgiving', 'CMhMQeTYY1', '2022-11-01', '2022-11-30', '50.00', '2.00', '2.00', 'percentage', 1, 4, '2022-10-26 01:53:23', '2022-10-26 01:53:23'),
(4, 'discount_on_purchase', 'Laptop', 'AKIQ8YdFiy', '2022-11-02', '2022-11-02', '16.00', '20.00', '50.00', 'amount', 0, 3, '2022-10-31 09:02:43', '2022-11-03 10:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `crud_events`
--

CREATE TABLE `crud_events` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `start` date DEFAULT NULL COMMENT 'Order Placement Date',
  `end` date DEFAULT NULL COMMENT 'Expected Delivery Date',
  `allDay` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crud_events`
--

INSERT INTO `crud_events` (`id`, `title`, `label`, `url`, `seller_id`, `customer_id`, `start`, `end`, `allDay`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test', 'Test', 'https://google.com', 1, 1, '2022-09-04', '2022-09-04', 1, '2022-09-30 16:31:07', '2022-09-30 16:31:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 1, NULL, '2022-08-26 16:27:09'),
(2, 'BDT', '৳', 'BDT', '101.59', 1, NULL, '2022-10-12 01:26:36'),
(3, 'Indian Rupi', '₹', 'Rupi', '82.29', 1, '2020-10-15 17:23:04', '2022-10-12 01:27:37'),
(4, 'Naira', '₦', 'NGN', '434.28', 1, '2022-05-24 09:40:04', '2022-10-12 01:19:51'),
(5, 'Euro', '€', 'EUR', '1.030', 1, '2022-08-06 17:55:00', '2022-10-12 01:23:13'),
(6, 'Pound', '£', 'GBP', '0.911', 1, '2022-08-06 17:58:51', '2022-10-12 01:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `royality_points` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `transaction_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_notifications`
--

CREATE TABLE `d_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint UNSIGNED NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `background_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `deal_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint UNSIGNED NOT NULL,
  `flash_deal_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ranking` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_topics`
--

INSERT INTO `help_topics` (`id`, `question`, `answer`, `ranking`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Why do I get the \"unauthenticated,” when I click on a link on the page or a menu on the platform?', '<p><span style=\"font-size: 11.0pt; line-height: 107%; font-family: \'Calibri\',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;\">It means you must be signed up first and then login to your account before you can be granted access to the page where the information you are looking for can be accessed.</span></p>', 0, 1, '2022-08-10 12:58:09', '2022-08-10 13:18:21'),
(7, 'When can a seller withdraw from their commission?', '<p><span style=\"font-size: 11.0pt; line-height: 107%; font-family: \'Calibri\',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;\">The seller&rsquo;s commission is automatic when the seller&rsquo;s account is properly set up and the seller is verified as the original owner of the named business or entity associated with the vendor account on scudin.com. When the vendor account is not properly set up with the vendors payment information, withdrawal won&rsquo;t be automatic. Hence, the seller can only withdraw 50% of their commission after the customer&rsquo;s purchase order is delivered to the customer. The other 50% is remitted to the seller after the Return Policy period is expired. At this point, the customer purchase order is deemed to be complete, and the seller can then get the full commission for those sales. You can find this information on our Return Policy page. This hold is necessary because it reduces abuse of sales and it helps Scudin.com to manage customer&rsquo;s refunds order in a more efficient and timely manner, which leaves our customers highly satisfied in scudin.com customer service.</span></p>', 1, 1, '2022-08-10 12:59:26', '2022-08-10 12:59:26'),
(8, 'Is there any refund for Ethos Account Subscription?', '<p class=\"MsoNormal\">No, there is no refund policy for Ethos Account Subscription after purchase. That is to say that Ethos Account is a non-refundable purchase. But the user of the Account has the express right to cancel the subscription at any time if the user thinks he or she can no longer make use of the service.</p>', 1, 1, '2022-08-10 13:00:48', '2022-08-10 13:00:48'),
(9, 'Who can purchase items on Scudin.com Marketplace?', '<p class=\"MsoNormal\">Anybody can buy products on Scudin.com Marketplace. To make it easier for the customer and for the customer to have best shopping experience with faster fulfilment rate, a customer can choose to buy items from a vendor who sells products on Scudin.com Marketplace within the customer&rsquo;s specified region. This way the customer can receive their order faster.</p>', 1, 1, '2022-08-10 13:01:49', '2022-08-10 13:01:49'),
(10, 'Is a seller required to specify their own Return Policy period on the product list page?', '<p class=\"MsoNormal\">Yes, the seller is obligated to let the customer know when they can return any item they purchase with a full refund. The seller is required to state the item&rsquo;s Return Policy period on the description page, where the item is listed so that the customer can see it and be aware of the period they can make any return if necessary for such purchase. You can access the information about Scudin.com return policy on our Terms &amp; Condition page.</p>', 1, 1, '2022-08-10 13:03:26', '2022-08-10 13:03:26'),
(11, 'When can I cancel my vendor/seller subscription on Scudin.com Marketplace?', '<p class=\"MsoNormal\">You can cancel your seller&rsquo;s subscription anytime you decide not to sell your products on Scudin.com Marketplace. You can\'t get a refund for your subscription when you cancel within a free trial period (you can start with the Basic Plan and use it for the trial period and upgrade later). After this period, no refund will be issued.</p>', 0, 1, '2022-08-10 13:04:38', '2022-08-21 13:22:43'),
(12, 'What is the Return Policy period?', '<p class=\"MsoNormal\">Scudin.com Return Policy period is within two weeks to 30 days from the delivery date for customer purchase order, depending on the category of item(s) the customer purchased. A seller can choose their own Return Policy period based on their business needs. Refer to Scudin.com Return Policy page here: Terms &amp; Conditions for more information.</p>', 0, 1, '2022-08-10 13:11:47', '2022-08-10 14:06:39'),
(13, 'Can a seller choose their own carrier for fulfilment purposes?', '<p class=\"MsoNormal\">Yes, a seller can only choose from Scudin.com selected third party fulfilment centers located within the seller&rsquo;s shipping zone or region to fulfil customer&rsquo;s order.</p>', 1, 1, '2022-08-10 13:19:41', '2022-08-10 13:19:41'),
(14, 'What does Ethos Account cover?', '<p class=\"MsoNormal\">Ethos Account covers part of seller&rsquo;s fulfilment obligation. When a seller subscribes for Ethos Account, Scudin.com will take responsibility of fulfilling the customer&rsquo;s orders from the seller, for items weighing &lt;1lb up to 20lb (&lt;1kg to 9.072kg) on standard shipment rate. There is additional shipment fees for items weighing more than 20lb or 9.072kg, and when overnight shipment is required or used to fulfil customer&rsquo;s order. Find more information about Fulfilment by Scudin.com.</p>', 1, 1, '2022-08-10 13:21:24', '2022-08-10 13:21:24'),
(15, 'Who handles seller’s fulfilment order when they list and sell their products on Scudin.com?', '<p><span style=\"font-size: 11.0pt; line-height: 107%; font-family: \'Calibri\',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;\">A seller who does not have Ethos Account will handle all customer shipping and return orders. That is, the seller will be responsible for fulfilling all customer&rsquo;s order. To get full fulfilment coverage from Scudin.com, you will need our Ethos Premium account during the vendor&rsquo;s sign up and onboarding. </span></p>', 1, 1, '2022-08-10 13:22:57', '2022-08-10 13:22:57'),
(16, 'Do I need an approval to sell on Scudin.com Marketplace?', '<p class=\"MsoNormal\">Yes, in certain scenario an approval may be required to sell within the listed categories, to protect the customer shopping experience and to allow the customers shop with ease of mind and confidence on Scudin.com Marketplace.</p>', 1, 1, '2022-08-10 13:26:36', '2022-08-10 13:26:36'),
(18, 'Why is the product I am selling not found within any of the categories on Scudin.com Marketplace?', '<p class=\"MsoNormal\">In this case, you can list your product on the &ldquo;Uncategorized Items&rdquo; category. This is available to sellers for products that do not clearly fit within the existing categories. Note: Do not place items in the Uncategorized Items category that can appropriately fit under one of the listed categories.</p>', 0, 1, '2022-08-10 13:48:19', '2022-09-08 05:27:20'),
(19, 'What is the seller’s commission for selling on Scudin.com Marketplace?', '<p><span style=\"font-size: 11.0pt; line-height: 107%; font-family: \'Calibri\',sans-serif; mso-ascii-theme-font: minor-latin; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;\">The commission you get as a seller depends on the category of products you are selling. Each product you sell on Scudin.com Marketplace falls within a certain category with the corresponding referral fee affix to them. You can access the information about the fees and pricing (Referral Fee Schedule when you become a vendor) on your seller dashboard.</span></p>', 0, 1, '2022-08-10 13:49:34', '2022-09-08 05:10:29'),
(20, 'What is the price of selling on Scudin.com Marketplace?', '<p class=\"MsoNormal\">We have two basic plans you can choose from if you decide to sell on Scudin.com Marketplace. One is the individual (basic) plan, and the other is a professional (business) plan. We also have Ethos Premium plan which comes with a lot of benefits to it, including fulfilment that is handled by Scudin.com. To access the information on both plans, visit the Sell on Scudin page to get started. For the additional selling fees, you will need to login to your seller dashboard to view the breakdown of each item category referral fees we charge on each sales.</p>', 0, 1, '2022-08-10 13:53:27', '2022-09-08 05:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE `menu_links` (
  `id` int NOT NULL,
  `menu_link` varchar(500) NOT NULL,
  `menu_title` varchar(500) NOT NULL,
  `menu_column` varchar(500) DEFAULT NULL,
  `menu_type` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('3d603d0e-f428-46a5-912a-4003fe35fafe', 'App\\Notifications\\NewOrder', 'App\\User', 1, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-28 20:15:25', '2022-08-28 20:15:25'),
('621abcc6-8fbc-4ef3-bbba-87d1ea458714', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 5, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-05 20:23:09', '2022-08-05 20:23:09'),
('7e4e480a-5917-4b31-9b11-58090141c581', 'App\\Notifications\\NewOrder', 'App\\User', 1, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-28 20:14:45', '2022-08-28 20:14:45'),
('9054aff3-a23c-4696-bb61-f2816273fe22', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 1, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-05 18:11:35', '2022-08-05 18:11:35'),
('9d30b26c-90df-45e4-ac56-fe8fc0381d09', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 8, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-10 13:35:48', '2022-08-10 13:35:48'),
('b12278c3-733a-4ce2-860f-ca918193f804', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 4, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-13 17:05:46', '2022-08-13 17:05:46'),
('b6d4b6d3-2e0a-4851-a4ec-0af253243a87', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 2, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-10 17:01:08', '2022-08-10 17:01:08'),
('bff11190-92dc-4caa-8e24-a2f9bea22081', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 3, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-05-20 12:36:23', '2022-05-20 12:36:23'),
('c36a6ec1-8206-4405-b7f5-257706c39769', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 3, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-10 18:25:45', '2022-08-10 18:25:45'),
('d22fd18d-090b-485c-ada4-cee92624b423', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 2, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-05 18:18:13', '2022-08-05 18:18:13'),
('d8e63bd3-beaf-48c5-9c4a-81e6646eb329', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 6, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-08-30 01:52:27', '2022-08-30 01:52:27'),
('fef394be-9cc2-4b1c-86ca-0f47a78b8f5d', 'App\\Notifications\\SellerApproved', 'App\\Model\\Seller', 7, '{\"title\":\"You have a New Order\",\"description\":\"To have a new order from User 99\"}', NULL, '2022-07-27 17:25:24', '2022-07-27 17:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23'),
(2, 2, '2021-05-24 18:37:14', '2021-05-24 18:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ref` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_response` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `discount_amount`, `discount_type`, `payment_response`, `created_at`, `updated_at`) VALUES
(100001, '1', 'customer', 'paid', 'delivered', 'Stripe', 'rw5Juy-861', '5196.00', '1', '0.00', '', NULL, '2022-08-28 11:57:27', '2022-08-28 18:19:12'),
(100002, '1', 'customer', 'paid', 'processing', 'Stripe', 'DeB7Gs-433', '5248.50', '1', '0.00', '', NULL, '2022-08-28 19:33:51', '2022-08-28 19:33:51'),
(100003, '1', 'customer', 'paid', 'confirmed', 'paypal', NULL, '52.50', '1', '0.00', '', NULL, '2022-08-28 19:48:34', '2022-08-28 19:48:34'),
(100004, '1', 'customer', 'paid', 'confirmed', 'paypal', NULL, '52.50', '1', '0.00', '', NULL, '2022-08-28 19:50:52', '2022-08-28 19:50:52'),
(100005, '1', 'customer', 'paid', 'confirmed', 'paypal', NULL, '52.50', '1', '0.00', '', NULL, '2022-08-28 19:52:26', '2022-08-28 19:52:26'),
(100006, '1', 'customer', 'paid', 'confirmed', 'paypal', NULL, '52.50', '1', '0.00', '', NULL, '2022-08-28 19:56:11', '2022-08-28 19:56:11'),
(100007, '1', 'customer', 'paid', 'confirmed', 'paypal', NULL, '5196.00', '1', '0.00', '', NULL, '2022-08-28 20:01:04', '2022-08-28 20:01:04'),
(100008, '1', 'customer', 'paid', 'confirmed', 'paypal', NULL, '5196.00', '1', '0.00', '', NULL, '2022-08-28 20:35:19', '2022-08-28 20:35:19'),
(100009, '1', 'customer', 'paid', 'processing', 'Stripe', 'lk0bVj-592', '5196.00', '1', '0.00', '', NULL, '2022-08-28 20:50:17', '2022-08-28 20:50:17'),
(100010, '1', 'customer', 'paid', 'processing', 'Stripe', 'iQnmPZ-164', '142.00', '1', '0.00', '', NULL, '2022-09-06 07:57:36', '2022-09-06 07:57:36'),
(100011, '10', 'customer', 'unpaid', 'pending', 'Stripe', 'OZW0mP-569', '58.39', '2', '0.00', '', NULL, '2022-10-22 13:08:23', '2022-10-22 13:08:23'),
(100012, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'tYie0H-443', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:22:01', '2023-02-14 15:22:01'),
(100013, '1', 'customer', 'unpaid', 'pending', 'Stripe', '7eVOqz-365', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:22:14', '2023-02-14 15:22:14'),
(100014, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'GF5lST-212', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:23:10', '2023-02-14 15:23:10'),
(100015, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'iVLt3p-83', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:47:44', '2023-02-14 15:47:44'),
(100016, '1', 'customer', 'unpaid', 'pending', 'Stripe', '4bcRgx-256', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:48:17', '2023-02-14 15:48:17'),
(100017, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'vo1kw4-166', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:48:52', '2023-02-14 15:48:52'),
(100018, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'EntJfi-650', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:49:22', '2023-02-14 15:49:22'),
(100019, '1', 'customer', 'unpaid', 'pending', 'Stripe', '7ixRgo-615', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:49:57', '2023-02-14 15:49:57'),
(100020, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'a2HAT5-706', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:51:11', '2023-02-14 15:51:11'),
(100021, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'EwWKQv-23', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:52:47', '2023-02-14 15:52:47'),
(100022, '1', 'customer', 'unpaid', 'pending', 'Stripe', '34xKms-333', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:52:57', '2023-02-14 15:52:57'),
(100023, '1', 'customer', 'unpaid', 'pending', 'Stripe', '1wnhJa-627', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:53:13', '2023-02-14 15:53:13'),
(100024, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'wBq2TH-501', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:53:53', '2023-02-14 15:53:53'),
(100025, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'ioLHyZ-501', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:54:23', '2023-02-14 15:54:23'),
(100026, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'shkCmo-112', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:54:39', '2023-02-14 15:54:39'),
(100027, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'mvpSGM-12', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:54:53', '2023-02-14 15:54:53'),
(100028, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'xAKHBL-377', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:55:20', '2023-02-14 15:55:20'),
(100029, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'CWuQ1p-45', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:55:53', '2023-02-14 15:55:53'),
(100030, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'kNpwgW-364', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:56:06', '2023-02-14 15:56:06'),
(100031, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'grQk8F-94', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:56:16', '2023-02-14 15:56:16'),
(100032, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'm0bg0e-434', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:57:26', '2023-02-14 15:57:26'),
(100033, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'ILPudJ-284', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:57:35', '2023-02-14 15:57:35'),
(100034, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'UL1Ekc-807', '5355.00', '1', '0.00', '', NULL, '2023-02-14 15:58:16', '2023-02-14 15:58:16'),
(100035, '1', 'customer', 'paid', 'processing', 'Stripe', 'iweopM-243', '5355.00', '1', '0.00', '', '{\"id\": \"pi_3MbS6U2eZvKYlo2C1gxaGz5o\", \"amount\": 535500, \"object\": \"payment_intent\", \"review\": null, \"source\": null, \"status\": \"succeeded\", \"charges\": {\"url\": \"/v1/charges?payment_intent=pi_3MbS6U2eZvKYlo2C1gxaGz5o\", \"data\": [{\"id\": \"ch_3MbS6U2eZvKYlo2C1tB0keLE\", \"paid\": true, \"order\": null, \"amount\": 535500, \"object\": \"charge\", \"review\": null, \"source\": null, \"status\": \"succeeded\", \"created\": 1676394962, \"dispute\": null, \"invoice\": null, \"outcome\": {\"type\": \"authorized\", \"reason\": null, \"risk_level\": \"normal\", \"risk_score\": 63, \"network_status\": \"approved_by_network\", \"seller_message\": \"Payment complete.\"}, \"refunds\": {\"url\": \"/v1/charges/ch_3MbS6U2eZvKYlo2C1tB0keLE/refunds\", \"data\": [], \"object\": \"list\", \"has_more\": false, \"total_count\": 0}, \"captured\": true, \"currency\": \"usd\", \"customer\": null, \"disputed\": false, \"livemode\": false, \"metadata\": {\"order_id\": \"100035\", \"pay_type\": \"order\"}, \"refunded\": false, \"shipping\": null, \"application\": null, \"description\": null, \"destination\": null, \"receipt_url\": \"https://pay.stripe.com/receipts/payment/CAcaFwoVYWNjdF8xMDMyRDgyZVp2S1lsbzJDKJLEsJ8GMgZbvOEIjNw6LBbGLpsa8wYat35cyc1FVUDR6NL1UirE6yyadceNZGiXLYQxjDrsDREzMSvm\", \"failure_code\": null, \"on_behalf_of\": null, \"fraud_details\": [], \"receipt_email\": null, \"transfer_data\": null, \"payment_intent\": \"pi_3MbS6U2eZvKYlo2C1gxaGz5o\", \"payment_method\": \"pm_1MbS6n2eZvKYlo2CkUGZQZYe\", \"receipt_number\": null, \"transfer_group\": null, \"amount_captured\": 535500, \"amount_refunded\": 0, \"application_fee\": null, \"billing_details\": {\"name\": null, \"email\": null, \"phone\": null, \"address\": {\"city\": null, \"line1\": null, \"line2\": null, \"state\": null, \"country\": \"NG\", \"postal_code\": null}}, \"failure_message\": null, \"source_transfer\": null, \"balance_transaction\": \"txn_3MbS6U2eZvKYlo2C1laQAw54\", \"statement_descriptor\": null, \"application_fee_amount\": null, \"payment_method_details\": {\"card\": {\"moto\": null, \"brand\": \"visa\", \"last4\": \"4242\", \"checks\": {\"cvc_check\": \"pass\", \"address_line1_check\": null, \"address_postal_code_check\": null}, \"wallet\": null, \"country\": \"US\", \"funding\": \"credit\", \"mandate\": null, \"network\": \"visa\", \"exp_year\": 2029, \"exp_month\": 9, \"fingerprint\": \"Xt5EWLLDS7FJjR1c\", \"installments\": null, \"three_d_secure\": null}, \"type\": \"card\"}, \"failure_balance_transaction\": null, \"statement_descriptor_suffix\": null, \"calculated_statement_descriptor\": \"Stripe\"}], \"object\": \"list\", \"has_more\": false, \"total_count\": 1}, \"created\": 1676394942, \"invoice\": null, \"currency\": \"usd\", \"customer\": null, \"livemode\": false, \"metadata\": {\"order_id\": \"100035\", \"pay_type\": \"order\"}, \"shipping\": null, \"processing\": null, \"application\": null, \"canceled_at\": null, \"description\": null, \"next_action\": null, \"on_behalf_of\": null, \"client_secret\": \"pi_3MbS6U2eZvKYlo2C1gxaGz5o_secret_cBkZLvgETY9XqZHWFAEwcbsg8\", \"latest_charge\": \"ch_3MbS6U2eZvKYlo2C1tB0keLE\", \"receipt_email\": null, \"transfer_data\": null, \"amount_details\": {\"tip\": []}, \"capture_method\": \"automatic\", \"payment_method\": \"pm_1MbS6n2eZvKYlo2CkUGZQZYe\", \"transfer_group\": null, \"amount_received\": 535500, \"amount_capturable\": 0, \"last_payment_error\": null, \"setup_future_usage\": null, \"cancellation_reason\": null, \"confirmation_method\": \"automatic\", \"payment_method_types\": [\"card\"], \"statement_descriptor\": null, \"application_fee_amount\": null, \"payment_method_options\": {\"card\": {\"network\": null, \"installments\": null, \"mandate_options\": null, \"request_three_d_secure\": \"automatic\"}}, \"automatic_payment_methods\": null, \"statement_descriptor_suffix\": null}', '2023-02-14 15:59:31', '2023-02-14 23:06:43'),
(100036, '1', 'customer', 'unpaid', 'pending', 'Stripe', 'U67Fz6-581', '357.00', '1', '0.00', '', NULL, '2023-02-14 22:03:15', '2023-02-14 22:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  `product_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` int NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `delivery_status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `shipping_method_id` bigint DEFAULT NULL,
  `variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `created_at`, `updated_at`) VALUES
(1, 100001, 9, 0, '{\"id\":9,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Jones Wears Marshmello Printed Hoodie Black\",\"slug\":\"jones-wears-marshmello-printed-hoodie-black-gTXCwd\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":2}]\",\"charge_cat\":\"9\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1659962672_35597114.jpg\\\",\\\"1659962672_9227852.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1659965057_57231928.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"            M\\\",\\\"            L\\\",\\\"            XL\\\",\\\"            XXL\\\",\\\"            XXXL\\\",\\\"            XXXXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-S\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-M\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-L\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXXL\\\",\\\"qty\\\":\\\"1\\\"}]\",\"published\":0,\"unit_price\":4800,\"purchase_price\":4800,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"Our Hoodies are made for extreme Comfort, fitted with pristine precision and finely crafted with the highest quality fabric. With these Hoodies, you do not only feel the difference in fitting and comfort but also have access to a wide range of style purposes. These Hoodies can be worn for different days in a plethora of ways. Joneswears now has a history of creating functional yet stylish street-wear, covering everything from retro styles to forward-thinking pieces.Joneswears is a fast growing urbane clothier makes the best wardrobe for that awesome transition from corporate wears.With our fun and talking Tees, you do more than just look good, you make a statement.\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-08T13:44:32.000000Z\",\"updated_at\":\"2022-08-08T14:39:45.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"length\":\"0.00\",\"product_type\":0,\"download_url\":null}', 1, '4800.00', '396.00', '0.00', 'delivered', 'unpaid', 6, 'Black-L', '{\"color\":\"Black\",\"Size\":\"L\"}', 'discount_on_product', 1, '2022-08-28 11:57:27', '2022-08-28 18:10:58'),
(2, 100002, 9, 0, '{\"id\":9,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Jones Wears Marshmello Printed Hoodie Black\",\"slug\":\"jones-wears-marshmello-printed-hoodie-black-gTXCwd\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":2}]\",\"charge_cat\":\"9\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1659962672_35597114.jpg\\\",\\\"1659962672_9227852.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1659965057_57231928.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"            M\\\",\\\"            L\\\",\\\"            XL\\\",\\\"            XXL\\\",\\\"            XXXL\\\",\\\"            XXXXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-S\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-M\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-L\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXXL\\\",\\\"qty\\\":\\\"1\\\"}]\",\"published\":0,\"unit_price\":4800,\"purchase_price\":4800,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"Our Hoodies are made for extreme Comfort, fitted with pristine precision and finely crafted with the highest quality fabric. With these Hoodies, you do not only feel the difference in fitting and comfort but also have access to a wide range of style purposes. These Hoodies can be worn for different days in a plethora of ways. Joneswears now has a history of creating functional yet stylish street-wear, covering everything from retro styles to forward-thinking pieces.Joneswears is a fast growing urbane clothier makes the best wardrobe for that awesome transition from corporate wears.With our fun and talking Tees, you do more than just look good, you make a statement.\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-08T13:44:32.000000Z\",\"updated_at\":\"2022-08-08T14:39:45.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"length\":\"0.00\",\"product_type\":1,\"download_url\":null}', 1, '4800.00', '396.00', '0.00', 'pending', 'unpaid', 7, 'Black-L', '{\"color\":\"Black\",\"Size\":\"L\"}', 'discount_on_product', 1, '2022-08-28 19:33:51', '2022-08-28 19:33:51'),
(3, 100002, 17, 1, '{\"id\":17,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Demo Product 23\",\"slug\":\"demo-product-23-Kn4P9D\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"charge_cat\":\"\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":33,\"refundable\":0,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":55,\"purchase_price\":59,\"tax\":5,\"tax_type\":null,\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":100,\"details\":\"hhhhh\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-28T19:25:08.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":1,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"1.00\",\"width\":\"1.00\",\"length\":\"1.00\",\"product_type\":0,\"download_url\":null}', 1, '55.00', '3.00', '5.50', 'processing', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2022-08-28 19:33:51', '2022-09-18 14:47:10'),
(4, 100003, 17, 1, '{\"id\":17,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Demo Product 23\",\"slug\":\"demo-product-23-Kn4P9D\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"charge_cat\":\"\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":33,\"refundable\":0,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":55,\"purchase_price\":59,\"tax\":5,\"tax_type\":null,\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":100,\"details\":\"hhhhh\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-28T19:25:08.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":1,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"1.00\",\"width\":\"1.00\",\"length\":\"1.00\",\"product_type\":0,\"download_url\":null}', 1, '55.00', '3.00', '5.50', 'pending', 'unpaid', 6, '', '[]', 'discount_on_product', 1, '2022-08-28 19:48:34', '2022-08-28 19:48:34'),
(5, 100004, 17, 1, '{\"id\":17,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Demo Product 23\",\"slug\":\"demo-product-23-Kn4P9D\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"charge_cat\":\"\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":33,\"refundable\":0,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":55,\"purchase_price\":59,\"tax\":5,\"tax_type\":null,\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":100,\"details\":\"hhhhh\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-28T19:25:08.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":1,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"1.00\",\"width\":\"1.00\",\"length\":\"1.00\",\"product_type\":0,\"download_url\":null}', 1, '55.00', '3.00', '5.50', 'pending', 'unpaid', 6, '', '[]', 'discount_on_product', 1, '2022-08-28 19:50:52', '2022-08-28 19:50:52'),
(6, 100005, 17, 1, '{\"id\":17,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Demo Product 23\",\"slug\":\"demo-product-23-Kn4P9D\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"charge_cat\":\"\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":33,\"refundable\":0,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":55,\"purchase_price\":59,\"tax\":5,\"tax_type\":null,\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":100,\"details\":\"hhhhh\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-28T19:25:08.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":1,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"1.00\",\"width\":\"1.00\",\"length\":\"1.00\",\"product_type\":0,\"download_url\":null}', 1, '55.00', '3.00', '5.50', 'pending', 'unpaid', 6, '', '[]', 'discount_on_product', 1, '2022-08-28 19:52:26', '2022-08-28 19:52:26'),
(7, 100006, 16, 1, '{\"id\":16,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Demo Product 22\",\"slug\":\"demo-product-22-9aOJUN\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"charge_cat\":\"\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":23,\"refundable\":0,\"images\":\"[\\\"def.png\\\"]\",\"thumbnail\":\"\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=2D-rr4gv3fk\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":55,\"purchase_price\":59,\"tax\":5,\"tax_type\":null,\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":100,\"details\":\"hhhhh\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-08-28T19:24:50.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":1,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"1.00\",\"width\":\"1.00\",\"length\":\"1.00\",\"product_type\":0,\"download_url\":null}', 1, '55.00', '3.00', '5.50', 'pending', 'unpaid', 8, '', '[]', 'discount_on_product', 1, '2022-08-28 19:56:11', '2022-08-28 19:56:11'),
(8, 100007, 9, 0, '{\"id\":9,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Jones Wears Marshmello Printed Hoodie Black\",\"slug\":\"jones-wears-marshmello-printed-hoodie-black-gTXCwd\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":2}]\",\"charge_cat\":\"9\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1659962672_35597114.jpg\\\",\\\"1659962672_9227852.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1659965057_57231928.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"            M\\\",\\\"            L\\\",\\\"            XL\\\",\\\"            XXL\\\",\\\"            XXXL\\\",\\\"            XXXXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-S\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-M\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-L\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXXL\\\",\\\"qty\\\":\\\"1\\\"}]\",\"published\":0,\"unit_price\":4800,\"purchase_price\":4800,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"Our Hoodies are made for extreme Comfort, fitted with pristine precision and finely crafted with the highest quality fabric. With these Hoodies, you do not only feel the difference in fitting and comfort but also have access to a wide range of style purposes. These Hoodies can be worn for different days in a plethora of ways. Joneswears now has a history of creating functional yet stylish street-wear, covering everything from retro styles to forward-thinking pieces.Joneswears is a fast growing urbane clothier makes the best wardrobe for that awesome transition from corporate wears.With our fun and talking Tees, you do more than just look good, you make a statement.\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-08T13:44:32.000000Z\",\"updated_at\":\"2022-08-08T14:39:45.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"length\":\"0.00\",\"product_type\":1,\"download_url\":null}', 1, '4800.00', '396.00', '0.00', 'pending', 'unpaid', 8, 'Black-XXL', '{\"color\":\"Black\",\"Size\":\"XXL\"}', 'discount_on_product', 1, '2022-08-28 20:01:04', '2022-08-28 20:01:04'),
(9, 100008, 9, 0, '{\"id\":9,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Jones Wears Marshmello Printed Hoodie Black\",\"slug\":\"jones-wears-marshmello-printed-hoodie-black-gTXCwd\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":2}]\",\"charge_cat\":\"9\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1659962672_35597114.jpg\\\",\\\"1659962672_9227852.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1659965057_57231928.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"            M\\\",\\\"            L\\\",\\\"            XL\\\",\\\"            XXL\\\",\\\"            XXXL\\\",\\\"            XXXXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-S\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-M\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-L\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXXL\\\",\\\"qty\\\":\\\"1\\\"}]\",\"published\":0,\"unit_price\":4800,\"purchase_price\":4800,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"Our Hoodies are made for extreme Comfort, fitted with pristine precision and finely crafted with the highest quality fabric. With these Hoodies, you do not only feel the difference in fitting and comfort but also have access to a wide range of style purposes. These Hoodies can be worn for different days in a plethora of ways. Joneswears now has a history of creating functional yet stylish street-wear, covering everything from retro styles to forward-thinking pieces.Joneswears is a fast growing urbane clothier makes the best wardrobe for that awesome transition from corporate wears.With our fun and talking Tees, you do more than just look good, you make a statement.\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-08T13:44:32.000000Z\",\"updated_at\":\"2022-08-08T14:39:45.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"length\":\"0.00\",\"product_type\":1,\"download_url\":null}', 1, '4800.00', '396.00', '0.00', 'pending', 'unpaid', 7, 'Black-XL', '{\"color\":\"Black\",\"Size\":\"XL\"}', 'discount_on_product', 1, '2022-08-28 20:35:19', '2022-08-28 20:35:19'),
(10, 100009, 9, 0, '{\"id\":9,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Jones Wears Marshmello Printed Hoodie Black\",\"slug\":\"jones-wears-marshmello-printed-hoodie-black-gTXCwd\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":2}]\",\"charge_cat\":\"9\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1659962672_35597114.jpg\\\",\\\"1659962672_9227852.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1659965057_57231928.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"            M\\\",\\\"            L\\\",\\\"            XL\\\",\\\"            XXL\\\",\\\"            XXXL\\\",\\\"            XXXXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-S\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-M\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-L\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXL\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-XXXXL\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"JWMPHB-Black-XXXXL\\\",\\\"qty\\\":\\\"1\\\"}]\",\"published\":0,\"unit_price\":4800,\"purchase_price\":4800,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"Our Hoodies are made for extreme Comfort, fitted with pristine precision and finely crafted with the highest quality fabric. With these Hoodies, you do not only feel the difference in fitting and comfort but also have access to a wide range of style purposes. These Hoodies can be worn for different days in a plethora of ways. Joneswears now has a history of creating functional yet stylish street-wear, covering everything from retro styles to forward-thinking pieces.Joneswears is a fast growing urbane clothier makes the best wardrobe for that awesome transition from corporate wears.With our fun and talking Tees, you do more than just look good, you make a statement.\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-08T13:44:32.000000Z\",\"updated_at\":\"2022-08-08T14:39:45.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"length\":\"0.00\",\"product_type\":1,\"download_url\":null}', 1, '4800.00', '396.00', '0.00', 'pending', 'unpaid', 5, 'Black-XL', '{\"color\":\"Black\",\"Size\":\"XL\"}', 'discount_on_product', 1, '2022-08-28 20:50:17', '2022-08-28 20:50:17'),
(11, 100010, 35, 0, '{\"id\":35,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Test Product By Emmanuel\",\"slug\":\"test-product-by-emmanuel-Yjo0KE\",\"category_ids\":\"[{\\\"id\\\":\\\"21\\\",\\\"position\\\":1},{\\\"id\\\":\\\"25\\\",\\\"position\\\":2}]\",\"charge_cat\":\"21\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1662450935_8118314.jpeg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1662450935_95457843.jpeg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#0000FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Black\\\",\\\"price\\\":150,\\\"sku\\\":\\\"Wear-Black-214TPBE-Black\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Blue\\\",\\\"price\\\":150,\\\"sku\\\":\\\"TPBE-Blue\\\",\\\"qty\\\":\\\"1\\\"}]\",\"published\":0,\"unit_price\":150,\"purchase_price\":135,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"flat\",\"current_stock\":2,\"details\":\"<p>Just a demo product for Samuel<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-06T07:55:35.000000Z\",\"updated_at\":\"2022-09-06T07:55:35.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":null,\"plan_id\":1,\"weight\":\"0.50\",\"height\":\"1.00\",\"width\":\"15.00\",\"length\":\"2.00\",\"product_type\":0,\"download_url\":null}', 1, '150.00', '12.00', '20.00', 'pending', 'unpaid', 1, 'Blue', '{\"color\":\"Blue\"}', 'discount_on_product', 1, '2022-09-06 07:57:36', '2022-09-06 07:57:36'),
(12, 100011, 30, 0, '{\"id\":30,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Long Sleeve Square Neck Mini Dress\",\"slug\":\"long-sleeve-square-neck-mini-dress-KTE8sf\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1},{\\\"id\\\":\\\"11\\\",\\\"position\\\":2},{\\\"id\\\":\\\"73\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"9\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1662150148_72457080.png\\\",\\\"1662150150_88475194.png\\\",\\\"1662334226_82189288.png\\\",\\\"1662334227_83868812.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1662150150_2052085.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#2d667e\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"          L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":54.39,\\\"sku\\\":\\\"LSSNMD-Black-M\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":54.39,\\\"sku\\\":\\\"LSSNMD-Black-L\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"BlueGreen-M\\\",\\\"price\\\":54.39,\\\"sku\\\":\\\"LSSNMD-BlueGreen-M\\\",\\\"qty\\\":\\\"1\\\"},{\\\"type\\\":\\\"BlueGreen-L\\\",\\\"price\\\":54.39,\\\"sku\\\":\\\"LSSNMD-BlueGreen-L\\\",\\\"qty\\\":\\\"1\\\"}]\",\"published\":0,\"unit_price\":54.39,\"purchase_price\":54.39,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":4,\"details\":\"<p>Gorgeous Long Sleeve Square Neck Mini Dress for women.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Black, Dark Green<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Women<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All seasons, party, and formal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-02T20:22:30.000000Z\",\"updated_at\":\"2022-09-26T15:42:36.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":null,\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"8.01\"}', 1, '54.39', '4.00', '0.00', 'pending', 'unpaid', 8, 'BlueGreen-M', '{\"color\":\"BlueGreen\",\"Size\":\"M\"}', 'discount_on_product', 1, '2022-10-22 13:08:23', '2022-10-22 13:08:23'),
(13, 100013, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:22:14', '2023-02-14 15:22:14'),
(14, 100014, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:23:10', '2023-02-14 15:23:10'),
(15, 100015, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:47:44', '2023-02-14 15:47:44'),
(16, 100016, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:48:17', '2023-02-14 15:48:17'),
(17, 100017, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:48:52', '2023-02-14 15:48:52'),
(18, 100018, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:49:22', '2023-02-14 15:49:22'),
(19, 100019, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:49:57', '2023-02-14 15:49:57'),
(20, 100020, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:51:11', '2023-02-14 15:51:11'),
(21, 100021, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:52:47', '2023-02-14 15:52:47'),
(22, 100022, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:52:57', '2023-02-14 15:52:57'),
(23, 100023, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:53:13', '2023-02-14 15:53:13');
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `created_at`, `updated_at`) VALUES
(24, 100024, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:53:53', '2023-02-14 15:53:53'),
(25, 100024, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:53:53', '2023-02-14 15:53:53'),
(26, 100025, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:54:23', '2023-02-14 15:54:23'),
(27, 100025, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:54:23', '2023-02-14 15:54:23'),
(28, 100026, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:54:39', '2023-02-14 15:54:39'),
(29, 100026, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:54:39', '2023-02-14 15:54:39'),
(30, 100027, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:54:53', '2023-02-14 15:54:53'),
(31, 100027, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:54:53', '2023-02-14 15:54:53'),
(32, 100028, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:55:20', '2023-02-14 15:55:20'),
(33, 100028, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:55:20', '2023-02-14 15:55:20'),
(34, 100029, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:55:53', '2023-02-14 15:55:53'),
(35, 100029, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:55:53', '2023-02-14 15:55:53'),
(36, 100030, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:56:06', '2023-02-14 15:56:06'),
(37, 100030, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:56:06', '2023-02-14 15:56:06'),
(38, 100031, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:56:16', '2023-02-14 15:56:16'),
(39, 100031, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:56:16', '2023-02-14 15:56:16'),
(40, 100032, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:57:26', '2023-02-14 15:57:26');
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `created_at`, `updated_at`) VALUES
(41, 100032, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:57:26', '2023-02-14 15:57:26'),
(42, 100033, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:57:35', '2023-02-14 15:57:35'),
(43, 100033, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:57:35', '2023-02-14 15:57:35'),
(44, 100034, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:58:16', '2023-02-14 15:58:16'),
(45, 100034, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:58:16', '2023-02-14 15:58:16'),
(46, 100035, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 15, '330.00', '405.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 15:59:31', '2023-02-14 15:59:31'),
(47, 100035, 54, 4, '{\"id\":54,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Embroidered Cartoon Stockings\",\"slug\":\"embroidered-cartoon-stockings-Ao3Moh\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"position\\\":1},{\\\"id\\\":\\\"31\\\",\\\"position\\\":2},{\\\"id\\\":\\\"205\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"30\",\"brand_id\":4,\"unit\":\"lbs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1663699439_66652536.png\\\",\\\"1663699439_48399120.png\\\",\\\"1663699440_54309455.png\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1663699440_20932308.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[\\\"#87CEFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"                  M\\\",\\\"                  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"LightSkyBlue-S\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-S\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-M\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-M\\\",\\\"qty\\\":\\\"3\\\"},{\\\"type\\\":\\\"LightSkyBlue-L\\\",\\\"price\\\":14.99,\\\"sku\\\":\\\"ECS-LightSkyBlue-L\\\",\\\"qty\\\":\\\"3\\\"}]\",\"published\":0,\"chart_image\":null,\"unit_price\":14.99,\"purchase_price\":14.99,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Colors: Blue<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Sex: Girls<\\/p>\\r\\n<p style=\\\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\\\"><!-- [if !supportLists]--><span style=\\\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-20T19:44:00.000000Z\",\"updated_at\":\"2022-10-31T13:55:52.000000Z\",\"status\":1,\"p_type\":\"others\",\"featured_status\":0,\"extra_data\":\"[]\",\"plan_id\":1,\"weight\":\"1.00\",\"height\":null,\"width\":null,\"length\":null,\"product_type\":0,\"download_url\":null,\"commission\":\"1.71\"}', 1, '14.99', '0.00', '0.00', 'pending', 'unpaid', 1, 'LightSkyBlue-S', '{\"color\":\"LightSkyBlue\",\"Size\":\"S\"}', 'discount_on_product', 1, '2023-02-14 15:59:31', '2023-02-14 15:59:31'),
(48, 100036, 65, 3, '{\"id\":65,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"Drone test\",\"slug\":\"drone-test-d7eO2I\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"268\\\",\\\"position\\\":3}]\",\"sub_category\":null,\"sub_sub_category\":null,\"charge_cat\":\"5\",\"brand_id\":9,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"1667664169_51571646.jpg\\\"]\",\"thumbnail\":\"\\/storage\\/app\\/public\\/product\\/1667664169_44621400.jpg\",\"featured\":null,\"flash_deal\":null,\"video_provider\":null,\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"chart_image\":\"https:\\/\\/i.pinimg.com\\/originals\\/87\\/50\\/08\\/8750080969c808cca5ff935c48569949.png\",\"unit_price\":330,\"purchase_price\":600,\"tax\":8.25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-05T17:02:49.000000Z\",\"updated_at\":\"2022-11-05T17:10:24.000000Z\",\"status\":1,\"p_type\":\"tech\",\"featured_status\":0,\"extra_data\":\"{\\\"memory\\\":\\\"2gb\\\",\\\"processor\\\":\\\"2.6gh\\\",\\\"ram\\\":\\\"4gb\\\",\\\"storage\\\":\\\"500\\\",\\\"processor_peed\\\":\\\"2.50ghz\\\",\\\"release_year\\\":\\\"2019\\\",\\\"operating_system\\\":\\\"10\\\",\\\"upc\\\":\\\"Qz\\\",\\\"screen_size\\\":\\\"30\\\",\\\"mpn\\\":\\\"Penia\\\",\\\"product_family\\\":\\\"Mac\\\",\\\"model\\\":\\\"Hp\\\",\\\"features\\\":\\\"Sound\\\",\\\"storage_type\\\":\\\"Ssd\\\"}\",\"plan_id\":1,\"weight\":\"5.00\",\"height\":null,\"width\":\"10.00\",\"length\":\"6.00\",\"product_type\":0,\"download_url\":null,\"commission\":\"85.60\"}', 1, '330.00', '27.00', '0.00', 'pending', 'unpaid', 1, '', '[]', 'discount_on_product', 1, '2023-02-14 22:03:15', '2023-02-14 22:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `pagebuilder__pages`
--

CREATE TABLE `pagebuilder__pages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagebuilder__pages`
--

INSERT INTO `pagebuilder__pages` (`id`, `name`, `layout`, `data`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'master', '{\"html\":[\"[block slug=\\\"header\\\" id=\\\"IDL4STUVQSYWURJ2\\\"][block slug=\\\"hello-world\\\" id=\\\"IDL4STUVRI582FX3\\\"][block slug=\\\"carousel\\\" id=\\\"IDL4SUBQV993WCV0\\\"]\"],\"components\":[[{\"tagName\":\"phpb-block\",\"content\":\"\",\"attributes\":{\"slug\":\"header\",\"id\":\"IDL4STUVQSYWURJ2\"}},{\"tagName\":\"phpb-block\",\"content\":\"\",\"attributes\":{\"slug\":\"hello-world\",\"id\":\"IDL4STUVRI582FX3\"}},{\"tagName\":\"phpb-block\",\"content\":\"\",\"attributes\":{\"slug\":\"carousel\",\"id\":\"IDL4SUBQV993WCV0\"}}]],\"css\":\"* { box-sizing: border-box; } body {margin: 0;}\",\"style\":[],\"blocks\":{\"en\":{\"IDL4STUVQSYWURJ2\":{\"settings\":{\"attributes\":{\"style-identifier\":\"IDL4STTHLH865WE1\"}},\"blocks\":[],\"html\":\"<header class=\\\"IDL4STTHLH865WE1\\\">\\n    <div id=\\\"navbarHeader\\\" class=\\\"collapse bg-dark IDL4STTHLITY4HT2\\\">\\n        <div class=\\\"container\\\">\\n            <div class=\\\"row\\\">\\n                <div class=\\\"col-sm-8 col-md-7 py-4\\\">\\n                    <h4 data-raw-content=\\\"true\\\" class=\\\"text-white\\\">About<\\/h4>\\n                    <p data-raw-content=\\\"true\\\" class=\\\"text-muted\\\">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.<\\/p>\\n                <\\/div>\\n                <div class=\\\"col-sm-4 offset-md-1 py-4\\\">\\n                    <h4 data-raw-content=\\\"true\\\" class=\\\"text-white\\\">Contact<\\/h4>\\n                    <ul data-raw-content=\\\"true\\\" class=\\\"list-unstyled\\\">\\n                        <li><a href=\\\"#\\\" class=\\\"text-white\\\">Follow on Twitter<\\/a><\\/li>\\n                        <li><a href=\\\"#\\\" class=\\\"text-white\\\">Like on Facebook<\\/a><\\/li>\\n                        <li><a href=\\\"#\\\" class=\\\"text-white\\\">Email me<\\/a><\\/li>\\n                    <\\/ul>\\n                <\\/div>\\n            <\\/div>\\n        <\\/div>\\n    <\\/div>\\n    <div class=\\\"navbar navbar-dark bg-dark box-shadow IDL4STTHLWH0DFA3\\\">\\n        <div class=\\\"container d-flex justify-content-between\\\"><a href=\\\"#\\\" class=\\\"navbar-brand d-flex align-items-center IDL4STTHLXMMT514\\\"><svg xmlns=\\\"http:\\/\\/www.w3.org\\/2000\\/svg\\\" width=\\\"20\\\" height=\\\"20\\\" viewBox=\\\"0 0 24 24\\\" fill=\\\"none\\\" stroke=\\\"currentColor\\\" stroke-width=\\\"2\\\" stroke-linecap=\\\"round\\\" stroke-linejoin=\\\"round\\\" class=\\\"mr-2\\\">\\n                    <path d=\\\"M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z\\\"><\\/path>\\n                    <circle cx=\\\"12\\\" cy=\\\"13\\\" r=\\\"4\\\"><\\/circle>\\n                <\\/svg><strong data-raw-content=\\\"true\\\">Album<\\/strong><\\/a><button type=\\\"button\\\" data-toggle=\\\"collapse\\\" data-target=\\\"#navbarHeader\\\" aria-controls=\\\"navbarHeader\\\" aria-expanded=\\\"false\\\" aria-label=\\\"Toggle navigation\\\" data-raw-content=\\\"true\\\" class=\\\"navbar-toggler\\\"><br><\\/button><\\/div>\\n    <\\/div>\\n<\\/header>\",\"is_html\":true},\"IDL4STUVRI582FX3\":{\"settings\":{\"attributes\":{\"style-identifier\":\"IDL4STTRT56SW0C6\"}},\"blocks\":[],\"html\":\"<h1 data-raw-content=\\\"true\\\" class=\\\"IDL4STTRT56SW0C6\\\">Hello World!<\\/h1>\",\"is_html\":true},\"IDL4SUBQV993WCV0\":{\"settings\":{\"attributes\":{\"style-identifier\":\"IDL4SUBMKDUT5WC1\"}},\"blocks\":[],\"html\":\"<div class=\\\"row IDL4SUBMKDUT5WC1\\\">\\n    <div class=\\\"col-md-3\\\">\\n        <h1 data-raw-content=\\\"true\\\">Hello World!<\\/h1>\\n    <\\/div>\\n    <div class=\\\"col-md-3\\\">\\n        <h1 data-raw-content=\\\"true\\\">Hello World! 2<\\/h1>\\n    <\\/div>\\n    <div class=\\\"col-md-3\\\">\\n        <h1 data-raw-content=\\\"true\\\">Hello World! 3<\\/h1>\\n    <\\/div>\\n    <div class=\\\"col-md-3\\\">\\n        <h1 data-raw-content=\\\"true\\\">Hello World! 4<\\/h1>\\n    <\\/div>\\n<\\/div>\",\"is_html\":true}}}}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pagebuilder__page_translations`
--

CREATE TABLE `pagebuilder__page_translations` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `locale` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagebuilder__page_translations`
--

INSERT INTO `pagebuilder__page_translations` (`id`, `page_id`, `locale`, `title`, `route`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'About Us', 'about-us', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pagebuilder__settings`
--

CREATE TABLE `pagebuilder__settings` (
  `id` int UNSIGNED NOT NULL,
  `setting` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_array` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pagebuilder__uploads`
--

CREATE TABLE `pagebuilder__uploads` (
  `id` int UNSIGNED NOT NULL,
  `public_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_file` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `server_file` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('towojuads@gmail.com', 'ALID9Wtz1Tvt2G9eIqVSCGSyKGcSuv4NYCJS6OZEtNsskfgdESIEomHojJXGi3YAM34gGfAIk3fHEtauE4MB53mIlK0gPxjxLmQSXJi8lWFHRgFfplWAiE4s', '2022-06-24 14:06:07'),
('towojuads@gmail.com', 'MYBRFfigEWfwwQcend2n06uDYnEDRSJh0W8zSaX0jA4caK7kSBTObK0eVIjDVwhfxad1sJNaCoWGVoXOtxfyhRGQNUu0rZGBMeq6CcgXJLU4dvy0PMtzkLBc', '2022-06-24 14:09:39'),
('towojuads@gmail.com', 'wE0ZGWOX1q6oCGxUMsIUhgHUT2id6GjwcRjE7D2ybkh6hzBqIZvFkvAp9SxM74a3Z4JJxkdZqiZxjg2Yg375YwV1jJMJKoiXQVnq3mYYnG6mbhEcwCfWEiKF', '2022-06-24 15:00:34'),
('towojuads@gmail.com', 'ALID9Wtz1Tvt2G9eIqVSCGSyKGcSuv4NYCJS6OZEtNsskfgdESIEomHojJXGi3YAM34gGfAIk3fHEtauE4MB53mIlK0gPxjxLmQSXJi8lWFHRgFfplWAiE4s', '2022-06-24 14:06:07'),
('towojuads@gmail.com', 'MYBRFfigEWfwwQcend2n06uDYnEDRSJh0W8zSaX0jA4caK7kSBTObK0eVIjDVwhfxad1sJNaCoWGVoXOtxfyhRGQNUu0rZGBMeq6CcgXJLU4dvy0PMtzkLBc', '2022-06-24 14:09:39'),
('towojuads@gmail.com', 'wE0ZGWOX1q6oCGxUMsIUhgHUT2id6GjwcRjE7D2ybkh6hzBqIZvFkvAp9SxM74a3Z4JJxkdZqiZxjg2Yg375YwV1jJMJKoiXQVnq3mYYnG6mbhEcwCfWEiKF', '2022-06-24 15:00:34'),
('anavarro60y6ao24fi76@outlook.com', 'rliXqCkcFOmubQuPPCumzO45FwVptHV6jHGPkp8dqW5gwnTLkFNcPPc8P65DhHCjQOpLqEZ0t9IMN4EzAzPJycrOOmSDA8fXk8n4a1lmJYIptEwPsdd4zto4', '2022-08-08 19:34:12'),
('anavarro60y6ao24fi76@outlook.com', 'TcfeVdHbUq7WrOWGUEIDsoYRq7rJLSC0v6GdkW5P0u53KyCba3S1OTLv5PvJ690a2suAwk1sAQQkCe6Pqjuai4638Spv3D6foyhOca0e9L3xCEAONv7RJZy0', '2022-08-08 19:34:17'),
('towojuads@gmail.com', 'FkpZJdnHdJ0I1disnv5PHRL1VrcWtddz7vYQT1CX0hipwG4RDtLCYHLQNJP0Bs8NQtS8C7vBN20FPcRJK75tthTfGCnSQWhfCXFfBySsfQC0SrtEfMzUs4MH', '2022-08-09 17:21:47'),
('towojuads@gmail.com', 'FiBB3opWa2KZ3y8kYosVrRnprwLY9EzgBnYijFTZGF7jjBLNlW8wTFfrE46v9sJU3UM0Rq45IytXiq4EgAUwkBNt4dL9FeYVyoRZjT4BqRBoBX4ZPlwugt3G', '2022-08-09 17:24:05'),
('towojuads@gmail.com', 'YfTGQw6i55RL3cgD7nxsE26lXJ06S7ibzwH6erRfMK8RkrvusmVDeHKXBpAJ618pLeZgvvgPcHd1MPOzQb38PT1zJDRP0T1FjlkOLn3KF0BC4xH4xUeuXLes', '2022-08-09 17:32:36'),
('towojuads@gmail.com', '9lNCQ6cJ61jxxri5uSaVQet8G9aLcDo1NQTiH0VnkLCh4WOr6q1gol34ZTkgvLfocBgV1iKf7QC0iL3gzwUy66J61CZEbigvKb6uEdSIHJt9PnXPS3CZPjLq', '2022-08-09 17:34:21'),
('towojuads@gmail.com', 'ApPUOByPJNtEPXZX1DGtpVSukEyuxrabCHEwiEL4Ex7JUdOCzyjiaJ5llXrmNLqtuIgXBEHk0nPywiWz3jZtT2hA7u3KvyINd3wQcwHYXCL9MyfTw7UuCYjm', '2022-08-09 17:36:03'),
('towojuads@gmail.com', 'ZFkcWwlD8wQ4BnpUrxAtQ0zosgmfrQ9hs35jB4tIljQsGMmq1rPsCSMarIUPqXgwrsNZGrAM6n5kvm2icTD8uc4W0zSX9FhteHZUkys4AldLPZENjHdeAsDT', '2022-08-09 18:18:20'),
('pamuelea@gmail.com', 'qs3otMmrwBfC3lrTpYzA8peb9IsfUuplp8vBIx16WcGZinjBFvxzMlHkakAp3fC0rKeZT9j7DTocTUKRebIJQmLI6MUX4SYhnsXjc9nW5d90ZaB5Pcz3GeRW', '2022-08-11 17:15:55'),
('bbrandyce9z0bo769@outlook.com', 'M4IWGQ4qJP9mGONuXVuhBA3zkWOFDm3EI6XpdJrdVJukUg3whw82HhVeyiFJ9ExzBzcXYQ3VQf7b87vfVI2y2oMYRDHzsexS8v4xt1d2jaVxX8J0Ln0dz3hh', '2022-08-20 09:42:57'),
('bbrandyce9z0bo769@outlook.com', '2KAd3GlZ3BRRW1wGrdYddvU3LhC4N4XGaOKZ7LKeMeerf3RsBBlIJvDnKyEEuasDCYdiu9qGhBoiojL4BEoXR2lTCv695mksTKHMG8IlPb8rda2o2aGG9ihV', '2022-08-20 09:42:59'),
('emehuchesamuel@gmail.com', '7csFKDsBm2YOw63RZGagYJQQHjepDHezTydqZkdgNbvG41tM0RE1ZsVd5rEQQ010fYGTSnP9yThx3YQq1pAHzTLa6RonpaVNwFlpIsBbReV2VCPXb5unzoHX', '2022-08-29 16:55:36'),
('cshakemaufc82y189d2@outlook.com', 'isIJgZ1jmJbO2qz8ZphJfYn0i9tKkeScI0lULzoXSoRV1KfLAvW4ZbZ8B8W8YovD9HZ3GVkwWpdNKLYzYeavsZI3uZeUS9t71A8ehS5ABGhzHGBRmACDsMu3', '2022-08-30 22:59:44'),
('cshakemaufc82y189d2@outlook.com', 'FBXVuLc4Un8EKKS7u1GPtnku6CfhP5C7w2wG1dZBskxE3Auy4uIrlFKQmHSKV8LOf9AGfgSGtbTHyXXYHH5w6mkChPFH1QVNxrCgE1xPT8EMsSs2hRF2pBhq', '2022-08-30 22:59:46'),
('emehuchesamuel@gmail.com', 'N9MWQdMVwvRFSXWxe3dFN5vTRMKjy2HEONVqrVrJO4YHwNcxkkXJrp5wpYtUwV5JQUGyw1Ggul8mm8lgxkiWwNoUMviYVwI682CwrGjDDUDKK8jwPNwkWsR6', '2022-09-02 13:00:24'),
('emehuchesamuel@gmail.com', 'zmi6QQ4jzciM4cAIUciHhfzOyLvpnMWWiG0G0wahW2TavDlOrxn6IBF8zfVJU0zXgvwluUy0RXueF1e5YxSglN5s5aQwovtCt3fZgGMS7sapWKg7vAgpirMn', '2022-09-17 07:46:24'),
('towojuads@gmail.com', 'SeGXwzfVqpJY5cPmmyxUQwZ74RxhK5XPPPwW6lXc4aaW7jHJIN7DXGRh0Yydm4RCBl2WVrqHFEiY6O4jBhrmY7PDcwuEf5tHeCJWQlJdFqQF6HdBskfJwfeE', '2022-09-27 18:21:49'),
('towojuads@gmail.com', 'ZTPKhWPYTRN3lMW1b98U5yggxgO81pYIxdk74whcoSlZPXysyw2ywiTYsrZr6YZbC8eICQKf3tJ8y508CSfMId6o1RHEFf8SdFWMFj8Hq1WFyrUffXu2uF3g', '2022-09-27 18:31:42'),
('towojuads@gmail.com', 'wK8gSNq0sqKKM4GKFs3221UdeYlN1Q5xaHZVALElg6Uhe83zUE6LSQ2uQ27S2zDZZIcJEl96CwRtuULDYn4SBPi5kiXaAzfXrlypOoydDMNOKkoelDfMLAgO', '2022-09-27 18:37:28'),
('emehuchesamuel@gmail.com', '4tkWq34m49UHUA8ViyAEybY97bVi0dPeVouOkQeLTCxktd4UV5r7ALn6WydZoFAoaXWZDATtPN1akEDTyTSNU2Jq6oBMnY8aMjcfT5p4PyUgWDCx0IkWTGJi', '2022-10-05 12:22:40'),
('emehuchesamuel@gmail.com', 'E2yCTCS2hzH22Jnger28sN0g78MLGBB5wlwU9W1uP6WBKob0WjtqaEQ5leewffQvRNQL8wyceZlpgHg2RBpOUez8MOKR9ZqhZFn4mBabnNCQ5kYc5zfKBRTC', '2022-10-11 23:17:18'),
('dmitriy1fk@outlook.com', 'IGjfWAwAqwVdLcSSaKvnzp9718I63aizhpJ7xIGm39jWjPl1gTmdMVeqOiW3HR0xNqHGv6qUfNq51yRdwZvq0NEEO50wYySfhbfcAzzU2ip0WriR274cikFc', '2022-10-12 22:46:09'),
('dmitriy1fk@outlook.com', '3o9F5CEbbPuARHaBHlhN4cZBAnAP51MtGv7nIk9QCNIgHREPS7RD2A15u4H8XuII9Rz15DLoWPmEOdnugr9X5HH3U1vwNrYnozcy6y2qnnpmsvoI6hpJtXVC', '2022-10-12 22:46:11'),
('dimavira@outlook.com', 'SyfmLQql6l6h88bUBeUFsct4vSy59gyK8KnCCdbD1GKYGgU3XifXm3NCp8nxexF4q84gncvF7HPZ30FoI8zOACYD7xYll6pXwVzg18SlhFzg7r7NkKVx0prQ', '2022-10-20 01:36:07'),
('dimavira@outlook.com', 'fTIXwIzqYG3srd6wg8qpLyntcz4l52pJJPJW8lmW8k1ePXDSlJBrZq2Db1EHzYK9i5BrE9Dk7ds8Y5QKiLufKOCDsNVMKM3mW2VURm8UnFcr9Z6MPUIJ2Fjc', '2022-10-20 01:36:08'),
('emehuchesamuel@gmail.com', 'DPMTw7CITBQMHJrfaanbsfcmKrdhtKipSNFF3JdHpGVvOtbJa5EbH0dNJcoaUtGQgzKEq5zBWsh6UqR1dg1afkqCVnsJ47CtVmtVXkmqkHky2mHPdpqmTmqk', '2022-10-20 18:36:48'),
('emehuchesamuel@gmail.com', 'v0OElXmbvZr22t9IHyOVaQ4JXaAZMB812jDAKON4FGDGe68bkxRIz1Bdqn2RrbZWNTOcPzPxGDdo7h8B5tiIi0SlZcBhGLJ6lvHobJ7VNcQJtWeW7jjyoWoi', '2022-10-20 18:36:58'),
('emehuchesamuel@gmail.com', 'IO4kZsH7mgWSRN4ivU80HRUIn4dW2sI7PiDr6bBf2PLDms8URQsVRG0Crn7OLyGkBYVWi3NELHOmDQhxvh2plBtIS7cb1KcMYViI5FkWbkSsPW2p9RsFk8yk', '2022-10-20 18:38:31'),
('emehuchesamuel@gmail.com', 'NOcLrVrhkQoTV2w2YpFdUABmPw5Ei1vPxBvfKVpqbRxTFo3TOZ5DznWmiout2WY7H5HY0NWvCEmWR0lVTf1vbsV8PMKxpz0DiYdMScaCugxNU336pIfq9pr7', '2022-10-20 18:38:41'),
('kmmwpopov@outlook.com', 'M44uMzm2U13mbVUNpyTMQwiGz9EMgPGm5z7hoNxBuXCfwiQn8kWDIvJyqjlYpHjihMuwi2F9PnxpgpaKhy0PClfqsuRrh58VspAYdOJ0MJqwdUH2qm6L6qXx', '2022-10-26 15:02:27'),
('kmmwpopov@outlook.com', 'd310GmlZs1GPPZgayYAXBneNIMUdrRSRNzE8TZttbYtJJ7tjtxlSSPBcvSk8TBtoM9cToj9RwaHkOWXVey4pq9t8JI1Lh9qaF2wZolt799Rt68cE3pr7oL4Z', '2022-10-26 15:02:29'),
('debbieann@stny.rr.com', 'x80X6jsOjRt0ZItmaftDaEediLAewFzj55nUhHRhTSKUYXbSJutwEY600eBMkORJfxxYsWfN8TIxBni1AtXUGISKxXZomMxWzozmMwchJkzdIiWGOmufQtq2', '2022-10-26 16:25:16'),
('debbieann@stny.rr.com', 'ZEIFAlSkx7S3Sc5wMjAZJGOGgnmGNTQdQRbhKc60kwYDn0Lhh9ByCtwe3UxLc4Nc6uZ3ABxyqUvA4l6SY2G50B16VpOyghgBFRzVOIFMe6mG8llVK9gerKg6', '2022-10-26 16:25:20'),
('tintsycool@gmail.com', 'I0HZi6B9JJWNP3IVrC6S42V879wHLPcowY375nFVCZ8XxLvraORox7CXBEymTB87MV97mylD2ge8shDc6S3exPvlW3feDyOrK93kPMcqEsOShGxqGzB1iDWy', '2022-10-26 19:43:38'),
('tintsycool@gmail.com', 'B3NNvNMZ3pPHeOdkTX93a7uSntIJtmbG6uZWiSBp4sjf0ewB0GrhnpVTROZ2Gfj7sEPdIUzL7LuJNYG2flQhV6hjLB7B5jXDriEO6I1zZkRx7jRU7hReXAaF', '2022-10-26 19:43:40'),
('darnishaholloway@gmail.com', 'lM3kka23cxayX5VVn56oA3B8o0fX5jU72F11MVd5pmvKa79FVXZnSTa6Rbk3AO2UdnZ4XVx9sFCBojuczp3KJReUVaXdUlW1V7TctrNgVIFnhwBFzgnaNHzB', '2022-10-27 16:09:28'),
('darnishaholloway@gmail.com', 'VN1LvwU6vOvbJwnZe4VWYcCG7Aj3nbGh3SLt6u3cVyKFaxk7cHYWC9iO7q6ScKQpUJAx9k6wzv54ePKwGMIsoojwyKF7L5nlCiSDKOary0RSb3GPVQGLRBXl', '2022-10-27 16:09:30'),
('hsphelp66@gmail.com', 'LYznwM6WsitxO41YE8MQeN4qQb0bFBiHEZR2mKVAZrLUe2cCx8fTQOp3nSazqYLaexQJ5B4uDTmp36xKpdstsZcxSpYwfGpVVACnHi14WW1xRgw1IxzapIdV', '2022-10-27 16:16:41'),
('hsphelp66@gmail.com', 'Qerhepo27i357QTEWPMumWghi1Bt4WPdMho2JjKTRypUmVJgpV66cVFZE9YpoYABa4J7Cvv26dnDuejjpPIUaU9nv12mhQSbJDyoIYoFrENLFBNszVYTad3G', '2022-10-27 16:16:44'),
('maramhardy@gmail.com', 'd1m0QU4ynV9zRh9jaqU2qonSIE0Y5UmMKMFAytQ5Sz3OerV1o3oLXvCEOcVpN6jpgt1I2lq3YoSEfBx0NjyczpegmAwZWdZamYH0SOen2pSfbPrIOQlOs16V', '2022-10-27 23:26:57'),
('maramhardy@gmail.com', 'NoAewbfKPKUswt8GFsTQ14gnEZ8kXyvfmaTNkKCQOrtQRmnA5VDrS8RlLuJRVmN4EGnMEescm5Vy19Wh5QXaumpO1Y7LDJXV4UzIwLo6wENnipkF5IU2y1uD', '2022-10-27 23:26:58'),
('kayluc90@gmail.com', 'sD3k5YS1WIUy9PHsSkC04801UOB4WU1QZgkRdumxgQ1FXPIj965f5YiSwLHMmEPHQhDnURx7aUS1cvqU4TR2S4Ikj5giM4MbuoWafsAuIjO2wbC1yNGU2pte', '2022-10-28 04:49:33'),
('kayluc90@gmail.com', 'Mbs5JYyo7IB0UB20r9qqIDSZAnL7GFdMeOIaJxGPKMVNpchSVZjdwWhDBvPdxJKmYsCiFNoPibjQjLCU6paWLtGduSjNUQACBkts5BAD69Y6trBFVckkEEP1', '2022-10-28 04:49:34'),
('MontiaMoriseyjw@aol.com', 'v7oWOf4NxNsLVDUHVBD3OA6j8hkV322BZgXzYWtHIRY6lsKzdIkYFbRrZVtOaBJPXNUBHcc7i7QqCQbhhVlRu9hILK1eSC1wl5kDVarQdJBMioE9UMVBdnIy', '2022-10-28 07:27:02'),
('MontiaMoriseyjw@aol.com', 'qOTDvauSgdG0wKuYyc3cFEcMtqkGCnbjcpkK8XkdMecMQOQUEwKBGxHiiMRAhGzUitZmRzexzQinV5FVcEQgrUhyIGXeeNyvBhohAhLyVAyV7h9zDQJG9jWe', '2022-10-28 07:27:03'),
('georgiyrus94f@outlook.com', 'mF496F9QRG3Nk2YKwHJ0IVTAk71iEMP9BcxzpiMX2atF2blNtZmkvULbKRk9AomN5L9mNbLzUXzfMQ8c9f4jEgkFuQav3A9pUOQD7IfxCy2xdJ025LRcTZ8k', '2022-10-28 12:50:46'),
('georgiyrus94f@outlook.com', 'dII8tLL4YxN6hB2Fu08sQc2gy7sdEC8YasrgZKVS1QHDNK9gZdfXVS6zWbOx0ppOA7h50s3Sjd7eXZ9u70E9N8bx3wlZqc74wjP4WgjrGOue4pO0OeYvQUw7', '2022-10-28 12:50:53'),
('avongkhamsay@yahoo.com', 'BVa3j37S9aA0JHkA3xdTvphqHrKf3imqjZw6q5p3wbZJHjnKpWzlrNZJo1rdhwege9nGZapWRL0hcJrrvVBGOstcGXdkEZGW3IRIydhb5s5OCrWSy60B0745', '2022-10-28 16:05:31'),
('avongkhamsay@yahoo.com', 'jAYhsj4KfqiE0N4tvR4hnzrvzQPGjSD5ncaZjPtZng1DLhPU7MFoIbLOf5VLZPaeyC7wSkm4WaPOybzWljq3R2j0QRMQgnDqHBAJj73Z47I5sAMwVy00Vf1D', '2022-10-28 16:05:33'),
('avongkhamsay@yahoo.com', 'Od9RZYx7TG8edHiTlIezFR6zZE0QIW5ji4Ng9pTJlubPikxOPvTFr8UI6gHjAtiQRuwzA67i8RlKynt1BbNxe5pprJJ3Tw6GjemKLZHnLYHD6WoIFbl5THxk', '2022-10-28 17:46:22'),
('avongkhamsay@yahoo.com', 'WJhg3mRysZAABhsUujKrlhoqdqIpP2VDkLg7VmpRECtB7NqFGdH0meIrS8IE6LRwwyw9YwkmXVv3vI8dptZ1nAMkm5OXyjY9i4Dd2bYJQzhflWAghbKrP67g', '2022-10-28 17:46:24'),
('avongkhamsay@yahoo.com', 'GzzmF8hCIg808doYCvGrJv93rfuDuGhT2KkfeItGIuhUO51LQzewvKG2ExjgFjOOqy9G1iwdGsL4ybqvGLJUeFD0ldXcQzNCVaRoIaDcL5UFGwsM1Afs5IxG', '2022-10-28 17:46:35'),
('avongkhamsay@yahoo.com', '80Sj29JylIz02bddm3lqIlHcYTOOMaLIk28FWqNOtpagqYIen0jXLRVJTDCi9rqUOf1LPOUkOalfbc3x91dk8ZdEdbn9F0VNlotsfSUrvfmiLrUZEHKY2TJp', '2022-10-28 17:46:36'),
('cineybuddy@aol.com', 'tN8i0ydQZZU7x2OlHIFmZjqs60pd6IR2CJKOhZmstP3UZF7vvwKNe53RqAEqd4LXnBGMyAqmA8275Zct1Wj1g6l5eVUcxnaAnw7QmhYoGEZxabsa7lLr3KVD', '2022-10-28 19:07:29'),
('cineybuddy@aol.com', 'TdS2abi9pBlhaCUFVG7RdAMnJCypQB4gwwpuhVgfZQ9rd9BRLMliNRhFvkeZ4HQTZOV4qHeG635xMBXGpWdvJjUd26j7F8mjwBMcy2LhT4B2KnRheID0eBV1', '2022-10-28 19:07:30'),
('getjones72@yahoo.com', 'P0EC5hbjkigrsZuCPW3HMIoLa3UdbX3fi0Gy8d4QEx5t5ote2fY2s66WRFQlABNvkrHbHmcxObtyzvlw7qq9QfhkoN2DeGnN0KJNXD2qOkBxGsvlPtAUg5Mk', '2022-10-28 19:38:44'),
('getjones72@yahoo.com', 'FVpTDyghUmQkLtWZme6ncmd0cHL0JMjzOnIVbvNszpNq2ZK9633A24oivCrSo93g1ENcT5dMhK9pwA3H7PTwiETdMeOrr3CxZalfWKMqyXST2kE1V4gJTzK5', '2022-10-28 19:38:45'),
('ratliff.brandon@yahoo.com', 'ehcSXEIgKuETVE7F1oXpgPmoBaGTwMtNd03fHl7ezyVKYYwmlPmyTdkwz4UCrIMNRahWfCXCBDm5CxHMJHwQYZ9r6mo6OZaIUsYeZbZ0OWRrf306Niv7WC4L', '2022-10-28 21:16:55'),
('ratliff.brandon@yahoo.com', 'FuFU4lgpUzKgP79hy7imka7ETvqvxFJiApB89Bzoi2vFlo0tlfDZWHJCK8s3UQpG4afxD1m1NtjLIEIpWA5ywnfKRINQJHxNZaLwsy2FQtc0baCY1ZC41bdV', '2022-10-28 21:16:56'),
('gctlaw@aol.com', '0hGMEVFHodanfWR78hvSi771NeMtEbmYouNmdIu3EbKEP0kRmMHgO8d1ldOaIPoh1XIOFeBwLMelwwlI5STjRoX8Jli4E1oYL1gUxwpxzElle870LHoU7QcW', '2022-10-28 22:47:01'),
('gctlaw@aol.com', 'DDvOLcsivrkmGxTzhnpwhB0cjw2KR11VOwIRlQnHj2a1ltaJ8m7YWg64B1F4XNEg5MTdUwmRvkhE1XhriyOkNeTGeJ4HHW1TjLI5p9TZHNrmSkOSWAExLhqK', '2022-10-28 22:47:02'),
('NeenaMunuz91@aol.com', 'M2HhBLYimTAAN8G5tNHAS61Z0VYoB0x3paekkOzIL2FdI2KdlDawBQsXBuufDsK0yXAuoK4zCr7yspN01oqwpfS2gefdZXeOScP19cj5eX6Pq31FvGJIL8DA', '2022-10-29 03:12:06'),
('NeenaMunuz91@aol.com', 'fXPZ32E10xIMXNuT6sf3PGaTfGMfiDcshWgMZuKmMHiGTRs4q2M0UVmFUH5F4UNyoEKC8xMsPDozJZ4Io1DObad64z4U0XDbZ2uHtuzd9MAxB6bIPKiYJb4C', '2022-10-29 03:12:07'),
('eustis5@yahoo.com', 'o86uDS3ofd1ZNTatDc0wY7tkzCY3Wn6vh9C9djeBVC60DA7CzXdPbMA7os9hRxO5DDNN1RntoGYa4IhggfEHj1HAUipF51XCmme8xLg4HZ9iVpB7LM1t701l', '2022-10-29 04:13:14'),
('eustis5@yahoo.com', 'IlcWbuGQrBdDv3FrghUxhDGEAAgnCvV2AhcE2m7Hfx5Ki3hnIU77RF6jSgvZePdGUy1fKDg2g3IWKYtl5kQXvBZHOYFWI70Beh0WQn9efWKfduDHghmjF5Xw', '2022-10-29 04:13:15'),
('gctlaw@aol.com', 'nn1TfRd2vOnTiRRyx52pOydmKu6h1n7lw0psUycWyoS5sKZCmCNmRbfII3Ttu2Zf7FhaD1ryYbjdjaezBw8ZIMvQiBMh4GFS1FXff9HROb8mF6h6Doj6MVcM', '2022-10-29 04:14:48'),
('gctlaw@aol.com', 'IV23UubIocFwNLMveOzRrzW8JkWqOOQz3iQI1Y3ld9sHvvLaGkupL3QOxcPm1KKtuyrmq9w6FgkH99gYXSNDJatx3UZqX83L4krcw9WVMtG4JeOLPlxIXaFV', '2022-10-29 04:14:49'),
('gctlaw@aol.com', 'r69gKTmd7bm7ztAoYCsmScJCCqMDiXhkpk2PSfWiUfEIdiaK4GVmvVHbfj7jte9jRxfAZDJ7XsIR8dlRRPLGHILhDKwhpRod4OBuaVy6Yvg3FzYPqUlAFDkK', '2022-10-29 04:15:05'),
('gctlaw@aol.com', 'dzqzdT9IgTXFq8TCeDgXobZWujPZaZQo8JvpcUGjU9wLZjhPfFDstGzEj233wxY1FAlkLnbJJftJ4HtkXJZM5zXqvE5Ge9s4XqwVr71qIT3tbyo5Hcck71E3', '2022-10-29 04:15:07'),
('chelseabaron@ymail.com', 'HV1EzdISTa9VdrqARWvSKJBKFnlOaHqEaVnNX7RCWd8mk0GN0XTFeFdR0BCaRe5QVF5Oe08ExMgUu4uK6UIWgFZrD72uo5DI1Y65e5aRVmrrP5T7tbEOVeYR', '2022-10-29 05:45:42'),
('chelseabaron@ymail.com', 'QAoyhKpxQbr2wk9qAhWCVYKo5CNv0qeQRKTINwVs706T0xTaDnp7814MjQ0wriP05TR87OTY5YfOv8hM9zSZUwjlWnrv2CgQrZn9QhlN6CXO7CuKbSpPe4bB', '2022-10-29 05:45:44'),
('makennaholford@yahoo.com', 'tSpa4LjNCzQxT1C5VgEcaTL3HN5bWrrf5Aqp4dWQTDjrW5j3NVJvvpFhDrpDOzswcnTAssqgqqBKwzJIsTsDppx6NTKrav7I05ca8QgvEnXZpZfjBN6yUxtL', '2022-10-29 07:23:26'),
('makennaholford@yahoo.com', 'YSFgkUra4cSYbxDm1UV4xTmh0XAk5oHwFhmEc1Z4Pq3PtOhJpgcyBXyn3YdGPZw4gGMyV5zbaCfzsEB5YxKtCnEPy2nw3yHPQjHJErrSCUPtviUXnXRl2UEz', '2022-10-29 07:23:27'),
('JustusKarlssonkr@aol.com', 'N1jUmtkcluNhyiMSVzhpKZ7aPoOe4Cybl7dcxikJahypKwBP1TyKAwaAfqQjbPkdmklrYhDpkYKVp4Bo2eLGhNC0YeEHWzB5UgkPZNwo5C79nnZk6qk7WKWX', '2022-10-29 08:35:16'),
('JustusKarlssonkr@aol.com', 'wE6FaYid4qQQXaQc5uwOQw21pS3wFbpdwcEwOza4eIEyrwKim1gbTi6G4wuziJeSBSi2tkykxwu7inGSFAxoN11fVkUnjH1tQ1zN5rC84uzIjwdGhh6fd5ye', '2022-10-29 08:35:18'),
('chelseabaron@ymail.com', 'GGCE2MN0XEEsf8eptpuJmTKAxT7oG4HYBsnuRzvtOHdSZ21hVB9Q2LbsGmoPgHVpnnsjpYsHSrM62ZrRytgU9sHdWD9m42yrwJ8VN2b45A67LNpWj0d7BDeD', '2022-10-29 08:41:33'),
('chelseabaron@ymail.com', '6ZWiwO1CnVwDTF6QXZNMWmgg0tbA0PPhskUtDUt1faIT045UwossynLuxxjDu6XtiJWIDjYzDWdTJjobiRD7F4oo0lnbk1vE05D2lgqImgTCvtpC4XSoXt8s', '2022-10-29 08:41:35'),
('chelseabaron@ymail.com', 'HgGxyL7RdTeD0NWGmKjQG6u52jjUvHVyLEDnfOlxUg10sOm9MYS4u6T9F3PrhEn7VNK0wHdcpDIoDyCxtlQ7rRHP3mdxBYstyunkbfIeYJnWVTRlBBhnbRRU', '2022-10-29 08:41:46'),
('chelseabaron@ymail.com', 'iwJNJGHB129JegPUXasX39WUerQCVjqy9om3tIaJnMqqzdgucJjE0h60Gl8xjQ988AVvEN9Grug0ax3WQZZvrYQLNFyIq510SzTWuwMOjJcMlywKvIemi32j', '2022-10-29 08:41:50'),
('crseals@optonline.net', 'snomHzDOw8VXlCJO3t4tBMzQAQ7hJIGxgtBoVEbCNC9nyQxaEBnAmMkOgZo96VyaNgd5OiecGbjwrwR2H082tksArAbnTt6CXdxG8pOeZRY434tjS2hPN4KN', '2022-10-29 10:33:21'),
('crseals@optonline.net', 'p3rzVTdaPw9seX0Yr1LIqVMw7eCK4adnG33t5gmVVGr5ujCep8JjnxAAE5yL7aAnJ5K2NYwESmclCXEkEoIk5q9EXn9F7Cz1hewbeZHNjfbYkIk8SXZCSaEr', '2022-10-29 10:33:25'),
('purchasing@wrightbg.com', 'r4vDl4YR8Hj6vN1GeYKrupOr6VQfgC6xbKsZuDDZT1WfV00FbZ7xM7c93hd3OEALfGOa4k6f0XYTRvbTyWoAlLK6616tpTGJbgMYFQZJmgEEZ2DVjLPWmfQc', '2022-10-29 10:45:57'),
('purchasing@wrightbg.com', 'I08NDf2by3Cmxb7EzK6e33vIsDzJ30Zqpc8DJF2LSaARDOcGIYtRhC60eAqNBKQFEXK79rV06MvlFukxvl8cYmEFRigy2morRFX5llBZs08E0x2fIi8dZA8X', '2022-10-29 10:45:58'),
('raybear65@yahoo.com', 'bOC2mtBaXYGlYL1DphbcDEfUtuINa9dxvLplku6eolNFvprwF88EvSf1UdsvTYb5x7rkv1TJiTbKKF3Bhdlic76pNR4Kgp8ubuf40TLVfAFGE1AfevjMcqxw', '2022-10-29 16:07:33'),
('raybear65@yahoo.com', 'iqrm1EfrWyp0UjyvAo1iNpP9Vw03pSWx1USHMDlFlh3b5JXz5Ic5NG6gNt8bXEg6IA3BKKTRsWV3safpsi4M3YDgAIIt9XwfxjbLr3tFU6PYbWOxfDeQ4jal', '2022-10-29 16:07:35'),
('AstridLebo96@aol.com', 'ELqiDrph7rujzU09iMcBe7OsH3Reo0O0cs8Oq00zRvbQENKStkXS5jlfnXEByHkX9RnuUCTGSmcOIy5w2xe7jxZdwXK74jflyeHQ3EpSDg9mh0FQk2qvQuJX', '2022-10-29 17:11:10'),
('AstridLebo96@aol.com', 'Jt9RhPEbNBnnxWNNqYE8uX76VPpZroNvAiSgwmWF38J0IeHXU3kAlX2ZA3lCKAQE3yaqBSEYHTXQ90myos4x4vlaMeklfrbpzJtV53JEzK3WgAU8fVQQIvuw', '2022-10-29 17:11:11'),
('wilson10s@yahoo.com', 'x8Pv6ENKCSe2406kUFjKx8aMKT30nEYJPOfF11u27dIjBXRyEGdttNbm51ouq3Q17NX9PPqzvnYqWomJCqgScJbL391S3NoSvqFAv7meR5O9QG84OYeBqyLv', '2022-10-29 17:36:04'),
('wilson10s@yahoo.com', 'Dn2uvNECDIWjtqqWhRzyQGetUZXsqu7YPPdJJim01TxX7oEFpO5iP13n3yxUqxShNPo6fYVRDpXKz5M8v1Jnlm7fhnTpBaY8hFFiBtNf0l6XhwjVXaRcK93s', '2022-10-29 17:36:05'),
('cornelld1@yahoo.com', 'O8qShR8uEb1BWH2IRpmZkKmmqpg3EwMvlSvTfFmfKuiu8PHI9X49dLkH6MuSx7bvXaRBXY9eafC0L44cIfKKMSBhXApTw94mI5mFUrUhZKkiLvH0cMwdTOoB', '2022-10-29 21:18:59'),
('cornelld1@yahoo.com', 'WPg58lt5D4KK5ZvZpkoURPB63F6JG7H4OJHFMH81MD9mtcxtAeKtiQsk6KvSE5kJCXAM5MTihatIg3vChII7GbymhM6cTtX49eviAyo3dJxoFNBW1ShbuCGk', '2022-10-29 21:19:00'),
('stefanie.tavaglione@yahoo.com', 'dLCEwUkhHpxcCVEMdVWLQB52CxP9EzIMtuAImQySpZYbjEpzGEEUSoiJd6NZJA80XZQunAucFOnFHXYlckD6QByXsa6KL5nII7cmCdX4t2mmw5KA9vELGcQA', '2022-10-29 23:40:33'),
('stefanie.tavaglione@yahoo.com', 'SBWSx92WvlomYm42BcMXWRs1M5X658UOt2SrpO8vnvI7EkCwOSbkIktyBQhPb9o29BCq2Q9cbvNGjyrnsi4MEK11CYStQrHQbBkH0xWeCqSaMmvGyCu5e7ZV', '2022-10-29 23:40:34'),
('julissa1772@yahoo.com', 'GnUOXvmRJIvbJCtZt5JDYSKSg9GGrPSNgTu9FQBHRS2wuT1SDObfXjA9iMdHcqDyI8w2RdMeHOXvpzuNvrNrdgc4BivkQyoqnZR5hoOt4O2q3eXsCmaPRh9b', '2022-10-30 00:22:16'),
('julissa1772@yahoo.com', 'lSxoIrqluudH3k2WvGaaauEnaszMxEFatLCqJG8QZ2IcyEk2tqmA8XN9j4Wh4HD7Ylz3IiBLavJvyTDF8ZNmnFJfYF6oEGgemVjSVfXI0NlER2pWesDaR5SB', '2022-10-30 00:22:18'),
('ryansmom906@yahoo.com', 'hSB1zcfuU6aXViBqgVwt14xYe83Z7tpC5p2MeqaWZzFD35exZCyNCE0YbmyM9giKWqDID9FuJlf8jNGUd5nU80Xlo2UN0mrXcmKgvL5aNBxycrLPEs1pfvGH', '2022-10-30 05:46:29'),
('ryansmom906@yahoo.com', '3hY7ujkEALeZ4DD1F7KxwqFA2eRRLW376VUHeAeBLfhytTSCF7rQZGtS20HCqSttHJd96a7iOq6AxHUSf9gd9ctfzc9AkuusQNc5VXt1DgPid0mAKXbtBsOg', '2022-10-30 05:46:31'),
('lyuvensuppren1987@yahoo.com', '9MrV8vD50nwaWajhgPfMZAMENv0KlQFN3xzvXg1FMnceCSd6CX8NtuEpixUNYQWUtyMZcQxSWl5KiXnfrnJ2W9Qjwstgx2iqZX12oUXjjeBdG03eY2MjzdSp', '2022-10-30 06:17:45'),
('lyuvensuppren1987@yahoo.com', '3vNTe1P7rM2hV79eZSHhDAElyYZlubfAdI4WYtoJyCUOZqzuNGTrTeijJ1EuoJO6m2CUBfLLKoqxEt9cN4m4Syby3y3uiHVe3qAbEAvimfIqhU3XGOh4Z8Fu', '2022-10-30 06:17:48'),
('zetec2000i@aol.com', 'YmBsUYFukSmu64jyhhnddpHZlFHj7PvBvygmVDirc7jBLF4jJStuefWCc5HwEGgzPkfdQHlNzhEJ9xk0aUSVibzuYjTdzZRdNVYFdI1BLC7ECJpl0dzmYzNI', '2022-10-30 08:23:03'),
('zetec2000i@aol.com', 'GtyFcbKZczC79Mc3W5b70ibeSP5fhTy9PchJkBqWax2lQOOv4IPTIyxXAyHjY0KQwhqIaykiFguJRSbuLlo9Eu4ZgSxeNGNu3oQiJGtAnQC6OxNcDQYF69Oa', '2022-10-30 08:23:05'),
('piercer32@yahoo.com', 'NRgUYBrVIT9fCEvCg00oLH5SzAdUA6igtOxHW8YKtlGcySStEWfTUhGMSxncdfOAWk7ObUucwNPga2BODMKtUDJD2ECP1lEqTV3oJRALrww6xI9Z4Pj4ljAz', '2022-10-30 09:11:04'),
('piercer32@yahoo.com', '6hB1W1aPDuUX7G1w5f6JD3RI6IErybq4NZT5j0LVXchKxqpvnflOO9xWg9lwcyKac4aonzXZ3I9IFC5krNXbXPOnilGHX49gSWhHoTYJNljAhi77M1l1ANGb', '2022-10-30 09:11:05'),
('f_padron@yahoo.com', 'dWjCtpGTedQwtpOTajZnew8heyD1itmfvTfOReqYuup0Q9amZHNg69awTwv8Evq07SpnnB9T5LYVnm4BBg9vBK6Yt4Jt0B63XVdmVZXeLxMHSpGDyTl8VZPl', '2022-10-30 12:33:56'),
('f_padron@yahoo.com', '8AFtExPXsSl5Ofaqa1VFBE912UJ853LZPLLShiBMVUfAqVFV2tNXurKx3uEx7R8cDyDUvPK6wBvhtsfqeYVofd6AY9lC3PGaQ3mE81DPQGzFVtxmRAZLcZT5', '2022-10-30 12:33:58'),
('tturner20076@yahoo.com', '3Jdey8YyXxRqy9FL3yFWT1rHq49195zspsNSSOobLpVooVG21Y308rY4EbO65tlYfYuyBDcwmuNLQJPiyq9Dlqp0c1JEVc65sToBjgvTLKW9cyvrwlejwmxa', '2022-10-30 19:42:40'),
('tturner20076@yahoo.com', 'DaRFUtroIsoelFA8rwNSB12EGG2C55vLcOKr7ovjeBkrSQzHThIH1GViaBbwhG6Hes96egcfSkOlWxLq8sIN5fqHL3Ar36CQAdmtstgPrvG9mqmzL1tvUbVW', '2022-10-30 19:42:41'),
('auto_apprentice710@yahoo.com', 'dG6scnbkoXdGTVd8GURhh6iykoZLpwWjauIJysUQMw8o7LkFOMmY29waUQAPssjyUHaFU51ultsUVoXmPu7h5CAvZ3nTY0L62KrjNslsI2zE0VhnwGObUr97', '2022-10-30 21:34:23'),
('auto_apprentice710@yahoo.com', 'ymcHOM6WPM5DpJcxVI7fTECoyuVRTb4RFqihyzrhPI6Ubd3oU7omM0fNyLnFCP9vww53sh2vlZdqfoumf3KexYoxktpQgtc5l4lOqXSXkbaHNcKPypifqBzn', '2022-10-30 21:34:27'),
('giant17_82@yahoo.com', 'de3GXEyKTUr2qpsStCecW3TxftJcSBrA9GizgYVWDXXXWc5sdJ3AxIgJ1sSr5xPglXM4JkybdILltbf8aqwm9S7xwTwLQRGkVTbnvLksVzlUzUaFLnGOwzHc', '2022-10-31 01:40:11'),
('giant17_82@yahoo.com', 'oCsPntlK8xMW5KXTgu34c3zCQNSzpLaTFxNVUTpT9EpCWtdu6rx91IDfSUgJ9TBCGvCxSP3Kf8qyTppIrRcR0xfwVO1kyi2U4r9eWSdmg88poOlwQFrCG6MP', '2022-10-31 01:40:12'),
('stevepanczner@yahoo.com', 'Jp0aCOd6N1cynCH8QelzhXBqBs8X9vUbYiOsYpIU1ptMCphXWhFeAKwWsnfH7FILFIUbJ0MDn4UREPOQL8quDwG37AmHacJSRXuobO8MXHwuiCCAujcFgMNI', '2022-10-31 09:47:03'),
('stevepanczner@yahoo.com', 'GQ7SstdIPfEVkKtIVjQXa6ZE8SvvdBePWty6HhT757Wdr4pVWM8HoUr87JUAUPH5Kb2dzsweVmNjLZw5B74nOvY8NkXFi2uoBigyVsBfxBWh7HH8EJE1tGST', '2022-10-31 09:47:05'),
('gbird1@yahoo.com', 'Qs1EbF6ZlXZvD58dIwz3R4miutbrIx5qwecgmP421gkoo0TUAlW3wS33ciitznHBccBQdRArUvaAk8tfWZJxHeVUXKOuV9bxEXZIXbTrtFCQ07IYWBjV8Wpv', '2022-10-31 14:26:53'),
('gbird1@yahoo.com', 'sON7bDbn8uIQx0VYP14XvfuMZKzsUveKDapP13RiTg7E9DQcnNAuzEHYk4USQIkxCycsmGqZrknAqclBFTEZSRnQQVX7A5r7FtYJdFdXuwsFIIU1VrKN8Mh8', '2022-10-31 14:26:54'),
('pamela.hibbs@yahoo.com', 'DqG2bPCuNr206AtzphsvliskrVfgiVdwZZWYvzBPJofhBXa7usGXBiGbgbCDMpzEf0jMkYMLVbmlVRdlty51LVtPnsKtlmbD21pmi6DjUG8dki8FuKrp7XaZ', '2022-10-31 18:11:13'),
('pamela.hibbs@yahoo.com', 'zy6iOsmXX0u2MNqGmXPKOuHd1yRQr2Y3SNmN3gfG0vkPzCHKMn7n8oRV4n7bxpzBAcNPkxGqo5YrLhDzaaDovbg8bYGEQpp2D8wfNStT6lqaRmzQCe96emhz', '2022-10-31 18:11:14'),
('ldjttric44@aol.com', 'fYiEY0wiQUXEQFp8hgA8CNdYpNfMGdawAGDdUgRynSFZZbsjMVRGFCyBwIDL2BhJcMG4N0AJlETQ114wdQAwGpDj9klKvVBSQ1DAPeMRPATM2oqcmDMzvYZ6', '2022-10-31 19:12:57'),
('ldjttric44@aol.com', 'wIBehD6AsbaIxdnartA4NNHXDMr2wYFYgRrhpp2JpkfmCi1UhHYGyn6WK0TBEHGXaa4DIRiIdqXw3Z2qgVsAH21Yry69XexNEYNYgNWFECxQzOpgKJ8APFsu', '2022-10-31 19:12:58'),
('burrill11@aol.com', 'k75KwPrXfOS8hFMvhCCvwo9Z30qhRhPWdY4RptuPGovA1v2ggLN4D6Twn7aDBhprxQrZhzMja7OgAvU5RsagrgETmEPzKqXiQMKGeRz7i6sNYPIa9rO0jhzJ', '2022-10-31 19:13:14'),
('burrill11@aol.com', 'xAWiXsSA5C41Q95MqgSGkrSGSgcPCLsJNdVSLSmKFMKWZgktBOlHJ2aLw2BYqpFLm8IasdX7nphEY4WzQChiaqTsC438e2VSIn0jH5CB4FRCF84G2dUgNxu2', '2022-10-31 19:13:15'),
('prayermt@yahoo.com', 'gQy8NOuULZif7k1UltNTacGYdVHXjkFFCosJUgByddVtzZe78Fv5jvbeQUTUZb7kP8JOb8K6B9rEo0pAFpyNQJppKZQ7oHI3f58riG4gaPJPFbQ33geZa55p', '2022-10-31 19:22:28'),
('prayermt@yahoo.com', 'tAifha593VMv0ywwfiH1vEaSOp8RZk4hph5zefRYhqlI2uldFnf5DnHGgYVCj79dQAprTfJEaWWNAQTeZW8tSbIGv5aXA82f1jwZE00PywoMBl5nQxz9FlUU', '2022-10-31 19:22:30'),
('gfedie@yahoo.com', 't11PnvcftKk4yACtQxxuyqRdf3R4laFEGcWRngRIx6nVwjp3bGWSE0c4W1c6JrUUUCoDaBxnBojmMajOpIPR9ylTWztlXBl8dT5Mcn2v3HU2eOvQaX9atuLT', '2022-10-31 19:45:45'),
('gfedie@yahoo.com', 'uMa2hr35Cztof1vWOXu0EwYxNhfDWz0xU4UHvOdDudgsdhheRFYw6PoKHKIa8sjbAlYWf3abHL71Y6UGHehv8DKWPLxA6h6xyVNMsyGFn0qryHy1rYlaJOqm', '2022-10-31 19:45:48'),
('fangdavid168@yahoo.com', 'lYD6NTAD1ioKUDUEb1t3a9OL8p0do7WfG8Sry5CYrnYYVY4xEZ7p4wdipSGlIKMqYY9Kyoi71kiSf79ljqUpqeF2xeE7yunZPuG5WGFA9JGmL5FWy8WnZ5G3', '2022-10-31 21:38:40'),
('fangdavid168@yahoo.com', 'jLHeBGoUDsdMTkOSVB6S0SGX7UkooEOhw88Q1gvqW7xSOBaYUGmjjjPfUZpsMXETpSLVqWgh5llx3bmcrPJRDz9OBOSMFRcDv9tHYM9TZ7WuZJXfvkoOvuA2', '2022-10-31 21:38:43'),
('alanahrush@aol.com', '0ppFlcfDR7cIYt3Q7rJ0Ahr73Wi9WMzPmk6iaFipl7UrvnIr905sWrzzI9e1lYjSaGIJ9rYxVP6m04QW3qTm4rGC5VTfDlAiqjOW2lrbh0smU5oJQn7hH5kR', '2022-11-01 00:17:29'),
('alanahrush@aol.com', 'CqXMBFh98UmK2mHS9MqKJk4vZvIqjASElkIEjyOSTf7bFYmYWIuEq5xCVYOQjAFuvzrNOV12cca8MF2P7y2OsDVoKeGt5peBW0aw0e3YY0oiEkVSkXgxwffk', '2022-11-01 00:17:31'),
('ragingkelly@yahoo.com', 'TdEog9nbC3avROMEbnTUNXTnJ3SVrCMdHSIH8HW8967I2vLekip1UutgBw0vnlS6F9C4sdZ5wnpQ2lasL6OsB8HfTE6lmcHHKnRqrs0NglFP18OLT5WXltxO', '2022-11-01 03:41:29'),
('ragingkelly@yahoo.com', 'BdCgcErOtBnpVOGDD8BLfp0KB4NRAGGF4GGvxm6bwIUXD7UpAK5c34gqtMwDkwNIdozCyq9IWU5kWIo88X0m4ICdurQPNkcCZKtZ84ReA9MpEtQ9Bz0Gwftt', '2022-11-01 03:41:30'),
('rosat15@yahoo.ca', 'zhI1tbtSN0iUvHEcGeQTRUn66rs2E4HVN940nhxHBOA1U01LHpBCY4QMkqCMPNZYEb9MBo64x0XLBzgoWd1FaOx5gnnMeJ7u4Y1VSytnbkeRZHpfGtviam76', '2022-11-01 04:33:37'),
('rosat15@yahoo.ca', '6xBopWkOgFQtPKd4FO8FHsIJa7BhHmh039NTIHseygo5C76J3CYYiq40SGEJN2yBAeLIP9ynNiVwHD7jy5jKEBPeIbxxMFoP91Be6ex1TXp0HaGALM92INVw', '2022-11-01 04:33:39'),
('mawichi4@yahoo.com', '0CgiWMU8s1LOdkoIWwFvTbHknEgyoeweEd4sjoEeWLQchJz3qFkynMrTtKk9M9JQWWqBQWXBXQWsdnN9j7aDj8EfZ0To1OABozPO6Xh2DUaAUQ3GJeyOucV6', '2022-11-01 10:49:38'),
('mawichi4@yahoo.com', 'rIMYbmjT0UZGBv8ogisdfgvmRx56tMt18RjRjkVV8SGZ8yuyCABUHxLUkODn9x0jRkUEMviswF0291GbbLgzvQ124bnX6dzhUKdeYodDVC9VG7b5IiPptdpd', '2022-11-01 10:49:39'),
('ihelpyoubuyre@yahoo.com', 'HH2PDOFqLi4RDxQOWF8NNHBsbFlUkppogRwdQx8LA2LIFXrCZJtllYwpTNSW0v9CXv6OPXLUKxM8Eomjnp5wYThQLrTvYoN7R1hEYDuPgzfEv1lB58nm7Nse', '2022-11-01 11:45:34'),
('ihelpyoubuyre@yahoo.com', 'm9PrsP4VdJufedQa2g2fw7RxMbFLhzc2t1QrCht8ngOnN4dvo47KzSVSXPDr3I8faZmmflHLBgX75YIfTrkyWodDW92bdfEQfIFWiDxaFobZddZ4Z2re1RK6', '2022-11-01 11:45:36'),
('michael.luxenberg@yahoo.com', 'tlK1JYp5TJkW2EBaaLgOVQGV9XToP66rXOyWX75jfFD7AMcS8BIfUeCADdZtHGIYnYIZFOLfFdhzk6dUpYUmq1S3gAQiNt0IZGp2dwof5txWz69uhYZzoljR', '2022-11-01 14:05:51'),
('michael.luxenberg@yahoo.com', 'ejwjuL9ilPkKPZErR215q1zVkyLJFi9qgWoB3COi3sZQLDwPhtexgbHaNPAst8L8LulKv0DLAzlNdzrn1CmBOmz6aSNa9kEzkNpQvWMczXOmvoWUbalyKcZS', '2022-11-01 14:05:51'),
('baileri@aol.com', 'P0KT4D8vA4jMaCM9iQLqx3XPcXx1yuW6oMdAfi7q3cubmZgb1Uxs76Wcbss9UheZYlwY9YNgsaT4fzBGJlgMfrA2HLXoRXvqvZhAptvvmi3HrnbaS5sBsscH', '2022-11-01 15:02:59'),
('baileri@aol.com', 'jHmC9oefTtqmIsGyoh7UWiKoHi5DY07VRuamb15QpDfaQJciTZTumRmtQ3WRpwLdWrrDSv8YWxMVyyUsmNztWmySQSGnBhn1imnmQX2f1wMVmeZHBl3QYZiu', '2022-11-01 15:03:00'),
('sandeek2002@yahoo.com', 'ZqZyC0z6qhFxVYiHDhpEtcwCyvDcCzwHdxWwYMVNpTgainRCDOdatwyICS1joLCMAZ3xMghoRLY21yIFqDATwpOfkX8vRwsdpHS2r0NVaJYpnmlr1gf69MA0', '2022-11-01 17:13:17'),
('sandeek2002@yahoo.com', '2zbHMaYGREnfGbTQweLVNTuZt8sfHRIvYDtFQYNqrRPiukDxXbyyau5MEEsKcewXzaLbJUCrdpolQ4jUdHNmocuLSAFQ1yO31PUHnTpeekgefDeHGS1863jy', '2022-11-01 17:13:19'),
('neelamdevi@yahoo.com', 'DQLnLtAgcwh8foBYy5aozZjbsTeEH2I1L9P9P3FJ3NRDVx6mMHd4Kj6umAcYsN1Sfza7nNmBZyTOae9pjljdaXaalXdKIYjFrIMpj0HUStZwwSI19iJhzsyM', '2022-11-01 18:26:45'),
('neelamdevi@yahoo.com', 'Dql9CMl3qZ6XsEDFzwSLwaIm3P3T3ue1r5gVpq8CmHNgBGUSU76v2oFtAfoy4hioUoIV3aG60OEsrpmU0GlKllmA5B9pxev1Ak5K8XbczfO8T2pHvNqwRyGW', '2022-11-01 18:26:46'),
('neelamdevi@yahoo.com', 'AIZf8VXUEpcNO6PUUxIdc1Sns1YeE7wXlLuQeSf1nt9zh3pOHqHIRlKecXrzTmdgYYa7kAiae7xfRBG3EeTLwMgn4WaeRlQTmRiyXUgwZIWiYxmJawDQFywu', '2022-11-01 18:27:11'),
('neelamdevi@yahoo.com', 'Lob5OLkMOMngIL14q1PZFo8N9J3RRgLAzp0T3lNAkVphmjpUJTarkDru5CAJ6gMTpEQDAkGJkd0SPRl33SZXkhVhFjx3IBHiet3W9dNmVl5vqA22RugnceiG', '2022-11-01 18:27:12'),
('jenjenjmv@yahoo.com', 'rDFNavVxsjkaAv9CmY7hcMs0RK91ab7BQY1qztsuTEaNItqzFVw88bRTBe8RYKRIbAXqJbWMFHnxE2kjtN85KVZqiMh1baPxUqFQtqO4JgXKFPVs8VV1OdQD', '2022-11-01 19:00:14'),
('jenjenjmv@yahoo.com', 'rWqXd7QCLZY6FvpejgKAuUFi2q9Zgcjp2wyYTF0SVASkdvXOXEieyYWV8t41gvhS50JyGG3FGMDg9LgDojMUSbb0n9X1vwOKVRg9VVDAP1f3cSqlXIiNdjLg', '2022-11-01 19:00:16'),
('terrialboyce@aol.com', '3NrIhFWLGhbIS43Vg0Z8cfHawRMRhOBwPOUMUORpQSck8N8pqkhV6mo8LEJFGemzgW1xdFr5ntIpmxHRqcP3LLRyNCmD5imNMkv15CO3sG6zGCCm0DNgLjUw', '2022-11-01 19:24:17'),
('terrialboyce@aol.com', 'nHGulGxnTaweoAkaNoifCLp9eUIACeFnvDPdVYvyxwev9zkYUIjjsqCUCiWp34vcz7birIonMiKvqwKC7lMJn3Kv1ZWgnUXZ5JUCuwZWttIpToZBR4rFGvSp', '2022-11-01 19:24:19'),
('sandeek2002@yahoo.com', 'TSRstZKjpaA2XfuiMUzq3Mtf6zMTIwTkVy0tRuFvxBkLubjnHDgJiInjMXjZxeFs0nDn0PF30oENRaZonQuqqh7RSLxXv1ftfzCqxNc3oGGfxRHURllE1bhv', '2022-11-01 19:26:25'),
('sandeek2002@yahoo.com', 'KPvLUoapBrv3ka22WoZ5mZKtX4chrC9wJAchT5sAVJgTb2aFoOA4fRei9qBcu9mTVpcRI3vccZQbtjhzWJiS7k2AIy7AvJhtGvVjB7Qwj8r17Nd8n0hByhCO', '2022-11-01 19:26:26'),
('sandeek2002@yahoo.com', 'rWzwZh5lSu8266S3q0gxkX3h9ExFXWQW7qeFbSAPT5Eh0aj8891IKVQyl6TGyFn4YjyfcrNQLfNyNnDdlwp2PciQLrA7BJuhNHyxDfuoJ6jDkUfLKBA8UpRi', '2022-11-01 19:26:37'),
('sandeek2002@yahoo.com', 'Sl4gulv3SSk4wBaFby6wXnNhZJGBxBgLt1jw7gmj7wQcnUEwFOYXjmSLoQpfx3XNBaYeQBnhFoi11CP1npqPTenYsajot8UWdfeAGTZAjXsFXvf5PpbAqEUj', '2022-11-01 19:26:38'),
('neelamdevi@yahoo.com', 'LKVOcWLPe6PNHHm0oAgRJkyr1M6EstgjriKL00XKobU78wUfeyjdpaaBSJzV0mVQZEWFsjNHhGjqkJZYa28gITwZCBVuznZUtLMSMo6V4tlCgalFfPA1lYwk', '2022-11-01 19:27:07'),
('neelamdevi@yahoo.com', 'vaCmsQI4A6BNzsiMBxRlHnguS7PloMJB3BM9dz7Do0OAIt3nHjQMoN2l0hlxAe6UZeOoVfnRXgK6mgmLIAP2rrPtFwiXGZcPmnBCWlF3imrqa5sqkuk86PeN', '2022-11-01 19:27:08'),
('neelamdevi@yahoo.com', '74W5REaFVZHklSdyKerktoZwujK7JtwXYJmIvcHT2UiHy7wS7Wa7cxIrDryxJScIVCPyXoPorIhkoyfth75220uMYc9H130xLxBoqdvjYQHzsimABAqftRbJ', '2022-11-01 19:27:26'),
('neelamdevi@yahoo.com', 'yVgUPofdQ8hcU7yayI15gRbO6uNdl3Ntq5lLTJJIfVlzeipcRvdVU33mgnPO1uKS6xjmr4qrx6yTTbR8aTTXxSAjNYeFDgJJdiPGX54if3v0j6c1v0Q5zgt0', '2022-11-01 19:27:28'),
('lapp5@verizon.net', 'WmfgijFebk9YFU96FU6USVMuurvlaJMjO7h9UMKt18fAkQOwP3ODL41UO077CYraA75tTFck4mQ7aTnzrVE0krJsvvRCUJJAisOHxCHAj66C5w5Tnd7uSn3E', '2022-11-01 20:00:16'),
('lapp5@verizon.net', 'ZUmRY475c9j3nT3D3FduhiYKyzdxOPEkCy5n0HmnZTBhvJE8uXvxjyNplCIjK6eLLE98dHA10SyhUn72C9uD8YRSzcpU4XAL7r8tmsmEcVJHc8gxP2F4Ndrn', '2022-11-01 20:00:18'),
('kmackenbach@yahoo.com', '2UNhG1DNDY3fB4rEZ6VLVup9wZTSIiqp07XJiotEPmyBAk6RUR2aPPjwlAmcQmteDzXr5971LVDwzgOZsdLR7ualKxrSCkzIj7iWzaVelyWXrvW4vn1TDEhK', '2022-11-01 20:09:30'),
('kmackenbach@yahoo.com', '4u79bkYt8HXNbCn0g7HOnZJFoFTM6mWI9FD7Py5yckKzmcuF6OZWVeGjqHLGupGZMT0TPdmnyvzVztxzpZoDLGXjXvvgKYrf7fVXTPhPmPiTlKx7ee1OQH13', '2022-11-01 20:09:31'),
('jtisparks@aol.com', 'c3HjxBDfDaX8aTrEhDTGzK2lioOkOX95dPUkLE61yuSZgPFRxgwpgkAS2oOzjVr61jCvKA6pfsiljKD3lhG91uWQduRWWlxoWzBWI9d81KSuX4rEmLBYu1Fi', '2022-11-01 20:46:28'),
('jtisparks@aol.com', '2L62k7UF262bIuzwr6a3gg01WE3GFlTab9jMPE3qNJiTfoIDh8CW2f0wiDvGPwCrD0v84tSVhlAM0fSRHHOykJ5RbggOct9SiuRZbE3JGIS5vrpriV0BdevY', '2022-11-01 20:46:30'),
('rgouveia@sbcglobal.net', 'TvtKLhE3NQU2mM4z7eLamRkX0Lfra4hERgHcQrjeUCCK6B9JJgKNYS9Fe13J6bZCLlOx4nIn3B9bZLJGj1UaLl9lEdLlt2XvJMtJ90F8F7ruU1nMYMSIl2hA', '2022-11-01 22:10:33'),
('rgouveia@sbcglobal.net', 'UaW5nCMZMTNJPKuUcshwDeqUyf4Thh1EV6sq9mvcS8Ged2ozBMn36Ct9szGSLTMPVmUs8jbEtz7TX1vOKHAHJKawKp4CF8joPW2cW8MhQOKvxQGMCZ2lsgvp', '2022-11-01 22:10:34'),
('jbradley92@yahoo.com', '14XO2WCDTEYq7yBQEIk6C3aKFJWkExXbSbf08OUKVsFrAmf6M2qpv2FQUb9CzEwJr1fwNMOslwuwkGiH1ShoRYeNHuKGW6695fXLMu4ng4SqiPI05IvQQoCe', '2022-11-01 22:34:32'),
('jbradley92@yahoo.com', 'EDFGFl2C67w6V18MhgscgSQ0JdE2Y9RrAXyRykGqtZQdwzwpoBoYWOudOH7RUOQfk7fLiKwxLqBEsNeHtZ8tCVgfp0vBrGFAZBfEyilI0rehXy71wxqW2Jwv', '2022-11-01 22:34:32'),
('k1984h@yahoo.com', '8Q8W3qs4dF90oJ6RaxH4CUMjE4PtUufphRnjyqEIUEB0544i7TgO0yETDbWJfp4hGssOJCOlIsSA6dy6o9KRQBvc7RmMDMaEZAAJkQkZ4R61v0yQCRAM3f9j', '2022-11-02 00:03:04'),
('k1984h@yahoo.com', '9V1XX60Nv2pE1DONbbrTDmvP4SqpqLEKRZEELPpcndc8aLi0XZSt1VyUDeqj2MSgpJCGAQU8o6Q2MauV2jyXoVlRbyAJFCuSPRpeA8ncwN1dF4CViTvkUsSU', '2022-11-02 00:03:06'),
('maxine.i.torres@aol.com', 'ChCuPXcpi5SjYelMafmVUkWi7ttnZQp1Z2ZdGUoTlGgQvKTgTUfAHmcyTEvQzgL2AvII7MJSpwPbWYBpmmt7RyapmMI7eFKp1ABo3VauzW9XkGeW5pQTBnRw', '2022-11-02 01:00:25'),
('maxine.i.torres@aol.com', 'okuLLREOL9rIXOKzG9Y21V2vt7ewdsB91RjYM7FJFZaVXAQICIYhtbWj23w1DXlzLlXGTjaoGjvwzWkovxcrWLk7b3iSxtJaBToVNPF4mMq5UMdAUZC5tzb2', '2022-11-02 01:00:27'),
('friedsakabw@yahoo.com', 'cq3WNQMSgZQ7uR1s0ySKOQrpmwuDX4MmSG2m8xVlLqguUWIKUovoAbJtcAnEsvcYbAeRRp7OdinGPxwbdVvEzdlN4xgQvbqTM3o6wsXpdQIYgIH56zNv3KiH', '2022-11-02 01:11:37'),
('friedsakabw@yahoo.com', 'LDl4b1fFDord4jclUbtL4IYRdC1zpjmQLv8JHCr4679K3w1A8l6Q6gepPQRvVWJNz3kgdowSEbP0NVvjqlyuscG8TquXb5DNzVu7zPsZ8UoDSLItpWpD6ydY', '2022-11-02 01:11:38'),
('williejnickelson@yahoo.com', 'FYQH53k1WjfUGeTWJcT10JDl6jPz8gdpRBEHBIICIlOAEcJtQBqa7P29MHRIXiMGgFwOttNNFEkOKJSWNtpf7nCceKJPqyfpEsaYZrYb79SY4hXJS819xd4A', '2022-11-02 02:12:21'),
('williejnickelson@yahoo.com', 'NZLtaXDBhYkYe0RdxUCyCzSxNImHULogH5yer54xATW5GFn5igSooixcenanUmHdacPeyRU5qaOvkcEBk7LRppZA2JAGfcv78GGE2zfSRtq0IoKiYmCUG30V', '2022-11-02 02:12:24'),
('MacarioMeager457@aol.com', '6HzKdJF2FDNqR83Gp9YYHwoLBxIJDeBE1lxiplY0FawtpnubiQ4qEvSd4XQlpfTb2M0uIV9xCt4rT2ElV6NlRo7bY5F2zIpQsO80n3A198La3ss91S4bSfIW', '2022-11-02 02:19:29'),
('MacarioMeager457@aol.com', 'HM6F9p2fXwwyTCSkttya4yOXyVC2i659PMxZgJci6rsyxMUyyxJEl6RFLykSRF1LbapWeMHTTz072DczKnzlqN0sAvGSf8ypuaQjN0MA9vYc4nAzMqoNeKrX', '2022-11-02 02:19:30'),
('chrisdemaria@yahoo.com', 'cziqtfZhEDYOvHCzXfHmHDw22bJzGtqnR7uGsZgpuQDMLoamoOpjxY1fD4j4AaNIFTmotlQg861wppELK3xUzjj0RXAqkgHbmcZjYciHtkCLvBLaFsBM1xfH', '2022-11-02 04:02:35'),
('chrisdemaria@yahoo.com', 'vEP15dvKXcldN8cZKcCBUsbUA9IqaIgCtL7RvL8tyMcpG77nZFN6NtjMtaKTJFVnflwHFbdQkV7h6Q1wgCXDfXcFfLLMnnaC4LfxMV2WfcmBqDhxPU1ej17R', '2022-11-02 04:02:37'),
('l.dunhour@verizon.net', 'YpSKIYAoBa5rlZEthuMuFWnXH6viWDOUvFhcLxSmudXMdP2bWmlA8gdOuVysM58C5IIKJ8WCBPRpyvbQsWPJuHgYw1YX81NLQv0SijmckWaaQbHTK3AdIeub', '2022-11-02 10:35:21'),
('l.dunhour@verizon.net', 'otSk5Lc6wl1GBkQh2cSsyJdPHPj64BeDxdqXYgIIXTnXWPvyMh2VQl077Z7XJ3qPMSr0egxeEc3CSUT44tssqcsBrgr1bMdubaWaghAp6wchGNvAauejw379', '2022-11-02 10:35:22'),
('kiputric@yahoo.com', 'WnFRFRoPX94UQ0pEGXdTqQbg6UDYoapMxghVvWPhl4KlFyUmmx3zY4qVobX0saCErhl9i7kVdmnKKLID4Fr7iYuy2kGXy0tftsg1sJvURQ6WfIZoYz4v1Mbv', '2022-11-02 11:08:06'),
('kiputric@yahoo.com', 'QhxoNRo9czSgr11DcdlqGDzVsQvwikUPiy5DV09fPZxFOTAeRUfTrD2F22FSmb5XuKDSDaICdDLpf0wZRFsRpxjfpyn5zgAKAsKTAF11trTlU4goafC4DEB7', '2022-11-02 11:08:07'),
('emehuchesamuel@gmail.com', 'R0tz7htSmmgwXe4YT9gXgP4hciwSawjyByL03H6Y0dHOrZm1asrtVgA5GfFoFixTJV5xKQFFObkQm6E8ipVhq1QSsTyESPQT7NUhfmCHGRlf2FDhvx0tNX37', '2022-11-02 13:36:10'),
('emehuchesamuel@gmail.com', 'BWDVXfblFPQ49Wqkqib84sB6ObPm9B9QZsuqKw3jT8TaSmOnXK4ZGDdnWO8Hm5oojC5h8BPUyUotdwdClNMxbiZYLJo9C7hzZTtqwHC1UBBeGtUzEhLJTOrS', '2022-11-02 13:36:25'),
('stacybyrd@yahoo.com', 'wz47cr8A8JuyNbrRj31dd7Nn02fAY2yLJVnCVWbdEVmkt4lcrtm4kKLX6Riqz4Tj4LPUqBblnYEBXcNzakLbnRXohIvbWsNLXL8FmU12DXD2NkigIbXUboDw', '2022-11-02 14:05:00'),
('stacybyrd@yahoo.com', 'wIVLlWtva38URVx5XkwCZQkU0A8qhRZTs6sseSg2xQzwYmmWv1tApPltSnhcsnZq3CU5pCPGb70epKNPkDPKDlZegT38celU2RWC9ICAGc7rg5JKE6UrXswO', '2022-11-02 14:05:02'),
('towojuads@gmail.com', 'fzHHHAEc3KtMGKk8yhx9TwHp0omjRwKM22ndaEVpyp3MeUJn21cs9QCdDd8QsAwgLjl4SvtiTKaeVOm5BbkBpkGJewFsEI7oHuHTFHENMrJqCir0loUJgDh3', '2022-11-02 15:07:35'),
('emehuchesamuel@gmail.com', 'RnzRbrKMGKYQDTds1fNUX1ewuzVIGPl5kwTCr05SKHlHz7W1Ow4u3IWLh6PJcLXXqlqOSi01Tr91QWUJoLILMk63WMWZ1Q9OUOqsHYlX2hHwYb1ZygIp3Biu', '2022-11-02 15:13:38'),
('emehuchesamuel@gmail.com', 'PuwL60CSpChe5hIVK8H6xN7fUkIyOEdHJ0vj8YGeXVVgIYGRcSQRCbqh9WFnnekqIEJK8zVdZyQMYIycfSJiMGPITopLLX4z04eiMcrVGxIjHa8IvBgjLFW6', '2022-11-02 15:16:23'),
('stacybyrd@yahoo.com', 'DLAq2AWnLvwIPdSmZ0RPkRtLRHLnW2fyKpEXiXwlsafZLnnM7oZ5YeY1g9mgtAn8NA6M1CoXRxvEiUwChFuugVGPbyjacAUoWNZPSPLNya4Ogi7b1XGMVKl8', '2022-11-02 16:08:01'),
('stacybyrd@yahoo.com', 'WLUuhuOLbHV1PxVn0gfsMIJCUdpnlLDTqv0jyts9mzh9eeJFwscHE3dEx1BsDAyfvcS0hmvgBaWt5FGR7ZpFFl9vMRsoRAj91A2ID0PE0Dr5iVqeaDa6ausj', '2022-11-02 16:08:05'),
('stacybyrd@yahoo.com', '6uQAoS2xZElj6wJWfbLXuuzq4fIcqE1noHIG33dogzl6qtV74SfkTX5InY8pdk6Xxn45dbqAdFYVbiqbdJSgmG1IbMwBkWntQqVSy1zTAZEQAYhdfKRrtit3', '2022-11-02 16:09:04'),
('stacybyrd@yahoo.com', 'k927uBzhC985TWvoziNRdjahePv4wrYFobaATppHsagiViSNUno8tCMlQ7xRrgbdSaKL6sO21p9l1wjOe3uJsBZLPaT1EFWRTcnZlXIuturnelqnujIF0yN3', '2022-11-02 16:09:07'),
('todd_giesler@yahoo.com', '7nVL86kQ08MGPaHvaiPxVpaFMGjgGoSKw3DqjdIsTfA6m8eqDLexWS9OqJeKJex3cZ84WXUmB15ZOjrMLSkL3YVDJCdcX8F6xbHPPYPUatxwRq4YUXf1NeHf', '2022-11-02 16:29:14'),
('todd_giesler@yahoo.com', 'tnnYVChQnF7tRyEiwyHxL0wTKPK6ShoMbKM7haPMdDO9C9MXRTzcV4VDwLihxX5kV0CPuOaVt2cemUaxFBoxCXY5i1e2o8bym4NWI9Z7EmPLmJAFCivRPyt2', '2022-11-02 16:29:18'),
('katy_hollingshead@yahoo.com', 'qCNtWuqLPAYR5BKAnE4J4SbPsVYRoLpGjP0p9yfDqrvWRoHexl2dBIw1hBjxjx2oDt9R5v68HxTuWeOojNRUu95v9VnaHRibjlEdhi4VnlZ6RLVlLQZFTNYM', '2022-11-02 17:46:13'),
('katy_hollingshead@yahoo.com', 'Qttk9YekttPjiMTWNt8005j7ESGhTj6fr8dPOtY2nvuo1cboI5R8qdtCFYD20jee9JexhSgmt9jg3qgo7PYLAs2hTcQvokm2UAOUIVikGZ69BNCi2HRsenY7', '2022-11-02 17:46:15'),
('cathyrnherman@yahoo.com', 'Zu3q3Xq2Wdc4TtTMOMSGv8KloYBlA6FXTJ3xQ5ucpi68xXX3hBM2bfjODm0F8k6TCZydiPwrWMWWhQSvSbenkKtAwgobRVL2E1kHzZlzPlqkGUnZqDIfsLZl', '2022-11-02 18:05:04'),
('cathyrnherman@yahoo.com', 'D9kcAlhfQQC1wxqgGIHIKScNw82XEly4ZcTg8TIWtZ3yoonzAS0ItciowiGuYL0Mt94STuGXEfrNhuPXRNsjKgFLuYxsoQ5CpPybYBx9Qm4o6ULcAL9o8MuS', '2022-11-02 18:05:07'),
('ejvessel@aol.com', 'GCqfpUdACAGXCKmkdeDVsqsecmMc7z9X2djvFEtOkiFKZiAiINNKt30j4wWVskS4kpoyBFA5lifRqxfrG2JPSzFGrscd2T0TF4iPddaQ8mt50Gh9YBcfkQfW', '2022-11-02 19:03:39'),
('ejvessel@aol.com', 'a3TPJFx6mGMZOKYjkYT3BN7ln9SHGKeIEoa3eRlBvE7TafXMe4Wna8ot3vvGv7CKOe3bT0aJUv5u8DIsunzGuX4Rmr4C5C1MWpjzWn2IrgYGmNCqltU1GuJH', '2022-11-02 19:03:41'),
('wongduong1@yahoo.com', 'Hl2H8TFBo1J0DcYyPX5BqDFQfymwFnIgnlVKGZ2uGKaOzQ6xf7baFx78UUrri4p29IfO0q09ahMQlIWngInu96idzzqQOpE1N2VhhybwAEPcl0Ab2HikgE11', '2022-11-02 19:35:32'),
('wongduong1@yahoo.com', 'LyKl0u4peBQwBBS4KqYe6i9zvM4FS3IMpQM3Iq4qDlqjfJH0bRHYaAy435qLEhm36436suy2Sdtqe70fFOOydUgOlRvrcIdZxlReHUNp5Y3JctQ7Stqf14Wc', '2022-11-02 19:35:35'),
('cfraz12@yahoo.com', 'ExzTVmBZG5YapfYTOe7BnpusGn3ex1u5J28j3ig7cKpnGSKPvO6rBcvD0uRaN7uSch9vePOCqld4OJqHWWQgsmOvu2U5hxV8n0w70aB5vUBMQ1alYdvpvXoV', '2022-11-02 22:31:22'),
('johnjdh09@yahoo.com', '3xaayH9D3J6jbFVbWEYNBm8ZTqYYe91JMkfo7s1zWRQXM3QxElHDSbJpKaoJ2h3UitIFPA7SnhDAPvVl3IVBqtrDr8RkZ2sl2ntEoGRpGGM5Nq9zRAUBG0Ys', '2022-11-02 22:57:21'),
('johnjdh09@yahoo.com', 'kdk6UaRgssWgMpQjTMK8QBwp11zVJAH4v8YiU0BxtkfZOuqLD8Ne1pSYtc0znUbNvVkdwfV85sh6GqZmKMy3kfz0On0I6sXuwNxHumD9w7DadKWi8L7jrtWu', '2022-11-02 22:57:22'),
('wesvari@yahoo.com', 'pEUN2g4d1eChtlU8mKLS2VuEMIlJ5A0Gsqs6PkxnyemWFlyK9gO9q5n2BpwIeIIHcB8EtOM0JfppRI8eZicRGXmOebsAYUg9WmOZFvWvx0ojOmKVNsshY8E0', '2022-11-02 23:10:41'),
('wesvari@yahoo.com', 'wVzCMebVNMvNF6P7jnKJQHJyTVGarhinf3ncxGsPJlr4lzYwJooqYaMG1rptJuRhOgLNroi7vfM4OOMOLjrQ8u24S5fkeTvaXHO663Ry0PZnlTMlCNoJNFsh', '2022-11-02 23:10:43'),
('LorienBollier3@aol.com', 'znoJY3babbBEeKZd93JwToulTeYIF0764eTg2CNBmPo0g0IT0IEbweqJo0uTyGb0l3gBnm7rLu7qaocnGMyZmocvHqddkLwFC8MNGsKyLt9Tx4cBWC4fKtw4', '2022-11-02 23:49:02'),
('LorienBollier3@aol.com', 'ihkGZuouDYJ7ExADYWMnyGS6ElJujiZN7KAm3FEgQUqC5xuTm1PHefR76vEcXuCwxznJyUycD5dJhA76WXdcnEzQzWStFf1V23Xk17uFfI7aXTSU14WRG6VG', '2022-11-02 23:49:03'),
('zook721@yahoo.com', 'jBJ1sASMXVQPVuHyQTrreYQnnEGewei3q2iNYg6r0iuUOahRp0VcoV5Un2umdU3JZdTvWYJR68lwO7xUKQqSn9QTPrMt3ZOW13rAsN4MId5fwkC7fn63f4cX', '2022-11-03 00:12:53'),
('zook721@yahoo.com', 'UE4jDQUbswSMCzT4XbDl2aLD4nGDJYj0zvJdvtuxZE3xvZhioMHy5SJj7e4zOvFaHKojuhVYNqoraBTPR9rdRzz4m2L6oYogY4RUBL8Z9QcLAzqaiyZUOQnC', '2022-11-03 00:12:56'),
('kaylapoetter@yahoo.com', 't616sretLp9PYY3llJ9jsvsSwPBEMyaMbFhKtA0h0dIdIALOiyvWADLcC22zSYREIB8qaueZThReNKfJKiyClIVvxAu4ltgfi2J0bIRwMhXLtz9NckefoLex', '2022-11-03 00:49:23'),
('kaylapoetter@yahoo.com', '9IkYrWcfdUGInyRJX0YR24f0k6pdpUTl8PUnNIlA6dEjmysHdL0v0duV4jpMNZR56Z6p9Ls1fPl0v8UVJggSuQxV7JhySZhRM0EZouNSVY4Z086C3OHfutb0', '2022-11-03 00:49:25'),
('jenn_cruz123@yahoo.com', 'lDXCS0r0snGU75JKajHkB8DiUQ9wAeux01EbzGT2obT3fdwcAS2pqrVgwwboFd5MVSIjRUAYZ3d3gft6ADYxdPVPUsZomb341Hx7CKFNHRSTWXJ1JNWK42gF', '2022-11-03 01:12:57'),
('jenn_cruz123@yahoo.com', '8tyv6uUDcVQG2Unad9d83o0zQqmXMGTIDQYl2a5BePJmKssrikJOWcl17BYURKaai8sbiWdd5kYFKXE05f0Dtrxrw9gbDZKgSK8F2p9dKhKYw6NFxvzofjzY', '2022-11-03 01:13:00'),
('mr.payne11@yahoo.com', 'AVx7OLf2dE8nXVKOiXrqG3Y8RvfMLUXLQz8WdMdGVMHue4yHl2omTubQ4lV3kQhcs7TSKkLkfbIpPKQBIKTdrEYjAKpHCKYGyeA81c5PTU9sDIVyubJp2vnV', '2022-11-03 10:18:40'),
('mr.payne11@yahoo.com', 'NvRMRCzwklWiQJjULU4RwxjidxfDOHN0dH1dm51v8Tyk3kHQXPEqBnfG2SJNlm5dAFkKQpILmM3QSr0Qi0cOM7gZwMDi7ZxYCmokpHoSG6f8lcMM6NGewUYJ', '2022-11-03 10:18:42'),
('larryfindlay6@aol.com', 'TbaXT4d4y4a1j80nAYw0Kr2QrrKpNvj8lTb2jYvGKaVj1ngIVgD8ZSHq5ZG7cBSwYTRXv7jSdMfeRbqxdSdlw7zAkzVz9uZ25hMVV41va0VSjAiHqUbIXZCF', '2022-11-03 11:01:41'),
('larryfindlay6@aol.com', 'JSCYUlF0fZ47yPSwXQCNSxR9XQVgNShtUk7lZ3FlzT3e6HvzRjY1NZE4KMYe9fo6kqlz7LkfDdhTzxLZG67z6rfMg79ZxgeGMQBH0EZVNXDw0Ldyzlc5lMNa', '2022-11-03 11:01:44'),
('CandelariaHurlauh@aol.com', 'SwzdTTFvrwyMyD5FERy9nROxhFaIS9XjL8Dm3ZMwyxtqtYQl5sKKdTSkweY97XMGKsqlarP1Fl5fgTLKzpyeOxn8XmXPG6Zk6iDiZ34nn0Ufpl25QJIlyao0', '2022-11-03 12:24:58'),
('CandelariaHurlauh@aol.com', 'qGvc5Uxe857bfOrCuWlfv10U7U0kGmRslZUcfqzRnHFlBsCSaSuM0oeA3jbjcgYRtBM9Uorx3SAMlMI4rkoCbkAfkR5VhRcOZKwhpccKX7y7zAdbqjqKTTQr', '2022-11-03 12:25:01'),
('terrireilly@verizon.net', 'nB2JeVddNszF9GKzHKa0JhA1Q5uEgd76yIYT5p8qxtUqa0NGRsUy3mRPp2ptCLWN7Bc03QtIaoW0SJszv7w0UmVnCZja0vCNpFc45NKULCFY6p5PG4YlHDVJ', '2022-11-03 12:33:37'),
('terrireilly@verizon.net', 'TlsoGu7qgY7xXwYA2SLwH0i8QuvC1U0AL5qon8720yvKJuqYoLrzjfXEuHprj0BJgiwdaJMlg0q4mzaVSPvEnUGQQxidcAQadWzb4fKBNsz3RClM13kZXmwI', '2022-11-03 12:33:40'),
('mslatts5@sbcglobal.net', 'u2o5DQt9lUK3K8RBbi1fSuEVibRPELEs7L8Hd5a3gcLGsSVL3Uc8oB2DuPiBG3f61ksOmL5xohObEMF44zYu3OqrsEJVjiUJ8XLDxQKAxDW7mkGR24AqHQux', '2022-11-03 13:44:42'),
('mslatts5@sbcglobal.net', 'rZtyZPbKRoZlSBeRjjMNkBBPTqJayRxBvFmbOY0eWBsAxrQhxGlWt7CA3rdJBfXPC6C0WYJTCcBA4qXPH1SOlxhZylUSwPJAygp0DlESKoxGMnh0tt4yVYlm', '2022-11-03 13:44:43'),
('tnavgun0620@yahoo.com', 'Ownf9hb3EiVrsd5GYjyDiiE9dNA1Bx57sCtIuuhMoPxrg41PBrHyuE3v9gdpW1lBiKcaaOHBgo1XEymNQ0dGiPxJehpeyfEp6ghk3etV2LmJuQ5Mq1txNIAA', '2022-11-03 14:27:19'),
('tnavgun0620@yahoo.com', 'LACfAsy2R4LZ7FJ6by03rquxV8OXNTodwxdHGUVSaJMSoBGiW9c3AcwamQgn59QUI38V2U5MKOAY4dT1M6LIG0IlNufzf7x3kUqf261vQ6XgVgurkNIZcdo4', '2022-11-03 14:27:50'),
('zainotmartin@yahoo.com', '6V1PmsII4YARwiEELlwB9TkSRP2pPgVR2od9dwoCvb30IueSMboxCjHYW2vzeGlzYKO04sTd1UBibVRH6WSgkrhldP7acsPYs9OxeNwNOR80LrYOaMeAlIUn', '2022-11-03 15:45:11'),
('zainotmartin@yahoo.com', 'IlXxvnJIPMeGWqkA3UjZVHqHa69sc52nYUoz3Lq0IPmUYnLm2612JOpodyvVYXMS5zOQyvkmHECAKYX19rXKc4TsoIkanTPypb31Dy0hLtaiyG8gZeFITvH4', '2022-11-03 15:45:13'),
('gfedie@bellsouth.net', '3qRMF3QQxyjWfwPeFnWSvQWAAIXkzkuXtVQ37sbPQmuZd9EeBDrNgWXEFsN43jU8YMwPOUteA0SPbWXrYeGkwAQGFsC5Fmn644G2iyiVkEsIxIildBRYe3zf', '2022-11-03 18:52:32'),
('gfedie@bellsouth.net', 'qBZYmCcMfV9ZXEjdraV9WBes6Yz7i8wXYBXx5WjDlMRXeamhDWuU8k2w7uzuzQNUEXTUIBeKS2bsjn7voOI8m7LV5HMXAHt8Z1gMMC8YkN79nmGLxg4qkGwZ', '2022-11-03 18:52:33'),
('lilvp60@yahoo.com', '3xNMYKV3SY2zjHmMROyArk7tG8VttVtW0XVdbqnBSj76lEvUuUgj28GUaR820q1eCcYFwItK2wBv8tb17JLLq3y4ZWLc145ozgaZo83eksUuKMY0glp0mqeJ', '2022-11-03 19:32:56'),
('lilvp60@yahoo.com', 'NsnrN2lmXoxeCF12GoNjcsuxz3ZfB8I5zph5GTqnsRo0nGnvHLjk0PNTEFUGuCqyvuzzdo8sClpzujrpIjK6UguUCl871skGHRWWt0c9olEsABKLhitrRygn', '2022-11-03 19:32:59'),
('lapp5@verizon.net', 'ojEbevMu2u5npO9v0Skp3ayZ6RFGMELt10fAZ41PA9lOkMmD3Fn90LDQ4lmJ5bHtwgjC2eLTtZZeyFkYbFCdBZaAhKvVmy9pWCn4EGNnQuDUf9GNgZVptXJ8', '2022-11-03 20:34:06'),
('lapp5@verizon.net', 'JaqiC6WMtu6AuuxBMnVxm6ML69Cew0Tx5rATZXLVjwbzH2dGK7wZudb0seDP0kMgJWd30Wok8FIhoAPazb69a6peJyyNksPceVCVlD2wHWdrArSbsq3TrWsD', '2022-11-03 20:34:08'),
('ari.dayoub@yahoo.com', 'oVcXXSCB30xK5PQ46mLTtXjjqKKW57AmQMeZiCDfFHpPP8QJ2kJEtcfJysQC584bGelFUoON1iNNRU6ZEHLJgdmrvNBjDJ2TMoYUivfxsPrhZ8PViJ3MJHMA', '2022-11-03 20:43:24'),
('ari.dayoub@yahoo.com', 'zcc4AmgeqT7F3xa8nWBLj2sq1Vw4ldNsvAVlRRkReSOkCC6iVpRDoPzehunXPGEqMId9lLWbVzGQOvBbLbrPDv6DsQWaJt0z7VFm57579rdUl4CKM75OqWkc', '2022-11-03 20:43:26'),
('emehuchesamuel@gmail.com', 'ENzWSaLlj0TrDvlSFPcqm1Bm8e0DA3NyO60NBB568aTbceqbBMAcT1jQWaDv35RMxT4ukhezBpXz9PGV8uJxbCD0ybcOVHAPX9HqSa5yp9awRLoeFFTb4V7V', '2022-11-03 22:24:33'),
('ski_mgf@yahoo.com', 'edZBIwBdetk9MROmMiJF8oMHSgmyuBBi4bleq7O6tIaIdnzqlv0wKrbzJtLVPxbgKIWFL14Tz0B3JUGVaeXRF6DSoI0bVFWyIcAJ90mmPar9nRDeWN3wpUuW', '2022-11-03 22:35:39'),
('ski_mgf@yahoo.com', 'ZkBVxCcpgpiYTAGscqp4pGQR133QhK050rLdy5dnO88Gb8TEejUd3MKNbT1vZAIIcEfI7Ajo8j91oAjARtw1ZeVH4O4moSJSwDYI5JFTEMmQQ15u55qKWVPW', '2022-11-03 22:35:42'),
('xed6669@yahoo.com', '8ndh7yedmz9t56ZdvDZAk38fYK8Cu1pGjOymixUgMV9yKRZlGYYpB50l07EJz10olDYA6yTMxZV7if7ghG0bhOXUBH2dCF0cb2FLpm8pDqXvdH7plPD2rdq7', '2022-11-03 23:17:06'),
('xed6669@yahoo.com', '1jJBGgtK9tnTBme5H3QFp5eIwyVTQvzhNulkeRXn9C3PfOPoyHm9SZKGVlZ8v3rzbwGjqKPViUFTZUKIknHNz3EcXw7nVAuI7XWtGCs00M54sK91RbV9bP7a', '2022-11-03 23:17:09'),
('shawndwise@yahoo.com', 'qKT4ZKnqib93EDYREBaVBThCI4lx6zBGZkDnrN64nq3COzxplcLKPYADFEJBPwMsT9R8J2IvEkfmmziprHL5hnWcHASYNO8PBYfi2nNSLwOdwZEsycNfSE46', '2022-11-04 02:07:22'),
('shawndwise@yahoo.com', 'NnneFjskej86733wZTi6rqi7vOjaMHZJ72OBHsAW6c2GMAsNxkD3lEXBNsVCjRJNdMWFdnsBvVEIjr6OSrc3CkZ1udwA0FOZ9ieIwFnoKjUmRkiqLPEiov7m', '2022-11-04 02:07:25'),
('nhekv@yahoo.com', '1smTCf1PAOenxIXv9ml0ifBLf0HYNvSdZiINClBVoTbi05tzG2KCiRhuO9BLEdRmpeRjcU7xkLJoISBZwNig1EREr3A58ShCdcNxRgp4jWWn5yCqwS7Qp8ik', '2022-11-04 02:57:36'),
('nhekv@yahoo.com', 'ObCCEtmTAXYcJq9JtsyGKcdTsMj8l1Sdtn1HzcinNZ9MtDCIj3rpb0pBC4m2JhIEiIlG7OsCyTZpUVghMRQozb2SUQpCv8RZpTxmOVZryLRwrAHcE4yjQBA7', '2022-11-04 02:57:39'),
('jjamaiken@aol.com', 'eJRxk8H0y2pTWCyoTygTsBhFN0zK9yfBwLx7fb9NtVF7xSRiuASQrDCrjI5nNtizyaDyNNlPNIAMviE3nctAkpEdp2QTZ0Q40PcufhnRCFycmzNsd1iKhype', '2022-11-04 03:22:10'),
('jjamaiken@aol.com', 'u0HnsNvHCkrlYcgjYB5tHIT9SvENGhYUTJ8Ep39xEGkxstcujrurprFqv76tq3YERjyImUKOesHjZqcBnPrzqaT3NVbkds3ihRroOJpUGRbTkuBChpOEbvYX', '2022-11-04 03:22:18'),
('lana_ahmed2005@yahoo.com', 'hZtb0xeOqRTukzS4L2NFaibm8AdSELlWkWlGHLVfXxv1W1AfdEXQ4zkHMzeUfxMO1k4EXWtsmydua0QYv8aps7QYjwmabV3I0xILVl9Ba3rI5psc43iBplfM', '2022-11-04 09:31:02'),
('lana_ahmed2005@yahoo.com', 'aXOwlxDWzfteRjxqWrRdvd4PHhEsYlkFPnHz0VZ8yj8vgW6LbN6NAFCJzDRKM475qjHxAXhhNXAQ8BHAiIiMjWPkWjOgkIpAXX1im2CIOgVWrefDLMkSgXzJ', '2022-11-04 09:31:04'),
('s_tomer@rocketmail.com', 'ZG2kGc4TX6WSMd7AB9PEKBt5Pb6MbNFAgNRASv5vSAjjsoRfk470RQDsCTICWAB7DxseG8AdQuwj5JwFF4myoWwPUZbjFzZIZCPcw4t9S7XiAE7bazfkV87P', '2022-11-04 10:13:17'),
('s_tomer@rocketmail.com', 'jwtXdDVSZBLAXwfNpqD2al4EGyzQpobGZyE93uiMzSAPT7NO7ZFUIcDYV0CApOf49UDViADSOdWj5YddXtqPfLWI1BV1iV9V9EeQOrIzHvnMd72BghCRp9av', '2022-11-04 10:13:19'),
('marianeladoz2o@outlook.com', 'WJWXXRan3AYJjMQJwg2SJo4P5adgyjp5peDkD4DMgpAoyE2IbriLqWH6SzeTWBraROOcXl5QdAsO9TmVAyXsGHApq5UcpjWp7EVa46PvaYVh51pOO99rYHhE', '2022-11-04 10:46:47'),
('marianeladoz2o@outlook.com', 'wv3qMdfyrQreSXK0tp3fseO3J5uMc7IGm46d1N0kr6nQGzAUkp4nMOvCr6u1kDDpaTMM362SSg7qtXikLfNM4OuUe65BhuPd2eD0vl5JhxM5fuetcueoTy4T', '2022-11-04 10:46:48'),
('thompsondee16@yahoo.com', 'SVSvIGzPbbDoaaY78JevRVqChH8lX970f5gsQWiTaaJdkq1YNA2rvRu4WqZtFGlZp9OPBTpd1pvsV72B4U6ppuxbPKZBmo75GedDzHLNL30i7dwnpUSPEb8F', '2022-11-04 10:59:16'),
('thompsondee16@yahoo.com', 'yHEpNThtbIMpjCw5y3zFHSZwAvE4MDyBaPMNRGs9AFrglglV2XHnqAq41Brm5R41kpkXpvSaXjnsdPkA3tIHiVSy1E1Gychb9xcPcHNP1Mob7hfI0Heu5Rp0', '2022-11-04 10:59:18'),
('t.justineau.iii@gmail.com', '64bQvFBx7KNzKRXL4I4mKslwORlPOsDU7bMxyKTG8ILPfII71H6PQ2pztDHUIKsjCODPP8CYUvo7rs22C7AzFUWWrskpapSkD4AR401lKLDKQLb4R3BCFEiL', '2022-11-04 15:18:15'),
('t.justineau.iii@gmail.com', 'GZZTegc3Ce9NomiS8M2hd4V6P9TtSYbniNjzlJu96MpuAnsSwTmn9idRUjXOTd4W1PR3UwXn3qXvBYamMCpPb7c8oSBRV4nmycwTblbohJhKw05fQnAPALy4', '2022-11-04 15:18:17'),
('kathrynkwood@aol.com', '51iXlOJmeQNIG9lf47s2M9SYZo8Ji1t10sl94K2vZu7lnueCaupNdu11zyvyoyPgEqqEPwU4KuWjsBA05FRJYBpZgei90NC3pDSvpyRQJQ2wcMPCSKmrr26J', '2022-11-04 15:29:51'),
('kathrynkwood@aol.com', 'YtT8f0MsWIYrHir02ADg9rAcxg71A7AwvYhB1sVPwSRn2Pe7DHV2ANTDdC8DzfEeKJd2lIKaagIKAvw2BIgKdplq5DzVHxPZVkrLmolReosXDZtxgURhBAkm', '2022-11-04 15:29:52'),
('AnnieNolan71@yahoo.com', '89Op3zn0YGM6BBNPrtKmwpu6xjUyxXN5hnHYDDnpzztEYos4cAUQAiAQBMiNuozMWxNFhEHVSnnGbCtD9FW6lXAJ5jcN8kOzszsYFYLGUvbEX0tYHKLvtlc7', '2022-11-04 16:13:51'),
('AnnieNolan71@yahoo.com', 'ZA784vQ4rI4upximBqbbmCx7c1YyBN48pi0b32aNAS86jKZ9u5fACrFBVqHAIZn3NEJxMZ5RU1kKGMNF7BhcpiJKVXxJNs5aBqKLoXuF9bdPyBxvGbupslAI', '2022-11-04 16:13:53'),
('JaysonAlcini92@yahoo.com', 'stGGTHXLMbymO3HoTWLkZCDZkn8OHL2uMCGsE4RoLeL4guB2HqqfOcdlqkg4TjnYCjGkoN8RvZDfma9LMogNNfrFfbMX8g6pfVS7xzq6o2oqzXJiuvbhztYO', '2022-11-04 16:41:47'),
('JaysonAlcini92@yahoo.com', '5iu8QIkAdCsZwiw3QzhyHVnKFf8sPvBvtAB6V8VlIRpZDuvhiCr5xXbl8M9dWyeb6CPCb41KgST0Fm8IOTTQUNRJpewGeoJvAB5Qr5icl4T5gtmSHw5JNCcx', '2022-11-04 16:41:49'),
('burns.shaver@gmail.com', '11a0gozk6bN8ZxyrfP9IHtUbhjxFMc6ON2M5FfzW4eQ28Zu9KopI6rrnZLEl8GecOJJesldYE46tWRwxKHtuwtXGduhuHeBwl6Xvm9nsW3FjrVnpkNEzBfHh', '2022-11-04 16:46:48'),
('burns.shaver@gmail.com', 'fFMp231rezQ0YyyHf9OIcq2Bsvbr5SenlxPFHg8KCcBlUDrB73s13pYMczJkr3PlKalnAEfju9TWSOoBzrYqkvgLrkzKzk3plA9UyWQJxn06wyDQEIOVKQsz', '2022-11-04 16:46:50'),
('krista.cranston@yahoo.ca', 'UHUSZBgOuDd5gCpKUvHw0pan4rZhNM7GLGZL2eEQYszIXgyxtZVGLlzqU7nCzRnQBkHSd8xlfGokgYjXcBnOBWezFMm8IiZWdpYyQnVttkXrkPhFGTl7YauG', '2022-11-04 17:56:19'),
('krista.cranston@yahoo.ca', 'Fo4KhUAMTiY3ydNXa7N1zKByNXnnX46o08ubdScrV9MxqCeGnoxGNAdF4QBWKf1hCCNNJ9gRhuUS1jwaZIwtt580CkSLvNuMczukdbem8ik7Q5b1sfy2JbKA', '2022-11-04 17:56:21'),
('julia.pinto@yahoo.com', 'CugLZMKdXX5bCei03XXk55ALABsgE3dZ6kW9FD0lcbr5wsj26wKXZdv463p07Iy4V5RVV4vaqCqqnZ5xPyboh6ITsXXJfPwRR7JbYY8uizt5YhVQmOFMvbTH', '2022-11-04 18:02:51'),
('julia.pinto@yahoo.com', '8XUnMJxHkzaafg3nGH5Jq7oEf9exjR1x5S83PW3T3vSXVTIrzePTggSD47jrXsvS6TUYScI3Jvj0qfiStF9cQw5EZCOgdbmRxqKtTPOZlWR0aYJvZYVuhfrA', '2022-11-04 18:02:53'),
('aubre.scott@yahoo.com', 'cqGNEmNEyVx3MJO53lid7G39ZmLev0bMZrgvRSnhPXn65Gllxx5bkkuBk08v29czYoP1jtWOCn6p0dOFR2aTh1JPuZd8I82UuyAmG0zROo56r6EAI2f817PG', '2022-11-04 19:13:07'),
('aubre.scott@yahoo.com', '5lGhlIPmA2ab5jfNcaXR9A5O8VahkW9fmfgDQmLccxNFgKj1VTFpXJ5QYJIyx5ZHDMnowEjFdfT3aFYpzhIUh7rTjgboF0Jt0DDKfQfqObWTvYNfNIjY1ol1', '2022-11-04 19:13:08'),
('miss_hamilton89@yahoo.com', 'j7JQhWpi5GVG8q6Hjuaxk92BDx8OomPe1U67txO8GmCukQNv4W8huPgFWsSYdonKcPbsaZpTkbbaPMHWqltEbxVNxi8CZ1XsVoRqKHG9EGdpusyzxFG9Xeuh', '2022-11-04 19:33:28'),
('miss_hamilton89@yahoo.com', 'xePO9ArzECYBEZQMv0W2UcckQ1wJ4TxAhOviNEXl68zqF75vM7fliJ0NTNGmufCX8pV9fSeTogqBxAFNpusqeEmGC9IQLSjVC7tX8K0kOQtxAFgks0mdYQtx', '2022-11-04 19:33:40'),
('NidiaSchwebel524@yahoo.com', 'dQVcCkitmvuKD6LwdHElFku4hnjXhiQq43x4s9dWGIkx2eo9DsNw1uE5OTcFAWYhNBLB1rH14VGYGUG2KYpr5Mz13hSX3WaJnKIeJT6zcSliQMCxaTUM3gde', '2022-11-05 01:33:52'),
('NidiaSchwebel524@yahoo.com', 'JnoVnttFaAYu3TWYxji5kXke0C0I1BQot4jC4rmm8GJXDUNhZiYHmTP5KnI7j0EnMZYhsXv1q151xaURC9ULPHMiqiOHRC6DwwsALnFPEzwqAqAFeWOCRYjJ', '2022-11-05 01:33:54'),
('TorrenCoweemc@yahoo.com', 'kjpEtRPwpAtpzKUDvNpmG1r1UT35UhWbd3saH6awOrUdHRd0b0cdVHXZc2hIt3QpiMsDAlS505HVbCe6XMQz9QWrtu8k70CD6GwwVb33bUEPPjdYmo3pEfeR', '2022-11-05 07:00:44'),
('TorrenCoweemc@yahoo.com', '7yWAieZCeJVyLVVGYakFZOlND7VC7wKr854q7OQ4hx4081dOEarvKaa111rzCb4UQJ7uCEFpVTlsiWjVn3eaDW4PEB073VncMlXh4yCPp8j8DV1IcSMe31F1', '2022-11-05 07:01:00'),
('lisyrosell@gmail.com', 'XvmraabyAUG9Y6wjgIu1yR8bZhG103mTRNOFDe3Lj5o8TSgoW49n4ybUXSMj1LofoqpEuBPtIWB5OdcFexW0PohCWv1oGChC59TzrwXSnUO1vQYFXekLwv6b', '2022-11-06 00:45:07'),
('lisyrosell@gmail.com', 'KahGJVfwxraP3yEGnQUAM9ehDSFVCIqdTrhAPLQo46H38ugS4syfKVXnNdmiXyj0oei5Rn1IfmvemJgXMnIrJ4NL1PY7xMfiiI5HGQowaQufCgFwFDGwrCbz', '2022-11-06 00:45:09');
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('lovennurse@gmail.com', 'A7cb30cVxmpuqssgvCC48mESKMIb9lQlzbODUT6Bh92TlQSTdJKJBGFMAdFq4fwoFAEy25RZ5ZF5wT0lW5dZGaRk6Q1tl4TD0AWMGxVtgPqW8LyF16cXK6La', '2022-11-06 13:23:25'),
('lovennurse@gmail.com', '494elFFSyMnMRXpBI5z3ERKAXIbPPiwL8S7oTtqH4jMOduLtYdznr3SBRo1SfFNqcfI0JECzEqQKNUfPems5mhCD2UuW2yt88hTEyf6g8ZmKSCGD2Uh2CwOG', '2022-11-06 13:23:27'),
('scottsullivan.4email@gmail.com', 'kL2R2U3DnHsWz12nmNg20LMhfOV31FesdJcepEdMXtdMby2dy0RomQHgCLNsNXxu8qbUBPSFgJihOuSm3AR3NA2j0VimfseWi4Gcy2nf8hq9dDuIuHwHJo2w', '2022-11-06 18:08:59'),
('scottsullivan.4email@gmail.com', 'SzbRQ6rTjRhpHxFOEuJyjjjErK9Piqi7MflvNDU6TCA8i90cB9wSW1XPvuLWh9ZGgIcDQIEeYID5g4TnRNgzxYE3Q3iCPJJZfuwrzDbPrqil2X2IRJx80jNF', '2022-11-06 18:09:01'),
('dmckinney3000@gmail.com', 'qs7anxO8nrjrsdeHbQN8gIDm8OBD7PAlUamxDt4rimP1fNnsk7rm77slQzGxynIbabidFHGYVhZBJE18J1yhT5CdT5P8wwgrEFi0J9evzbOiOzhk29A3PxAr', '2022-11-06 18:54:21'),
('dmckinney3000@gmail.com', 'DYwuuUiixp1GagbVv27DjXy83p3M60q3C9zBEH3zSSeIs4i80aXutwScvvSycSYUxIYp8iIcqZ0HTvOHmhfK7bckHQcy4hMKkG3NJUr5fT3HeIqUvrFsPyqa', '2022-11-06 18:54:23'),
('wmtirrell@gmail.com', 'ZvKuUWLRa70MEmDsPoJ516hozGhZZn1ZSg7SQUd7IYFWl5nk38lWUOr0PHO7iKAk97iiiHoGRiSMkAgH1aastoAfiIs9HFQwFscCAKpogIFe1lZQ8eAwt53d', '2022-11-06 21:01:06'),
('wmtirrell@gmail.com', 'iXiFERAavFFJvj0eQ7WUfKrYhS0kGcXDyk6QiR7PwOYosRsxkygNpsSaMyANdPBO5yqloKqOYVpguW1F304AB2DEogJEoZUQQkitE4HZRBME7Iq3WbEABXf3', '2022-11-06 21:01:09'),
('hannah.deveny@gmail.com', 'ZpXk2XeQ90Y1P6eYpwWk73uYzBefUrH1VfTBDby6x8c0ZmyxAxm3IutE5XAqwaSPX5wTbi5AAfvZpG3qkzzUvZVZCctoOJ8Agl242phjXrlIarz1FJi862mm', '2022-11-06 23:06:32'),
('hannah.deveny@gmail.com', 'kUnsAdW83fOA6YyHrpyFycClaEWDpjNTZxcfKHNuCak7vJmNDkX4EZAKBkkszLNpyGroOfE3I9I5IqUz2iBzAQ6zG2YotirL9PWEPBpp9GRHDBPDtbxGSWqv', '2022-11-06 23:06:39'),
('wgodwin680@gmail.com', 'lDb0RLHC73YxjwhB5VNbb6HXu8UinLvVHmWqAlVw4w06FhzRFzCaowI9TVMj68sD6YNUJN0tI5DhQ6NlAxtDbAEhyeKv8rzDiTZTcOXtu4yAwVl9tie0Rx9I', '2022-11-07 20:13:36'),
('wgodwin680@gmail.com', '50nWesYVh6EpXsNzWz75dXo7vqIveRvtWmvRbPP2ygCgMC9ywBS20oIsO53O48G2EFPYhA0lb5fVpCSaTGU7SZpZRKgUixfjtjZhAogKoTvpvPrqIGUObY1G', '2022-11-07 20:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `plan_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `plan_duration` int NOT NULL DEFAULT '30',
  `plan_user_type` enum('users','seller','all','customers') NOT NULL DEFAULT 'all',
  `allowed_products` int NOT NULL DEFAULT '9999999',
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan_name`, `plan_price`, `plan_duration`, `plan_user_type`, `allowed_products`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Basic Plan', '0.00', 30, 'seller', 35, '<p>For less or 35 Units of items sold + additional selling fees</p>', '2022-08-06 15:28:52', '2022-08-06 16:43:25', NULL),
(3, 'Business Plan', '0.00', 30, 'seller', -1, '<p>For 35 or more Units of items sold + additional selling fees</p>', '2022-08-06 15:34:35', '2022-08-06 15:35:55', '2022-08-06 15:35:55'),
(4, 'Business Plan', '0.00', 30, 'seller', -1, '<p>For 35 or more Units of items sold + additional selling fees</p>', '2022-08-06 15:37:26', '2022-08-06 15:38:11', '2022-08-06 15:38:11'),
(5, 'Business Plan', '29.99', 30, 'seller', -1, '<p>For 35 or more Units of items sold + additional selling fees</p>', '2022-08-06 15:39:02', '2022-08-06 15:39:02', NULL),
(6, 'Ethos Premium', '4.00', 30, 'seller', -1, '<p>We will handle all the shipping and returns for items weighing 20lbs (9.07kg) or less, while you focus on managing your business.</p>', '2022-08-06 15:45:25', '2022-08-06 15:46:05', '2022-08-06 15:46:05'),
(7, 'Ethos Premium', '4599.99', 30, 'seller', -1, '<p>We will handle all the shipping and returns for items weighing 20lbs (9.07kg) or less, while you focus on managing your business.</p>', '2022-08-06 15:47:56', '2022-08-06 15:47:56', NULL),
(8, 'Student Ethos', '99.99', 365, 'users', 25, '<p>Free shipping and returns for items weighing 20lbs (9.07kg) or less.</p>', '2022-08-06 16:06:59', '2022-08-06 16:06:59', NULL),
(9, 'Customer Ethos', '89.99', 30, 'customers', 25, '<p>Free shipping and returns for items weighing 20lbs (9.07kg) or less.</p>', '2022-08-06 16:22:02', '2022-08-06 16:22:02', NULL),
(10, 'Corporate Ethos', '1.00', 30, 'customers', 55, '<p>Free shipping and returns for items weighing 20lbs (9.07kg) or less.</p>', '2022-10-05 13:41:57', '2022-10-05 13:47:32', '2022-10-05 13:47:32'),
(11, 'Corporate Ethos', '1599.99', 30, 'customers', 55, '<p>Free shipping and returns for items weighing 20lbs (9.07kg) or less.</p>', '2022-10-05 13:46:30', '2022-10-05 13:46:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `added_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_category` int DEFAULT NULL,
  `sub_sub_category` int DEFAULT NULL,
  `charge_cat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` bigint DEFAULT NULL,
  `unit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty` int NOT NULL DEFAULT '1',
  `refundable` tinyint(1) NOT NULL DEFAULT '1',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_deal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_provider` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT '0',
  `attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `variation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `chart_image` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `purchase_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` int DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `p_type` enum('car','tech','others') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'others',
  `featured_status` tinyint(1) NOT NULL DEFAULT '0',
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `plan_id` int NOT NULL DEFAULT '1',
  `weight` decimal(8,2) DEFAULT '1.00',
  `height` decimal(8,2) DEFAULT '1.00',
  `width` decimal(8,2) DEFAULT '1.00',
  `length` decimal(8,2) DEFAULT '1.00',
  `product_type` tinyint(1) NOT NULL DEFAULT '0',
  `download_url` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` decimal(8,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `sub_category`, `sub_sub_category`, `charge_cat`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `chart_image`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `p_type`, `featured_status`, `extra_data`, `plan_id`, `weight`, `height`, `width`, `length`, `product_type`, `download_url`, `commission`) VALUES
(12, 'seller', 3, 'Apple MacBook Air 13 M1 Chip 8GB 256GB 2020 Model - Gold', 'apple-macbook-air-13-m1-chip-8gb-256gb-2020-model-gold-Xi8oGn', '[{\"id\":\"5\",\"position\":1},{\"id\":\"7\",\"position\":2}]', NULL, NULL, '5', 11, 'kg', 1, 1, '[\"1666864401_44269389.jpg\",\"1666864401_25390491.jpg\",\"1666864401_16748713.jpg\"]', '/storage/app/public/product/1666863741_91620738.png', '1', NULL, NULL, NULL, '[\"#FFD700\",\"#808080\"]', 0, '[\"1\",\"2\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"8GB\"]},{\"name\":\"choice_2\",\"title\":\"Storage\",\"options\":[\"256GB\"]}]', '[{\"type\":\"Gold-8GB-256GB\",\"price\":\"357.00\",\"sku\":\"AMA1MC822M-G-Gold-8GB-256GB\",\"qty\":\"11\"},{\"type\":\"Gray-8GB-256GB\",\"price\":\"357.00\",\"sku\":\"AMA1MC822M-G-Gold-8GB-256GB\",\"qty\":\"11\"}]', 0, NULL, '40.00', '50.00', '8.25', 'percent', '0', 'percent', 22, '<p style=\"text-align: justify; padding-left: 40px;\"><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Apple&rsquo;s thinnest and lightest notebook gets supercharged with the Apple M1 chip. Tackle your projects with the blazing-fast 8-core CPU. Take graphics-intensive apps and games to the next level with the 7-core GPU. And accelerate machine learning tasks with the 16-core Neural Engine. All with a silent, fanless design and the longest battery life ever &mdash; up to 18 hours.&sup1; MacBook Air. Still perfectly portable. Just a lot more powerful.</span><br><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Apple-designed M1 chip for a giant leap in CPU, GPU, and machine learning performance</span><br><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Go longer than ever with up to 18 hours of battery life&sup1;</span><br><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">8-core CPU delivers up to 3.5x faster performance to tackle projects faster than ever&sup2; </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Seven GPU cores with up to 5x faster graphics for graphics-intensive apps and games&sup2; </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">16-core Neural Engine for advanced machine learning </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">8GB of unified memory so everything you do is fast and fluid </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Superfast SSD storage launches apps and opens files in an instant </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Fanless design for silent operation </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">13.3-inch Retina display with P3 wide color for vibrant images and incredible detail&sup3; </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">FaceTime HD camera with advanced image signal processor for clearer, sharper video calls </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Three-microphone array focuses on your voice instead of what&rsquo;s going on around you </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Next-generation Wi-Fi 6 for faster connectivity </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Two Thunderbolt / USB 4 ports for charging and accessories </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">Backlit Magic Keyboard and Touch ID for secure unlock and payments </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">macOS Big Sur introduces a bold new design and major app updates for Safari, Messages, and Maps </span><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">&sup1; Battery life varies by use and configuration. </span></p>\r\n<p style=\"text-align: justify; padding-left: 40px;\"><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">See apple.com/batteries for more information.</span><br><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">&sup2; Compared with previous generation.</span><br><span style=\"font-family: \'trebuchet ms\', geneva, sans-serif; font-size: 18pt;\">&sup3; Display size is measured diagonally</span></p>', 0, NULL, '2022-08-08 14:10:44', '2022-10-27 09:53:21', 0, 'tech', 0, '[]', 1, '2.00', '3.00', '11.60', '10.30', 0, NULL, '8.60'),
(18, 'admin', 1, 'JYBD L19B Portable Wireless Speaker', 'jybd-l19b-portable-wireless-speaker-aAzQI8', '[{\"id\":\"36\",\"position\":1},{\"id\":\"37\",\"position\":2}]', NULL, NULL, '36', 4, 'lbs', 1, 1, '[\"1662001787_31460551.png\",\"1662001788_28651985.png\",\"1662001788_65768889.png\"]', '/storage/app/public/product/1662001789_52082749.png', NULL, NULL, NULL, NULL, '[\"#000000\",\"#00008B\",\"#FF0000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":48.69,\"sku\":\"JLPWS-Black\",\"qty\":\"1\"},{\"type\":\"DarkBlue\",\"price\":48.69,\"sku\":\"JLPWS-DarkBlue\",\"qty\":\"15\"},{\"type\":\"Red\",\"price\":48.69,\"sku\":\"JLPWS-Red\",\"qty\":\"1\"}]', 0, NULL, '48.69', '48.69', '8.25', 'percent', '0', 'flat', 17, '<p class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">JYBD L19B Portable Bluetooth Wireless Speaker gives you the best filtered sound for the sound of your best music. It comes with huge and amazing stereo sound with advanced Bluetooth 5.0 + EDR. The Bluetooth Wireless Speaker is portable and comes with an Ultra Bass boost sound system with battery life of up to 1700mA combine and has a hands-free device capability.</span></p>\r\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal;\"><strong><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Features:</span></strong></p>\r\n<ul type=\"disc\">\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Brand by Sand Dunes</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Material Type: Metal + ABS</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Bluetooth Version 5.0</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Built-in rechargeable 1700mA battery</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Last up to 12hrs with playback</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Comes with a built-in microphone for hands-free speakers and pairs easily with phone calling</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Connection Type: Via Bluetooth, AUX, and USB</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Comes with memory card support</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Frequency Range: 60Hz-23KHz</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Transmission Distance: &le;10M</span></li>\r\n<li class=\"MsoNormal\" style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',serif; mso-fareast-font-family: \'Times New Roman\';\">Warranty: 1 Year Manufacturer&rsquo;s Warranty</span></li>\r\n</ul>', 0, NULL, '2022-09-01 03:09:49', '2022-10-22 17:06:05', 1, 'others', 1, NULL, 1, '0.70', '88.00', '90.00', '195.00', 0, NULL, '5.22'),
(19, 'admin', 1, 'Kids Woven Dress', 'kids-woven-dress-4uoLJB', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"101\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662028234_37437070.jpg\",\"1662028234_41417617.jpg\",\"1662028234_67878836.jpg\",\"1662028234_92832111.jpg\"]', '/storage/app/public/product/1662028234_83545594.jpg', NULL, NULL, NULL, NULL, '[\"#FF4500\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"9-12months\",\"    18-24months\",\"    2-3years\",\"    3-4years\",\"    4-5years\"]}]', '[{\"type\":\"OrangeRed-9-12months\",\"price\":19.49,\"sku\":\"KWD-OrangeRed-9-12months\",\"qty\":\"1\"},{\"type\":\"OrangeRed-18-24months\",\"price\":19.49,\"sku\":\"KWD-OrangeRed-18-24months\",\"qty\":\"1\"},{\"type\":\"OrangeRed-2-3years\",\"price\":19.49,\"sku\":\"KWD-OrangeRed-2-3years\",\"qty\":\"1\"},{\"type\":\"OrangeRed-3-4years\",\"price\":19.49,\"sku\":\"KWD-OrangeRed-3-4years\",\"qty\":\"1\"},{\"type\":\"OrangeRed-4-5years\",\"price\":19.49,\"sku\":\"KWD-OrangeRed-4-5years\",\"qty\":\"1\"}]', 0, NULL, '19.49', '19.49', '8.25', 'percent', '0', 'flat', 5, '<p>Beautiful Children&rsquo;s Woven Dress designed for little Girl.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Red, Golden Yellow Top</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress</p>', 0, NULL, '2022-09-01 10:30:35', '2022-09-26 16:14:15', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '2.43'),
(20, 'admin', 1, 'Boss Babe Woven Top', 'boss-babe-woven-top-Lc23cX', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662029735_30943139.jpg\",\"1662029735_51460734.jpg\",\"1662029735_23443113.jpg\"]', '/storage/app/public/product/1662029735_44971353.jpg', NULL, NULL, NULL, NULL, '[\"#000000\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"  M\",\"  L\",\"  XL\"]}]', '[{\"type\":\"Black-S\",\"price\":19.69,\"sku\":\"BBWT-Black-S\",\"qty\":\"1\"},{\"type\":\"Black-M\",\"price\":19.69,\"sku\":\"BBWT-Black-M\",\"qty\":\"1\"},{\"type\":\"Black-L\",\"price\":19.69,\"sku\":\"BBWT-Black-L\",\"qty\":\"1\"},{\"type\":\"Black-XL\",\"price\":19.69,\"sku\":\"BBWT-Black-XL\",\"qty\":\"1\"}]', 0, NULL, '19.69', '19.69', '8.25', 'percent', '0', 'flat', 4, '<p>Beautiful Boss Babe Woven Top designed for Women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Black</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season&rsquo;s dress, casual and informal top</p>', 0, NULL, '2022-09-01 10:55:35', '2022-09-26 16:13:02', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '2.46'),
(21, 'admin', 1, 'Little Boss Babe Woven Top', 'little-boss-babe-woven-top-Y9wlg2', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"101\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662030442_93947275.jpg\",\"1662030442_93045431.jpg\",\"1662030442_69295672.jpg\"]', '/storage/app/public/product/1662030442_74682449.jpg', NULL, NULL, NULL, NULL, '[\"#000000\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"9-12months\",\"    18-24months\",\"    2-3years\",\"    4-5years\",\"    6-7years\",\"    8-9years\"]}]', '[{\"type\":\"Black-9-12months\",\"price\":18.29,\"sku\":\"LBBWT-Black-9-12months\",\"qty\":\"1\"},{\"type\":\"Black-18-24months\",\"price\":18.29,\"sku\":\"LBBWT-Black-18-24months\",\"qty\":\"1\"},{\"type\":\"Black-2-3years\",\"price\":18.29,\"sku\":\"LBBWT-Black-2-3years\",\"qty\":\"1\"},{\"type\":\"Black-4-5years\",\"price\":18.29,\"sku\":\"LBBWT-Black-4-5years\",\"qty\":\"1\"},{\"type\":\"Black-6-7years\",\"price\":18.29,\"sku\":\"LBBWT-Black-6-7years\",\"qty\":\"1\"},{\"type\":\"Black-8-9years\",\"price\":18.29,\"sku\":\"LBBWT-Black-8-9years\",\"qty\":\"1\"}]', 0, NULL, '18.29', '18.29', '8.25', 'percent', '0', 'flat', 6, '<p>Beautiful Children&rsquo;s Little Boss Babe Woven Top designed for Girl.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Black</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season&rsquo;s dress, casual and informal top</p>', 0, NULL, '2022-09-01 11:07:22', '2022-09-26 16:07:28', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '2.24'),
(22, 'admin', 1, 'Short Sleeve V-Neck Lace Mini Dress', 'sleeveless-lace-mini-dress-zrDeOT', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662040017_23014662.png\",\"1662435708_14080921.png\",\"1662435709_1166598.png\"]', '/storage/app/public/product/1662040017_97456107.png', NULL, NULL, NULL, NULL, '[\"#000000\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"      M\",\"      L\"]}]', '[{\"type\":\"Black-S\",\"price\":37.59,\"sku\":\"SSVLMD-Black-S\",\"qty\":\"1\"},{\"type\":\"Black-M\",\"price\":37.59,\"sku\":\"SSVLMD-Black-M\",\"qty\":\"1\"},{\"type\":\"Black-L\",\"price\":37.59,\"sku\":\"SSVLMD-Black-L\",\"qty\":\"1\"}]', 0, NULL, '37.59', '37.59', '8.25', 'percent', '0', 'flat', 3, '<p>Beautiful Short Sleeve V-Neck Lace Mini Dress for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Black</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, party, and formal dress</p>', 0, NULL, '2022-09-01 13:46:58', '2022-09-26 16:06:45', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '5.32'),
(23, 'admin', 1, 'Red Buffalo Plaid Tartan Swing Dress', 'red-buffalo-plaid-tartan-swing-dress-NNYwQv', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"73\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662041657_45101881.png\",\"1662041657_41168948.png\",\"1662041658_15954930.png\",\"1662041658_44155615.png\"]', '/storage/app/public/product/1662041659_49127280.png', NULL, NULL, NULL, NULL, '[\"#8B0000\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"      M\",\"      L\"]}]', '[{\"type\":\"DarkRed-S\",\"price\":53.69,\"sku\":\"RBPTSD-DarkRed-S\",\"qty\":\"1\"},{\"type\":\"DarkRed-M\",\"price\":53.69,\"sku\":\"RBPTSD-DarkRed-M\",\"qty\":\"1\"},{\"type\":\"DarkRed-L\",\"price\":53.69,\"sku\":\"RBPTSD-DarkRed-L\",\"qty\":\"1\"}]', 0, NULL, '53.69', '53.69', '8.25', 'percent', '0', 'flat', 3, '<p>Classy Red Buffalo Plaid Tartan Swing Dress designed for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Red, Black</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, formal wear, casual and informal</p>', 0, NULL, '2022-09-01 14:14:19', '2022-10-22 17:04:46', 1, 'others', 1, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '7.90'),
(24, 'admin', 1, 'Tie Lace Embroidered Jumpsuit', 'tie-lace-embroidered-jumpsuit-OB1sb5', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"72\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662130610_14749656.png\",\"1662130610_78680924.png\",\"1662130611_60158277.png\",\"1662130611_75609524.png\"]', '/storage/app/public/product/1662130612_73715984.png', NULL, NULL, NULL, NULL, '[\"#FFB6C1\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"  M\",\"  L\"]}]', '[{\"type\":\"LightPink-S\",\"price\":36.89,\"sku\":\"TLEJ-LightPink-S\",\"qty\":\"1\"},{\"type\":\"LightPink-M\",\"price\":36.89,\"sku\":\"TLEJ-LightPink-M\",\"qty\":\"1\"},{\"type\":\"LightPink-L\",\"price\":36.89,\"sku\":\"TLEJ-LightPink-L\",\"qty\":\"1\"}]', 0, NULL, '36.89', '36.89', '8.25', 'percent', '0', 'flat', 3, '<p>Gorgeous Tie Lace Embroidered Jumpsuit for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Light Pink</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, party, informal and formal dress</p>', 0, NULL, '2022-09-02 14:56:52', '2022-09-26 16:03:17', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '5.21'),
(25, 'admin', 1, 'Gold Sequins Bodice Jumpsuit', 'gold-sequins-bodice-jumpsuit-3l6NQ8', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"72\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662131626_86848011.png\",\"1662131627_26578128.png\",\"1662131627_74139250.png\"]', '/storage/app/public/product/1662131627_28040563.png', NULL, NULL, NULL, NULL, '[\"#006400\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"M\",\"  L\"]}]', '[{\"type\":\"DarkGreen-M\",\"price\":89.79,\"sku\":\"GSBJ-DarkGreen-M\",\"qty\":\"1\"},{\"type\":\"DarkGreen-L\",\"price\":89.79,\"sku\":\"GSBJ-DarkGreen-L\",\"qty\":\"1\"}]', 0, NULL, '89.79', '89.79', '8.25', 'percent', '0', 'flat', 2, '<p>Gorgeous Gold Sequins Bodice Jumpsuit for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Dark Green</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, party, informal and formal dress</p>', 0, NULL, '2022-09-02 15:13:48', '2022-10-22 17:04:29', 1, 'others', 1, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '13.68'),
(26, 'admin', 1, 'Valentine Shiny Lining Pattern Jumpsuit', 'valentine-shiny-lining-pattern-jumpsuit-am1bbo', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"72\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662134224_27062981.png\",\"1662134224_88111892.png\",\"1662134225_40535588.png\",\"1662134225_88702868.png\"]', '/storage/app/public/product/1662134225_35983915.png', NULL, NULL, NULL, NULL, '[\"#8B0000\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"M\",\"  L\"]}]', '[{\"type\":\"DarkRed-M\",\"price\":85.99,\"sku\":\"VSLPJ-DarkRed-M\",\"qty\":\"1\"},{\"type\":\"DarkRed-L\",\"price\":85.99,\"sku\":\"VSLPJ-DarkRed-L\",\"qty\":\"1\"}]', 0, NULL, '85.99', '85.99', '8.25', 'percent', '0', 'flat', 2, '<p>Gorgeous Valentine Shiny Lining Pattern Jumpsuit for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Burgundy</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, party, informal and formal dress</p>', 0, NULL, '2022-09-02 15:57:06', '2022-10-22 17:00:03', 1, 'others', 1, NULL, 1, '2.00', NULL, NULL, NULL, 0, NULL, '13.07'),
(27, 'admin', 1, 'Sheer Mesh Contrasted Bodice Jumpsuit', 'sheer-mesh-contrasted-bodice-jumpsuit-RC3R5f', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"72\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662135985_41499163.png\",\"1662135986_31807233.png\",\"1662135986_43077064.png\",\"1662135986_29160865.png\"]', '/storage/app/public/product/1662135987_79320616.png', NULL, NULL, NULL, NULL, '[\"#E9967A\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"M\",\"  L\"]}]', '[{\"type\":\"DarkSalmon-M\",\"price\":77.69,\"sku\":\"SMCBJ-DarkSalmon-M\",\"qty\":\"1\"},{\"type\":\"DarkSalmon-L\",\"price\":77.69,\"sku\":\"SMCBJ-DarkSalmon-L\",\"qty\":\"1\"}]', 0, NULL, '77.69', '77.69', '8.25', 'percent', '0', 'flat', 2, '<p>Gorgeous Sheer Mesh Contrasted Bodice Jumpsuit for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Dark Salmon</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, party, informal and formal dress</p>', 0, NULL, '2022-09-02 16:26:27', '2022-10-22 17:01:53', 1, 'others', 1, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '11.74'),
(28, 'admin', 1, 'Iris High-Low Mini Dress', 'iris-high-low-mini-dress-NrTYbQ', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"73\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662146666_2359463.png\",\"1662146667_38272510.png\",\"1662146667_28907779.png\"]', '/storage/app/public/product/1662146668_97463180.png', NULL, NULL, NULL, NULL, '[\"#BC8F8F\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"  M\"]}]', '[{\"type\":\"RosyBrown-S\",\"price\":33.99,\"sku\":\"IHMD-RosyBrown-S\",\"qty\":\"1\"},{\"type\":\"RosyBrown-M\",\"price\":33.99,\"sku\":\"IHMD-RosyBrown-M\",\"qty\":\"1\"}]', 0, NULL, '33.99', '33.99', '8.25', 'percent', '0', 'flat', 2, '<p>Gorgeous Iris High-Low Mini Dress for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Rossy Brown</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, party, informal and formal dress</p>', 0, NULL, '2022-09-02 19:24:28', '2022-09-26 15:49:32', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '4.75'),
(29, 'admin', 1, 'Crossover Front Mini Dress', 'crossover-front-mini-dress-6LjbZU', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"73\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662148475_25981694.png\",\"1662148475_10879082.png\",\"1662148476_59732952.png\",\"1662148476_19002360.png\"]', '/storage/app/public/product/1662148477_3653575.png', NULL, NULL, NULL, NULL, '[\"#FF0000\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"  M\"]}]', '[{\"type\":\"Red-S\",\"price\":45.99,\"sku\":\"CFMD-Red-S\",\"qty\":\"1\"},{\"type\":\"Red-M\",\"price\":45.99,\"sku\":\"CFMD-Red-M\",\"qty\":\"1\"}]', 0, NULL, '45.99', '45.99', '8.25', 'percent', '0', 'flat', 2, '<p>Gorgeous Crossover Front Mini Dress for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Red</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, party, informal and formal dress</p>', 0, NULL, '2022-09-02 19:54:37', '2022-09-26 15:47:11', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '6.67'),
(30, 'admin', 1, 'Long Sleeve Square Neck Mini Dress', 'long-sleeve-square-neck-mini-dress-KTE8sf', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"73\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662150148_72457080.png\",\"1662150150_88475194.png\",\"1662334226_82189288.png\",\"1662334227_83868812.png\"]', '/storage/app/public/product/1662150150_2052085.png', NULL, NULL, NULL, NULL, '[\"#000000\",\"#2d667e\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"M\",\"          L\"]}]', '[{\"type\":\"Black-M\",\"price\":54.39,\"sku\":\"LSSNMD-Black-M\",\"qty\":\"1\"},{\"type\":\"Black-L\",\"price\":54.39,\"sku\":\"LSSNMD-Black-L\",\"qty\":\"1\"},{\"type\":\"BlueGreen-M\",\"price\":54.39,\"sku\":\"LSSNMD-BlueGreen-M\",\"qty\":\"1\"},{\"type\":\"BlueGreen-L\",\"price\":54.39,\"sku\":\"LSSNMD-BlueGreen-L\",\"qty\":\"1\"}]', 0, NULL, '54.39', '54.39', '8.25', 'percent', '0', 'flat', 4, '<p>Gorgeous Long Sleeve Square Neck Mini Dress for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Black, Dark Green</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, party, and formal dress</p>', 0, NULL, '2022-09-02 20:22:30', '2022-09-26 15:42:36', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '8.01'),
(31, 'admin', 1, 'Waist Tie Maxi Dress', 'waist-tie-maxi-dress-GSZL1r', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"73\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662152428_90704901.png\",\"1662152428_43167815.png\",\"1662152429_80389020.png\",\"1662152429_41214126.png\"]', '/storage/app/public/product/1662152429_92903633.png', NULL, NULL, NULL, NULL, '[\"#00008B\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\"]}]', '[{\"type\":\"DarkBlue-S\",\"price\":32.99,\"sku\":\"WTMD-DarkBlue-S\",\"qty\":\"1\"}]', 0, NULL, '32.99', '32.99', '8.25', 'percent', '0', 'flat', 1, '<p>Beautiful Waist Tie Maxi Dress for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Dark Blue</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, casual, informal and formal dress</p>', 0, NULL, '2022-09-02 21:00:30', '2022-10-22 16:58:11', 1, 'others', 1, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '4.59'),
(32, 'admin', 1, 'Dyed Hand-Tied Printed Romper', 'dyed-hand-tied-printed-romper-pJveEL', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"74\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662153905_10168577.png\",\"1662153905_96679154.png\",\"1662153906_32777400.png\",\"1662153906_8656895.png\"]', '/storage/app/public/product/1662153907_11953215.png', NULL, NULL, NULL, NULL, '[\"#008000\",\"#FAFAD2\",\"#ff66cc\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"        M\",\"        L\"]}]', '[{\"type\":\"Green-S\",\"price\":21.49,\"sku\":\"DHPR-Green-S\",\"qty\":\"1\"},{\"type\":\"Green-M\",\"price\":21.49,\"sku\":\"DHPR-Green-M\",\"qty\":\"1\"},{\"type\":\"Green-L\",\"price\":21.49,\"sku\":\"DHPR-Green-L\",\"qty\":\"1\"},{\"type\":\"LightGoldenrodYellow-S\",\"price\":21.49,\"sku\":\"DHPR-LightGoldenrodYellow-S\",\"qty\":\"1\"},{\"type\":\"LightGoldenrodYellow-M\",\"price\":21.49,\"sku\":\"DHPR-LightGoldenrodYellow-M\",\"qty\":\"1\"},{\"type\":\"LightGoldenrodYellow-L\",\"price\":21.49,\"sku\":\"DHPR-LightGoldenrodYellow-L\",\"qty\":\"1\"},{\"type\":\"RosePink-S\",\"price\":21.49,\"sku\":\"DHPR-RosePink-S\",\"qty\":\"1\"},{\"type\":\"RosePink-M\",\"price\":21.49,\"sku\":\"DHPR-RosePink-M\",\"qty\":\"1\"},{\"type\":\"RosePink-L\",\"price\":21.49,\"sku\":\"DHPR-RosePink-L\",\"qty\":\"1\"}]', 0, NULL, '21.49', '21.49', '8.25', 'percent', '0', 'flat', 9, '<p>Beautiful Romper for women.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Yellow, Light Green, Rose Pink</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All seasons, casual and informal dress</p>', 0, NULL, '2022-09-02 21:25:07', '2022-09-26 15:37:55', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '2.75'),
(36, 'admin', 1, 'Girls Embroidered Flower Long Dress', 'girls-embroidered-flower-long-dress-f7Jegp', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"100\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662522802_97120432.png\",\"1662522802_21048376.png\",\"1662522802_64083688.png\",\"1662522803_81830692.png\"]', '/storage/app/public/product/1662522803_83669605.png', NULL, NULL, NULL, NULL, '[\"#f7e7ce\",\"#FFB6C1\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"5-6years\",\"  7-8years\",\"  11-12years\",\"  12-13years\",\"  13-14years\"]}]', '[{\"type\":\"Champagne-5-6years\",\"price\":67.89,\"sku\":\"GEFLD-Champagne-5-6years\",\"qty\":\"1\"},{\"type\":\"Champagne-7-8years\",\"price\":67.89,\"sku\":\"GEFLD-Champagne-7-8years\",\"qty\":\"1\"},{\"type\":\"Champagne-11-12years\",\"price\":67.89,\"sku\":\"GEFLD-Champagne-11-12years\",\"qty\":\"1\"},{\"type\":\"Champagne-12-13years\",\"price\":67.89,\"sku\":\"GEFLD-Champagne-12-13years\",\"qty\":\"1\"},{\"type\":\"Champagne-13-14years\",\"price\":67.89,\"sku\":\"GEFLD-Champagne-13-14years\",\"qty\":\"1\"},{\"type\":\"LightPink-5-6years\",\"price\":67.89,\"sku\":\"GEFLD-LightPink-5-6years\",\"qty\":\"1\"},{\"type\":\"LightPink-7-8years\",\"price\":67.89,\"sku\":\"GEFLD-LightPink-7-8years\",\"qty\":\"1\"},{\"type\":\"LightPink-11-12years\",\"price\":67.89,\"sku\":\"GEFLD-LightPink-11-12years\",\"qty\":\"1\"},{\"type\":\"LightPink-12-13years\",\"price\":67.89,\"sku\":\"GEFLD-LightPink-12-13years\",\"qty\":\"1\"},{\"type\":\"LightPink-13-14years\",\"price\":67.89,\"sku\":\"GEFLD-LightPink-13-14years\",\"qty\":\"1\"}]', 0, NULL, '67.89', '67.89', '8.25', 'percent', '0', 'flat', 10, '<p>Beautiful Children\'s Embroidered Flower Long Dress designed for girl kids.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Pink, Champagne</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season&rsquo;s party dress, wedding party dress, and formal dress</p>', 0, NULL, '2022-09-07 03:53:24', '2022-10-22 16:59:17', 1, 'others', 1, NULL, 1, '1.30', NULL, NULL, NULL, 0, NULL, '10.17');
INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `sub_category`, `sub_sub_category`, `charge_cat`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `chart_image`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `p_type`, `featured_status`, `extra_data`, `plan_id`, `weight`, `height`, `width`, `length`, `product_type`, `download_url`, `commission`) VALUES
(37, 'admin', 1, 'Mesh Printed Lace Dress', 'mesh-printed-lace-dress-Rp0LlF', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"100\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662526952_38472496.png\",\"1662526953_90436884.png\",\"1662526953_97378978.png\",\"1662526954_23563199.png\"]', '/storage/app/public/product/1662526954_39574846.png', NULL, NULL, NULL, NULL, '[\"#FFB6C1\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"0-3months\",\"    3-6months\",\"    6-9months\",\"    9-12months\",\"    12-18months\",\"    18-24months\"]}]', '[{\"type\":\"LightPink-0-3months\",\"price\":29.99,\"sku\":\"MPLD-LightPink-0-3months\",\"qty\":\"1\"},{\"type\":\"LightPink-3-6months\",\"price\":29.99,\"sku\":\"MPLD-LightPink-3-6months\",\"qty\":\"1\"},{\"type\":\"LightPink-6-9months\",\"price\":29.99,\"sku\":\"MPLD-LightPink-6-9months\",\"qty\":\"1\"},{\"type\":\"LightPink-9-12months\",\"price\":29.99,\"sku\":\"MPLD-LightPink-9-12months\",\"qty\":\"1\"},{\"type\":\"LightPink-12-18months\",\"price\":29.99,\"sku\":\"MPLD-LightPink-12-18months\",\"qty\":\"1\"},{\"type\":\"LightPink-18-24months\",\"price\":29.99,\"sku\":\"MPLD-LightPink-18-24months\",\"qty\":\"1\"}]', 0, NULL, '29.99', '29.99', '8.25', 'percent', '0', 'flat', 6, '<p>Beautiful Children&rsquo;s Mesh Printed Lace Dress designed for infants and toddler girls.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Pink</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Infants and Toddler Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season&rsquo;s dress, Kids party and formal dress</p>', 0, NULL, '2022-09-07 05:02:34', '2022-09-26 15:36:06', 1, 'others', 0, NULL, 1, '0.50', NULL, NULL, NULL, 0, NULL, '4.11'),
(38, 'admin', 1, 'Printed Cotton and Lace Long Sleeve Dress', 'printed-cotton-and-lace-long-sleeve-dress-RlBt23', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"100\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662528612_92272427.png\",\"1662528612_6907314.png\",\"1662528613_27773988.png\"]', '/storage/app/public/product/1662528613_25454428.png', NULL, NULL, NULL, NULL, '[\"#FFB6C1\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"2-3years\",\"  3-4years\",\"  4-5years\",\"  5-6years\",\"  6-7years\"]}]', '[{\"type\":\"LightPink-2-3years\",\"price\":26.87,\"sku\":\"LSPCaLD-LightPink-2-3years\",\"qty\":\"1\"},{\"type\":\"LightPink-3-4years\",\"price\":26.87,\"sku\":\"LSPCaLD-LightPink-3-4years\",\"qty\":\"1\"},{\"type\":\"LightPink-4-5years\",\"price\":26.87,\"sku\":\"LSPCaLD-LightPink-4-5years\",\"qty\":\"1\"},{\"type\":\"LightPink-5-6years\",\"price\":26.87,\"sku\":\"LSPCaLD-LightPink-5-6years\",\"qty\":\"1\"},{\"type\":\"LightPink-6-7years\",\"price\":26.87,\"sku\":\"LSPCaLD-LightPink-6-7years\",\"qty\":\"1\"}]', 0, NULL, '26.87', '26.87', '8.25', 'percent', '0', 'flat', 5, '<p>Beautiful Children&rsquo;s Long Sleeve Printed Cotton and Lace Dress designed for infants, toddlers, and older girls.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Pink</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season&rsquo;s party dress, casual and informal dress</p>', 0, NULL, '2022-09-07 05:30:13', '2022-09-26 15:34:06', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '3.61'),
(39, 'admin', 1, 'Boys Solid Color Denim Jeans', 'boys-solid-color-denim-jeans-MH92Ju', '[{\"id\":\"30\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"92\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662557463_94672738.png\",\"1662557464_8426045.png\",\"1662557464_73728656.png\",\"1662557465_48691716.png\"]', '/storage/app/public/product/1662557465_4253473.png', NULL, NULL, NULL, NULL, '[\"#0000FF\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"2-3years\",\"  3-4years\",\"  4-5years\",\"  5-6years\",\"  7-8years\",\"  9-10years\"]}]', '[{\"type\":\"Blue-2-3years\",\"price\":35.89,\"sku\":\"BSCDJ-Blue-2-3years\",\"qty\":\"2\"},{\"type\":\"Blue-3-4years\",\"price\":35.89,\"sku\":\"BSCDJ-Blue-3-4years\",\"qty\":\"1\"},{\"type\":\"Blue-4-5years\",\"price\":35.89,\"sku\":\"BSCDJ-Blue-4-5years\",\"qty\":\"2\"},{\"type\":\"Blue-5-6years\",\"price\":35.89,\"sku\":\"BSCDJ-Blue-5-6years\",\"qty\":\"1\"},{\"type\":\"Blue-7-8years\",\"price\":35.89,\"sku\":\"BSCDJ-Blue-7-8years\",\"qty\":\"2\"},{\"type\":\"Blue-9-10years\",\"price\":35.89,\"sku\":\"BSCDJ-Blue-9-10years\",\"qty\":\"2\"}]', 0, NULL, '35.89', '35.89', '8.25', 'percent', '0', 'flat', 10, '<p>Beautiful Children&rsquo;s Solid Color Denim Jeans designed for toddlers and older boys.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Blue</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Boys</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, casual and informal</p>', 0, NULL, '2022-09-07 13:31:06', '2022-10-22 17:00:20', 1, 'others', 1, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '5.05'),
(40, 'admin', 1, 'Pattern Designed Knit Hoodies', 'pattern-designed-knit-hoodies-a2IlQO', '[{\"id\":\"30\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"104\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662560162_5261534.png\",\"1662560162_69201278.png\",\"1662560163_47292959.png\",\"1662560163_35028412.png\"]', '/storage/app/public/product/1662560164_37671367.png', NULL, NULL, NULL, NULL, '[\"#000000\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"4-5years\"]}]', '[{\"type\":\"Black-4-5years\",\"price\":36.29,\"sku\":\"PDKH-Black-4-5years\",\"qty\":\"1\"}]', 0, NULL, '36.29', '36.29', '8.25', 'percent', '0', 'flat', 1, '<p>Beautiful Children&rsquo;s Solid Pattern Designed Knit Hoodies for toddlers, and older boys.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Black, Brown</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Boys</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, casual and informal</p>', 0, NULL, '2022-09-07 14:16:04', '2022-10-22 16:59:30', 1, 'others', 1, NULL, 1, '1.20', NULL, NULL, NULL, 0, NULL, '5.12'),
(41, 'admin', 1, 'Kids Printed Stripe Outfit for School and Home Use', 'kids-printed-stripe-outfit-for-school-and-home-use-1Pfzq2', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"100\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662656175_90695133.png\",\"1662656175_71046118.png\",\"1662656176_82870404.png\",\"1662656177_29350571.png\"]', '/storage/app/public/product/1662656177_64000306.png', NULL, NULL, NULL, NULL, '[\"#00008B\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"2-3years\",\"  3-4years\",\"  4-5years\",\"  5-6years\",\"  6-7years\"]}]', '[{\"type\":\"DarkBlue-2-3years\",\"price\":27.45,\"sku\":\"KPSOfSaHU-DarkBlue-2-3years\",\"qty\":\"1\"},{\"type\":\"DarkBlue-3-4years\",\"price\":27.45,\"sku\":\"KPSOfSaHU-DarkBlue-3-4years\",\"qty\":\"1\"},{\"type\":\"DarkBlue-4-5years\",\"price\":27.45,\"sku\":\"KPSOfSaHU-DarkBlue-4-5years\",\"qty\":\"1\"},{\"type\":\"DarkBlue-5-6years\",\"price\":27.45,\"sku\":\"KPSOfSaHU-DarkBlue-5-6years\",\"qty\":\"1\"},{\"type\":\"DarkBlue-6-7years\",\"price\":27.45,\"sku\":\"KPSOfSaHU-DarkBlue-6-7years\",\"qty\":\"1\"}]', 0, NULL, '27.45', '27.45', '8.25', 'percent', '0', 'flat', 5, '<p>Beautiful Children&rsquo;s Solid Printed Stripe Outfit for Schools and Home use designed for toddlers, and older girls.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: White and Blue Stripes</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, for school uniform and home use, casual and informal</p>', 0, NULL, '2022-09-08 16:56:18', '2022-10-23 22:21:49', 1, 'others', 1, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '3.70'),
(42, 'admin', 1, 'Boys Set of Sweat Pant and Top', 'boys-set-of-sweat-pant-and-top-JRq9mG', '[{\"id\":\"30\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"105\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662661223_18554826.png\",\"1662661223_25479652.png\",\"1662661224_25156621.png\",\"1662661224_86186574.png\"]', '/storage/app/public/product/1662661224_8657803.png', NULL, NULL, NULL, NULL, '[\"#FFD700\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"18-24months\",\"  2-3years\",\"  3-4years\",\"  4-5years\"]}]', '[{\"type\":\"Gold-18-24months\",\"price\":25.9,\"sku\":\"BSoSPaT-Gold-18-24months\",\"qty\":\"1\"},{\"type\":\"Gold-2-3years\",\"price\":25.9,\"sku\":\"BSoSPaT-Gold-2-3years\",\"qty\":\"1\"},{\"type\":\"Gold-3-4years\",\"price\":25.9,\"sku\":\"BSoSPaT-Gold-3-4years\",\"qty\":\"1\"},{\"type\":\"Gold-4-5years\",\"price\":25.9,\"sku\":\"BSoSPaT-Gold-4-5years\",\"qty\":\"1\"}]', 0, NULL, '25.99', '25.99', '8.25', 'percent', '0', 'flat', 4, '<p>Strong and Solid Boys&rsquo; Set of Sweat Pant and Top designed for toddlers, and older boys.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Black and Gold</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Boys</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, casual and informal</p>', 0, NULL, '2022-09-08 18:20:25', '2022-09-26 15:30:27', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '3.47'),
(43, 'admin', 1, 'Plain Self Tie Maternity Gown', 'plain-self-tie-maternity-gown-NiSA9g', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"73\",\"position\":3}]', NULL, NULL, '9', 4, 'lbs', 1, 1, '[\"1662662449_58150482.png\",\"1662662450_31676432.png\"]', '/storage/app/public/product/1662662450_27544273.png', NULL, NULL, NULL, NULL, '[\"#00008B\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"M\",\"  L\"]}]', '[{\"type\":\"DarkBlue-M\",\"price\":24.87,\"sku\":\"PSTMG-DarkBlue-M\",\"qty\":\"1\"},{\"type\":\"DarkBlue-L\",\"price\":24.87,\"sku\":\"PSTMG-DarkBlue-L\",\"qty\":\"1\"}]', 0, NULL, '24.87', '24.87', '8.25', 'percent', '0', 'flat', 2, '<p>Beautiful Self Tie Maternity Gown designed for women, and pregnant moms.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Dark Blue</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Women</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, casual and informal</p>', 0, NULL, '2022-09-08 18:40:50', '2022-09-26 15:29:44', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '3.29'),
(44, 'admin', 1, 'New York Printed Sweat Pant', 'new-york-printed-sweat-pant-HXmYwl', '[{\"id\":\"30\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"105\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662664632_76688083.png\",\"1662664632_9081381.png\"]', '/storage/app/public/product/1662664633_27947858.png', NULL, NULL, NULL, NULL, '[\"#00008B\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"18-24months\",\"      2-3yrs\",\"      3-4yrs\",\"      4-5yrs\",\"      6-7yrs\",\"      7-8yrs\"]}]', '[{\"type\":\"DarkBlue-18-24months\",\"price\":15.9,\"sku\":\"NYPSP-DarkBlue-18-24months\",\"qty\":\"1\"},{\"type\":\"DarkBlue-2-3yrs\",\"price\":15.9,\"sku\":\"NYPSP-DarkBlue-2-3yrs\",\"qty\":\"1\"},{\"type\":\"DarkBlue-3-4yrs\",\"price\":15.9,\"sku\":\"NYPSP-DarkBlue-3-4yrs\",\"qty\":\"1\"},{\"type\":\"DarkBlue-4-5yrs\",\"price\":15.9,\"sku\":\"NYPSP-DarkBlue-4-5yrs\",\"qty\":\"1\"},{\"type\":\"DarkBlue-6-7yrs\",\"price\":15.9,\"sku\":\"NYPSP-DarkBlue-6-7yrs\",\"qty\":\"1\"},{\"type\":\"DarkBlue-7-8yrs\",\"price\":15.9,\"sku\":\"NYPSP-DarkBlue-7-8yrs\",\"qty\":\"1\"}]', 0, NULL, '15.90', '15.90', '8.25', 'percent', '0', 'flat', 6, '<p>Beautiful Children&rsquo;s New York Printed Sweat Pant designed for toddlers and older kids.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Dark Blue</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Boys</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, casual and informal</p>', 0, NULL, '2022-09-08 19:17:13', '2022-09-26 15:28:54', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '1.85'),
(45, 'admin', 1, 'Summer Printed Set of Sweat Pant and Hoody Top', 'summer-printed-set-of-sweat-pant-and-hoody-top-Hnt3xR', '[{\"id\":\"30\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"105\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662665995_40115395.png\",\"1662665996_37112467.png\",\"1662665996_25082222.png\",\"1662665997_46730148.png\"]', '/storage/app/public/product/1662665997_12900924.png', NULL, NULL, NULL, NULL, '[\"#000000\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"18-24months\",\"  2-3yrs\",\"  3-4yrs\",\"  4-5yrs\",\"  5-6yrs\"]}]', '[{\"type\":\"Black-18-24months\",\"price\":27.89,\"sku\":\"SPSoSPaHT-Black-18-24months\",\"qty\":\"1\"},{\"type\":\"Black-2-3yrs\",\"price\":27.89,\"sku\":\"SPSoSPaHT-Black-2-3yrs\",\"qty\":\"1\"},{\"type\":\"Black-3-4yrs\",\"price\":27.89,\"sku\":\"SPSoSPaHT-Black-3-4yrs\",\"qty\":\"1\"},{\"type\":\"Black-4-5yrs\",\"price\":27.89,\"sku\":\"SPSoSPaHT-Black-4-5yrs\",\"qty\":\"1\"},{\"type\":\"Black-5-6yrs\",\"price\":27.89,\"sku\":\"SPSoSPaHT-Black-5-6yrs\",\"qty\":\"1\"}]', 0, NULL, '27.89', '27.89', '8.25', 'percent', '0', 'flat', 5, '<p>Beautiful Children&rsquo;s Summer Printed Set of Sweat Pant and Hoody Top designed for toddlers and older kids.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Black</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Boys</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, casual and informal</p>', 0, NULL, '2022-09-08 19:39:57', '2022-09-26 15:28:14', 1, 'others', 0, NULL, 1, '1.50', NULL, NULL, NULL, 0, NULL, '3.77'),
(46, 'admin', 1, 'Printed Set of Little Miss Sassy Pants and Hoody Top', 'printed-set-of-little-miss-sassy-pants-and-hoody-top-2ONCIN', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"101\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662668770_74245314.png\",\"1662668770_43610107.png\",\"1662668771_82060405.png\"]', '/storage/app/public/product/1662668771_95700729.png', NULL, NULL, NULL, NULL, '[\"#FFB6C1\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"12-18months\",\"  18-24months\",\"  2-3yrs\",\"  4-5yrs\"]}]', '[{\"type\":\"LightPink-12-18months\",\"price\":23.46,\"sku\":\"PSoLMSPaH-LightPink-12-18months\",\"qty\":\"2\"},{\"type\":\"LightPink-18-24months\",\"price\":23.46,\"sku\":\"PSoLMSPaH-LightPink-18-24months\",\"qty\":\"2\"},{\"type\":\"LightPink-2-3yrs\",\"price\":23.46,\"sku\":\"PSoLMSPaH-LightPink-2-3yrs\",\"qty\":\"2\"},{\"type\":\"LightPink-4-5yrs\",\"price\":23.46,\"sku\":\"PSoLMSPaH-LightPink-4-5yrs\",\"qty\":\"2\"}]', 0, NULL, '23.46', '23.46', '8.25', 'percent', '0', 'flat', 8, '<p>Beautiful Children&rsquo;s Printed Set of Little Miss Sassy Pant and Hoody Top designed for toddlers and older kids.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Pink</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, casual and informal</p>', 0, NULL, '2022-09-08 20:26:12', '2022-09-26 14:23:14', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '3.06'),
(47, 'admin', 1, 'Children\'s 2pcs Printed Outfit', 'childrens-2pcs-printed-outfit-lVdALW', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"100\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662671297_62051602.png\",\"1662671298_15199215.png\",\"1662671298_52839287.png\",\"1662671298_53985484.png\"]', '/storage/app/public/product/1662671299_18103681.png', NULL, NULL, NULL, NULL, '[\"#800020\",\"#006400\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"9-12months\",\"  12-18months\",\"  18-24months\",\"  2-3yrs\",\"  4yrs\"]}]', '[{\"type\":\"Burgundy-9-12months\",\"price\":28.47,\"sku\":\"C2PO-Burgundy-9-12months\",\"qty\":\"1\"},{\"type\":\"Burgundy-12-18months\",\"price\":28.47,\"sku\":\"C2PO-Burgundy-12-18months\",\"qty\":\"1\"},{\"type\":\"Burgundy-18-24months\",\"price\":28.47,\"sku\":\"C2PO-Burgundy-18-24months\",\"qty\":\"1\"},{\"type\":\"Burgundy-2-3yrs\",\"price\":28.47,\"sku\":\"C2PO-Burgundy-2-3yrs\",\"qty\":\"1\"},{\"type\":\"Burgundy-4yrs\",\"price\":28.47,\"sku\":\"C2PO-Burgundy-4yrs\",\"qty\":\"1\"},{\"type\":\"DarkGreen-9-12months\",\"price\":28.47,\"sku\":\"C2PO-DarkGreen-9-12months\",\"qty\":\"1\"},{\"type\":\"DarkGreen-12-18months\",\"price\":28.47,\"sku\":\"C2PO-DarkGreen-12-18months\",\"qty\":\"1\"},{\"type\":\"DarkGreen-18-24months\",\"price\":28.47,\"sku\":\"C2PO-DarkGreen-18-24months\",\"qty\":\"1\"},{\"type\":\"DarkGreen-2-3yrs\",\"price\":28.47,\"sku\":\"C2PO-DarkGreen-2-3yrs\",\"qty\":\"1\"},{\"type\":\"DarkGreen-4yrs\",\"price\":28.47,\"sku\":\"C2PO-DarkGreen-4yrs\",\"qty\":\"1\"}]', 0, NULL, '28.47', '28.47', '8.25', 'percent', '0', 'flat', 10, '<p>Beautiful Children&rsquo;s 2pcs Printed Outfit with Top and strapped sleeve gown designed for infants, toddlers, and older kids.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Dark Green, Burgundy</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, school uniform, home use, casual and informal</p>', 0, NULL, '2022-09-08 21:08:19', '2022-09-26 15:23:08', 1, 'others', 0, NULL, 1, '1.00', NULL, NULL, NULL, 0, NULL, '3.87'),
(48, 'admin', 1, 'Earphone Printed T-Shirt', 'earphone-printed-t-shirt-G5IKNt', '[{\"id\":\"30\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"103\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1662672442_84409919.png\"]', '/storage/app/public/product/1662672443_19985137.png', NULL, NULL, NULL, NULL, '[\"#FFFF00\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"2-3yrs\",\"          4-5yrs\",\"          5-6yrs\",\"          6-7yrs\"]}]', '[{\"type\":\"Yellow-2-3yrs\",\"price\":13.89,\"sku\":\"EPT-Yellow-2-3yrs\",\"qty\":\"1\"},{\"type\":\"Yellow-4-5yrs\",\"price\":13.89,\"sku\":\"EPT-Yellow-4-5yrs\",\"qty\":\"1\"},{\"type\":\"Yellow-5-6yrs\",\"price\":13.89,\"sku\":\"EPT-Yellow-5-6yrs\",\"qty\":\"1\"},{\"type\":\"Yellow-6-7yrs\",\"price\":13.89,\"sku\":\"EPT-Yellow-6-7yrs\",\"qty\":\"1\"}]', 0, NULL, '13.89', '13.89', '8.25', 'percent', '0', 'flat', 4, '<p>Beautiful Earphone Printed T-Shirt designed for toddlers and older kids.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Yellow</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Boys</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season, casual and informal</p>', 0, NULL, '2022-09-08 21:27:23', '2022-10-23 22:21:34', 1, 'others', 0, NULL, 1, '0.50', NULL, NULL, NULL, 0, NULL, '1.53'),
(49, 'admin', 0, 'Demo Product 22', 'demo-product-22-5J7bmn', '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]', NULL, NULL, '1', 4, 'kg', 23, 0, '[\"def.png\"]', '', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=2D-rr4gv3fk', '[]', 0, 'null', '[]', '[]', 0, NULL, '55.00', '59.00', '8.25', 'percent', '10', 'percent', 100, '<p>hhhhh</p>', 0, NULL, NULL, '2022-09-26 16:15:50', 1, 'others', 0, NULL, 1, '1.00', '1.00', '1.00', '1.00', 0, NULL, '4.49'),
(50, 'admin', 0, 'Demo Product 23', 'demo-product-23-Fz2HwN', '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2},{\"id\":\"3\",\"position\":3}]', NULL, NULL, '', 1, 'pc', 33, 0, '[\"def.png\"]', '', NULL, NULL, 'youtube', '', '[]', 0, '[]', '[]', '[]', 0, NULL, '55.00', '59.00', '5', NULL, '10', 'percent', 100, 'hhhhh', 0, NULL, NULL, '2022-09-18 10:04:41', 1, 'others', 0, NULL, 1, '1.00', '1.00', '1.00', '1.00', 0, NULL, '0.00'),
(51, 'admin', 0, 'Demo Product 22', 'demo-product-22-7bGkyr', '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2},{\"id\":\"3\",\"position\":3}]', NULL, NULL, '', 1, 'pc', 23, 0, '[\"def.png\"]', '', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=2D-rr4gv3fk', '[]', 0, '[]', '[]', '[]', 0, NULL, '55.00', '59.00', '5', NULL, '10', 'percent', 100, 'hhhhh', 0, NULL, NULL, '2022-09-18 10:04:45', 1, 'others', 0, NULL, 1, '1.00', '1.00', '1.00', '1.00', 0, NULL, '0.00'),
(52, 'admin', 0, 'Demo Product 23', 'demo-product-23-XgrzNw', '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2},{\"id\":\"3\",\"position\":3}]', NULL, NULL, '', 1, 'pc', 33, 0, '[\"def.png\"]', '', NULL, NULL, 'youtube', '', '[]', 0, '[]', '[]', '[]', 0, NULL, '55.00', '59.00', '5', NULL, '10', 'percent', 100, 'hhhhh', 0, NULL, NULL, '2022-09-18 10:06:06', 1, 'others', 0, NULL, 1, '1.00', '1.00', '1.00', '1.00', 0, NULL, '0.00'),
(54, 'seller', 4, 'Embroidered Cartoon Stockings', 'embroidered-cartoon-stockings-Ao3Moh', '[{\"id\":\"30\",\"position\":1},{\"id\":\"31\",\"position\":2},{\"id\":\"205\",\"position\":3}]', NULL, NULL, '30', 4, 'lbs', 1, 1, '[\"1663699439_66652536.png\",\"1663699439_48399120.png\",\"1663699440_54309455.png\"]', '/storage/app/public/product/1663699440_20932308.png', NULL, NULL, NULL, NULL, '[\"#87CEFA\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"S\",\"                  M\",\"                  L\"]}]', '[{\"type\":\"LightSkyBlue-S\",\"price\":14.99,\"sku\":\"ECS-LightSkyBlue-S\",\"qty\":\"3\"},{\"type\":\"LightSkyBlue-M\",\"price\":14.99,\"sku\":\"ECS-LightSkyBlue-M\",\"qty\":\"3\"},{\"type\":\"LightSkyBlue-L\",\"price\":14.99,\"sku\":\"ECS-LightSkyBlue-L\",\"qty\":\"3\"}]', 0, NULL, '14.99', '14.99', '8.25', 'percent', '0.00', 'percent', 9, '<p>Beautiful Children&rsquo;s Embroidered Cartoon Stockings designed for little Girl and older.</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Colors: Blue</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Sex: Girls</p>\r\n<p style=\"margin-left: .5in; text-indent: -.25in; mso-list: l0 level1 lfo1; tab-stops: list .5in;\"><!-- [if !supportLists]--><span style=\"font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol;\"><span style=\"mso-list: Ignore;\">&middot;<span style=\"font: 7.0pt \'Times New Roman\';\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><!--[endif]-->Season: All season&rsquo;s dress, Casual and informal dress</p>', 0, NULL, '2022-09-20 18:44:00', '2022-10-31 12:55:52', 1, 'others', 0, '[]', 1, '1.00', NULL, NULL, NULL, 0, NULL, '1.71'),
(62, 'seller', 3, 'Drone', 'drone-F5kMVI', '[{\"id\":\"9\",\"position\":1},{\"id\":\"11\",\"position\":2},{\"id\":\"72\",\"position\":3}]', NULL, NULL, '9', 3, 'lbs', 1, 1, '[\"1667132437_77907695.jpg\"]', '/storage/app/public/product/1667132502_84756702.jpg', NULL, NULL, NULL, NULL, '[]', 0, 'null', '[]', '[]', 0, NULL, '80.00', '18.00', '8.25', 'percent', '23', 'percent', 50, '<p>Testing</p>', 0, NULL, '2022-10-17 08:05:10', '2022-11-05 15:56:16', 0, 'others', 0, '[]', 1, '10.30', '80.00', '68.00', '30.00', 0, NULL, '3.57'),
(64, 'admin', 1, 'ThinkCentre M70a  - All-in-one PC - 21.5” LED', 'thinkcentre-m70a-all-in-one-pc-215-led-SWCHYl', '[{\"id\":\"5\",\"position\":1},{\"id\":\"6\",\"position\":2}]', NULL, NULL, '5', 3, 'lbs', 1, 1, '[\"1667417243_17138534.png\",\"1667417244_41465588.png\",\"1667417244_13808910.png\",\"1667417244_60013141.png\"]', '/storage/app/public/product/1667417245_2652518.png', NULL, NULL, NULL, NULL, '[\"#000000\",\"#C0C0C0\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Storage\",\"options\":[\"\"]}]', '[{\"type\":\"Black-\",\"price\":1069.99,\"sku\":\"TM-AP-2L-Black-\",\"qty\":\"1\"},{\"type\":\"Silver-\",\"price\":1069.99,\"sku\":\"TM-AP-2L-Silver-\",\"qty\":\"1\"}]', 0, NULL, '1069.99', '1069.99', '8.25', 'percent', '5', 'percent', 2, '<p><strong>ThinkCentre&nbsp;M70a&nbsp;&nbsp;-<wbr>&nbsp;All-in-one - 21.5&rdquo; LED</strong>&nbsp;- with UltraFlex IV Stand -&nbsp;<strong>Core i5&nbsp;</strong>10400 / 2.9 GHz -&nbsp;<strong>RAM 8 GB - SSD 256 GB</strong>&nbsp; -&nbsp;<strong>DVD</strong>-Writer&nbsp; - GigE - WLAN, Bluetooth 5.0 -&nbsp;<strong>Win 10 Pro</strong>&nbsp;64-bit</p>\r\n<p>&nbsp;</p>\r\n<p><strong>More Capabilities:</strong></p>\r\n<ul>\r\n<li>\r\n<p>Up to 10th Gen Intel&reg; Core&trade; i9 processing</p>\r\n</li>\r\n<li>\r\n<p>Features an adjustable 21.5\" FHD display</p>\r\n</li>\r\n<li>\r\n<p>Easy to set up, use, and manage</p>\r\n</li>\r\n<li>\r\n<p>Dolby Atmos&reg; audio</p>\r\n</li>\r\n<li>\r\n<p>Plenty of memory and storage</p>\r\n</li>\r\n<li>\r\n<p>Military-grade tested for durability</p>\r\n</li>\r\n<li>\r\n<p>Top hardware and software security features</p>\r\n</li>\r\n<li>\r\n<p>Includes USB Keyboard &amp; Mouse</p>\r\n</li>\r\n<li>\r\n<p>Great for the office or at-home professionals</p>\r\n</li>\r\n</ul>', 0, NULL, '2022-11-02 19:27:25', '2022-11-04 13:44:18', 1, 'others', 1, NULL, 1, '10.50', NULL, NULL, NULL, 0, NULL, '148.20'),
(65, 'seller', 3, 'Drone test', 'drone-test-d7eO2I', '[{\"id\":\"5\",\"position\":1},{\"id\":\"7\",\"position\":2},{\"id\":\"268\",\"position\":3}]', NULL, NULL, '5', 9, 'kg', 1, 1, '[\"1667664169_51571646.jpg\"]', '/storage/app/public/product/1667664169_44621400.jpg', NULL, NULL, NULL, NULL, '[]', 0, 'null', '[]', '[]', 0, 'https://i.pinimg.com/originals/87/50/08/8750080969c808cca5ff935c48569949.png', '330.00', '600.00', '8.25', 'percent', '0.00', 'flat', 50, NULL, 0, NULL, '2022-11-05 16:02:49', '2022-11-05 16:10:24', 1, 'tech', 0, '{\"memory\":\"2gb\",\"processor\":\"2.6gh\",\"ram\":\"4gb\",\"storage\":\"500\",\"processor_peed\":\"2.50ghz\",\"release_year\":\"2019\",\"operating_system\":\"10\",\"upc\":\"Qz\",\"screen_size\":\"30\",\"mpn\":\"Penia\",\"product_family\":\"Mac\",\"model\":\"Hp\",\"features\":\"Sound\",\"storage_type\":\"Ssd\"}', 1, '5.00', NULL, '10.00', '6.00', 0, NULL, '85.60');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `qty` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `duration` int NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `duration`, `cost`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Basic Plan', 1, '2.00', '2022-10-17 08:58:39', '2022-10-17 09:03:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion_data`
--

CREATE TABLE `promotion_data` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `expires_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `comment`, `order_id`, `attachment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 64, 1, 'What a wonder product you\'ve got here. this is the best thing I ever bought on the internet.', '10001', NULL, 4, 1, '2022-05-02 02:46:44', '2022-08-16 15:05:29'),
(2, 64, 1, 'What a wonder product you\'ve got here. this is the best thing I ever bought on the internet.', '10001', NULL, 2, 1, '2022-05-02 02:46:44', '2022-08-16 15:05:29'),
(3, 64, 1, 'What a wonder product you\'ve got here. this is the best thing I ever bought on the internet.', '10001', NULL, 5, 1, '2022-05-02 02:46:44', '2022-08-16 15:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `f_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `plan_id` int NOT NULL DEFAULT '1',
  `plan_expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tax_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `paypal_email`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `plan_id`, `plan_expires`, `tax_id`, `is_email_verified`, `updated_at`, `created_at`) VALUES
(1, 'Emmanuel', 'Towoju', '08123456789', 'def.png', 'towojuads@gmail.com', '$2y$10$PKkUFq.jKxUydqTPoTWtFuIiO4td9EW2zcCOXILW06x/gycjbCNkG', 'approved', 'wyVpQ5K6wH2wtlURelcM7F02Y1IS7GXUEN3PKwikrxPunUIr0fdQPNSKAkvO', NULL, 'Chaim Brady', '00112233', '100', 'Naomi Perry', NULL, 5, '2022-08-29 06:33:56', NULL, 1, '2023-02-05 10:51:13', '2022-08-10 16:32:33'),
(3, 'Sam', 'Sam', '07065184234', 'def.png', 'winconx@yahoo.com', '$2y$10$GXfLOpJnCJXdjzujD0YgjOrzVXiqnjPEFz9ewiLmtHcd6.6yGeOmG', 'approved', 'rphpKUgqL0htLXvClzdYpibfpfOljNOAjmWbbMGxfPR79m5ZDZttsxyiFFBl', NULL, 'Gtb', 'Lagos', '12345678910', 'Sam', NULL, 1, '2022-09-10 18:22:18', NULL, 1, '2022-10-31 08:16:26', '2022-08-10 18:22:18'),
(4, 'Chinonyerem', 'Ubah', '2148504961', 'def.png', 'sales@scudin.com', '$2y$10$w73cYRAmELOrMarQkeRRpel5Ie4dom.7g69W.nIb.tQZOO4PV1bLa', 'approved', 't1pjcuZydLhsF5pV8DmMfXOuTTO7tAL9Uqa0otRdfhSgWh05ATnZHn2kYfbh', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-13 16:57:27', NULL, 1, '2022-08-13 17:05:46', '2022-08-13 16:57:27'),
(8, 'John', 'Onyi', '08132645321', '/storage/app/public/seller/a19772309f6ec15fe10577ac70f8016a23470009.jpg', 'ekeonyijohn@gmail.com', '$2y$10$UzDslIlJ18i8e3C7KdXhqeAcguy0X4b74S2TO1UHynmQdIM.Ektx6', 'pending', '4WdfqdCvDt7iasODKSSbNrcZXFI6cvgFFtOkifnMQ88UdN2WwtTg84Yk1brd', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-10-30 10:26:00', NULL, 0, '2022-10-30 10:26:00', '2022-10-30 10:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `seller_verify`
--

CREATE TABLE `seller_verify` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `token` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `seller_verify`
--

INSERT INTO `seller_verify` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 1, 'kvkKRpjcMGuAZqO2GFnKYSVaCfEJCX8rT1iEhYpSyOUmlB4w4Sc2XWmcyk5MmyfC', '2022-08-10 16:32:33', '2022-08-10 16:32:33'),
(2, 2, '2s0JNOXd245IlopjOkFJK9o8D4F52HRVuKoC878b2FTMwj4DMAshRN2SGXB97ckP', '2022-08-10 16:49:08', '2022-08-10 16:49:08'),
(3, 3, '6dEs77KmiYDcEmZKtkjdkhnKD0a2I5WZpAMaPFF1KXLZW5Z5bClCxEZ2y2ujt5hw', '2022-08-10 18:22:18', '2022-08-10 18:22:18'),
(4, 4, 'grBVG9FtZvrmzKiLvj3FcLV6iMHEZjv8RVgjQQCZCSqxjDflBqjIlkqX41wKoE5A', '2022-08-13 16:57:27', '2022-08-13 16:57:27'),
(5, 5, 'thWQXnFzXSEQq4h4fZHRlB623KXB6UfM7dhl6ootSDyUldkFTQcv0KESQdt9PScR', '2022-08-20 09:42:46', '2022-08-20 09:42:46'),
(6, 6, 'zSpnwOWjdpMMvzDrCm6x4FoKGs0otSJCVU88fRCez2551nC3AnSzcJYZiVXEYLJb', '2022-08-30 01:49:02', '2022-08-30 01:49:02'),
(7, 7, 'M9Hrow5CX03H5hFTsV7mquegoh8hcEjcyB3dmUHczNJamOUjhD8AYOMknDUIhiuV', '2022-10-21 03:02:09', '2022-10-21 03:02:09'),
(8, 8, '7rULM6zdiX5Q1s8CY61NhplE3fhljlWxlNppOX4zGPHjjbSfnXeKhlVFrYOLQMpu', '2022-10-30 10:26:00', '2022-10-30 10:26:00'),
(9, 9, 'KEnCHOSbnbPUrxj3STdwUAMyiiV15GiAMHcFTwcfvRmgMN3Hg5Ho6ndkbYSP078A', '2022-11-02 16:03:17', '2022-11-02 16:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint DEFAULT NULL,
  `balance` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `withdrawn` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `schedule` tinyint(1) NOT NULL,
  `method` enum('paypal','bank') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'paypal',
  `min_balance` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `balance`, `withdrawn`, `schedule`, `method`, `min_balance`, `created_at`, `updated_at`) VALUES
(1, 3, '0', '0', 2, 'bank', '70.00', '2022-08-10 18:26:00', '2022-09-14 16:13:33'),
(2, 4, '0', '0', 0, 'bank', '0.00', '2022-08-13 17:43:11', '2022-08-13 17:43:11'),
(3, 1, '4950', '0', 2, 'bank', '90.00', '2022-08-14 13:05:58', '2022-08-24 10:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`) VALUES
(1, '1', 'Emmanuel Towoju', 'home', '333 Fremont Street', 'San Francisco', '94105', '8105733895', '2022-08-27 10:03:45', '2022-08-27 10:03:45', NULL, NULL),
(2, '10', 'Samuel Uchechukwu Emeh', 'home', '56 Charles Avenue Lagos State', 'Apapa', '100011', '07065184234', '2022-08-29 18:11:39', '2022-08-29 18:11:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `creator_id` bigint DEFAULT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `method` enum('default','ups','fedex') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT '0.00',
  `duration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_qty_cost` int NOT NULL DEFAULT '0',
  `shipping_policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund_policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `method`, `title`, `cost`, `duration`, `per_qty_cost`, `shipping_policy`, `refund_policy`, `status`, `address`, `city`, `state`, `postal`, `country`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'default', 'Standard Shipping', '0.00', 'Auto-generated on checkout', 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, '101 Founders Hub', 'Coppell', 'TX', '75019', 'US', '2022-08-11 19:05:12', '2022-08-11 19:05:12'),
(4, 1, 'admin', 'fedex', 'FedEx Standard', '0.00', 'Auto-generated on checkout', 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, 'Suite 101 Founders Hub', 'Coppell', 'TX', '75019', 'US', '2022-08-11 19:47:51', '2022-08-11 19:47:51'),
(5, 1, 'admin', 'fedex', 'FedEx Overnight Priority', '0.00', 'Auto-generated on checkout', 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, 'Suite 101 Founders Hub', 'Coppell', 'TX', '75019', 'US', '2022-08-11 19:50:25', '2022-08-11 19:50:25'),
(6, 1, 'admin', 'ups', 'UPS Standard', '0.00', 'Auto-generated on checkout', 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, 'Suite 101 Founders Hub', 'Coppell', 'TX', '75019', 'US', '2022-08-11 19:52:07', '2022-08-11 19:52:07'),
(7, 1, 'admin', 'ups', 'UPS Overnight Priority', '0.00', 'Auto-generated on checkout', 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, 'Suite 101 Founders Hub', 'Coppell', 'TX', '75019', 'US', '2022-08-11 19:53:26', '2022-08-11 19:53:26'),
(8, 1, 'admin', 'fedex', 'FedEx Express International Export', '0.00', 'Auto-generated on checkout', 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, 'Suite 101 Founders Hub', 'Coppell', 'TX', '75019', 'US', '2022-08-17 17:58:22', '2022-08-17 17:58:22'),
(9, 1, 'seller', 'ups', 'UPS Standard', '0.00', NULL, 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, '333 Fremont Street', 'San Francisco', 'CA', '94105', 'US', '2022-10-04 16:38:56', '2022-10-04 16:38:56'),
(10, 1, 'seller', 'fedex', 'FedEx Standard', '10.00', '4-7days', 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, '333 Fremont Street', 'San Francisco', 'CA', '94105', 'US', '2022-10-13 12:37:37', '2022-10-13 12:37:37'),
(11, 4, 'seller', 'fedex', 'FedEx Standard', '0.00', 'Auto-generated on checkout', 0, 'https://scudin.com/terms', 'https://scudin.com/return-policy', 1, '101 Founders Hub Blvd', 'Coppell', 'TX', '75019', 'US', '2022-10-18 13:19:14', '2022-10-18 13:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `tax_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `tax_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Omega Store', '333 Fremont street', '08123456789', '/storage/app/public/seller/091c49d83c02dad3396f4ea0bd67007907893b86.jpg', '139', '2022-08-10 16:32:33', '2023-02-05 10:58:00'),
(2, 2, 'sam', 'sam', '07065184234', '2022-08-10-62f3e1849d234.png', NULL, '2022-08-10 16:49:08', '2022-08-10 16:49:08'),
(3, 3, 'samy', 'samy', '070651842345', '/storage/app/public/seller/8b85a0eeb81f1aa6ce9233c432585ef9b353faac.jpg', NULL, '2022-08-10 18:22:18', '2022-09-18 11:01:54'),
(4, 4, 'Scudin.com', '101 Founders Hub Blvd, Coppell, TX', '2148504961', '2022-08-13-62f7d7f76d86e.png', '8324900180000', '2022-08-13 16:57:27', '2022-11-03 05:18:21'),
(5, 5, 'JwxgrvLAUo', 'CJSwArIRiGKHTs', '7811982437', 'def.png', NULL, '2022-08-20 09:42:46', '2022-08-20 09:42:46'),
(6, 6, 'Don', 'Lagos', '07065184534', '/storage/app/public/seller/12b462c40a4d037e8c785b8d72e823eb70de31c4.jpg', NULL, '2022-08-30 01:49:02', '2022-08-30 01:49:02'),
(7, 7, 'Believe', '101 MyLane St., Coppell TX', '2148504961', '/storage/app/public/seller/94866471242207c2a9b212119e5843511c12a1f4.jpg', NULL, '2022-10-21 03:02:09', '2022-10-21 03:02:09'),
(8, 8, 'Eke', 'Lagos', '08132645321', '/storage/app/public/seller/a19772309f6ec15fe10577ac70f8016a23470009.jpg', NULL, '2022-10-30 10:26:00', '2022-10-30 10:26:00'),
(9, 9, 'Melyssa Sweeney', 'Quibusdam sunt accus', '27', '/storage/app/public/seller/9522ee392ea10ed7348d8f6985520f2116755d6a.jpg', NULL, '2022-11-02 16:03:17', '2022-11-02 16:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'https://www.facebook.com/myapp.scudin.com.onlinestore', 'fa fa-facebook', 0, 1, NULL, '2022-10-19 15:00:29'),
(2, 'twitter', 'https://twitter.com/ScudinC', 'fa fa-twitter', 0, 1, '2022-09-26 15:03:57', '2022-10-19 15:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `shop_id` bigint DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `name`, `email`, `password`, `shop_id`, `is_active`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Noelle Acosta', 'kyve@mailinator.com', '$2y$10$ergxIJ0.Uu6xqZ8pbjpAF.n7LgcehzokLo1TFS2xW7TD7LZriMfrC', 2, 1, 'staff', '2022-08-22 14:19:47', '2022-09-18 15:23:54', NULL),
(2, 'Callie Blankenship', 'valaq@mailinator.com', '$2y$10$87PVyuf28zBEc6nSbsfFD.kT4MFLc15djnxNa.Z7IFaMRsjkmFoLe', 1, 1, 'staff', '2022-09-18 15:19:36', '2022-10-30 13:28:13', NULL),
(3, 'Odette Hubbard', 'bodytoq@mailinator.com', '$2y$10$nfiwX7iW55bxVURhTbhyHOhcFZ1Futuaent9OolPmeYUk.b3JCU12', 1, 1, 'staff', '2022-10-30 15:08:59', '2022-10-30 15:08:59', NULL),
(4, 'Sam23', 'sam2@gmail.com', '$2y$10$uVskw8qpZ4TXOKYYNrjzqOLYJfqvBN8YYyIvLR7uQ56Lz3MkD1w2K', 3, 1, 'staff', '2022-10-31 10:34:01', '2022-10-31 10:35:21', NULL),
(5, 'Isa Davison', 'isa.davison@scudin.com', '$2y$10$DcDiARJztbEYZ0ty13khqurQncCGblL4olMP5VeL4HmoUjHSNQ2p6', 4, 1, 'staff', '2022-11-03 05:11:30', '2022-11-03 05:11:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_type` varchar(500) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `plan_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `subject` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `customer_id`, `subject`, `type`, `priority`, `description`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nemo corporis exerci', 'Info inquiry', 'Medium', '<p>I am trying to get the client\'s IP address in Laravel.</p>\n<p>It is easy to get a client\'s IP in PHP by using&nbsp;<code>$_SERVER[\"REMOTE_ADDR\"]</code>. It is working fine in core PHP, but when I use the same thing in Laravel, it returns the server IP', NULL, 'close', '2022-08-22 12:19:27', '2022-10-11 23:05:52'),
(2, 145, 'Test kode', 'Partner request', 'High', '<p>Here we go with a newly found challenger&nbsp;</p>', NULL, 'open', '2022-11-03 23:20:19', '2022-11-03 23:20:50');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `customer_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_convs`
--

INSERT INTO `support_ticket_convs` (`id`, `support_ticket_id`, `admin_id`, `customer_message`, `admin_message`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '<p>Test Reply</p>', NULL, 0, '2022-08-29 05:39:03', '2022-08-29 05:39:03'),
(2, 1, 1, NULL, '<p>test from admin</p>', 0, '2022-08-29 15:29:02', '2022-08-29 15:29:02'),
(3, 2, NULL, '<p>Try again Sam!</p>', NULL, 0, '2022-11-03 23:20:50', '2022-11-03 23:20:50');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `payment_for` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint DEFAULT NULL,
  `payment_receiver_id` bigint DEFAULT NULL,
  `paid_by` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int NOT NULL,
  `units` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `units`, `created_at`, `updated_at`) VALUES
(3, 'kg', '2022-08-06 04:24:34', '2022-08-06 04:24:34'),
(4, 'lbs', '2022-08-06 04:24:41', '2022-08-06 04:24:41'),
(5, 'oz', '2022-08-06 04:26:15', '2022-08-06 04:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.svg',
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `plan_id` int NOT NULL DEFAULT '1',
  `plan_expires` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `is_email_verified`, `password`, `remember_token`, `street_address`, `country`, `city`, `postal`, `house_no`, `apartment_no`, `cm_firebase_token`, `shop_id`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`, `plan_id`, `plan_expires`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Fallon Schultz', 'Fallon', 'Schultz', '09012345678', 'default.svg', 'towojuads@gmail.com', NULL, 1, '$2y$10$Epu0TN.Gy.dkCPHgwljWkOIrqzoIMwkcwvMYfGP3sz5hIA8.oHiKq', 'IFkaO2vLhON4kgOrMSaORWLQxsp5mjA2CMVao337qjhLLiqMEjHhB2P2MZvR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, '2022-08-29 06:20:37', '2022-08-05 16:28:19', '2023-02-11 20:33:05', NULL),
(14, 'Chino Ubah ', 'Chino', 'Ubah', '2148504961', 'default.svg', 'chino.ubah@yahoo.com', NULL, 0, '$2y$10$TJ/AsvUEPmsGgeTB8ycE8.7FCY9G2NINMH83s5XfbULtMihsnDI7C', 'jWupf8MNs3IXW3JtMGJBr1Gqa5cxENQqzMh4yUkIYxnBJXbvEcIJL2vZ0GuC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-09-27 04:17:24', '2022-09-27 04:35:43', '2022-09-27 04:35:43'),
(15, 'Chinonyerem Ubah ', 'Chinonyerem', 'Ubah', '8176185015', 'default.svg', 'c.ubah@scudin.com', NULL, 1, '$2y$10$TssE4h1iQxc0prONn1f4J.hxDLEXBoNTZHqvqJms4ScGzPStZsw7a', 'l79hGbX8LotciCspZNhcVllEbEpKy0V0BOLBUquwW6DAvMEbCXnzxwQZWVxq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-09-27 12:38:40', '2022-11-04 02:34:55', NULL),
(20, 'test test2 ', 'test', 'test2', '08115100463', 'default.svg', 'videozcliq@gmail.com', NULL, 0, '$2y$10$L5/slSE9FWc9QM0CYJcr.ehFwFi6wGXCbSRNLRS0WCoyv.iTkRShu', 'eezHD9Ts5r9QDLtnsZZbPLM1Nq6QGvLrEPw8MZE5RYrCF40JxULt4ZslpHoX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-19 23:46:28', '2022-10-19 23:48:56', '2022-10-19 23:48:56'),
(22, 'Guenter Schmittberger ', 'Guenter', 'Schmittberger', '+491752985215', 'default.svg', 'g.schmittberger@coman.de', NULL, 0, '$2y$10$NIbICD9z2PkTu8p6WCcA4.XbSjw/dDMqJro9ruyplUMLeN4Vz7U22', '3VUTm0PFPpWvanJMlP4fZrVsJz65JpM6LnzuZcZYRaxtWZz5YCdBj97Xv6ZB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-21 08:22:39', '2022-10-21 08:29:36', NULL),
(59, 'John Onyi ', 'John', 'Onyi', '08123847362', 'default.svg', 'onyijohneke@gmail.com', NULL, 0, '$2y$10$D6.lXHjbKuLQ69/BzBVvoOn3D/a2D2RUtrv/T/s1DH.y.255ClDqm', '6GhLe9lZfJL6q4h9U8giDKLLzF4bAEadxXofkDVS3OvIU0zQiLEYjGpY30Yg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-30 10:21:24', '2022-10-30 10:23:12', '2022-10-30 10:23:12'),
(60, 'John Onyi ', 'John', 'Onyi', '08123847361', 'default.svg', 'onyijeohneke@gmail.com', NULL, 0, '$2y$10$cI7IJsZdoBmqOrX7qX7xZ.80dfpgDGI6yboqPnj7qJpv7LNFglMNS', '4WJOMkx3Ldqe4NVvbTVz5QCOnSOPfLhlTrxT28OjoaGgt2cMS7J52Jo4e5wI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-30 10:22:34', '2022-10-30 10:23:07', '2022-10-30 10:23:07'),
(64, 'Test User ', 'Test', 'User', '8176185052', 'default.svg', 'test.user@scudin.com', NULL, 0, '$2y$10$SwkPcVRk3bU/HdqJ1w.d0ux5KCxOoW78R1njPWxsZoZmygTK9eaiq', 'OVX1TpWYLvJ8jZTbdvMxOxv6Jaojf1NSe5pxwse3GNk7Pe94wZMAMIYcRIkj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-30 22:38:52', '2022-10-30 22:43:04', '2022-10-30 22:43:04'),
(145, 'Bourgeois Bourgeois ', 'Bourgeois', 'Bourgeois', '09039395114', '/storage/app/public/profile/b759e89382b403ace9e26682feed6ff61f9ea881.jpg', 'tbash767@gmail.com', '2022-11-03 23:16:07', 1, '$2y$10$MLAWnGX265vXXxhAYSttUOzHlQvLqfjrzjBJNypQyEDxHkUYA72OO', 'mMn3wglawmd0AbZFNPcWoag2AkXRBWIf63Llmub6orYhneLBOS39ORD2bk7w', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-03 23:15:51', '2022-11-03 23:18:03', NULL),
(148, 'test22 test22 ', 'test22', 'test22', '09872635', 'default.svg', 'sueprodigitaltech@gmail.com', NULL, 0, '$2y$10$IbiCbC3vAVc8xuQnwfK0a.qPBFKLDKimnG2.miyLtU4wwPxeP5dgK', 'DREHXG9B7U6iWP3Mtaw87UuGkO3pclNduBlwKJOEfGgtO8DlPqShpB7UKL4b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-03 23:29:52', '2022-11-04 00:08:36', '2022-11-04 00:08:36'),
(149, 'WLUqgyreitfNbXjx uDHWTVGvEYt ', 'WLUqgyreitfNbXjx', 'uDHWTVGvEYt', '9928782839', 'default.svg', 'shawndwise@yahoo.com', NULL, 0, '$2y$10$ijahhRSBd24FmjLKAV2/qOO9eo1F9YtcYdNXNex/R0sBwl3gNC4Nu', 'OSDOjfo3YmqtAaffsIty7DiPvTOaPIoG8nxUjRNE3Le2W3fyIohgmfsi8plw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 02:07:06', '2022-11-04 13:33:53', '2022-11-04 13:33:53'),
(150, 'cHxzsVhjeFBJ bVsKrBROSPm ', 'cHxzsVhjeFBJ', 'bVsKrBROSPm', '2283549229', 'default.svg', 'nhekv@yahoo.com', NULL, 0, '$2y$10$U95On6VWdjjAvaxoR6dWQ.Q6rliOkoNOdUHxj0.ux6KEx9mlHU2VW', 'wDqPLhUF0Sr5SCit1kLUGnrVTor3fT0i7DlYeYA7QViujGz68NeXG3KeoitT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 02:57:18', '2022-11-04 13:34:03', '2022-11-04 13:34:03'),
(151, 'VpEmtvTrbfCnOslY FYwsVNPzBnORAUX ', 'VpEmtvTrbfCnOslY', 'FYwsVNPzBnORAUX', '9744426667', 'default.svg', 'jjamaiken@aol.com', NULL, 0, '$2y$10$3sCFZiROc8wg9jOgT9MAsO6dLT4TdcqFgbAL73ipSDImrxBfp.LyO', 'Cl8UazliBHDYLMddPVL5fjywJdrbZgMY6TwU9RX6Z3ctXTRtb3tWwEiCLLSe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 03:20:27', '2022-11-04 15:57:04', '2022-11-04 15:57:04'),
(152, 'vJAiowbBz onVhNLlHXScjzpO ', 'vJAiowbBz', 'onVhNLlHXScjzpO', '8898829405', 'default.svg', 'KeisaFerrimanqh@aol.com', NULL, 0, '$2y$10$Kgi19seiWqqYkzgz0LqyYeW7/TkoLAQetSsNyNHDzcuVq/Rjw7yZG', 'Qpa7fFuI0aKWKYWSVU6WBDHdusk6BGgDAX1og1xRNkeMO4JvKTNsJuol12g6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 09:05:47', '2022-11-04 15:57:08', '2022-11-04 15:57:08'),
(153, 'RnlWtDTZGYjerKiF dtMbRnrQoY ', 'RnlWtDTZGYjerKiF', 'dtMbRnrQoY', '7642751374', 'default.svg', 'lana_ahmed2005@yahoo.com', NULL, 0, '$2y$10$Ds46dkekFnOYWLo2ydHvM.3NUpD1gq5vLJTkickKeA7Jd8STWQ4gm', '7UZmIcpyaXYPjbLfbTQY50pOASmbyZqZp3bZjn7culeK6EIkUr51qhqd6wEi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 09:30:47', '2022-11-04 15:57:13', '2022-11-04 15:57:13'),
(154, 'HPFoOWjzBDT jecJYCNrxzLa ', 'HPFoOWjzBDT', 'jecJYCNrxzLa', '5451347380', 'default.svg', 's_tomer@rocketmail.com', NULL, 0, '$2y$10$8kEnqTkZA44u1Dfc2utyS.cyPyZE2UNR8511QoJWsuvftFQ1nJZmS', 'ROGhPZ4anqt0DbZdM5vswORrUdfVhi4Q4mYXqplGsEWXoCyJICSLEWM6OId6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 10:13:01', '2022-11-04 15:57:18', '2022-11-04 15:57:18'),
(155, 'piBXxafZkdAu XyuYUlEFkq ', 'piBXxafZkdAu', 'XyuYUlEFkq', '4530604607', 'default.svg', 'marianeladoz2o@outlook.com', NULL, 0, '$2y$10$uSsqc2z6tGHm4Oo6uk7oauLCsmItXUvlvFb9KqwWcxzg6iIByhcGy', '9nRcLb7CP0dt7ZcfrNGkpRFw1LbewyR9og9lcbqwXsR0J8u5jxyERbGtbdlL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 10:46:26', '2022-11-04 15:57:25', '2022-11-04 15:57:25'),
(156, 'xiungXDsBbhwH EGjOxRntW ', 'xiungXDsBbhwH', 'EGjOxRntW', '3805029063', 'default.svg', 'thompsondee16@yahoo.com', NULL, 0, '$2y$10$M8oZdz1ZC4MZ1QePWozmL.YBl9eafZgcFbJQH1/D1ZfF5eyjKaXFG', 'OSRsIFKPPKghqEfUSYGaxJzBDp89ikTUDcW5F6R76Fb7aFlLMNNaY7aEbfZa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 10:59:05', '2022-11-04 15:57:30', '2022-11-04 15:57:30'),
(157, 'wSqyWdZGxc RtWILGNAxXV ', 'wSqyWdZGxc', 'RtWILGNAxXV', '5000879371', 'default.svg', 't.justineau.iii@gmail.com', NULL, 0, '$2y$10$Vm3n.LMe7Hdzt1yWhNmNkuYjR5swx37q83P6wSqCYtcIqlzg9jKyu', 'SBjTwoGuqVmCOQxwfESxzyTFmY82wx2BA6g0vzgaXK7d3BVuMUin4MdBrboQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 15:18:04', '2022-11-04 15:57:55', '2022-11-04 15:57:55'),
(158, 'XuJLSwNenxF nspdhYPMbTNiXvjK ', 'XuJLSwNenxF', 'nspdhYPMbTNiXvjK', '9763858058', 'default.svg', 'kathrynkwood@aol.com', NULL, 0, '$2y$10$fmmiedXw.avwOtyzNBIWgu3Sbl8ER84XxVhnfI026PMsM35gaiZfu', '2IPWnt68jy9uPlqnipSUtt5u3T6UxwvBeRIvftAkHIwfcRsVPeHWxyR1kpzk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 15:29:39', '2022-11-04 15:58:00', '2022-11-04 15:58:00'),
(159, 'eXnwGyRB DVNoOMUzpS ', 'eXnwGyRB', 'DVNoOMUzpS', '5421975284', 'default.svg', 'ThiLitter453@yahoo.com', NULL, 0, '$2y$10$zhB2smmh/9EU2U6zxPvyDufJwP.qK8pnASVdkPbtm0Hl./UYkycwq', 'uCYvlE0FKExYPIO454cEt0J98GBFJ3FO4E2l5WMKGBq3057wShHrdIjnm3Hh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 15:57:07', '2022-11-04 15:58:06', '2022-11-04 15:58:06'),
(160, 'xLeZkzHXn GBiaECIu ', 'xLeZkzHXn', 'GBiaECIu', '9901432412', 'default.svg', 'AnnieNolan71@yahoo.com', NULL, 0, '$2y$10$uY99vE.fOV75nv.doDvSWehSmfiwKqNVSzehgA0DQHgiMqMT79VwK', 'SAdTfJm8RNWmTzBCL2jOROfXF4wKuNM5hlTfhWNehuBtxdu9dOqGc9AcJg7S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 16:12:24', '2022-11-04 21:18:09', '2022-11-04 21:18:09'),
(161, 'abzUiRNprBO FdZvgaVXUHerD ', 'abzUiRNprBO', 'FdZvgaVXUHerD', '2849315155', 'default.svg', 'JaysonAlcini92@yahoo.com', NULL, 0, '$2y$10$7M.fXPl3mnBXAA8obgdIw.Kbh0.xjypWye0581o1S8z9DuN7sM4nW', 'PNYpJgWjhrEkvFZ1mYWyG7o2axEdK2cZGGdpdPNoHKfz6X4g7YqNACkHhV1Z', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 16:41:24', '2022-11-04 21:18:21', '2022-11-04 21:18:21'),
(162, 'bsLCFBthMEjGure gjUlebaNnFEO ', 'bsLCFBthMEjGure', 'gjUlebaNnFEO', '5460980131', 'default.svg', 'burns.shaver@gmail.com', NULL, 0, '$2y$10$1lyq3J/8Dzu/9SEonwqg/eN44If3HiZO2u0nZrRXprPzoooyaRcZW', 'yc8zuZcBuvbkZPcBhVMEAsWuRim5OKrwI69YQx4OG5a4U23iR4pLkRhT52ZJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 16:46:33', '2022-11-04 21:18:15', '2022-11-04 21:18:15'),
(163, 'BQPzSigdYR mXGYaQvhBrwbfW ', 'BQPzSigdYR', 'mXGYaQvhBrwbfW', '8642181115', 'default.svg', 'krista.cranston@yahoo.ca', NULL, 0, '$2y$10$WdYq3LRuhml2FVZ.9XnVmOQz36mIof4UBe3sKnLX4YgasmgiGmpwi', 'kVZdo0yLdNFX5ZIVrJq8BNKkqCBQAg5JOQevVtKxcEKLYbyvB3woNCIC2RZo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 17:56:09', '2022-11-04 21:18:35', '2022-11-04 21:18:35'),
(164, 'zDlAsXQNbBn LVcbwMlAYUyQ ', 'zDlAsXQNbBn', 'LVcbwMlAYUyQ', '8785542245', 'default.svg', 'julia.pinto@yahoo.com', NULL, 0, '$2y$10$38pKZb35m.XaIPAEV7.czOIYq/Y5VfXhBchGET21.3x8pIh1hhkui', 'jrrzzZMFiBskRWL36Buh2QkE2PMYGDL23eBxuN9Ent8YlwMiAvJvaqku3hRe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 18:02:37', '2022-11-04 21:18:41', '2022-11-04 21:18:41'),
(165, 'tpdzaPQJ TbQEYNnVu ', 'tpdzaPQJ', 'TbQEYNnVu', '6145864888', 'default.svg', 'aubre.scott@yahoo.com', NULL, 0, '$2y$10$.fJwlOu29.HuW.BuWsHtguUmcgJQvHYukgwAIRO9RkhyQoS1XCUdy', '59dN7NHqYX7nmWwwFIkeMJjmM7PuAvA2NobeQInRJfMoxWa2S0oikQGiI1yc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 19:12:52', '2022-11-04 21:18:48', '2022-11-04 21:18:48'),
(166, 'pHDioekUszgKfh zgMmkDdAi ', 'pHDioekUszgKfh', 'zgMmkDdAi', '8880776889', 'default.svg', 'miss_hamilton89@yahoo.com', NULL, 0, '$2y$10$6NQTkDQEG5jAT6DgdyvaKOqtXSI/GoBJhkd3QwvEhu9b7Gjy2DQw6', 'wVGYKj1AJDJfbFQKUcEUrma04014lHkVYdRHiMvKOeo7h8SJh0UUVlcL4UaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-04 19:32:16', '2022-11-04 21:19:02', '2022-11-04 21:19:02'),
(167, 'WuzrfbqBejicMys aFvVxzynwrNLRciD ', 'WuzrfbqBejicMys', 'aFvVxzynwrNLRciD', '3824671912', 'default.svg', 'NidiaSchwebel524@yahoo.com', NULL, 0, '$2y$10$cnUnVNepC2ZE910yafYS9.dArNDMD5bBmFKWIK0lFmRT2tFaFRFJm', 'xBFi21xEGfZ6LHpRHyhEN6EobHaRiKnyol4JS5SsoaYAheG5Z1FzVISYXT2D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-05 01:32:08', '2022-11-05 02:09:36', '2022-11-05 02:09:36'),
(168, 'cLpFBODGdN gqEbCpRSrfWtz ', 'cLpFBODGdN', 'gqEbCpRSrfWtz', '7639191152', 'default.svg', 'TorrenCoweemc@yahoo.com', NULL, 0, '$2y$10$nipm4J3oYXWRNBQEqzQN0.jk6jatN4.CCoj/F5ja4X7Sy//75vzP6', '33PFHS24fj1OqEUzgIuG5mjAVIezaVwkPUbllTL38YfB2UMAL63WRretTLGj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-05 06:59:15', '2022-11-05 13:42:13', '2022-11-05 13:42:13'),
(169, 'sbAFfqrVReYCELpa xbDZimXlJQ ', 'sbAFfqrVReYCELpa', 'xbDZimXlJQ', '6809610933', 'default.svg', 'lisyrosell@gmail.com', NULL, 0, '$2y$10$xG9GqJ4KIsL/0jeZqAVvM.y7u/eFEqtjbj7JIi6MlCtkP.QtWTwPG', 'RV4wxfu2qnYvXHQFQgAfizDNiZwxoNen68drO9DexTsaBhfahb14SrlUGrKj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 00:44:51', '2022-11-06 01:35:24', '2022-11-06 01:35:24'),
(170, 'DGfkYNoEcmnCMqXO nUgYqNsQVe ', 'DGfkYNoEcmnCMqXO', 'nUgYqNsQVe', '6798694276', 'default.svg', 'LucetteBissetterf@aol.com', NULL, 0, '$2y$10$w5cJlCsHoAky0ps.1R545ufs6arLIY..tBJizUouEN9iMVVhJ9Ox6', 'aCXpzhDvlmWKDy0cK17b7T2qGYvNt5JH2RPRt0UkOY62UVvWYSQucvILFNSM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 06:32:10', '2022-11-06 11:33:33', '2022-11-06 11:33:33'),
(171, 'NZLQgBrdmbTP DEuzlCLOeGcS ', 'NZLQgBrdmbTP', 'DEuzlCLOeGcS', '3770423633', 'default.svg', 'lovennurse@gmail.com', NULL, 0, '$2y$10$x6u7TkdbovPuc0bafRp9BOEXXWAM.U.V4xbV0MMCTm1Ik/GdNMVRa', '5ziTq3UhaLRYNHgqt7jGYEoH4wqHGWaXyAFQcDk5vviVkKFXltmn3qSmcGCv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 13:23:14', '2022-11-06 14:21:51', '2022-11-06 14:21:51'),
(172, 'uKisUJnCm hswfNuRFYdq ', 'uKisUJnCm', 'hswfNuRFYdq', '9329963329', 'default.svg', 'DoraHolzinger43@yahoo.com', NULL, 0, '$2y$10$27LS32nYwYGNa.o70Oj/cOdXbNdGWsHM0rHQPVAAMAy.aZnvNQ20.', 'Mcc9eRoVk6w7XKBG9uf3JKzGIxZssGEJkcdamrgH3cHLdqSzYShLdSbaC1mf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 14:25:05', '2022-11-06 17:23:30', '2022-11-06 17:23:30'),
(173, 'HdAVsXUe ofeSXupNQ ', 'HdAVsXUe', 'ofeSXupNQ', '4802224877', 'default.svg', 'ajfontanilla80@gmail.com', NULL, 0, '$2y$10$C.E8RrG.fs7jWHfjYIYp8.InBJlu9dnKeK1aJAjcGakYwosQv8UBu', 'Kh0i06JhNhjwE8EjZyLOejVzi42dHRL69pwpivMNOyIk548uayVqhrPdFGil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 17:34:39', '2022-11-06 19:03:57', '2022-11-06 19:03:57'),
(174, 'bXGwmdQoeHaqNE EZkaYNOliWFcLb ', 'bXGwmdQoeHaqNE', 'EZkaYNOliWFcLb', '5888002160', 'default.svg', 'scottsullivan.4email@gmail.com', NULL, 0, '$2y$10$MvM45lz/ChzXDzBttdFnauuwyYBV/Ujhe7GTVsUQG9H0juAR2zko.', 'l233Bw4WG17oaWW5vRp53aDsc3lC0bGIRFHlkaSGp3LxCpcp9tOKSmvzhJcF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 18:08:45', '2022-11-06 19:03:51', '2022-11-06 19:03:51'),
(175, 'GFJLMgsab bcEFfUquovgr ', 'GFJLMgsab', 'bcEFfUquovgr', '4431470680', 'default.svg', 'dmckinney3000@gmail.com', NULL, 0, '$2y$10$KE2HJKEVReSR3BMjXJC0w.omaR1cVuKMdJtqW658HBMljcRikXrUy', 'wUpniFWffxhdTII0I8vQwJDiTxMMHQPijOTD3qPOjQzODwHW54TAq2jrL4rw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 18:54:03', '2022-11-06 19:03:47', '2022-11-06 19:03:47'),
(176, 'ioVyHpENrMThu rTsILVaGFgl ', 'ioVyHpENrMThu', 'rTsILVaGFgl', '8128644243', 'default.svg', 'wmtirrell@gmail.com', NULL, 0, '$2y$10$EIQDOpTom6rpm0vjCt7VbuQut8pEXRUAsRVvlVlhvDpkGa37Fid.i', 'UaeRlWlqx2XgxM80s1zi9rhHbMoVzKbMEENwDNXCxd1jaZGpY3OgrFaOEThu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 21:00:53', '2022-11-07 06:10:41', '2022-11-07 06:10:41'),
(177, 'tuoSpKysUOFf HpcukUIavEGgi ', 'tuoSpKysUOFf', 'HpcukUIavEGgi', '2742400008', 'default.svg', 'hannah.deveny@gmail.com', NULL, 0, '$2y$10$jGLWB1EUacDrMgFPpcXAleQ/mIItxg9PFRBsBtL4UX6mow5P4X.Hi', 'nDktPPFIBspGHBpyFiRgJP6dojiz9fkFTeqjwyDjfWDpV2dBLT3FZxOOO51v', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-06 23:05:32', '2022-11-07 06:10:45', '2022-11-07 06:10:45'),
(178, 'ESdtVXYzrKUMQBF fFjvhbStJVrsz ', 'ESdtVXYzrKUMQBF', 'fFjvhbStJVrsz', '9574905273', 'default.svg', 'BusterVanosdel54@aol.com', NULL, 0, '$2y$10$kEE/G/49W4bRY/SNGDin.O.xKPLHFbBl7m40SaT5lCO.KE0U16TY6', '0JosJiYzXHBCHQgUJYkWMP3KFvmjSsuzDpOes39NxcERIUnObMptDvFdqyaq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-07 16:38:14', '2022-11-07 16:38:39', NULL),
(179, 'qPEUNYHcjzFVgtXf xnRWVpSewmsthj ', 'qPEUNYHcjzFVgtXf', 'xnRWVpSewmsthj', '9493428856', 'default.svg', 'wgodwin680@gmail.com', NULL, 0, '$2y$10$dRkNzYGP.lmtfr1fTXbWDuN8rMKqVhfsrTVHR2WuAV2ICZmN0CEtq', 'SZn44mD2oui0iQSqieDdwF8JZ4Yi1S7C730ew6Z6Ls2jJHgRc4iiLlNJHMHu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-07 20:13:17', '2022-11-07 20:13:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_verify`
--

CREATE TABLE `users_verify` (
  `user_id` int NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_verify`
--

INSERT INTO `users_verify` (`user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 'fgsdgdsfgsdfgsdgdsfs', '2022-08-04 02:08:30', NULL),
(5, 'WIWnFgpbEjL2yf5YG60NJyGTLlChao7YQ7wEbAhWwcDzmnfVmUZCxi3lddUiQeMk', '2022-08-09 19:04:52', '2022-08-09 19:04:52'),
(6, 'GXgKPDCCFLPozPmNGaFFr8d3SNZk7M6xnwlO2lIB8vspTc6RGuGHjQWW3EJFrKJz', '2022-08-10 13:11:43', '2022-08-10 13:11:43'),
(7, 'M62gBAtqHGaof6fiBXgSRSAz08Xqrrnjb87yRSUBXWmOwlMYeNNA6m2eNHTjXpS0', '2022-08-13 09:28:26', '2022-08-13 09:28:26'),
(8, 'szKrVaY4LmsN7HlnvvXvpsVWDhNtY3gKEJqEWpsA1XOEL5qEYPXLZazWbOAgAnVQ', '2022-08-20 09:42:39', '2022-08-20 09:42:39'),
(9, '6cJ8btKFZFQpwaDRIGzUMVDSMOrWuV0oQ1sS0DeXWmIsmcQFsXthj8ZhJ7Ip0RUs', '2022-08-29 04:40:19', '2022-08-29 04:40:19'),
(10, 'sWCQUAT48DZGNo1SZaTwKVYkjsDAGvfsJvGq1cchH8A2cCQRZyqqw2lV2n751J9j', '2022-08-29 06:41:36', '2022-08-29 06:41:36'),
(11, 'aBEUIZ3IR85uT5ZJ9ezGQV06AC0zol6tOipGphVeSRwowSCzBrEyfsipNDLIuaUx', '2022-08-29 09:33:01', '2022-08-29 09:33:01'),
(12, 'vZER6prJVgbpkVRxd6jgCxLvZaH5QW1gxOybQBv0GCdPmeZh8TVqcOpJdT0dEQvL', '2022-08-30 00:45:24', '2022-08-30 00:45:24'),
(13, 'CU4XKdHL8SCzMTRg5qlsHsRpkdnPxiXrtrj8mvWDnTwWL32IJ7RRzc8bKacy3kFm', '2022-08-30 22:59:04', '2022-08-30 22:59:04'),
(14, 'oJfyOg63vv4ahJMzWJy2n38VsAhWOKL1hLjJ28HBknVXRNXAGDNwJbTQxJPI10MA', '2022-09-27 04:17:24', '2022-09-27 04:17:24'),
(15, 'KvU4sDY0KyXVXbzDWbCBMp7wEU17AEvRooEk25VISWfbiIslJsjgwE5DApXv2qWe', '2022-09-27 12:38:40', '2022-09-27 12:38:40'),
(16, 'dKSoYV9rPhm856A08S96igOYhT7qdHn1F40NR3IKilkmgWfbrSz15ySjp32AQMgh', '2022-10-04 12:25:50', '2022-10-04 12:25:50'),
(17, 'dIbpQOpxC9uGAuUhe0EPJyKFzkMLHC0AycfxlIKo6JJkZ08aMGol8LX5TkdNt7l0', '2022-10-05 16:33:44', '2022-10-05 16:33:44'),
(18, 'sGaOORMoUkKvzmi98nlxmedX20OhcCKW7BRaw9l35jzR7E4jdjEiDtR2m4kE0R7L', '2022-10-12 22:45:52', '2022-10-12 22:45:52'),
(19, 'L7GV1s0CVGluIXPvJgWdDk10SlnnoxNIoVS2110QcMPnhuGysRv54UJz5U3B1s23', '2022-10-16 17:13:05', '2022-10-16 17:13:05'),
(20, 'MswXWmMQ0CnBMPtO3HRdZGJhxffqF694zekKQfoWjVg7BWUN8VGm4GRgO1peKWPS', '2022-10-19 23:46:28', '2022-10-19 23:46:28'),
(21, 'SV33dcxP1BjQ4NKYtQ6joVuUcBjGnsHen4EuqCpTdPpRUECPitStfbgumW0SsKpQ', '2022-10-20 01:35:48', '2022-10-20 01:35:48'),
(22, 'oLjIj32fYFe39LZCTbtFNOOsGZVtA8CI3npRoFpiOy3ro5Wb1TEkXBHIRTrQo7QZ', '2022-10-21 08:22:39', '2022-10-21 08:22:39'),
(23, 'EXPPyTh0Bc69oY2gx9oW3L7Rhmb1BiasBP7V4hLDDIuzZGSqcYTqEgsubQSEDQoT', '2022-10-25 06:00:56', '2022-10-25 06:00:56'),
(24, 'X4srcm4zUk6Egeb7GslXka4h3AWoFXrzniRsuiD5SsIDu0CWoXgo7FlSipWav8UL', '2022-10-26 15:02:18', '2022-10-26 15:02:18'),
(25, 'hi1gq8F29EUG0N3DTKqU8eVW75IbYtFFKCZbh00tg0Enbw9hSSUniWKmS7cYlt8w', '2022-10-26 16:24:47', '2022-10-26 16:24:47'),
(26, 'DkQjilMTfYnY5dyC2EjUgoFjUY8EdTC03yDZLuUx66z1OyCMUsmiFNsbTHKkVBCx', '2022-10-26 19:43:19', '2022-10-26 19:43:19'),
(27, 's8A6qu5K94IoQWHXprbLkHzcOSb8YHBpFYNs03dnccaVainI42aKItfYsUEJepq2', '2022-10-26 21:58:30', '2022-10-26 21:58:30'),
(28, 'FrvE2mF9nhQCM9Tz0N8wIabFXsOUqQlJTnYRtLck9QnlhURYF6HyXlo6kGgoCYRj', '2022-10-27 16:09:20', '2022-10-27 16:09:20'),
(29, 'rwMoiZtBLb81JiBK75lqquBNLJ5KlStbMQZifoEUmRxkbttZdcCDjti20m0YrSOq', '2022-10-27 16:16:06', '2022-10-27 16:16:06'),
(30, '0QZjYIkcR1t2KiY0eJ3OELTt69tBb2GH71MCL8MXBR3uDq4p05fJT7V4TH0qKUe5', '2022-10-27 18:48:19', '2022-10-27 18:48:19'),
(31, '512GJOoKzUaVHhGWFbIg2t68uJ1ogVmG4L53JPkRx5aFypKWHvpd5x2BYwhbiFlo', '2022-10-27 23:26:46', '2022-10-27 23:26:46'),
(32, '5keLywbwfpUBUPKMNFUXWDTS5LVv7R0fI9xZQVgptySFbkW15OHcprkV3SlzzWVU', '2022-10-28 04:49:29', '2022-10-28 04:49:29'),
(33, 'L9NxhbcSTJQgckKTnad03jHo8Fd800EqXRZjkAHWJLV24JwlR57zXP8zR4RXylhm', '2022-10-28 07:26:42', '2022-10-28 07:26:42'),
(34, 'qU34cYXgDoGGtXkOTxomrRaCKZlDL4B5D1DBnscT0w1oooQH34dWT4aTPWHNCfhG', '2022-10-28 12:50:32', '2022-10-28 12:50:32'),
(35, 'aGrrqP8gwxdckgoQzALOKL50cJVFdW4fJjKZDWGQTDo4d26mpl3127DLth1z654R', '2022-10-28 16:05:22', '2022-10-28 16:05:22'),
(36, 'vsuMMnXsytSFqN1WKv3Rt5H9AfswF55ogGOClJjoZuxZ2IzlMVZ9YrQZC7GPbx6t', '2022-10-28 19:07:21', '2022-10-28 19:07:21'),
(37, 'HsxFV4I8QW5jcs3OR5RT5QDj4UVN4oP3Ltip3y30yxWzpvhHiLt7NJiVDoOi3ST8', '2022-10-28 19:38:39', '2022-10-28 19:38:39'),
(38, 'rFAIcM9cjFPFSCmjZWRmPXmvgzzhOctEFslvpt9IASMP0SDRDascOuPypvB58r0R', '2022-10-28 20:24:37', '2022-10-28 20:24:37'),
(39, 'FKyg0k40dccJgU4dUTp8zEL5H7wQE0deXn0In4OWJgRvBgfiwcRUzxmqQCDMcRRF', '2022-10-28 21:16:45', '2022-10-28 21:16:45'),
(40, 'Sgf4sHKtF2qvt0158QJVEQMRFdiJFJx8aqwsy0PYKbvIGZ99Pp6Kvai9dKy1wnqG', '2022-10-28 22:46:52', '2022-10-28 22:46:52'),
(41, 'VxQGa9QNf0sp1fYT0Nsv2owqwoHnJHgZJkNVFmc3SwSgv72fqdfbNzPdOUbmVjnx', '2022-10-29 03:11:16', '2022-10-29 03:11:16'),
(42, 'oKHGKpAE1f49r05a7PBHsEHJgo7UH2nHmHfbtZ84xR5nckCKhmeICYmAjae6jsTu', '2022-10-29 04:13:03', '2022-10-29 04:13:03'),
(43, 'Q0uXOgPts6w4GDM7oogPhfuSKfsJzif55myIR7fb9RAz8IxnLOVdLX8nPIDtjLMB', '2022-10-29 05:45:28', '2022-10-29 05:45:28'),
(44, 'jDZKQjdmRoUt9GiUKz68ikU6yJb9BG9OPQqValHM41FCwYvNwIFfx7BV5qr8SnsD', '2022-10-29 07:23:18', '2022-10-29 07:23:18'),
(45, 'MOzkp28AyqUtSBzcl1wdw2BrBimxnEpQJ0GNbYSZ1bykZ62xOVkF0Hr2By7S985p', '2022-10-29 08:34:26', '2022-10-29 08:34:26'),
(46, 'Jui4SL1s0jo9NEyhoNQqGHsogVvuRvQgER3x7hd57xSpXtVJNZFD97nY44RnB7XV', '2022-10-29 10:33:13', '2022-10-29 10:33:13'),
(47, 'FDpp28y6jelNGm3VdyQEETOCi98OKcfYJkwUUPkwX3OWVRi7QjLojDXSRpwvQF7S', '2022-10-29 10:45:47', '2022-10-29 10:45:47'),
(48, '3c47jhsoFhwiY6bTGdleEhanwimAkxIxItYM53VGPJJTHP9l2vffzZkQXw5Ibvwp', '2022-10-29 16:07:25', '2022-10-29 16:07:25'),
(49, 'syByqz0lhlJ9O0kjmtdQ3GpCBAPvvRyTUe5s0xOBCMXZNWel8I3fSkCumThWFhSH', '2022-10-29 17:10:45', '2022-10-29 17:10:45'),
(50, 'JEozHSjH9hRKixBdD5LgE4ikRXiyIR7hDwXSRsXehBXl6J1tpYxgZqPAHRu2v3cg', '2022-10-29 17:35:55', '2022-10-29 17:35:55'),
(51, 'Qp8pLcjsJZtlMobhy27qROnvzGD9QauUujdnJKpwHFmW6xyKniovUikfmuGu6KOT', '2022-10-29 21:18:43', '2022-10-29 21:18:43'),
(52, 'ehOIVY51VhePIEEwuId2MZlriKIr6u7tR88ZU24yXep03uWjBArFeN4j8A3Lg1Km', '2022-10-29 23:40:27', '2022-10-29 23:40:27'),
(53, '0WNX2RxgtiNgfFmJMJl1wGITL3DQZZKh7p32Dhud9ojJWWiKqrsZyWP7rX1sv4Dm', '2022-10-30 00:18:32', '2022-10-30 00:18:32'),
(54, 'bjIC6A038IJsCIYJ7tP1jrlAYSZ2OWJtEMU551mQt5mCZg2m1fH9bWOiaPpWXi5C', '2022-10-30 00:21:24', '2022-10-30 00:21:24'),
(55, '2HZ82bOJCQJsm3fLr4WyFi0T0hn3sHrqFJvu2qHrlOXVf84Ei6SW1mEjdP1bxkBn', '2022-10-30 05:46:18', '2022-10-30 05:46:18'),
(56, 'n2MuAITrRlQnS5ny1MCTpDShpjC8CkWimKatOZd35Hbn86TiPxMVCjBJQ0BMMMP8', '2022-10-30 06:16:46', '2022-10-30 06:16:46'),
(57, 'oeE6LKXKYBMWLI5i5a6w2q6qeihAjlY71IH4ri50cDbhITsrwh3Ht7kDbi1SUqMw', '2022-10-30 08:22:54', '2022-10-30 08:22:54'),
(58, 'ZeMmLueAgIE4gGQqNMmPrZ7o55l2zxtqPIbI9eanovxdTsHPtu4crryn9ZYERTQr', '2022-10-30 09:10:41', '2022-10-30 09:10:41'),
(59, 'A99gmVXTAEoEN0FlptvSitQk9gJN5f5YURmVAc18gZCeWxM7CHICP7fkzRCdO7jf', '2022-10-30 10:21:24', '2022-10-30 10:21:24'),
(60, 'FnF1L1BwmJIUtnPko7izh2T2zhfrVpyHVNPjNHTpAXhP46xGylXoHM0RT2mU61wd', '2022-10-30 10:22:34', '2022-10-30 10:22:34'),
(61, 'pNNUYcYUk85HqAd5TE21uReX5t7FksCezmiNPim0HgUpFDiVY7M062IiGWb8FMAM', '2022-10-30 12:33:46', '2022-10-30 12:33:46'),
(62, 'RuOJRtdMcvEqiKe0b0NvMIIPRgxKALqiJ3iT09K59WHOlkSDRYr5XNHChVxkL5cy', '2022-10-30 19:42:35', '2022-10-30 19:42:35'),
(63, 'sJSD5AoSPC3xK2FHDnSibSiwJ7EhyN6dfjt65ULmmIjvRCsJRDyvvADheHpZvd29', '2022-10-30 21:33:39', '2022-10-30 21:33:39'),
(64, 'cyyrO40E0CiweNF3DubI68QrXUfJ4Et1ICIQflrtF90Nq2JzoNA4fUQw9hbp8IX1', '2022-10-30 22:38:52', '2022-10-30 22:38:52'),
(65, 'exFMo3noACbJImiDXSIt1PrkJLfU3GPwJLuX7IX9bYbi35o5KcfFyD1AyowKA4by', '2022-10-31 01:39:50', '2022-10-31 01:39:50'),
(66, '1eycfF9jimrUclVaL8Hu7ujNEeJhhEh4Jy9ElHMoXG4ddWYigigoABFnnecqiCau', '2022-10-31 01:40:24', '2022-10-31 01:40:24'),
(67, 'qKdyTYxU7uroYN2zRbmk7Mf0r16ly5mF3t2KVAU1v1OnGjFZhxB30pcLZhYzo5Co', '2022-10-31 09:46:55', '2022-10-31 09:46:55'),
(68, 'Uzh0CkWnT3B92BcdAHr27guJ0o83AzWmLAXdl7fkoSATaGPSiN1f6YVfUU5vzB1E', '2022-10-31 14:26:47', '2022-10-31 14:26:47'),
(69, '7H0Pe26PTedusvW2sCR2E4ucoa5IPdJn6b84e1V8inDAs88qBPaciOi0UYPtBEzD', '2022-10-31 18:10:54', '2022-10-31 18:10:54'),
(70, 'oz9nkrvFc93jU3ly59gwrsNdX9GwfZUJKWHgkMpZ32KhvB6yPpmwAKgF1JOgJwkV', '2022-10-31 19:12:19', '2022-10-31 19:12:19'),
(71, 'qrq1TReyfGzwEdmAHU7PlZJQm8WJL14FunfuT4SUrYldZ4oh1rOPoXwXri5jWAQq', '2022-10-31 19:13:03', '2022-10-31 19:13:03'),
(72, 'rWZwJvHscU04mPajaB3XijzMGxYIJMTqdoVKdpZuxnc02w2bxOotzlzbtPaUoBKg', '2022-10-31 19:22:17', '2022-10-31 19:22:17'),
(73, 'SFOuI5Hj7Szye3nkSbneJ4KJWpCazAhFK1UMHLfeWy9mMZc4aK2hCAW9LXTbLSYP', '2022-10-31 19:45:01', '2022-10-31 19:45:01'),
(74, 'hVyK5wrL79dkrG04xkUwd9P9V8r4t5kwQq7JcuS2QdcB5BGqR7dC3rV0OffmElAx', '2022-10-31 20:32:11', '2022-10-31 20:32:11'),
(75, 'OJLfORdXuNl2CQotqcNNlmAtS9kjd2i5sgfhXqVVTumsU0ppgUAQS7dbDm5Y1mG3', '2022-10-31 21:38:05', '2022-10-31 21:38:05'),
(76, 'dz8qCNuZkXlUlOKIz7dUWRGC9KCDIqIqgNQoteI84ewOISGLPLHupc9AespX27oT', '2022-11-01 00:17:19', '2022-11-01 00:17:19'),
(77, 'HYPgaCUsdSHdIZYPOLMkAoTc7AOdNtzQOswND2D81aM5PKxVEz4XjcdrHuG8kxND', '2022-11-01 01:55:15', '2022-11-01 01:55:15'),
(78, 'sW3g0n0kNX7BH18o7dXnCX9haJnND9PdiDX0EG56qWuFfNoX2J9EAE0c83j68fOu', '2022-11-01 03:41:21', '2022-11-01 03:41:21'),
(79, 'EXvrFGdYvys83IrqqcPpt08A3SSUZ0wK41m0PLvFSD6nDdy9vpp6WD7XDYlJLcBJ', '2022-11-01 04:33:17', '2022-11-01 04:33:17'),
(80, 'Sl2KspdAl7sGRLMk6LiivqqC5vBWPfCyw81Cayz2x0LTwvbLNEFDVoKNNWavQHGp', '2022-11-01 10:49:30', '2022-11-01 10:49:30'),
(81, 'GuSTUl0NoDCZAOXnHuVunkQSAictSHaY3wzzajTnhWsur65o94d1peLxJuYEsbJm', '2022-11-01 11:45:24', '2022-11-01 11:45:24'),
(82, 'J0il3ztEh8GOtzi110QRT5He3Mi5jis2rOlDjMzCGMszdOhB56WFbA5obbW6omvE', '2022-11-01 14:05:46', '2022-11-01 14:05:46'),
(83, 'l4YBczTxzR4qCJD4v7Hp6dtN2Gxcsm2nvpI8HzCumORn26BzkRu0z7HKRcW4rePn', '2022-11-01 15:02:52', '2022-11-01 15:02:52'),
(84, 'jg1QmHB9MY0FAO0RGCfjOHXvq1LQJ4Pel61zutwXkYfyjpXz7F6PU42QxcT1l7HJ', '2022-11-01 17:13:05', '2022-11-01 17:13:05'),
(85, 'mcU0Mc68WGrCXo7bLuB3PjGYiCE6bAYZfk8MIQcX22zTxlkdm4SZyZDQFyGMcJYb', '2022-11-01 18:11:25', '2022-11-01 18:11:25'),
(86, 'p8H0CucMZuqdVWpkNTxwAI1rt0oSdIa19Vp6LbrYKliomJoHV0FH9TWB9MqCF2jk', '2022-11-01 19:00:02', '2022-11-01 19:00:02'),
(87, '17EY4AUMoh2U9QnHhmnQxHIqqTVuoVkQ1VJndHWS7YhXLncSmnd7IXJttgarABEL', '2022-11-01 19:24:08', '2022-11-01 19:24:08'),
(88, 'IwpPJagzs33snhSVyd7tayFntp6qTaJ79v07IZEVSVPElQBOYc1jujzkUeS1pjcS', '2022-11-01 20:00:03', '2022-11-01 20:00:03'),
(89, 'iPHT6Fvns3sUHXdPE5whRWoQShMtcNKPOaEBu02579L2VOYgbNLHKQJ5sdnzoaJA', '2022-11-01 20:09:14', '2022-11-01 20:09:14'),
(90, 'HqBfLSUeEV91LGZkb8mJCFpw3KxVMoVpIShg2BsOY2KJhLsDzqIyumdSATJdbiHr', '2022-11-01 20:46:19', '2022-11-01 20:46:19'),
(91, 'EI0ePe7SB0f4zBJtjEtIFrBDoTBhC7pMgUMmACxEzKUIKWIV4zB4rled4jqIhek1', '2022-11-01 21:28:35', '2022-11-01 21:28:35'),
(92, 'JneZ8RUI5VUwNjgQOZO0prLJmC85rz44H4XL7t5934gCfYaLy2C8hJd8WBqShfbm', '2022-11-01 22:10:23', '2022-11-01 22:10:23'),
(93, 'orTJdyOv9lFvayleokeuMaBXvXXK3IbKfLayctKvXxtgrcsk3cjY50IbnGHiOFuw', '2022-11-01 22:34:26', '2022-11-01 22:34:26'),
(94, '6ozpKeikhwXmcipyvT4aD8ps5CgJ6paNGqw8eMQYO8N2xpOSvx95waeMmtUAZiei', '2022-11-02 00:02:05', '2022-11-02 00:02:05'),
(95, 'i9itbWfeO5AIINL2PfZgOMUTKCadddBJZhRYHhkd7NQ81lGURju5t891OVAVc6tr', '2022-11-02 00:30:16', '2022-11-02 00:30:16'),
(96, 'KkEpKbnaVLgugykpzpnVhA8EGoQLGtGdH8z6mSNXVFeivNQUHYMc3jtZ08gUf9ZF', '2022-11-02 01:00:15', '2022-11-02 01:00:15'),
(97, 'QXDbcvmZpWPWcI44i9ODe65CGOiOBHFBjSwr3zdk26qnE56BdJA6dHVXzNC6a2jq', '2022-11-02 01:11:27', '2022-11-02 01:11:27'),
(98, 'uCX8Gbeo7T4FtLJIRETtJZd4o2YZSurjHNRQ4xQXQueEn5nmxcjS1aJpbPxD9ahL', '2022-11-02 02:11:56', '2022-11-02 02:11:56'),
(99, 'WIpQcVtvpOJcQvbMj2vWxdn69llazovtNiNMCzSYVxDDh8VnWMvwvWqqvvqIuGch', '2022-11-02 02:18:47', '2022-11-02 02:18:47'),
(100, 'aB64pJkhaqHZpDJp1gaAnPuljDX446pvqI9Cfr11XCjJHiXNR3kOFOlkO8E0ssJE', '2022-11-02 04:02:08', '2022-11-02 04:02:08'),
(101, 'ZK9jOEN0VqO2dc3g1hdoo9w48jboeKISDlSvyoXABhcUmc61PNQN1duquLQMWtPU', '2022-11-02 09:26:20', '2022-11-02 09:26:20'),
(102, '7y5jWqpHbWRfcHzIG8OtKmEGGhr2QgtVRezbRr8nf1icss2PMjcxJvxoy4FqNQwS', '2022-11-02 10:35:03', '2022-11-02 10:35:03'),
(103, 'nZLgDq9OCV2PNaW2N9HyrG4My66cQibxE78C7fMXhqEsoY7EuEIoSUF2DzEE2O1b', '2022-11-02 11:07:48', '2022-11-02 11:07:48'),
(104, 'Yk8H2KU4ijiKwdm1HswQOwzwvg9DiDug8yoRvqx812dqsDnzaD1HPiK71RUd7mNA', '2022-11-02 14:04:50', '2022-11-02 14:04:50'),
(105, 'odq5Zu9fZOKv5dWPmk5tBiwmQYB4kRFk8zO8ddidOJPWb0xvyxHbHW20mKipmkPe', '2022-11-02 15:44:51', '2022-11-02 15:44:51'),
(106, 'l4T73Ks9H0oNL4qe37QQ7zTVX3Y8DZ3zK67lXlRkSRrpbOnoCGxR1eWCPSdC95Ql', '2022-11-02 15:58:07', '2022-11-02 15:58:07'),
(107, 'fld7b7CPeF2J3U110IONAYIRrfeSDVUos75ujERqrPOAjnUxw1nu3WJegXisCWDt', '2022-11-02 16:02:06', '2022-11-02 16:02:06'),
(108, 'qjyyZjMTVQIby2JQjdRTG7JT86RRohONZjs9aGXI9tiARFygkx2hZNTsTPEU8dlo', '2022-11-02 16:05:52', '2022-11-02 16:05:52'),
(109, 'Iom5e1z03HgPs6CVZmD4TlClUefbWmBWYPNJFwwD7YOFuvlcr9dqJuw4W3SWKwHK', '2022-11-02 16:29:02', '2022-11-02 16:29:02'),
(110, 'ZahGNCEUgWImMhHTq8OOsG4EUCPi7zIJK7qKubClSwKcIltcYT0mk6GifHCUvECp', '2022-11-02 17:45:59', '2022-11-02 17:45:59'),
(111, 'vZKHNa9cfw2IQok2W7R48uik1YEwCCJ6s9GXSUxh25ZJXo3DrBZRffIW9qDNixwY', '2022-11-02 18:04:45', '2022-11-02 18:04:45'),
(112, 'UAmJHvdTELHSvizToW3eLta5TMuxHcnxoyrnxhybWIPn2wpGt7nL21rEY3i28uLa', '2022-11-02 19:03:26', '2022-11-02 19:03:26'),
(113, 'D8XFHeHrAQU1VdQvftiu1ifzgqvEgm9cPOSjXsB0RlJdUoQ4RSEsa5xeFClYbCPk', '2022-11-02 19:35:18', '2022-11-02 19:35:18'),
(114, 'YUEsagnepZDGk1dJaO3zfdJ51kBxHheTVO8VnKoyVyTw9L8vOgqFWp5gEilWNYTU', '2022-11-02 22:31:05', '2022-11-02 22:31:05'),
(115, 'iqSWa7GY16MYaI6hytlBsxzUzd6egocu9UXrKA8cJ0CiDQFsthtzBQaW94Vxtlh0', '2022-11-02 22:56:48', '2022-11-02 22:56:48'),
(116, 'JrJeMlaYqzxPsimQZXe4wvzFftOtH3swZuqxwG5naLByo8BoN0UrKzAvJ1ciTlCi', '2022-11-02 23:10:23', '2022-11-02 23:10:23'),
(117, 'm3sxulhUkFhJsUNFpGz8BZ1TSBok03mqYfWe0JbuCHauuPvZpW6zBc575N9tej5Y', '2022-11-02 23:48:48', '2022-11-02 23:48:48'),
(118, 'JAtoW61vYBRBEz83Y5HxUGn7Imd6GvXGUaTTjvpq7FVAH9EqTBHOdVnvLyXnECim', '2022-11-03 00:12:40', '2022-11-03 00:12:40'),
(119, 'OY0PUY3GpEKwnZzC6WYXTOuTSnqFvwdAH0tKXgNt2jeLUmjKAJwoSQ0TDMigePgO', '2022-11-03 00:49:06', '2022-11-03 00:49:06'),
(120, 'FXY28HlFVVb2uEHKMEMDFGzqSYnL79NBkbC8udQYkNyeasRrOgzV7BaAJtxZiOx7', '2022-11-03 01:12:41', '2022-11-03 01:12:41'),
(121, 'HrXG3aIXLBj9PvSaW0TFwqO7mqxppXw7Femywt4TPmzYAvFhOH6cEyIsI0nr8jLi', '2022-11-03 01:46:16', '2022-11-03 01:46:16'),
(122, 'TksrmeOnm9u9UDJJGa42XTWN6zBVGMuYeUR50icE0c18HDtOctmL8bX0xVtBb1UX', '2022-11-03 10:18:32', '2022-11-03 10:18:32'),
(123, '30PvmWeziYt2QnRuAFIpig7TMBPdk3rW7ZV39lItevc6xUFaepdTOLR3d8vtHwCj', '2022-11-03 11:00:32', '2022-11-03 11:00:32'),
(124, 'AvLzOPUDQmgj6fkYOHtVzGhOT02HDWQbWKiM1cEgkroNksrKditGj8k9UD1D2DBj', '2022-11-03 12:24:27', '2022-11-03 12:24:27'),
(125, 'TscpNslZxbsFXZfhyLsJwaqCMITXXRhsDypqqkPQJ89ZgLFEFMnSd52eV6temoYS', '2022-11-03 12:33:26', '2022-11-03 12:33:26'),
(126, 'tY3SpdJLenmkgkKUOjuFypw9iDOnBYN1eiNf39zEXnK4J8JNsMgKFHokkuM5cyPy', '2022-11-03 13:27:30', '2022-11-03 13:27:30'),
(127, 'KgEOhbkihBMp3oTXmH5tvxcK1UBZkBqqIIQWLuasgsjijcnPrFSAHzN2a7zvE24b', '2022-11-03 13:44:36', '2022-11-03 13:44:36'),
(128, '8iITfKICCzOcExXWdLGBSBtGdzcmFjYiMgcEowjWqE7JLTLaH30bpxV5xkik59TV', '2022-11-03 14:27:05', '2022-11-03 14:27:05'),
(129, 'Oj8jGrkX2tQZhXdgZ4kZiiW9RAF6cj29uT1NwFbccOzPuIKakBNa9rziMNc4xBQB', '2022-11-03 15:32:35', '2022-11-03 15:32:35'),
(130, 'XoPagNaWc17gN7ZNRGYirgeruRO5curPwaXLJMfJHtFE0FFNhW6PcBmyY69rn5GI', '2022-11-03 15:44:56', '2022-11-03 15:44:56'),
(131, 'lVMIESxEi1B7F3T7OJgpm1FWSRbCKOrendVr23Yb0S3ypNSFJKDiJHTSVp179eC3', '2022-11-03 18:51:34', '2022-11-03 18:51:34'),
(132, 'Rh4jwQg7vyIRJj5YMiTwBVeQ29Cc1XGjaw39rlWkRyGXyS71mMUA9cORpScQWvyz', '2022-11-03 19:32:46', '2022-11-03 19:32:46'),
(133, 's7C8f21x37xBBIIxbsgsjxEWxz1hPVYvs7nm2kQwyAOdEMH76AUmu0Jil8sDmsxt', '2022-11-03 20:33:53', '2022-11-03 20:33:53'),
(134, '6oijHIgYohf6c2QIGjFessSRdU0vQcBxQWgam4PQb2lytib9FFrPLkjsGOpxdxCp', '2022-11-03 20:41:56', '2022-11-03 20:41:56'),
(135, 'H8w01VryTz044vHNFkkR4BB9LKTUnpg2NGL2E5JxXwppu11SKeebhlSNZx4krK2o', '2022-11-03 21:49:28', '2022-11-03 21:49:28'),
(136, '5CY1TlJh66AdHliz6C40Vau9HoX8hMh8cHEwQNxwqclmTbal3QPGYFDlfkaZPbd3', '2022-11-03 22:00:39', '2022-11-03 22:00:39'),
(137, 'JDgRlt3hLlfOjQTPSiJ6Jrl8TlsXIjO5R5P4ht2HRhjEy3CO1io7XDVFVigwcKaH', '2022-11-03 22:15:38', '2022-11-03 22:15:38'),
(138, 'omH8CcVZhaB6ecp6If1F3o5HjmYjm4mgxgyBEOYxzQwewwtkeN3fU8MLmlaaVDLZ', '2022-11-03 22:35:30', '2022-11-03 22:35:30'),
(139, 'TXpOmnZBIDe9OcCimnLopYtgz17XY2tQdkldkFEeyPuWWJWy9ge2hZN4EjBdYWh7', '2022-11-03 22:47:34', '2022-11-03 22:47:34'),
(140, 'vyTYXFEEOC0I72WqUzPth545d9mPUkfvqBtKeyBAACxixRIEcmknBAzAk8vvJvsa', '2022-11-03 22:55:45', '2022-11-03 22:55:45'),
(141, '7knDzMj2sN1VTwrDzbhyoUel54LBJbRo3QxvnG73m4kAOgUlAAfyLb1SrwxnWzWc', '2022-11-03 22:57:26', '2022-11-03 22:57:26'),
(142, '7OzP8mPhGxzAYksB12SU24eRiswMt70U5hHZcWHG0i0XGkdsMg3QbFbvW3YNHoZx', '2022-11-03 23:02:11', '2022-11-03 23:02:11'),
(143, 'gFRYqsakQrXufqmihjezF6C0syXeFTmAHkiBxFb20cWzsinJ5QtXKkoRAX9iFQl8', '2022-11-03 23:09:04', '2022-11-03 23:09:04'),
(144, 'sMGn2nqslkR2NVQLsrOtavkOowpSPoj8yY9GX1LrbrFrSv3ULdQrlkXG5wbwFHcW', '2022-11-03 23:14:55', '2022-11-03 23:14:55'),
(145, 'TICUQMwTTb0FZdIckDehnBEXRSlL5U9jhnmrUobIChhWUElMxsMzkjAXmfq5qhmA', '2022-11-03 23:15:52', '2022-11-03 23:15:52'),
(146, 'aUlDgU7z2p1QLHv5ad21wG0ESXcatcWZ1WddBcwJEExTzp4leCpWEvcNYe9eGk9A', '2022-11-03 23:16:50', '2022-11-03 23:16:50'),
(147, 'udsDa95pCN3cG5FXaFzTOCXH8I7A9kvOIEIFnjpLmbSvCtluxOwy6dbNR5qxQ8eS', '2022-11-03 23:19:49', '2022-11-03 23:19:49'),
(148, '2Tt6hHAtx2wch1hXsr76OsyhoPEGOZFsXirUwo8p5YrGuZ62wJL8G5cc6Tm28LLM', '2022-11-03 23:29:52', '2022-11-03 23:29:52'),
(149, '1q8G1g4SvFKkKHGPjZyzaIHnUpw094vEQX0VNwTxKs5yEcS1f2V8QuoZXDpSa9cC', '2022-11-04 02:07:06', '2022-11-04 02:07:06'),
(150, 'iU3MFEA2WGzFWfrLWBSeTeFBsMGpoxsuyzrbaPjdcq8WDiB94TQWQxT62TfW1g11', '2022-11-04 02:57:18', '2022-11-04 02:57:18'),
(151, '0agESLzQFeIForZOCzvm4LScTkkNTCj9atlVb0B6oVpZbJNg2TO7iFRxEpWQYMiW', '2022-11-04 03:20:27', '2022-11-04 03:20:27'),
(152, '3CtHzYO5iQX4m3MFdhtPEptPVJuQa0qpaKAakptdlugRETAd3PObVsR5A76EarLn', '2022-11-04 09:05:47', '2022-11-04 09:05:47'),
(153, 'hTk1vCuqFtzJ2MaeAjwxdrZWhHfonVEM6jBsKpTIMRCyBiPnAoOvIpEBC4qlhujv', '2022-11-04 09:30:47', '2022-11-04 09:30:47'),
(154, 'cmiB643jv9nrnZuNxkezZDYPSUcynBRmepxHF7mHY0xrPzrrvPoo5Ip55ib5LPRP', '2022-11-04 10:13:01', '2022-11-04 10:13:01'),
(155, '9KIiyX6jhojCEkoTjqiMmdMIqoq51x05VDzp5f2sL6akCXHTNfjguSfs3hMwBmP5', '2022-11-04 10:46:26', '2022-11-04 10:46:26'),
(156, 'ixvpUyGXf9VZGVonXfhWtTxHZSoaDgPafa2EryThYXDxMYb8mRjAbTUBwIlhD4Kp', '2022-11-04 10:59:05', '2022-11-04 10:59:05'),
(157, 'GpE6gMGWFI5Eud3l80iLxwVD80HCQSwPUj15KaJJAcluID517XV3eAPF9gRdLJhE', '2022-11-04 15:18:04', '2022-11-04 15:18:04'),
(158, 'mfPpahmxx4yQBVUScE6yfUescbTgy8Wi7ZPZuzDPtpPPVMHPCVezNw8deVEl1tsL', '2022-11-04 15:29:39', '2022-11-04 15:29:39'),
(159, 'YwsCA8leDyuWwrwaJHfvwOrl6QA28MFjwPpnNk37rbGP95r0KMKUyUy69bP8mAYY', '2022-11-04 15:57:07', '2022-11-04 15:57:07'),
(160, 'ptyQMXTsuCUHRFMowFJfSSyXCBrS5uIZjuEsJ02FavooT9LJmtIHFfqBkf46AQJ0', '2022-11-04 16:12:24', '2022-11-04 16:12:24'),
(161, 'mpWMzQHzs7u0LGYERnLCJsXD8toDy3AewoDdSskY7maNl7kDAoeNLBHlB7uEV5Kt', '2022-11-04 16:41:24', '2022-11-04 16:41:24'),
(162, 'xHSLINlbweQFYhpqtJyzJx19jxbouFxjTe6cywvbPZ45ElzPwO0RLjvV3YgplseQ', '2022-11-04 16:46:33', '2022-11-04 16:46:33'),
(163, 'gCyMlo3Bxa09FOHSsx4EDW6HZz9OSVaEpqVMySBfUlUPosfYEzCZIMLqQ84jcGyq', '2022-11-04 17:56:09', '2022-11-04 17:56:09'),
(164, 'dz7enjN9ZJLqBTfp6oTEiLHZQ7hsuavrTu2N8xksYnfWYIbaF7rFnErhWogKzXI2', '2022-11-04 18:02:37', '2022-11-04 18:02:37'),
(165, 'MMy085ejO0T6ObIzStf54J93ia4MykctNJybpFP5O4eKQHY7YEjb465yEYBJO91a', '2022-11-04 19:12:52', '2022-11-04 19:12:52'),
(166, '3OBU88TG4cSyaE2TxOLLdJ18dOYiwcZQz01ntptJ8pkFc994hmNKCpG4jeQUpRXi', '2022-11-04 19:32:16', '2022-11-04 19:32:16'),
(167, 'YGK48iZCqextFLB69wTqZLXlWim41DJYsi7jnMIGbyLw7RzAEumAgZcyAZX48wwB', '2022-11-05 01:32:08', '2022-11-05 01:32:08'),
(168, 'H6QsIGUgObL6iCClzWCZFkImK6mdMENCBQruYgkLlWUFeMmzlWFSoDuj4xZEjLW7', '2022-11-05 06:59:15', '2022-11-05 06:59:15'),
(169, '9SOsDt0fl9JXXw5dOTRYsf9wl0qhxSMOleLezbgFwJ6FRRjJP24MCecTfhAutr0p', '2022-11-06 00:44:51', '2022-11-06 00:44:51'),
(170, 'EqRAZsTK4xfTx1hZlFJrJ4JK0WaoCBjzrwe7LXeKBrVMeblhNfg7Bt9gaaBxuNeS', '2022-11-06 06:32:10', '2022-11-06 06:32:10'),
(171, 'jKso6WxkTcUvD1adRTjx4IJ2cN28pfzHs3UIuhxcrtwjcSFD2G07VtTKLx06kkNn', '2022-11-06 13:23:14', '2022-11-06 13:23:14'),
(172, 'DROer6MzZt7ABly7hwUFdUoGm53zEJIEKNiRww5trwLBfKFg9tnTXbDoEzQ4oq13', '2022-11-06 14:25:05', '2022-11-06 14:25:05'),
(173, 'PfkWyl5LrjCWZd0i6T5gzF8GHoH3FltLZuQcf7vP6zs9ulSRAonDSPMCrsBL3xan', '2022-11-06 17:34:39', '2022-11-06 17:34:39'),
(174, 'Am59umUWK89bapVBwyJGCjv6RWufMww7i8QFnvzhLYx46dZxhUgAWrFZbRGoFCsD', '2022-11-06 18:08:45', '2022-11-06 18:08:45'),
(175, 'a2ptsYzIFPnW5Q2ymWiQ9vqYqqCrmvt0Zi9RPdRHXS9LzNLe5HDpHChhEUiB4vEw', '2022-11-06 18:54:03', '2022-11-06 18:54:03'),
(176, '5TOho4SJMGBo2wPce2EgZzwYix4kBtAhsra8qNcoG9NvKjUL8syNTwVunKg6J8Qt', '2022-11-06 21:00:53', '2022-11-06 21:00:53'),
(177, 'xv2QQa8hc7m9OCRbbE6Wapk88wksz64DcUdsL3tIGLJXWdQ1YCk23kgMvk4EHDHD', '2022-11-06 23:05:32', '2022-11-06 23:05:32'),
(178, 'C2mKsU1NVZvlmmm3bucyYR7L8gLnCokK0I5deqOyVrtMf3Wge0FBsnS7AEtbe5b2', '2022-11-07 16:38:14', '2022-11-07 16:38:14'),
(179, 'VJqOf6oMAPZUygFFCp8pMRvDXAUL0rs41UBUtcied94YVCNEujrLkSK7M2nluneu', '2022-11-07 20:13:17', '2022-11-07 20:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 10, 32, '2022-11-01 07:25:41', '2022-11-01 07:25:41'),
(5, 1, 48, '2022-11-01 11:42:58', '2022-11-01 11:42:58'),
(6, 1, 31, '2022-11-02 15:11:17', '2022-11-02 15:11:17'),
(7, 1, 64, '2022-11-05 15:37:48', '2022-11-05 15:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `seller_id`, `admin_id`, `amount`, `transaction_note`, `approved`, `created_at`, `updated_at`) VALUES
(3, 1, NULL, '50', 'Test Mode', 0, '2022-08-24 10:29:13', '2022-08-24 10:29:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagebuilder__pages`
--
ALTER TABLE `pagebuilder__pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagebuilder__page_translations`
--
ALTER TABLE `pagebuilder__page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pagebuilder__page_translations_page_id_locale_unique` (`page_id`,`locale`);

--
-- Indexes for table `pagebuilder__settings`
--
ALTER TABLE `pagebuilder__settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pagebuilder__settings_setting_unique` (`setting`);

--
-- Indexes for table `pagebuilder__uploads`
--
ALTER TABLE `pagebuilder__uploads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pagebuilder__uploads_public_id_unique` (`public_id`),
  ADD UNIQUE KEY `pagebuilder__uploads_server_file_unique` (`server_file`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_data`
--
ALTER TABLE `promotion_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_verify`
--
ALTER TABLE `seller_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100037;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `pagebuilder__pages`
--
ALTER TABLE `pagebuilder__pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pagebuilder__page_translations`
--
ALTER TABLE `pagebuilder__page_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pagebuilder__settings`
--
ALTER TABLE `pagebuilder__settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagebuilder__uploads`
--
ALTER TABLE `pagebuilder__uploads`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promotion_data`
--
ALTER TABLE `promotion_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seller_verify`
--
ALTER TABLE `seller_verify`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pagebuilder__page_translations`
--
ALTER TABLE `pagebuilder__page_translations`
  ADD CONSTRAINT `pagebuilder__page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pagebuilder__pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
