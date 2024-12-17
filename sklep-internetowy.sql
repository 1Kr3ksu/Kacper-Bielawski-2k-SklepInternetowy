-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2024 at 03:17 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep-internetowy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adresy`
--

CREATE TABLE `adresy` (
  `adres_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `miasto` varchar(100) NOT NULL,
  `wojewodztwo` varchar(100) NOT NULL,
  `kod_pocztowy` varchar(6) NOT NULL,
  `kraj` varchar(50) NOT NULL,
  `typ_adresu` enum('rozliczeniowy','dostawy','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adresy`
--

INSERT INTO `adresy` (`adres_id`, `user_id`, `miasto`, `wojewodztwo`, `kod_pocztowy`, `kraj`, `typ_adresu`) VALUES
(1, 1, 'Warszawa', 'Mazowieckie', '00-001', 'Polska', 'rozliczeniowy'),
(2, 2, 'Kraków', 'Małopolskie', '31-001', 'Polska', 'dostawy'),
(3, 3, 'Wrocław', 'Dolnośląskie', '50-001', 'Polska', 'rozliczeniowy'),
(4, 4, 'Poznań', 'Wielkopolskie', '60-001', 'Polska', 'dostawy'),
(5, 5, 'Gdańsk', 'Pomorskie', '80-001', 'Polska', 'rozliczeniowy'),
(6, 6, 'Szczecin', 'Zachodniopomorskie', '70-001', 'Polska', 'dostawy'),
(7, 7, 'Lublin', 'Lubelskie', '20-001', 'Polska', 'rozliczeniowy'),
(8, 8, 'Bydgoszcz', 'Kujawsko-Pomorskie', '85-001', 'Polska', 'dostawy'),
(9, 9, 'Łódź', 'Łódzkie', '90-001', 'Polska', 'rozliczeniowy'),
(10, 10, 'Katowice', 'Śląskie', '40-001', 'Polska', 'dostawy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ceny`
--

CREATE TABLE `ceny` (
  `cena_id` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `cena` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ceny`
--

INSERT INTO `ceny` (`cena_id`, `id_produktu`, `cena`) VALUES
(1, 1, 3500.00),
(2, 2, 1500.00),
(3, 3, 20.00),
(4, 4, 2000.00),
(5, 5, 2.00),
(6, 6, 100.00),
(7, 7, 250.00),
(8, 8, 30.00),
(9, 9, 50.00),
(10, 10, 800.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawy`
--

CREATE TABLE `dostawy` (
  `dostawa_id` int(11) NOT NULL,
  `zamowienie_id` int(11) DEFAULT NULL,
  `adres_id` int(11) DEFAULT NULL,
  `status` enum('oczekujaca','w_drodze','dostarczona') NOT NULL,
  `data_dostawy` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dostawy`
--

INSERT INTO `dostawy` (`dostawa_id`, `zamowienie_id`, `adres_id`, `status`, `data_dostawy`) VALUES
(1, 1, 1, '', '2024-12-01 16:00:00'),
(2, 2, 2, '', '2024-12-02 12:00:00'),
(3, 3, 3, '', '2024-12-03 12:00:00'),
(4, 4, 4, '', '2024-12-03 14:00:00'),
(6, 6, 6, '', '2024-12-05 16:30:00'),
(7, 7, 7, '', '2024-12-06 09:45:00'),
(8, 8, 8, '', '2024-12-07 13:00:00'),
(9, 9, 9, '', '2024-12-08 11:15:00'),
(10, 10, 10, '', '2024-12-09 15:45:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `elementy_zamowienia`
--

CREATE TABLE `elementy_zamowienia` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `calkowita_cena` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `elementy_zamowienia`
--

INSERT INTO `elementy_zamowienia` (`order_item_id`, `order_id`, `produkt_id`, `ilosc`, `calkowita_cena`) VALUES
(1, 1, 1, 2, 7000.00),
(2, 2, 2, 1, 1500.00),
(3, 3, 3, 5, 100.00),
(4, 4, 4, 1, 2000.00),
(5, 5, 5, 10, 20.00),
(6, 6, 6, 3, 300.00),
(7, 7, 7, 2, 500.00),
(8, 8, 8, 1, 30.00),
(9, 9, 9, 2, 100.00),
(10, 10, 10, 1, 800.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `kategoria_id` int(11) NOT NULL,
  `nazwa_kategorii` varchar(50) NOT NULL,
  `opis_kategorii` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategoria`
--

INSERT INTO `kategoria` (`kategoria_id`, `nazwa_kategorii`, `opis_kategorii`) VALUES
(1, 'Elektronika', 'Produkty elektroniczne, takie jak komputery, telefony itp.'),
(2, 'Spożywcze', 'Produkty spożywcze, takie jak jedzenie, napoje itp.'),
(3, 'Odzież', 'Odzież, obuwie, dodatki i akcesoria'),
(4, 'Zabawki', 'Zabawki dla dzieci, gry i edukacyjne akcesoria'),
(5, 'Dom i ogród', 'Artykuły do wyposażenia domu, ogrodu, narzędzia'),
(6, 'Sport', 'Sprzęt sportowy, odzież sportowa i akcesoria'),
(7, 'Kultura', 'Książki, muzyka, filmy i inne artykuły kulturowe'),
(8, 'Motoryzacja', 'Akcesoria i części samochodowe'),
(9, 'Artykuły biurowe', 'Produkty do biura, artykuły papiernicze'),
(10, 'Turystyka', 'Sprzęt turystyczny, wakacje i wycieczki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `metody_platnosci`
--

CREATE TABLE `metody_platnosci` (
  `metoda_plat_id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `opis` text NOT NULL,
  `cena_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metody_platnosci`
--

INSERT INTO `metody_platnosci` (`metoda_plat_id`, `nazwa`, `opis`, `cena_id`) VALUES
(1, 'Przelew bankowy', 'Standardowy przelew bankowy.', 1),
(2, 'Visa', 'Płatność za pomocą karty kredytowej Visa.', 2),
(3, 'PayPal', 'Płatność za pomocą PayPal.', 3),
(4, 'Płatność przy odbiorze', 'Płatność gotówką lub kartą przy odbiorze.', 4),
(5, 'BLIK', 'Płatność za pomocą aplikacji mobilnej BLIK.', 5),
(6, 'Przelew natychmiastowy', 'Natychmiastowy przelew online.', 6),
(7, 'Karta podarunkowa', 'Płatność za pomocą karty podarunkowej.', 7),
(8, 'Apple Pay', 'Płatność za pomocą Apple Pay.', 8),
(9, 'Google Pay', 'Płatność za pomocą Google Pay.', 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opinie`
--

CREATE TABLE `opinie` (
  `opinie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `ocena` int(11) NOT NULL,
  `opinia` text NOT NULL,
  `data_opinii` datetime NOT NULL
) ;

--
-- Dumping data for table `opinie`
--

INSERT INTO `opinie` (`opinie_id`, `user_id`, `produkt_id`, `ocena`, `opinia`, `data_opinii`) VALUES
(1, 1, 1, 5, 'Bardzo dobry laptop, działa bez zarzutów!', '2024-12-01 14:30:00'),
(2, 2, 2, 4, 'Smartfon jest świetny, ale bateria mogłaby być lepsza.', '2024-12-02 10:15:00'),
(3, 3, 3, 5, 'Kawa ma bardzo intensywny smak, polecam!', '2024-12-02 17:45:00'),
(4, 4, 4, 4, 'Telewizor ma doskonałą jakość obrazu, idealny do oglądania filmów.', '2024-12-03 11:00:00'),
(5, 5, 5, 3, 'Woda mineralna jest smaczna, ale cena mogłaby być niższa.', '2024-12-04 09:30:00'),
(6, 6, 6, 5, 'Szal jest miękki i ciepły, idealny na zimę.', '2024-12-05 16:00:00'),
(7, 7, 7, 3, 'Buty są wygodne, ale kolor nie odpowiada moim oczekiwaniom.', '2024-12-06 12:30:00'),
(8, 8, 8, 4, 'Myszka działa bardzo dobrze, ale jest trochę za mała.', '2024-12-07 08:45:00'),
(9, 9, 9, 4, 'Bluzka jest świetna, ale materiał mógłby być lepszy.', '2024-12-08 19:00:00'),
(10, 10, 10, 5, 'Tablet ma świetną wydajność, idealny do pracy.', '2024-12-09 13:30:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `produkt_id` int(11) NOT NULL,
  `nazwa_produktu` varchar(255) NOT NULL,
  `opis` text NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `ilosc_w_magazynie` int(11) NOT NULL,
  `kategoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`produkt_id`, `nazwa_produktu`, `opis`, `cena`, `ilosc_w_magazynie`, `kategoria_id`) VALUES
(1, 'Laptop', 'Laptop z procesorem Intel i 16GB RAM', 3500.00, 50, 1),
(2, 'Smartfon', 'Smartfon z Androidem i 128GB pamięci', 1500.00, 100, 1),
(3, 'Kawa', 'Kawa ziarnista 500g', 20.00, 200, 2),
(4, 'Telewizor', 'Telewizor 55\" 4K', 2000.00, 30, 1),
(5, 'Woda mineralna', 'Woda w butelkach 1.5L', 2.00, 500, 2),
(6, 'Szal', 'Szal zimowy z wełny', 100.00, 150, 3),
(7, 'Buty sportowe', 'Buty do biegania', 250.00, 120, 3),
(8, 'Mysz komputerowa', 'Mysz optyczna USB', 30.00, 200, 1),
(9, 'Bluzka', 'Bluzka bawełniana', 50.00, 80, 3),
(10, 'Tablet', 'Tablet z ekranem 10\" i Androidem', 800.00, 60, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `użytkownicy`
--

CREATE TABLE `użytkownicy` (
  `user_id` int(11) NOT NULL,
  `imie` varchar(15) NOT NULL,
  `nazwisko` varchar(15) NOT NULL,
  `email` varchar(15) NOT NULL,
  `password` varchar(16) NOT NULL,
  `numer_tel` varchar(15) NOT NULL,
  `data_uro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `użytkownicy`
--

INSERT INTO `użytkownicy` (`user_id`, `imie`, `nazwisko`, `email`, `password`, `numer_tel`, `data_uro`) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@ex', 'haslo123', '+48 123 456 789', '1985-05-10 00:00:00'),
(2, 'Anna', 'Nowak', 'anna.nowak@exam', 'haslo456', '+48 234 567 890', '1990-06-20 00:00:00'),
(3, 'Marek', 'Zieliński', 'marek.zielinski', 'haslo789', '+48 345 678 901', '1988-07-15 00:00:00'),
(4, 'Karolina', 'Wójcik', 'karolina.wojcik', 'haslo101', '+48 456 789 012', '1992-08-30 00:00:00'),
(5, 'Tomasz', 'Lewandowski', 'tomasz.lewandow', 'haslo202', '+48 567 890 123', '1987-09-25 00:00:00'),
(6, 'Piotr', 'Szymański', 'piotr.szymanski', 'haslo303', '+48 678 901 234', '1995-10-05 00:00:00'),
(7, 'Ewa', 'Kwiatkowska', 'ewa.kwiatkowska', 'haslo404', '+48 789 012 345', '1993-11-12 00:00:00'),
(8, 'Kamil', 'Jankowski', 'kamil.jankowski', 'haslo505', '+48 890 123 456', '1986-12-01 00:00:00'),
(9, 'Oliwia', 'Kaczmarek', 'oliwia.kaczmare', 'haslo606', '+48 901 234 567', '1991-01-21 00:00:00'),
(10, 'Paweł', 'Kozłowski', 'pawel.kozlowski', 'haslo707', '+48 012 345 678', '1989-02-18 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamówienia`
--

CREATE TABLE `zamówienia` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `data_zamowienia` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('pakowanie','wysyłanie','w drodze','dostarczone') NOT NULL,
  `metoda_platnosci_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zamówienia`
--

INSERT INTO `zamówienia` (`order_id`, `user_id`, `data_zamowienia`, `status`, `metoda_platnosci_id`, `produkt_id`, `ilosc`) VALUES
(1, 1, '2024-12-16 19:52:53', 'pakowanie', 1, 1, 1),
(2, 2, '2024-12-16 19:52:54', '', 2, 2, 1),
(3, 3, '2024-12-02 16:45:00', 'w drodze', 3, 0, 1),
(4, 4, '2024-12-03 10:00:00', '', 1, 0, 1),
(5, 5, '2024-12-04 08:30:00', 'pakowanie', 2, 0, 1),
(6, 6, '2024-12-05 15:00:00', '', 1, 0, 1),
(7, 7, '2024-12-06 11:30:00', 'w drodze', 3, 0, 1),
(8, 8, '2024-12-07 07:45:00', '', 2, 0, 1),
(9, 9, '2024-12-08 18:00:00', 'pakowanie', 1, 0, 1),
(10, 10, '2024-12-09 12:30:00', '', 2, 0, 1),
(11, 11, '2024-01-01 13:30:00', 'pakowanie', 1, 0, 1),
(12, 12, '2024-01-02 09:15:00', '', 2, 0, 1),
(13, 13, '2024-02-01 13:30:00', 'pakowanie', 1, 0, 1),
(14, 14, '2024-02-02 09:15:00', '', 2, 0, 1),
(15, 15, '2024-03-01 13:30:00', 'pakowanie', 1, 0, 1),
(16, 16, '2024-03-02 09:15:00', '', 2, 0, 1),
(17, 17, '2024-04-01 12:30:00', 'pakowanie', 1, 0, 1),
(18, 18, '2024-04-02 08:15:00', '', 2, 0, 1),
(19, 19, '2024-05-01 12:30:00', 'pakowanie', 1, 0, 1),
(20, 20, '2024-05-02 08:15:00', '', 2, 0, 1),
(21, 21, '2024-06-01 12:30:00', 'pakowanie', 1, 0, 1),
(22, 22, '2024-06-02 08:15:00', '', 2, 0, 1),
(23, 23, '2024-07-01 12:30:00', 'pakowanie', 1, 0, 1),
(24, 24, '2024-07-02 08:15:00', '', 2, 0, 1),
(25, 25, '2024-08-01 12:30:00', 'pakowanie', 1, 0, 1),
(26, 26, '2024-08-02 08:15:00', '', 2, 0, 1),
(27, 27, '2024-09-01 12:30:00', 'pakowanie', 1, 0, 1),
(28, 28, '2024-09-02 08:15:00', '', 2, 0, 1),
(29, 29, '2024-10-01 12:30:00', 'pakowanie', 1, 0, 1),
(30, 30, '2024-10-02 08:15:00', '', 2, 0, 1),
(31, 31, '2024-11-01 13:30:00', 'pakowanie', 1, 0, 1),
(32, 32, '2024-11-02 09:15:00', '', 2, 0, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adresy`
--
ALTER TABLE `adresy`
  ADD PRIMARY KEY (`adres_id`);

--
-- Indeksy dla tabeli `ceny`
--
ALTER TABLE `ceny`
  ADD PRIMARY KEY (`cena_id`);

--
-- Indeksy dla tabeli `dostawy`
--
ALTER TABLE `dostawy`
  ADD PRIMARY KEY (`dostawa_id`);

--
-- Indeksy dla tabeli `elementy_zamowienia`
--
ALTER TABLE `elementy_zamowienia`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`kategoria_id`),
  ADD UNIQUE KEY `unique_kategoria_nazwa` (`nazwa_kategorii`);

--
-- Indeksy dla tabeli `metody_platnosci`
--
ALTER TABLE `metody_platnosci`
  ADD PRIMARY KEY (`metoda_plat_id`);

--
-- Indeksy dla tabeli `opinie`
--
ALTER TABLE `opinie`
  ADD PRIMARY KEY (`opinie_id`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`produkt_id`),
  ADD UNIQUE KEY `unique_nazwa` (`nazwa_produktu`);

--
-- Indeksy dla tabeli `użytkownicy`
--
ALTER TABLE `użytkownicy`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indeksy dla tabeli `zamówienia`
--
ALTER TABLE `zamówienia`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `metody_platnosci`
--
ALTER TABLE `metody_platnosci`
  MODIFY `metoda_plat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `opinie`
--
ALTER TABLE `opinie`
  MODIFY `opinie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `produkt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
