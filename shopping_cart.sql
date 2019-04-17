-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2019 at 12:42 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminuser`
--

CREATE TABLE `adminuser` (
  `id` int(11) NOT NULL,
  `userid` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminuser`
--

INSERT INTO `adminuser` (`id`, `userid`, `password`) VALUES
(1, 'admin', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL DEFAULT '0',
  `category_name` varchar(60) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `parent_id`) VALUES
(1, 'Automobiles', 0),
(2, 'Cellular', 0),
(3, 'Sport', 0),
(4, 'AudioVideo', 0),
(5, 'Beverages', 0),
(8, 'Mercedes', 1),
(9, 'Toyota', 1),
(12, 'In-line skates', 3),
(13, 'Snowboards', 3),
(14, 'Samsung', 2),
(15, 'Ericsson', 2),
(17, 'Nokia', 2),
(18, 'Siemens', 2),
(20, 'DVD', 4),
(21, 'mp3-players', 4),
(23, 'Books', 0),
(24, 'Lexus', 1),
(25, 'Clothes', 0),
(27, 'Computers', 0),
(38, 'Winter', 25),
(39, 'Summer', 25),
(40, 'Home', 25),
(46, 'Alcohol', 5),
(47, 'Alcohol free', 5),
(51, 'Notebooks', 27),
(57, 'PDA', 27),
(58, 'Personal', 27),
(63, 'Lotus', 1),
(64, 'Lamborghini', 1),
(71, 'Harry Potter', 23),
(72, 'Design', 23),
(73, 'Programming', 23),
(74, 'Classic', 25),
(75, 'Multimedia', 27),
(76, 'Home theatres', 4),
(77, 'Bycicles', 3),
(78, 'new  category', 0),
(79, 'new subcategory', 78);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL DEFAULT '0',
  `storename` varchar(50) NOT NULL DEFAULT '',
  `storeurl` varchar(50) NOT NULL DEFAULT '',
  `ordernoticeemail` varchar(50) NOT NULL DEFAULT '',
  `cursymbol` varchar(6) NOT NULL DEFAULT '',
  `curcode` varchar(6) NOT NULL DEFAULT '',
  `aboutustext` text NOT NULL,
  `shipdeltext` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `storename`, `storeurl`, `ordernoticeemail`, `cursymbol`, `curcode`, `aboutustext`, `shipdeltext`) VALUES
(1, 'My Shopping Cart', 'http://www.mycompany.com', 'notice@mycompany.com', '$', 'USD', 'Rose India shopping cart simple project', 'Here you can provide information about shipping and payment options.This HTML text can be edited in the administrative mode.');

-- --------------------------------------------------------

--
-- Table structure for table `orderedcarts`
--

CREATE TABLE `orderedcarts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_name` char(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderedcarts`
--

INSERT INTO `orderedcarts` (`id`, `product_id`, `order_id`, `product_name`, `price`, `quantity`, `user_id`, `status`) VALUES
(71, 11, 0, '  Samsung A300\n							', 249.99, 1, 1, 'CRT'),
(70, 52, 0, '  BURTON Power\n							', 659, 1, 1, 'CRT'),
(69, 28, 0, '  Black Dahlia, The (Widescreen)\n							', 21.73, 1, 1, 'CRT');

-- --------------------------------------------------------

--
-- Table structure for table `orderinfo`
--

CREATE TABLE `orderinfo` (
  `id` int(11) NOT NULL,
  `jam_plan_id` varchar(25) DEFAULT NULL,
  `openpay_order_id` varchar(25) DEFAULT NULL,
  `new_online_order_status` varchar(25) DEFAULT NULL,
  `new_online_order_capture_status` varchar(25) DEFAULT NULL,
  `online_order_status` varchar(25) DEFAULT NULL,
  `order_approve_status` varchar(25) DEFAULT NULL,
  `online_order_reduction_status` varchar(25) DEFAULT NULL,
  `reduction_amount` varchar(11) DEFAULT '0.00',
  `order_dispatch_status` varchar(25) DEFAULT NULL,
  `min_max_purchase_price_status` varchar(25) DEFAULT NULL,
  `order_fraud_alert_status` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderinfo`
--

INSERT INTO `orderinfo` (`id`, `jam_plan_id`, `openpay_order_id`, `new_online_order_status`, `new_online_order_capture_status`, `online_order_status`, `order_approve_status`, `online_order_reduction_status`, `reduction_amount`, `order_dispatch_status`, `min_max_purchase_price_status`, `order_fraud_alert_status`) VALUES
(11, '3000000026164', NULL, '0', NULL, '0', 'Approved', '12711', '100.0', '12713', NULL, NULL),
(12, '3000000026165', NULL, '0', '0', '0', 'Approved', NULL, NULL, NULL, NULL, NULL),
(13, '3000000026166', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '3000000026196', NULL, '0', '0', '0', 'Approved', NULL, NULL, NULL, NULL, NULL),
(15, '3000000026203', NULL, '0', '0', '0', 'Approved', NULL, NULL, NULL, NULL, '0'),
(16, '3000000026217', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '3000000026218', NULL, '0', '0', '0', 'Approved', '0', '250.0', '12713', NULL, NULL),
(20, '3000000026219', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '3000000026274', NULL, '0', '0', '0', 'Approved', '0', '120.0', '0', NULL, '0'),
(23, '3000000026281', NULL, '0', '0', '0', 'Approved', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `cust_first_name` varchar(30) DEFAULT NULL,
  `other_names` varchar(11) DEFAULT NULL,
  `cust_last_name` varchar(30) DEFAULT NULL,
  `cust_email` varchar(30) DEFAULT NULL,
  `cust_country` varchar(30) DEFAULT NULL,
  `cust_zip` varchar(30) DEFAULT NULL,
  `cust_state` varchar(30) DEFAULT NULL,
  `cust_city` varchar(30) DEFAULT NULL,
  `cust_phone` varchar(30) DEFAULT NULL,
  `cust_fax` varchar(11) DEFAULT NULL,
  `credit_card_type` varchar(30) DEFAULT NULL,
  `card_holder_name` varchar(30) DEFAULT NULL,
  `credit_card_number` varchar(20) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `customer_notes` varchar(255) DEFAULT NULL,
  `cvv_number` varchar(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `purchase_price` varchar(11) DEFAULT NULL,
  `plan_creation_type` varchar(11) DEFAULT NULL,
  `retailer_order_no` varchar(11) DEFAULT NULL,
  `charge_back_count` varchar(11) DEFAULT NULL,
  `customer_quality` varchar(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `res_address1` varchar(255) DEFAULT NULL,
  `res_address2` varchar(255) DEFAULT NULL,
  `res_suburb` varchar(255) DEFAULT NULL,
  `del_address1` varchar(255) DEFAULT NULL,
  `del_address2` varchar(255) DEFAULT NULL,
  `del_suburb` varchar(255) DEFAULT NULL,
  `del_postcode` varchar(255) DEFAULT NULL,
  `del_state` varchar(255) DEFAULT NULL,
  `tender_name` varchar(222) DEFAULT NULL,
  `amount` varchar(11) DEFAULT NULL,
  `payment_type` varchar(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_time`, `cust_first_name`, `other_names`, `cust_last_name`, `cust_email`, `cust_country`, `cust_zip`, `cust_state`, `cust_city`, `cust_phone`, `cust_fax`, `credit_card_type`, `card_holder_name`, `credit_card_number`, `expiration_date`, `customer_notes`, `cvv_number`, `user_id`, `purchase_price`, `plan_creation_type`, `retailer_order_no`, `charge_back_count`, `customer_quality`, `dob`, `gender`, `res_address1`, `res_address2`, `res_suburb`, `del_address1`, `del_address2`, `del_suburb`, `del_postcode`, `del_state`, `tender_name`, `amount`, `payment_type`) VALUES
(17, NULL, 'new user', '', 'asdasdas', 'fdgdsfg@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(16, NULL, 'new user', '', 'asdasdas', 'fdgdsfg@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(15, NULL, 'Amit', '', 'Maity', 'sayan@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(14, NULL, 'Amit', 'Kumar', 'Maity', 'amit@gmail.com', NULL, '', '', '', '4224324342', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(13, NULL, 'Sayan', 'Sundar', 'Sarkar', 'sayan@digitalaptech.com', NULL, '', '', '', '4224324342', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(11, NULL, 'Amit', 'Kumar', 'Maity', 'amit@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '1103.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(12, NULL, 'Amit', 'Kumar', 'Maity', 'amit@gmail.com', NULL, '', '', '', '4224324342', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '1103.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(18, NULL, 'Amit', 'Kumar', 'Maity', 'amit@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(19, NULL, 'Amit', 'Kumar', 'Maity', 'amit@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(20, NULL, 'Amit', 'Kumar', 'Maity', 'amit@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Bank'),
(21, NULL, 'Amit', '', 'Maity', 'fdgdsfg@gmail.com', NULL, '', '', '', '4224324342', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '680.73', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(22, NULL, 'Amit', 'Kumar', 'Maity', 'amit@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '930.72', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay'),
(23, NULL, 'Amit', 'Kumar', 'Maity', 'amit@gmail.com', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, 0, '930.72', 'Pending', 'O3562342', NULL, NULL, NULL, 'M', '', '', '', '', '', '', '', '', NULL, NULL, 'Openpay');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `product_name` varchar(60) NOT NULL DEFAULT '',
  `product_price` varchar(40) NOT NULL DEFAULT '',
  `list_price` varchar(20) DEFAULT NULL,
  `image_name` varchar(60) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `brief_desc` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_price`, `list_price`, `image_name`, `quantity`, `description`, `brief_desc`) VALUES
(1, 9, 'Toyota Land Cruiser 100', '70000', '71000', 'ToyotaLandCruiser100.jpg', 2, '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(2, 9, 'Toyota-98', '80000', '81000', 'Toyota-98.jpg', 5, '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(3, 8, 'Mercedes S600', '85990', '87900', 'MercedesS600.jpg', 2, 'Mercedes', 'Mercedes  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(4, 24, 'Lexus GS300', '4900', '5100', 'LexusGS300.jpg', 2, '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(5, 24, 'Lexus RX300', '52000', '54000', 'LexusRX300.jpg', 2, '', ''),
(6, 63, 'Lotus Esprit', '72000', '80000', 'LotusEsprit.jpg', 2, '', ''),
(7, 64, 'Lamborghini Diablo', '190000', '230000', 'LamborghiniDiablo.jpg', 2, '', ''),
(8, 14, 'Samsung R200', '135', '140', 'SamsungR200.jpg', 5, '', ''),
(9, 14, 'Samsung N100', '157', '162', 'SamsungN100.jpg', 14, '', NULL),
(10, 14, 'Samsung A100', '187', '197', 'SamsungA100.jpg', 15, '', ''),
(11, 14, 'Samsung A300', '249.99', '269.00', 'SamsungA300.jpg', 11, '', 'The premium SGH-A300, designed to succeed the SGH-A100 and A110, is targeted for people who lead in fashion rather than follow.'),
(12, 15, 'Ericsson T29', '173', '183', 'EricssonT29.jpg', 10, '', ''),
(13, 15, 'Ericsson T39', '266', '286', 'EricssonT39.jpg', 10, '', ''),
(14, 15, 'Ericsson T60', '345', '380', 'EricssonT60.jpg', 20, '', ''),
(15, 14, 'Samsung R20', '125', '130', 'Samsung_R20.jpg', 10, '', ''),
(16, 14, 'Samsung-n30', '200', '225', '1551217932_635_samsung_galaxy_m30.jpg', 12, '', ''),
(22, 74, 'Classic01', '50', '57', 'Classic01.jpg', 10, '', ''),
(27, 20, 'The Last Kiss', '15.30', '20.00', 'thelastkiss.jpg', 5, '', ''),
(28, 20, 'Black Dahlia, The (Widescreen)', '21.73', '29.98', 'black_dahlia.jpg', 10, '', ''),
(29, 20, 'Step Up(Widescreen)', '23.42', '29.99', 'stepup.jpg', 20, '', ''),
(30, 20, 'Woh Lamhe', '22.99', '25.30', 'wohlamhe.jpg', 20, '', ''),
(31, 20, '2 Hot 2 Handle', '12.99', '14.99', 'hot_handle.jpg', 20, '', ''),
(32, 76, 'JVC LT-37X987 LCD HDTV', '5000', '8000', 'jvclcdtv.jpg', 22, '', ''),
(33, 21, 'Apple iPod Nano (2GB, black)', '129', '135', 'Apple_ iPod_Nano.gif', 20, '', ''),
(34, 20, 'GURU', '9.00', '10.00', 'guruh061106_3.jpg', 20, '', ''),
(35, 17, 'Nokia 6600', '250', '280', 'nokia_6600.jpg', 40, '', ''),
(36, 17, 'Nokia 3230', '250', '280', 'nokia3230.jpg', 10, '', ''),
(37, 17, 'Nokia N90', '300', '315', 'nokian-90.jpg', 5, '', ''),
(38, 17, 'Nokia N91', '625', '700', 'nokia-N91.jpg', 5, '', ''),
(39, 40, 'Sweeter', '47', '55', '480_095_small.jpg', 10, '', ''),
(45, 57, 'Compaq iPAQ H3760', '365', '377', '220px-Hp-ipaq-hw910.jpg', 5, '', '3.8’’, 240 õ 320, 206MHz, 64MB, 32MB ROM, MS Pocket PC 2002'),
(52, 13, 'BURTON Power', '659', '700', 'ford-pre-cross-flow.jpg', 5, '', ''),
(53, 12, 'Roces Khuti', '179', '200', 'RocesKhuti.jpg', 5, '', ''),
(54, 46, 'Rum Captain Morgan', '14', '15', '46_captain_morgan.jpg', 20, '', ''),
(55, 47, 'Coca-Cola', '0.99', '1.00', '732_469.jpg', 50, '', ''),
(56, 46, 'Budwieser', '0.39', '0.59', 'ci-budweiser-67a7f61cde5c4cd0.jpeg', 50, '', ''),
(57, 71, 'Harry Potter book #1', '5.0', '8.0', '15794s.jpg', 20, '', 'Harry Potter has never played a sport while flying on a broomstick. He`s never worn a cloak of invisibility, befriended a giant, or helped hatch a dragon...'),
(58, 71, 'Harry Potter book #2', '5.0', '7.0', '15795s.jpg', 25, '', 'The Dursleys were so mean and hideous that summer that all Harry Potter wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. '),
(59, 71, 'Harry Potter. Magic Eye. Album', '3.0', '5.0', 'HarryPotterMagicEyeAlbum.jpg', 20, '', ''),
(60, 73, 'Professional PHP programming', '15', '17', '8472s.jpg', 10, '', 'PHP is a new technology that is growing fast...'),
(61, 73, 'Visual C++ and MFC', '17', '20', '4064s.jpg', 10, '', 'Tap into a collection of programming solutions that use the Microsoft Foundation Class(MFC) library...'),
(62, 72, 'Stiv Krug :: Web-design ``Don`', '8.0', '10.0', '10805s.jpg', 15, '', 'Exactly how do you deliver great web usability?...'),
(63, 18, 'Siemens SL45', '240', '250', '720_ssl45_small.jpg', 10, '', 'What if a phone is also an MP3 player, a digital voice recorder, an organizer? Can it still be called a phone? '),
(64, 18, 'Siemens ME45', '219', '250', '532_sme45.jpg', 10, '', 'With the ME45 you have it right in your hand. Voice direction and dialling, flexible memorymanagement for total personalisation, easy and fast calendar synchronisation with Microsoft Outlook, GPRS for really fast net action via your notebook or WAP.'),
(65, 18, 'Siemens M35i', '95.0', '98.0', '366_sm35_small.jpg', 5, '', 'he M35i gives you mobile web access, Personal Messaging with pictures, Intelligent Typing, and even allows the occasional game whenever life slows down..'),
(66, 75, 'BOSE Companion 3 Three Piece Multimedia Computer Speaker Sys', '249', '250', '77861534.jpg', 5, '', ''),
(67, 75, 'Ultra USB 2.0 WEB CAM Video Camera', '63.05', '65.00', '68886096.jpg', 15, '', 'Creative Labs have created the WebCam Live! Ultra . You can place this camera almost anywhere, such as any flat surface, flat-panel and notebook displays due to the camera''s built-in flexible four-way base. '),
(68, 77, 'Dahon Vitesse D7 with Cyclone Electric Kit', '800', '805', 't_21179.jpg', 10, '', 'If your shopping for a electric power-assisted bike, then you simply must check this out!'),
(69, 77, 'Felt QX60 - 2007 Model', '450', '455', 't_21835.jpg', 10, '', 'Aluminium hybrid bike, by Felt.'),
(70, 79, 'new product', '354', '425', 't_21835.jpg', 5, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(30) NOT NULL DEFAULT '',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `first_name`, `last_name`, `email`, `country`, `zip`, `state`, `city`, `address`, `phone`, `fax`) VALUES
(1, 'amit', 'amit', 'amit', 'patel', 'patel@yahoo.com', 'india', '54354', 'delhi', 'delhia', 'sdfgfdjh djg jfd', '564654', 65),
(5, 'amar12', 'amar', 'amar', 'patel', 'patel@yahoo.com', 'india', '54354', 'delhi', 'delhia', 'sdfgfdjh djg jfd', '564654', 65),
(8, 'amar122', 'amar', 'amar', 'patel', 'patel@yahoo.com', 'india', '54354', 'delhi', 'delhia', 'sdfgfdjh djg jfd', '564654', 65),
(10, 'amar1222', 'amar', 'amar', 'patel', 'patel@yahoo.com', 'india', '54354', 'delhi', 'delhia', 'sdfgfdjh djg jfd', '564654', 65),
(13, 'amar11', 'amar', 'amar', 'patel', 'patel@yahoo.com', 'delhi', '564378', 'delhi', 'delhi', '128,G-26,rohini sec-3', '3453537', 3472826),
(14, 'vinod', 'vinod', 'vinod', 'Kumar', 'kumar@yahoo.com', 'delhi', '5455343', 'delhi', 'delhi', 'rohini sec-3', '3424243223', 4322432);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminuser`
--
ALTER TABLE `adminuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderedcarts`
--
ALTER TABLE `orderedcarts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminuser`
--
ALTER TABLE `adminuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `orderedcarts`
--
ALTER TABLE `orderedcarts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
