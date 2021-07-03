-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 03 2021 г., 20:20
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `group_authorization`
--

-- --------------------------------------------------------

--
-- Структура таблицы `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `name_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `companies`
--

INSERT INTO `companies` (`id`, `name_company`, `created_at`, `updated_at`) VALUES
(1, 'Jack\'s compan', NULL, NULL),
(2, 'Поликлиника №5', '2021-07-03 11:45:17', '2021-07-03 11:45:17');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_03_132527_create_companies_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `company_id` int NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `parent_id`, `company_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Джек', 'jack@gmail.com', 0, 1, NULL, '$2y$10$u.iFpj5NrCpEKoXo7/kpU.yMWkSkYo1ft5PYSP.YlUwkWs1jwAKKK', NULL, '2021-07-03 11:12:25', '2021-07-03 11:12:25'),
(2, 'Джулия', 'juliya@gmail.com', 1, 1, NULL, '$2y$10$LPGRN.Kdb3OF4Tf5Ez1DjO6QSRAI4CyrHWTuDdEs/pJukyahs50kO', NULL, '2021-07-03 11:22:24', '2021-07-03 11:22:24'),
(3, 'Den', 'den@gmail.com', 2, 1, NULL, '$2y$10$txX5yluTX6wDxIYhn2.3cudWyIIQal7tEp.D2EAGMeBebPn/.KZWK', NULL, '2021-07-03 11:33:17', '2021-07-03 11:33:17'),
(4, 'Greg', 'greg@gmail.com', 3, 1, NULL, '$2y$10$Dv4bUJchjQbYnJPItUGBVuR1WMBkBRI8EYKljf8shafI4FdQmHsK2', NULL, '2021-07-03 11:34:50', '2021-07-03 11:34:50'),
(5, 'Albina', 'albina@gmail.com', 0, 2, NULL, '$2y$10$Ii5fMLLr7Q029AH/XtoX1Og4eRO3pNVMZXwe.HAy7MY7B6RY1RuLi', 'oMyrcat4og65WBgxAXJ70dA5WBXGgl6WfX521CtRZKWPhuzFtR1UX1hJrd6J', '2021-07-03 11:45:17', '2021-07-03 11:45:17'),
(6, 'Lena', 'lena@gmail.com', 5, 2, NULL, '$2y$10$cGRhzrldOe/VaNhwcPzAguVF16TzePYpbkXVa127yw/ipvIcZenAy', NULL, '2021-07-03 11:45:50', '2021-07-03 11:45:50'),
(7, 'Raisa', 'raisa@gmail.com', 5, 2, NULL, '$2y$10$3q6ftjaWf.XOkIElMgFz9.1euJt/MyBYk8vt8RsRzoH5eJk0A6.mK', NULL, '2021-07-03 12:01:04', '2021-07-03 12:01:04'),
(8, 'Anya', 'anya@gmail.com', 6, 2, NULL, '$2y$10$FbVCcPlAxakAxxH/XcR8E.LeMGgcWpUHaLPVwVFWo6jDgFvxb4urK', NULL, '2021-07-03 12:11:52', '2021-07-03 12:11:52'),
(9, 'Petr', 'petr@gmail.com', 8, 2, NULL, '$2y$10$ykjY0zgqSu9dB8RHsIbRDetXSL/.V5IFkbI6BDgPJcKHs/qedimSi', NULL, '2021-07-03 12:37:59', '2021-07-03 12:37:59'),
(10, 'Vasil', 'vasil@gmail.com', 8, 2, NULL, '$2y$10$8gl/t7Iq/ZyumEcgmxFlyOPytXrBPIFemge.efKTBuxHoalSdkO1C', NULL, '2021-07-03 12:49:04', '2021-07-03 12:49:04'),
(11, 'Nastya', 'nastya@gmail.com', 10, 2, NULL, '$2y$10$aizlMr/m6vqmlFkkOK12AOWw4tOfu5.51jWrvZwjl0On8vbQThUCq', NULL, '2021-07-03 12:50:08', '2021-07-03 12:50:08'),
(12, 'Karlen', 'karlen@gmail.com', 1, 1, NULL, '$2y$10$0hzsnWLdQE7VO/rKLkzJq.EOdNrLytOvTL.sW1EaQwlJz59sb3BsG', NULL, '2021-07-03 14:02:56', '2021-07-03 14:02:56');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
