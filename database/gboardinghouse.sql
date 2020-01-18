-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2020 at 08:34 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gboardinghouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(10) UNSIGNED NOT NULL,
  `amen_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rate` decimal(16,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `amen_name`, `description`, `rate`) VALUES
(2, 'Aircon', 'Additional Monthly Payment', '2000.00'),
(8, 'Rice Cooker', 'Additional monthly', '200.00'),
(9, 'Wifi', 'Additional monthly payment', '720.00');

-- --------------------------------------------------------

--
-- Table structure for table `financials`
--

CREATE TABLE `financials` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` enum('Paid','Unpaid','Overdue') COLLATE utf8_unicode_ci NOT NULL,
  `remarks` enum('Advance Payment','Deposit','Rent') COLLATE utf8_unicode_ci NOT NULL,
  `payment_for` date NOT NULL,
  `debit` decimal(16,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(16,2) NOT NULL DEFAULT '0.00',
  `occupant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `financials`
--

INSERT INTO `financials` (`id`, `status`, `remarks`, `payment_for`, `debit`, `credit`, `occupant_id`, `created_at`, `updated_at`) VALUES
(1, 'Paid', 'Rent', '2019-12-27', '0.00', '122333.00', 121, '2019-12-27 10:58:28', '2019-12-27 10:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_12_22_053531_create_amenities_table', 1),
(4, '2017_12_23_032543_create_rooms_table', 1),
(5, '2017_12_27_053405_create_reservations_table', 1),
(6, '2017_12_27_053406_create_occupants_table', 1),
(7, '2018_01_08_071252_create_debits_table', 1),
(8, '2018_01_08_071309_create_payments_table', 1),
(9, '2018_01_08_074303_create_room_capacities_table', 1),
(10, '2018_01_10_094836_add_foriegn_key_to_table_occupancy', 1),
(11, '2018_01_15_073113_create_financials_table', 1),
(12, '2017_12_28_064658_add_email_token_to_users', 2),
(13, '2018_02_07_081406_add_verified_to_users', 2),
(14, '2018_02_07_085950_create_jobs_table', 3),
(15, '2018_02_07_085958_create_failed_jobs_table', 3),
(16, '2018_02_17_093711_create_occupant_amenities_table', 4),
(17, '2018_02_19_171633_add_check_out_to_reservations', 5),
(18, '2018_02_23_103440_add_start_date_to_occupants', 6),
(19, '2018_03_05_081331_add_start_date_to_occupants', 7);

-- --------------------------------------------------------

--
-- Table structure for table `occupants`
--

CREATE TABLE `occupants` (
  `id` int(10) UNSIGNED NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `occupants`
--

INSERT INTO `occupants` (`id`, `flag`, `created_at`, `updated_at`, `end_date`, `user_id`, `room_id`, `start_date`) VALUES
(120, 0, '2019-04-03 13:16:45', '2019-12-20 13:20:40', '2019-12-20', 152, 4, '0000-00-00'),
(121, 1, '2019-12-21 03:58:44', '2019-12-21 03:58:44', NULL, 152, 2, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `occupant_amenities`
--

CREATE TABLE `occupant_amenities` (
  `id` int(10) UNSIGNED NOT NULL,
  `occupant_id` int(10) UNSIGNED NOT NULL,
  `amenities_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `occupant_amenities`
--

INSERT INTO `occupant_amenities` (`id`, `occupant_id`, `amenities_id`, `created_at`, `updated_at`) VALUES
(1, 120, 8, NULL, NULL),
(2, 120, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('rainson@gmail.com', '$2y$10$bc5tIrmvJ69g.1Fq6RjxbOTLn1mSmfn6MukOqS1JyBOMEAw33qn9K', '2018-02-07 09:39:15'),
('lasaweroll@gmail.com', '$2y$10$v6cUfg1oqnSNza96pPJYieNR0UDBoFP.f9IkCRpid7arAA5SMPIHm', '2019-12-21 05:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(10) UNSIGNED NOT NULL,
  `check_in` date NOT NULL,
  `status` enum('Active','Settled','Cancel') COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `check_out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `check_in`, `status`, `user_id`, `room_id`, `created_at`, `updated_at`, `check_out`) VALUES
(1, '2019-12-22', 'Active', 152, 11, '2019-12-19 06:20:45', '2019-12-19 06:20:45', '2020-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Available','Unavailable','Occupied','Full') COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `current_capacity` int(11) NOT NULL DEFAULT '0',
  `max_capacity` int(11) NOT NULL,
  `rate` decimal(16,2) NOT NULL,
  `room_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_no`, `status`, `type`, `description`, `current_capacity`, `max_capacity`, `rate`, `room_image`, `created_at`, `updated_at`) VALUES
(1, '2F-201', 'Full', 'Private', 'With C.R', 1, 2, '2500.00', '1518311433.jpg', '2018-02-04 18:19:33', '2018-03-05 00:10:46'),
(2, '2F-202', 'Occupied', 'Bed Spacer', 'With C.R', 1, 2, '2500.00', '1518311538.jpg', '2018-02-04 18:19:33', '2019-12-21 03:58:44'),
(3, '2F-203', 'Occupied', 'Bed Spacer', 'With C.R', 3, 4, '4000.00', '1518311571.jpg', '2018-02-04 18:19:33', '2018-03-05 00:23:41'),
(4, '2F-204', 'Available', 'Bed Spacer', 'With C.R', 0, 6, '7200.00', '1518311853.jpg', '2018-02-04 18:19:33', '2019-12-20 13:20:40'),
(5, '2F-205', 'Available', 'Bed Spacer', 'Common C.R', 0, 2, '3200.00', '1518311871.jpg', '2018-02-04 18:19:34', '2018-02-22 10:39:51'),
(6, '2F-206', 'Available', 'Private', 'Common C.R', 0, 4, '3200.00', '1518311909.jpg', '2018-02-04 18:19:34', '2018-02-27 11:37:42'),
(7, '3F-201', 'Full', 'Private', 'Common C.R', 1, 2, '3200.00', '1518311928.jpg', '2018-02-04 18:19:34', '2018-02-28 01:51:09'),
(8, '3F-202', 'Available', 'Bed Spacer', 'with C.R', 0, 2, '3000.00', '1518311951.jpg', '2018-02-04 18:19:34', '2018-02-11 01:19:11'),
(9, '3F-203', 'Available', 'Private', 'Common C.R', 0, 2, '2500.00', '1518311967.jpg', '2018-02-04 18:19:34', '2018-02-11 09:36:20'),
(10, '3F-204', 'Available', 'Private', 'with C.R', 0, 2, '3200.00', '1518311995.jpg', '2018-02-04 18:19:34', '2018-02-27 11:24:57'),
(11, '3F-205', 'Available', 'Bed Spacer', 'Common C.R', 0, 4, '4000.00', '1518312320.jpg', '2018-02-04 18:19:34', '2018-02-20 14:16:32'),
(12, '3F-206', 'Available', 'Private', 'Common C.R', 0, 4, '4000.00', '1518312305.jpg', '2018-02-04 18:19:34', '2018-02-20 04:00:51'),
(13, '3F-207', 'Available', 'Private', 'Common C.R', 0, 2, '3200.00', '1518312288.jpg', '2018-02-04 18:19:34', '2018-02-22 09:25:45'),
(14, '3F-208', 'Available', 'Bed Spacer', 'with C.R', 0, 2, '3200.00', '1518312275.jpg', '2018-02-04 18:19:34', '2018-02-20 04:36:12'),
(15, '3F-209', 'Available', 'Bed Spacer', 'Common C.R', 0, 2, '3200.00', '1518312229.jpg', '2018-02-04 18:19:34', '2018-02-18 08:55:36'),
(16, '4F-201', 'Available', 'Private', 'Common C.R', 0, 4, '2500.00', '1518312196.jpg', '2018-02-04 18:19:34', '2018-02-23 06:21:18'),
(17, '4F-202', 'Available', 'Bed Spacer', 'Common C.R', 0, 4, '3200.00', '1518312132.jpg', '2018-02-04 18:19:34', '2018-02-11 01:22:12'),
(18, '4F-203', 'Available', 'Bed Spacer', 'Common C.R', 0, 2, '2500.00', '1518312065.jpg', '2018-02-04 18:19:34', '2018-02-11 01:21:05'),
(19, '4F-204', 'Available', 'Bed Spacer', 'Common C.R', 0, 2, '2500.00', '1518312047.jpg', '2018-02-04 18:19:34', '2018-02-27 13:31:36'),
(20, '4F-205', 'Available', 'Bed Spacer', 'Common C.R', 0, 4, '3200.00', '1518312025.jpg', '2018-02-04 18:19:34', '2018-02-11 01:20:25'),
(21, '4F-206', 'Available', 'Bed Spacer', 'Common C.R', 0, 2, '2500.00', '1518312335.jpg', '2018-02-05 11:09:33', '2018-02-11 01:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_ad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_no` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('Client','Tenant','Admin') COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `street_ad`, `city`, `province`, `dob`, `email`, `contact_no`, `username`, `password`, `status`, `role`, `remember_token`, `created_at`, `updated_at`, `email_token`, `verified`) VALUES
(151, 'Rainson', 'Goloso', '0028 Janssen Heights road barangay Dampas', 'tagbilaran', 'bohol', '1997-09-24', 'rainsongame@gmail.com', '09123861788', 'rson', '$2y$10$91L14c96M6Hu66taspzC9eZs.XHv0nG84v9zSQ/XuA/T5iiwttMSW', 'Active', 'Admin', 'VqJAIW1kvyR9jXiCOjlnEXMv7cQqWEYYCouQ9VHYKjj3IPNk6CooA7P9AG5J', '2019-04-03 12:44:13', '2019-04-03 12:49:16', NULL, 1),
(152, 'Test', 'Name', '0129312', 'rqwrqw', 'qweqwe', '2004-12-14', 'asdad@gmail.com', '09123113411', '23231', '$2y$10$KdQIWtJqWWl/amBQRj7xCeFU1xtv7Hb9iAPiUoi7PMELuujEKUFXe', 'Active', 'Tenant', NULL, '2019-04-03 13:01:51', '2019-12-21 03:58:44', NULL, 0),
(153, 'Rainson', '123', '1231', '123123', '213124', '1997-06-13', 'lasaweroll@gmail.com', '09123861788', 'helloword', '$2y$10$Q9r56euZM8kWujnp8f1bJ.v6DtfuVKON3e2VNmeCqBN0xWH7pcztu', 'Active', 'Tenant', NULL, '2019-12-20 09:01:25', '2019-12-21 03:57:43', NULL, 0),
(154, 'jad', 'asd', '2222123asd', 'aasdasd', 'qweqwe', '2004-12-21', 'golosorainsona@gmail.com', '09123861788', 'wasder', '$2y$10$fju3S0jSCBKJ1RASW9WCnOvEkjhVISpTHJBuiF7gCtIV.3phS.fJ.', 'Active', 'Client', NULL, '2019-12-20 09:05:03', '2019-12-20 09:05:03', 'jHa9WHcCQrhZFmQyHqhBRH399m11JUSBRaskGktW', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financials`
--
ALTER TABLE `financials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financials_occupant_id_foreign` (`occupant_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occupants`
--
ALTER TABLE `occupants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occupants_user_id_foreign` (`user_id`),
  ADD KEY `occupants_room_id_foreign` (`room_id`);

--
-- Indexes for table `occupant_amenities`
--
ALTER TABLE `occupant_amenities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occupant_amenities_occupant_id_foreign` (`occupant_id`),
  ADD KEY `occupant_amenities_amenities_id_foreign` (`amenities_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_user_id_foreign` (`user_id`),
  ADD KEY `reservations_room_id_foreign` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `financials`
--
ALTER TABLE `financials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `occupants`
--
ALTER TABLE `occupants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `occupant_amenities`
--
ALTER TABLE `occupant_amenities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `financials`
--
ALTER TABLE `financials`
  ADD CONSTRAINT `financials_occupant_id_foreign` FOREIGN KEY (`occupant_id`) REFERENCES `occupants` (`id`);

--
-- Constraints for table `occupants`
--
ALTER TABLE `occupants`
  ADD CONSTRAINT `occupants_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `occupants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `occupant_amenities`
--
ALTER TABLE `occupant_amenities`
  ADD CONSTRAINT `occupant_amenities_amenities_id_foreign` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`id`),
  ADD CONSTRAINT `occupant_amenities_occupant_id_foreign` FOREIGN KEY (`occupant_id`) REFERENCES `occupants` (`id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
