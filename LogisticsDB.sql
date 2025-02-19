-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 04 2025 г., 10:43
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `LogisticsDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Location`
--

CREATE TABLE `Location` (
  `Id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Location`
--

INSERT INTO `Location` (`Id`, `Name`) VALUES
(1, 'SendLocation'),
(2, 'RecipientLocation');

-- --------------------------------------------------------

--
-- Структура таблицы `Package`
--

CREATE TABLE `Package` (
  `Id` int(11) NOT NULL,
  `Weight` varchar(45) NOT NULL,
  `Distance` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `SenderLocationId` int(11) NOT NULL,
  `RecipientLocationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Package`
--

INSERT INTO `Package` (`Id`, `Weight`, `Distance`, `UserId`, `SenderLocationId`, `RecipientLocationId`) VALUES
(2, '213', 12312, 1, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `Id` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`Id`, `Email`, `Password`) VALUES
(1, 'FirstUser@gmail.com', '12345');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Package`
--
ALTER TABLE `Package`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_Package_User_idx` (`UserId`),
  ADD KEY `fk_Package_Location1_idx` (`SenderLocationId`),
  ADD KEY `fk_Package_User1_idx` (`RecipientLocationId`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Location`
--
ALTER TABLE `Location`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Package`
--
ALTER TABLE `Package`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Package`
--
ALTER TABLE `Package`
  ADD CONSTRAINT `fk_Package_Location1` FOREIGN KEY (`SenderLocationId`) REFERENCES `Location` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Package_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
