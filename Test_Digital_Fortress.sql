-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th3 13, 2024 lúc 11:13 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `Test_Digital_Fortress`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `homes`
--

CREATE TABLE `homes` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `homes`
--

INSERT INTO `homes` (`id`, `name`, `user_id`) VALUES
(1, 'Home 1', 1),
(2, 'Home 2', 2),
(3, 'Home 3', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `light`
--

CREATE TABLE `light` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `color` varchar(225) NOT NULL,
  `brightness` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `light`
--

INSERT INTO `light` (`id`, `name`, `color`, `brightness`, `status`, `room_id`) VALUES
(1, 'Light 1.1 ', 'red', 100, 0, 1),
(2, 'Light 1.2 ', 'orange', 200, 0, 1),
(3, 'Light 2.1 ', 'red', 100, 0, 2),
(4, 'Light 2.2 ', 'orange', 200, 0, 2),
(5, 'Light 3.1 ', 'red', 100, 0, 3),
(6, 'Light 3.2 ', 'orange', 200, 0, 3),
(7, 'Light 4.1 ', 'red', 100, 0, 4),
(8, 'Light 4.2 ', 'orange', 200, 0, 4),
(9, 'Light 5.1 ', 'red', 100, 0, 5),
(10, 'Light 5.2 ', 'orange', 200, 0, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `light_status`
--

CREATE TABLE `light_status` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `light_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `home_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `home_id`) VALUES
(1, 'Room 1.1 ', 1),
(2, 'Room 1.2 ', 1),
(3, 'Room 2.1 ', 2),
(4, 'Room 2.2 ', 2),
(5, 'Room 3.1 ', 3),
(6, 'Room 3.2', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'Huy', '123'),
(2, 'Toan', '123'),
(3, 'Nam', '123');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `homes`
--
ALTER TABLE `homes`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `light`
--
ALTER TABLE `light`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `light_status`
--
ALTER TABLE `light_status`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `light_id` (`light_id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `home_id` (`home_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `homes`
--
ALTER TABLE `homes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `light`
--
ALTER TABLE `light`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `light_status`
--
ALTER TABLE `light_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `homes`
--
ALTER TABLE `homes`
  ADD CONSTRAINT `homes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `light`
--
ALTER TABLE `light`
  ADD CONSTRAINT `light_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Các ràng buộc cho bảng `light_status`
--
ALTER TABLE `light_status`
  ADD CONSTRAINT `light_status_ibfk_1` FOREIGN KEY (`light_id`) REFERENCES `light` (`id`);

--
-- Các ràng buộc cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`home_id`) REFERENCES `homes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
