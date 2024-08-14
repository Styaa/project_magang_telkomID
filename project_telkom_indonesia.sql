-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 14, 2024 at 07:37 PM
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
-- Database: `project_telkom_indonesia`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `title`, `user_id`, `started_at`, `ended_at`, `created_at`, `updated_at`) VALUES
(1, 'Conversation 1', 1, NULL, NULL, '2024-08-14 03:27:10', '2024-08-14 03:27:10'),
(2, 'Conversation 2', 1, NULL, NULL, '2024-08-14 05:36:31', '2024-08-14 05:36:31'),
(3, 'Conversation 3', 1, NULL, NULL, '2024-08-14 09:16:24', '2024-08-14 09:16:24'),
(4, 'Conversation 4', 1, NULL, NULL, '2024-08-14 09:17:26', '2024-08-14 09:17:26'),
(5, 'Conversation5', 1, NULL, NULL, '2024-08-14 09:18:35', '2024-08-14 09:18:35'),
(6, 'Conversation6', 1, NULL, NULL, '2024-08-14 09:42:41', '2024-08-14 09:42:41'),
(7, 'Conversation7', 1, NULL, NULL, '2024-08-14 09:44:11', '2024-08-14 09:44:11'),
(8, 'Conversation8', 1, NULL, NULL, '2024-08-14 09:49:35', '2024-08-14 09:49:35'),
(9, 'Conversation9', 1, NULL, NULL, '2024-08-14 10:04:11', '2024-08-14 10:04:11'),
(10, 'Conversation10', 1, NULL, NULL, '2024-08-14 10:09:19', '2024-08-14 10:09:19'),
(11, 'Conversation11', 1, NULL, NULL, '2024-08-14 10:10:40', '2024-08-14 10:10:40'),
(12, 'Conversation12', 1, NULL, NULL, '2024-08-14 10:15:27', '2024-08-14 10:15:27'),
(13, 'Conversation13', 1, NULL, NULL, '2024-08-14 10:15:31', '2024-08-14 10:15:31'),
(14, 'Conversation14', 1, NULL, NULL, '2024-08-14 10:15:35', '2024-08-14 10:15:35'),
(15, 'Conversation15', 1, NULL, NULL, '2024-08-14 10:15:52', '2024-08-14 10:15:52'),
(16, 'Conversation16', 1, NULL, NULL, '2024-08-14 10:18:42', '2024-08-14 10:18:42'),
(17, 'Conversation17', 1, NULL, NULL, '2024-08-14 10:24:59', '2024-08-14 10:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `conversation_id` bigint UNSIGNED NOT NULL,
  `sender` enum('user','assistant') COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender`, `message_text`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, 1, 'user', 'Hai', '2024-08-14 14:20:46', NULL, NULL),
(2, 1, 'assistant', 'Hi. How are you?', '2024-08-14 14:20:46', NULL, NULL),
(3, 1, 'user', 'Good, you?', '2024-08-14 07:34:26', '2024-08-14 07:34:26', '2024-08-14 07:34:26'),
(4, 2, 'user', 'Hello', '2024-08-14 07:35:02', '2024-08-14 07:35:02', '2024-08-14 07:35:02'),
(5, 1, 'user', 'hei', '2024-08-14 07:36:15', '2024-08-14 07:36:15', '2024-08-14 07:36:15'),
(6, 2, 'user', 'How are uuuuu', '2024-08-14 07:38:11', '2024-08-14 07:38:11', '2024-08-14 07:38:11'),
(7, 1, 'user', 'test', '2024-08-14 07:40:03', '2024-08-14 07:40:03', '2024-08-14 07:40:03'),
(8, 2, 'user', 'test1', '2024-08-14 07:40:25', '2024-08-14 07:40:25', '2024-08-14 07:40:25'),
(9, 1, 'user', 'Halo', '2024-08-14 08:22:23', '2024-08-14 08:22:23', '2024-08-14 08:22:23'),
(10, 1, 'user', 'Halo', '2024-08-14 08:23:04', '2024-08-14 08:23:04', '2024-08-14 08:23:04'),
(11, 2, 'user', 'ge1', '2024-08-14 08:44:57', '2024-08-14 08:44:57', '2024-08-14 08:44:57'),
(12, 2, 'user', 'test3', '2024-08-14 08:46:24', '2024-08-14 08:46:24', '2024-08-14 08:46:24'),
(13, 2, 'user', 'test4', '2024-08-14 08:47:04', '2024-08-14 08:47:04', '2024-08-14 08:47:04'),
(14, 2, 'user', 'test5', '2024-08-14 08:49:28', '2024-08-14 08:49:28', '2024-08-14 08:49:28'),
(15, 2, 'assistant', 'It looks like you entered \"test5.\" How can I assist you today? If you have a question or need help with something specific, feel free to ask!', '2024-08-14 08:49:30', '2024-08-14 08:49:30', '2024-08-14 08:49:30'),
(16, 2, 'user', 'Halo, my name is Satya', '2024-08-14 08:49:45', '2024-08-14 08:49:45', '2024-08-14 08:49:45'),
(17, 2, 'assistant', 'Halo, Satya! How can I assist you today?', '2024-08-14 08:49:46', '2024-08-14 08:49:46', '2024-08-14 08:49:46'),
(18, 2, 'user', 'What is my name?', '2024-08-14 08:49:58', '2024-08-14 08:49:58', '2024-08-14 08:49:58'),
(19, 2, 'assistant', 'I\'m sorry, but I don\'t have access to personal information like your name. How can I assist you today?', '2024-08-14 08:49:59', '2024-08-14 08:49:59', '2024-08-14 08:49:59'),
(20, 5, 'user', 'HI', '2024-08-14 09:32:47', '2024-08-14 09:32:47', '2024-08-14 09:32:47'),
(21, 5, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 09:32:48', '2024-08-14 09:32:48', '2024-08-14 09:32:48'),
(22, 5, 'user', 'hai', '2024-08-14 09:33:57', '2024-08-14 09:33:57', '2024-08-14 09:33:57'),
(23, 5, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 09:33:59', '2024-08-14 09:33:59', '2024-08-14 09:33:59'),
(24, 5, 'user', '1+1?', '2024-08-14 09:34:14', '2024-08-14 09:34:14', '2024-08-14 09:34:14'),
(25, 5, 'assistant', '1 + 1 equals 2.', '2024-08-14 09:34:16', '2024-08-14 09:34:16', '2024-08-14 09:34:16'),
(26, 5, 'user', 'Nama ku satya', '2024-08-14 09:38:37', '2024-08-14 09:38:37', '2024-08-14 09:38:37'),
(27, 5, 'assistant', 'Hai Satya! Apa kabar? Ada yang bisa saya bantu hari ini?', '2024-08-14 09:38:38', '2024-08-14 09:38:38', '2024-08-14 09:38:38'),
(28, 5, 'user', 'mau bikin nasi goreng', '2024-08-14 09:39:12', '2024-08-14 09:39:12', '2024-08-14 09:39:12'),
(29, 5, 'assistant', 'Tentu! Berikut adalah resep sederhana untuk membuat nasi goreng:\n\n### Bahan-bahan:\n- 2 piring nasi putih (sebaiknya nasi yang sudah dingin atau sisa nasi kemarin)\n- 2 sendok makan minyak goreng\n- 2 siung bawang putih, cincang halus\n- 2 siung bawang merah, cincang halus\n- 1 butir telur (optional)\n- 100 gram ayam cincang atau udang (optional)\n- 2 sendok makan kecap manis\n- Garam secukupnya\n- Merica secukupnya\n- 2 batang daun bawang, iris halus\n- Sambal dan kerupuk (untuk penyajian)\n\n### Cara Membuat:\n1. **Panaskan Minyak:** Dalam wajan atau penggorengan, panaskan minyak goreng di atas api sedang.\n  \n2. **Tumis Bumbu:** Masukkan bawang putih dan bawang merah. Tumis hingga harum.\n\n3. **Tambahkan Protein:** Jika menggunakan ayam atau udang, masukkan dan masak hingga berubah warna.\n\n4. **Masukkan Telur:** Jika ingin menambahkan telur, buat ruang di tengah wajan dan pecahkan telur. Orak-arik hingga matang, kemudian campurkan dengan bahan lainnya.\n\n5. **Tambahkan Nasi:** Masukkan nasi putih dan aduk rata. Pastikan nasi terurai dengan baik dan tidak menggumpal.\n\n6. **Bumbui:** Tambahkan kecap manis, garam, dan merica. Aduk rata hingga semua bahan tercampur dan nasi terwarnai dengan baik.\n\n7. **Akhiri dengan Daun Bawang:** Tambahkan irisan daun bawang dan aduk sejenak.\n\n8. **Sajikan:** Angkat nasi goreng dan sajikan hangat dengan sambal dan kerupuk di sampingnya.\n\nSelamat mencoba membuat nasi goreng! Kamu bisa menambahkan sayuran seperti wortel atau kacang polong sesuai selera.', '2024-08-14 09:39:17', '2024-08-14 09:39:17', '2024-08-14 09:39:17'),
(30, 5, 'user', 'nama saya siapa', '2024-08-14 09:39:24', '2024-08-14 09:39:24', '2024-08-14 09:39:24'),
(31, 5, 'assistant', 'Saya tidak mengetahui nama Anda. Namun, jika Anda ingin memperkenalkan diri, silakan beri tahu saya nama Anda!', '2024-08-14 09:39:26', '2024-08-14 09:39:26', '2024-08-14 09:39:26'),
(32, 0, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 09:42:47', '2024-08-14 09:42:47', '2024-08-14 09:42:47'),
(33, 0, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 09:44:29', '2024-08-14 09:44:29', '2024-08-14 09:44:29'),
(34, 7, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 09:45:18', '2024-08-14 09:45:18', '2024-08-14 09:45:18'),
(35, 7, 'user', 'galoo', '2024-08-14 09:49:23', '2024-08-14 09:49:23', '2024-08-14 09:49:23'),
(36, 7, 'assistant', 'It seems like \"galoo\" might refer to various contexts. Could you please provide more details or clarify what you mean by \"galoo\"? Are you referring to a specific topic, a character, or something else?', '2024-08-14 09:49:25', '2024-08-14 09:49:25', '2024-08-14 09:49:25'),
(37, 0, 'user', 'my name is satya', '2024-08-14 09:50:44', '2024-08-14 09:50:44', '2024-08-14 09:50:44'),
(38, 0, 'assistant', 'Nice to meet you, Satya! How can I assist you today?', '2024-08-14 09:50:46', '2024-08-14 09:50:46', '2024-08-14 09:50:46'),
(39, 8, 'user', 'my name is satya', '2024-08-14 09:51:03', '2024-08-14 09:51:03', '2024-08-14 09:51:03'),
(40, 8, 'assistant', 'Nice to meet you, Satya! How can I assist you today?', '2024-08-14 09:51:04', '2024-08-14 09:51:04', '2024-08-14 09:51:04'),
(41, 8, 'user', 'who am i', '2024-08-14 09:51:13', '2024-08-14 09:51:13', '2024-08-14 09:51:13'),
(42, 8, 'assistant', 'I don’t have access to personal data about individuals unless it has been shared with me in the course of our conversation. Therefore, I can’t tell who you are. However, I can answer questions or assist you in other ways if you provide some context!', '2024-08-14 09:51:14', '2024-08-14 09:51:14', '2024-08-14 09:51:14'),
(43, 8, 'user', 'my name is satya', '2024-08-14 09:52:12', '2024-08-14 09:52:12', '2024-08-14 09:52:12'),
(44, 8, 'assistant', 'Nice to meet you, Satya! How can I assist you today?', '2024-08-14 09:52:14', '2024-08-14 09:52:14', '2024-08-14 09:52:14'),
(45, 8, 'user', 'what is my name', '2024-08-14 09:52:49', '2024-08-14 09:52:49', '2024-08-14 09:52:49'),
(46, 8, 'assistant', 'I\'m sorry, but I don\'t know your name. If you\'d like to share it, feel free to do so!', '2024-08-14 09:52:50', '2024-08-14 09:52:50', '2024-08-14 09:52:50'),
(47, 8, 'user', 'Halo', '2024-08-14 09:55:31', '2024-08-14 09:55:31', '2024-08-14 09:55:31'),
(48, 8, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 09:55:32', '2024-08-14 09:55:32', '2024-08-14 09:55:32'),
(49, 8, 'user', 'haloo', '2024-08-14 09:59:25', '2024-08-14 09:59:25', '2024-08-14 09:59:25'),
(50, 8, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 09:59:26', '2024-08-14 09:59:26', '2024-08-14 09:59:26'),
(51, 8, 'user', 'halo', '2024-08-14 10:02:27', '2024-08-14 10:02:27', '2024-08-14 10:02:27'),
(52, 8, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 10:02:29', '2024-08-14 10:02:29', '2024-08-14 10:02:29'),
(53, 8, 'user', 'mau makan', '2024-08-14 10:02:50', '2024-08-14 10:02:50', '2024-08-14 10:02:50'),
(54, 8, 'assistant', 'Tentu! Apa yang ingin kamu makan? Ada masakan atau makanan tertentu yang kamu sukai? Atau butuh rekomendasi?', '2024-08-14 10:02:51', '2024-08-14 10:02:51', '2024-08-14 10:02:51'),
(55, 8, 'user', 'makan rendang', '2024-08-14 10:03:15', '2024-08-14 10:03:15', '2024-08-14 10:03:15'),
(56, 8, 'assistant', 'Rendang adalah hidangan tradisional Indonesia yang terkenal, berasal dari Minangkabau, Sumatera Barat. Ini adalah semacam daging yang dimasak dengan rempah-rempah khas dan santan, sehingga menghasilkan rasa yang kaya dan aroma yang menggugah selera. Rendang biasanya disajikan dalam berbagai acara, terutama pada perayaan dan acara keluarga.\n\nApakah Anda ingin tahu cara memasak rendang, variasinya, atau informasi lainnya tentang hidangan ini?', '2024-08-14 10:03:16', '2024-08-14 10:03:16', '2024-08-14 10:03:16'),
(57, 9, 'user', 'haloo', '2024-08-14 10:08:53', '2024-08-14 10:08:53', '2024-08-14 10:08:53'),
(58, 9, 'assistant', 'Halo! Bagaimana kabar Anda hari ini?', '2024-08-14 10:08:54', '2024-08-14 10:08:54', '2024-08-14 10:08:54'),
(59, 0, 'user', 'Haloo', '2024-08-14 10:10:43', '2024-08-14 10:10:43', '2024-08-14 10:10:43'),
(60, 0, 'assistant', 'Halo! Ada yang bisa saya bantu hari ini?', '2024-08-14 10:10:44', '2024-08-14 10:10:44', '2024-08-14 10:10:44'),
(61, 11, 'user', 'haloo', '2024-08-14 10:11:08', '2024-08-14 10:11:08', '2024-08-14 10:11:08'),
(62, 11, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 10:11:09', '2024-08-14 10:11:09', '2024-08-14 10:11:09'),
(63, 17, 'user', 'halo', '2024-08-14 10:30:33', '2024-08-14 10:30:33', '2024-08-14 10:30:33'),
(64, 17, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 10:30:34', '2024-08-14 10:30:34', '2024-08-14 10:30:34'),
(65, 9, 'user', 'haloo', '2024-08-14 10:31:50', '2024-08-14 10:31:50', '2024-08-14 10:31:50'),
(66, 9, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 10:31:51', '2024-08-14 10:31:51', '2024-08-14 10:31:51'),
(67, 12, 'user', 'heloo', '2024-08-14 10:32:36', '2024-08-14 10:32:36', '2024-08-14 10:32:36'),
(68, 12, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 10:32:37', '2024-08-14 10:32:37', '2024-08-14 10:32:37'),
(69, 12, 'user', 'haaaaa', '2024-08-14 10:34:25', '2024-08-14 10:34:25', '2024-08-14 10:34:25'),
(70, 12, 'assistant', 'Hello! It seems like you might be feeling a bit overwhelmed or frustrated. How can I help you today?', '2024-08-14 10:34:27', '2024-08-14 10:34:27', '2024-08-14 10:34:27'),
(71, 12, 'user', 'its nothing', '2024-08-14 10:34:51', '2024-08-14 10:34:51', '2024-08-14 10:34:51'),
(72, 12, 'assistant', 'It seems like you might be feeling a bit uncertain or perhaps down. If you want to talk about it or share what\'s on your mind, I\'m here to listen and help if I can!', '2024-08-14 10:34:52', '2024-08-14 10:34:52', '2024-08-14 10:34:52'),
(73, 12, 'user', 'my name is satya', '2024-08-14 10:35:12', '2024-08-14 10:35:12', '2024-08-14 10:35:12'),
(74, 12, 'assistant', 'Nice to meet you, Satya! How can I assist you today?', '2024-08-14 10:35:13', '2024-08-14 10:35:13', '2024-08-14 10:35:13'),
(75, 12, 'user', 'can u say my name?', '2024-08-14 10:35:21', '2024-08-14 10:35:21', '2024-08-14 10:35:21'),
(76, 12, 'assistant', 'I don\'t know your name, but if you tell me, I can definitely use it!', '2024-08-14 10:35:22', '2024-08-14 10:35:22', '2024-08-14 10:35:22'),
(77, 11, 'user', 'haaaaa', '2024-08-14 10:38:07', '2024-08-14 10:38:07', '2024-08-14 10:38:07'),
(78, 11, 'assistant', 'It seems like you might be feeling a bit overwhelmed or frustrated. How can I assist you today?', '2024-08-14 10:38:09', '2024-08-14 10:38:09', '2024-08-14 10:38:09'),
(79, 11, 'user', 'my name is satya', '2024-08-14 10:38:37', '2024-08-14 10:38:37', '2024-08-14 10:38:37'),
(80, 11, 'assistant', 'Hello, Satya! How can I assist you today?', '2024-08-14 10:38:39', '2024-08-14 10:38:39', '2024-08-14 10:38:39'),
(81, 11, 'user', 'can you say my name?', '2024-08-14 10:38:47', '2024-08-14 10:38:47', '2024-08-14 10:38:47'),
(82, 11, 'assistant', 'I’m sorry, but I don’t know your name! If you tell me, I’ll be happy to use it.', '2024-08-14 10:38:48', '2024-08-14 10:38:48', '2024-08-14 10:38:48'),
(83, 15, 'user', 'Haloo', '2024-08-14 10:54:14', '2024-08-14 10:54:14', '2024-08-14 10:54:14'),
(84, 15, 'user', 'haloo', '2024-08-14 10:55:15', '2024-08-14 10:55:15', '2024-08-14 10:55:15'),
(85, 15, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 10:55:16', '2024-08-14 10:55:16', '2024-08-14 10:55:16'),
(86, 15, 'user', 'nama saya satya', '2024-08-14 10:55:35', '2024-08-14 10:55:35', '2024-08-14 10:55:35'),
(87, 15, 'assistant', 'Halo Satya! Apa kabar? Ada yang bisa saya bantu hari ini?', '2024-08-14 10:55:35', '2024-08-14 10:55:35', '2024-08-14 10:55:35'),
(88, 15, 'user', 'siapa nama saya', '2024-08-14 10:56:26', '2024-08-14 10:56:26', '2024-08-14 10:56:26'),
(89, 15, 'assistant', 'Maaf, saya tidak tahu nama Anda. Saya tidak memiliki akses ke informasi pribadi kecuali Anda memberitahukannya. Jika ada yang bisa saya bantu, silakan beri tahu!', '2024-08-14 10:56:28', '2024-08-14 10:56:28', '2024-08-14 10:56:28'),
(90, 15, 'user', 'nama saya satya', '2024-08-14 10:56:44', '2024-08-14 10:56:44', '2024-08-14 10:56:44'),
(91, 15, 'assistant', 'Halo Satya! Senang berkenalan denganmu. Ada yang bisa saya bantu hari ini?', '2024-08-14 10:56:45', '2024-08-14 10:56:45', '2024-08-14 10:56:45'),
(92, 15, 'user', 'saya', '2024-08-14 10:58:00', '2024-08-14 10:58:00', '2024-08-14 10:58:00'),
(93, 11, 'user', 'haeee', '2024-08-14 11:01:53', '2024-08-14 11:01:53', '2024-08-14 11:01:53'),
(94, 11, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 11:01:55', '2024-08-14 11:01:55', '2024-08-14 11:01:55'),
(95, 11, 'user', 'dd', '2024-08-14 11:02:38', '2024-08-14 11:02:38', '2024-08-14 11:02:38'),
(96, 11, 'assistant', 'It seems like your message is incomplete or may have been sent by mistake. Could you please provide more context or clarify what you would like to know or discuss?', '2024-08-14 11:02:39', '2024-08-14 11:02:39', '2024-08-14 11:02:39'),
(97, 9, 'user', 'whtt sup', '2024-08-14 11:03:45', '2024-08-14 11:03:45', '2024-08-14 11:03:45'),
(98, 9, 'assistant', 'Hello! Not much, just here to help you out. What’s on your mind?', '2024-08-14 11:03:46', '2024-08-14 11:03:46', '2024-08-14 11:03:46'),
(99, 9, 'user', 'owh okey', '2024-08-14 11:04:17', '2024-08-14 11:04:17', '2024-08-14 11:04:17'),
(100, 9, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 11:04:17', '2024-08-14 11:04:17', '2024-08-14 11:04:17'),
(101, 11, 'user', 'yeaa', '2024-08-14 11:06:56', '2024-08-14 11:06:56', '2024-08-14 11:06:56'),
(102, 11, 'assistant', 'Hey! How can I help you today?', '2024-08-14 11:06:57', '2024-08-14 11:06:57', '2024-08-14 11:06:57'),
(103, 7, 'user', 'hehehe', '2024-08-14 11:08:52', '2024-08-14 11:08:52', '2024-08-14 11:08:52'),
(104, 7, 'assistant', 'Haha! What’s on your mind? 😊', '2024-08-14 11:08:53', '2024-08-14 11:08:53', '2024-08-14 11:08:53'),
(105, 12, 'user', 'hehehehe', '2024-08-14 11:10:15', '2024-08-14 11:10:15', '2024-08-14 11:10:15'),
(106, 12, 'assistant', 'Hehehe! Sounds like you\'re in a good mood. What\'s on your mind?', '2024-08-14 11:10:16', '2024-08-14 11:10:16', '2024-08-14 11:10:16'),
(107, 12, 'user', 'very good mood', '2024-08-14 11:10:52', '2024-08-14 11:10:52', '2024-08-14 11:10:52'),
(108, 12, 'assistant', 'I\'m glad to hear that! A good mood can make a big difference in your day. Is there something specific that’s putting you in this great mood, or do you want to share what you love about feeling good?', '2024-08-14 11:10:53', '2024-08-14 11:10:53', '2024-08-14 11:10:53'),
(109, 12, 'user', 'i dont want to tell you hehe', '2024-08-14 11:11:19', '2024-08-14 11:11:19', '2024-08-14 11:11:19'),
(110, 12, 'assistant', 'That\'s totally fine! If you have something else on your mind or if there\'s a different topic you\'d like to discuss, feel free to share!', '2024-08-14 11:11:20', '2024-08-14 11:11:20', '2024-08-14 11:11:20'),
(111, 12, 'user', 'my name is satya', '2024-08-14 11:11:32', '2024-08-14 11:11:32', '2024-08-14 11:11:32'),
(112, 12, 'assistant', 'Hello, Satya! How can I assist you today?', '2024-08-14 11:11:33', '2024-08-14 11:11:33', '2024-08-14 11:11:33'),
(113, 12, 'user', 'can u say my name?', '2024-08-14 11:11:41', '2024-08-14 11:11:41', '2024-08-14 11:11:41'),
(114, 12, 'assistant', 'I can\'t say your name unless you tell me what it is! If you share it, I can use it in our conversation.', '2024-08-14 11:11:42', '2024-08-14 11:11:42', '2024-08-14 11:11:42'),
(115, 11, 'user', 'test', '2024-08-14 11:15:24', '2024-08-14 11:15:24', '2024-08-14 11:15:24'),
(116, 11, 'assistant', 'Test received! How can I assist you today?', '2024-08-14 11:15:25', '2024-08-14 11:15:25', '2024-08-14 11:15:25'),
(117, 13, 'user', 'my name is satya', '2024-08-14 11:18:13', '2024-08-14 11:18:13', '2024-08-14 11:18:13'),
(118, 13, 'assistant', 'Nice to meet you, Satya! How can I assist you today?', '2024-08-14 11:18:15', '2024-08-14 11:18:15', '2024-08-14 11:18:15'),
(119, 13, 'user', 'can u say my name?', '2024-08-14 11:18:23', '2024-08-14 11:18:23', '2024-08-14 11:18:23'),
(120, 13, 'assistant', 'I don\'t know your name yet! But if you tell me, I\'ll be happy to use it.', '2024-08-14 11:18:24', '2024-08-14 11:18:24', '2024-08-14 11:18:24'),
(121, 13, 'user', 'can you say my name?', '2024-08-14 11:19:57', '2024-08-14 11:19:57', '2024-08-14 11:19:57'),
(122, 13, 'assistant', 'I don\'t know your name unless you tell me! What would you like me to call you?', '2024-08-14 11:19:58', '2024-08-14 11:19:58', '2024-08-14 11:19:58'),
(123, 13, 'user', 'can u say my name?', '2024-08-14 11:20:27', '2024-08-14 11:20:27', '2024-08-14 11:20:27'),
(124, 13, 'assistant', 'I don\'t have access to your name, but if you share it with me, I\'d be happy to use it!', '2024-08-14 11:20:28', '2024-08-14 11:20:28', '2024-08-14 11:20:28'),
(125, 13, 'user', 'i want to eat', '2024-08-14 11:21:04', '2024-08-14 11:21:04', '2024-08-14 11:21:04'),
(126, 13, 'assistant', 'What are you in the mood for? Do you want something sweet, savory, healthy, or maybe a specific cuisine? Let me know, and I can suggest some ideas!', '2024-08-14 11:21:07', '2024-08-14 11:21:07', '2024-08-14 11:21:07'),
(127, 13, 'user', 'my name is satya', '2024-08-14 11:21:49', '2024-08-14 11:21:49', '2024-08-14 11:21:49'),
(128, 13, 'assistant', 'Nice to meet you, Satya! How can I assist you today?', '2024-08-14 11:21:50', '2024-08-14 11:21:50', '2024-08-14 11:21:50'),
(129, 13, 'user', 'what is my name again?', '2024-08-14 11:22:03', '2024-08-14 11:22:03', '2024-08-14 11:22:03'),
(130, 13, 'assistant', 'I\'m sorry, but I don\'t have access to your personal information, including your name. You can let me know if you\'d like to share it!', '2024-08-14 11:22:04', '2024-08-14 11:22:04', '2024-08-14 11:22:04'),
(131, 11, 'user', 'yes', '2024-08-14 11:22:49', '2024-08-14 11:22:49', '2024-08-14 11:22:49'),
(132, 11, 'assistant', 'Hello! How can I assist you today?', '2024-08-14 11:22:50', '2024-08-14 11:22:50', '2024-08-14 11:22:50'),
(133, 13, 'user', 'can u say my name?', '2024-08-14 11:23:58', '2024-08-14 11:23:58', '2024-08-14 11:23:58'),
(134, 13, 'assistant', 'I can’t see your name, but I’d be happy to help you with anything! How can I assist you today?', '2024-08-14 11:23:59', '2024-08-14 11:23:59', '2024-08-14 11:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_08_14_053633_create_conversations_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('N1Hsk4Y4sCneoqjpiBQfKpRAKSxegFPanJpA7uHp', 1, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSXFOZko2Q1pzNXl5RzhGUFZkSTdGT3BjQVlYbVZkUW4yVlBaVFB4bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1723663541);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Satya Aryaputra Wigiyanto', 'satyaaryaputrawigiyanto@gmail.com', NULL, '$2y$12$VrbCWOnOF6/w9h/ZCdKC7OKlFUZZ70DuTCpF79xq1KUlf33yIoAsa', NULL, '2024-08-13 07:17:41', '2024-08-13 07:17:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
