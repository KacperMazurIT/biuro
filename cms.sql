-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Lis 2019, 15:25
-- Wersja serwera: 10.1.37-MariaDB
-- Wersja PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cms`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cat_title` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`cat_id`, `user_id`, `cat_title`) VALUES
(79, 0, 'Last Minute'),
(80, 0, 'Wakacje '),
(81, 0, 'Wycieczki objazdowe'),
(82, 0, 'Rejsy'),
(83, 0, 'Bilety lotnicze'),
(84, 0, 'Hotele');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `comment_email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `comment_content` text COLLATE utf8_polish_ci NOT NULL,
  `comment_status` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(14, 51, 'kacper', 'kacper@gmail.com', 'Kacper ahahah', 'zatwierdzony', '2019-11-05');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(34, 46, 28),
(36, 21, 53),
(38, 21, 52);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `post_author` varchar(25) COLLATE utf8_polish_ci NOT NULL,
  `post_title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `post_user` varchar(25) COLLATE utf8_polish_ci DEFAULT NULL,
  `post_date` date NOT NULL,
  `post_image` text COLLATE utf8_polish_ci NOT NULL,
  `post_content` text COLLATE utf8_polish_ci NOT NULL,
  `post_tags` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) COLLATE utf8_polish_ci NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `user_id`, `post_author`, `post_title`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`, `likes`) VALUES
(51, 79, 0, '', 'Hiszpania, Ibiza', 'Kacper', '2019-11-05', 'Ibiza.jpg', '<ul><li>cena: 2500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 05.07.2019r.</li><li>PowrÃ³t 12.07.2019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel &nbsp;Europa (4 gwiazdki)</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'ibiza, island, spain, Last Minute, last,', 0, 'published', 17, 0),
(52, 80, 0, '', 'Hiszpania, Ibiza', 'Kacper', '2019-11-05', 'Ibiza.jpg', '<ul><li>cena: 3500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 10.07.2019r.</li><li>PowrÃ³t 17.07.2019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel &nbsp;Europa (4 gwiazdki)</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'ibiza, island, spain, wakacje,', 0, 'published', 9, 1),
(53, 80, 0, '', 'Francja, Cannes', 'Kacper', '2019-11-05', 'Cannes.jpg', '<ul><li>cena: 4000 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 12.07.2019r.</li><li>PowrÃ³t 19.07.2019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel &nbsp;Posejdon (4 gwiazdki)</li></ul><p>Cannes â€“ miejscowoÅ›Ä‡ i gmina we Francji, w regionie Prowansja-Alpy-Lazurowe WybrzeÅ¼e, w departamencie Alpy Nadmorskie na Lazurowym WybrzeÅ¼u. Obecnie miasto znane jest na caÅ‚ym Å›wiecie dziÄ™ki miÄ™dzynarodowemu festiwalowi filmowemu i turystyce.</p>', 'Francja, France, Cannes Cann, cann, Lazurowe, wybrzeÅ¼e', 0, 'published', 10, 1),
(54, 82, 0, '', 'Rejs, Karaiby', 'Kacper', '2019-11-05', 'Rejs3.jpg', '<ul><li>cena: 7500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 01.07.2019r.</li><li>PowrÃ³t: 29.07.2019r.</li><li>Transport: Statek</li><li>wypÅ‚ywamy z GdaÅ„ska</li><li>Statek posiada: wiele restauracji, dyskotekÄ™, basen, boisko do kosza i wiele innych.</li></ul><p><strong>Rejsy po Karaibach</strong> pokochajÄ… wszyscy! ZarÃ³wno ci, ktÃ³rzy udajÄ… siÄ™ na miesiÄ…c miodowy, jak i grupa przyjaciÃ³Å‚, ktÃ³ra chce razem spÄ™dziÄ‡ niezapomniane wakacje. Odkryj najpiÄ™kniejsze plaÅ¼e w trakcie jednego urlopu bez przepakowywania walizek i przeprowadzek z hotelu do hotelu.</p>', 'rejs, Karaiby,', 0, 'published', 6, 0),
(55, 80, 0, '', 'Rejs, Grejca, Ibiza', 'Kacper', '2019-11-05', 'Rejs1.jpg', '<ul><li>cena: 6500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 11.07.2019r.</li><li>PowrÃ³t: 29.07.2019r.</li><li>Transport: Statek</li><li>wypÅ‚ywamy z GdaÅ„ska</li><li>Statek posiada: wiele restauracji, dyskotekÄ™, basen, boisko do kosza i wiele innych.</li></ul><p>UrzekajÄ…ce Morze ÅšrÃ³dziemne bogate w kulturÄ™ i historiÄ™. Wyrusz w rejs wzdÅ‚uÅ¼ chorwackich wybrzeÅ¼y, lub przepiÄ™knych greckich wysp, poznaj fascynujÄ…ce miasta takie jak Valletta, Marsylia, lub Barcelona.</p>', 'rejs, grecja, greece, holiday,  wakacje,', 0, 'published', 2, 0),
(56, 82, 0, '', 'Rejs,Hiszpania, Ibiza', 'Kacper', '2019-11-05', 'Rejs.jpg', '<ul><li>cena: 5500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 08.07.2019r.</li><li>PowrÃ³t : 20.07.2019r.</li><li>Transport - samolot</li><li>wypÅ‚ywamy z GdaÅ„ska</li><li>Luksusowy &nbsp;statek z wieloma restaurcjami jaki i basenem</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'rejs, ibiza, island, spain, Last Minute, last,', 0, 'published', 2, 0),
(57, 82, 0, '', 'Rejs,Hiszpania, Ibiza', 'Kacper', '2019-11-05', 'Rejs.jpg', '<ul><li>cena: 6000 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 02.07.2019r.</li><li>PowrÃ³t : 20.07.2019r.</li><li>Transport - samolot</li><li>wypÅ‚ywamy z GdaÅ„ska</li><li>Luksusowy &nbsp;statek z wieloma restaurcjami jaki i basenem</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'rejs, ibiza, island, spain, Last Minute, last,', 0, 'published', 0, 0),
(58, 80, 0, '', 'Rejs, Grejca, Ibiza', 'Kacper', '2019-11-05', 'Rejs1.jpg', '<ul><li>cena: 6500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 03.07.2019r.</li><li>PowrÃ³t: 29.07.2019r.</li><li>Transport: Statek</li><li>wypÅ‚ywamy z GdaÅ„ska</li><li>Statek posiada: wiele restauracji, dyskotekÄ™, basen, boisko do kosza i wiele innych.</li></ul><p>UrzekajÄ…ce Morze ÅšrÃ³dziemne bogate w kulturÄ™ i historiÄ™. Wyrusz w rejs wzdÅ‚uÅ¼ chorwackich wybrzeÅ¼y, lub przepiÄ™knych greckich wysp, poznaj fascynujÄ…ce miasta takie jak Valletta, Marsylia, lub Barcelona.</p>', 'rejs, grecja, greece, holiday,  wakacje,', 0, 'published', 0, 0),
(59, 84, 0, '', 'Hiszpania, Malaga, Hotel', 'Kacper', '2019-11-05', 'hotele1.jpg', '<ul><li>cena: 2500 zÅ‚ All inclusive (1 os)</li><li>pobyt od: 01.07.2019r.</li><li>pobyt do: 15.07.2019r.</li><li>Hotel posiada: restauracje, dyskotekÄ™, basen, boisko do kosza i wiele innych atrakcji.</li></ul><p><strong>Malaga </strong>â€“ miasto w poÅ‚udniowej Hiszpanii. Drugie - po Sewilli - co do wielkoÅ›ci miasto regionu Andaluzja. PoÅ‚oÅ¼ona nad Morzem ÅšrÃ³dziemnym, u podnÃ³Å¼a GÃ³r Betyckich. Jedno z najstarszych miast Europy, zamieszkane od VIII wieku p.n.e. DuÅ¼y port handlowy i rybacki, kÄ…pielisko na Costa del Sol.</p>', 'hiszpania, malaga, hotel, hotele', 0, 'published', 2, 0),
(60, 84, 0, '', 'Hiszpania, Malaga, Hotel', 'Kacper', '2019-11-05', 'hotele1.jpg', '<ul><li>cena: 1500 zÅ‚ All inclusive (1 os)</li><li>pobyt od: 01.07.2019r.</li><li>pobyt do: 08.07.2019r.</li><li>Hotel posiada: restauracje, dyskotekÄ™, basen, boisko do kosza i wiele innych atrakcji.</li></ul><p><strong>Malaga </strong>â€“ miasto w poÅ‚udniowej Hiszpanii. Drugie - po Sewilli - co do wielkoÅ›ci miasto regionu Andaluzja. PoÅ‚oÅ¼ona nad Morzem ÅšrÃ³dziemnym, u podnÃ³Å¼a GÃ³r Betyckich. Jedno z najstarszych miast Europy, zamieszkane od VIII wieku p.n.e. DuÅ¼y port handlowy i rybacki, kÄ…pielisko na Costa del Sol.</p>', 'hiszpania, malaga, hotel, hotele', 0, 'published', 0, 0),
(61, 84, 0, '', 'Chorwacja, Dubrownik, Hotel', 'Kacper', '2019-11-05', 'hotele2.jpg', '<ul><li>cena: 3500 zÅ‚ All inclusive (1 os)</li><li>pobyt od: 01.07.2019r.</li><li>pobyt do: 08.07.2019r.</li><li>Hotel posiada: restauracje, dyskotekÄ™, basen, boisko do kosza i wiele innych atrakcji.</li><li>5 gwiazdkowy hotel</li></ul><p><strong>Dubrownik</strong> â€“ miasto w poÅ‚udniowej Dalmacji, nad Morzem Adriatyckim. 42,6 tys. mieszkaÅ„cÃ³w. Siedziba wÅ‚adz Å¼upanii dubrownicko-neretwiaÅ„skiej. NiegdyÅ› oÅ›rodek handlu rangi europejskiej, obecnie przede wszystkim oÅ›rodek turystyki. Port handlowy i pasaÅ¼erski.</p>', 'chorwacja, dubrownik, hotel, hotele', 0, 'published', 2, 0),
(62, 84, 0, '', 'Chorwacja, Dubrownik, Hotel', 'Kacper', '2019-11-05', 'hotele2.jpg', '<ul><li>cena: 7000 zÅ‚ All inclusive (1 os)</li><li>pobyt od: 01.07.2019r.</li><li>pobyt do: 15.07.2019r.</li><li>Hotel posiada: restauracje, dyskotekÄ™, basen, boisko do kosza i wiele innych atrakcji.</li><li>5 gwiazdkowy hotel</li></ul><p><strong>Dubrownik</strong> â€“ miasto w poÅ‚udniowej Dalmacji, nad Morzem Adriatyckim. 42,6 tys. mieszkaÅ„cÃ³w. Siedziba wÅ‚adz Å¼upanii dubrownicko-neretwiaÅ„skiej. NiegdyÅ› oÅ›rodek handlu rangi europejskiej, obecnie przede wszystkim oÅ›rodek turystyki. Port handlowy i pasaÅ¼erski.</p>', 'chorwacja, dubrownik, hotel, hotele', 0, 'published', 0, 0),
(65, 83, 0, '', 'Przeloty, Polska (Warszawa) - Hiszpania (Ibiza)', 'Kacper', '2019-11-05', 'samolot.jpg', '<ul><li>cena: 1500 zÅ‚ &nbsp;(1 os)</li><li>Wylot: 08.07.2019r. Warszawa -&gt; Ibiza</li><li>PowrÃ³t : 20.07.2019r. Ibiza -&gt; Warszawa</li><li>Transport - samolot klasa Ekonomiczna</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'przeloty, przelot, Warszawa, hiszpania, polska, ibiza, bilety, bilety lotnicze, bilet', 0, 'published', 2, 0),
(66, 83, 0, '', 'Przeloty, Polska (Warszawa) - Hiszpania (Barcelona)', 'Kacper', '2019-11-05', 'samolot1.jpg', '<ul><li>cena: 2000 zÅ‚ &nbsp;(1 os)</li><li>Wylot: 08.07.2019r. Warszawa -&gt; Barcelona</li><li>PowrÃ³t : 20.07.2019r. Barcelona -&gt; Warszawa</li><li>Transport - samolot klasa Ekonomiczna</li></ul><p><strong>Barcelona</strong> â€“ miasto w pÃ³Å‚nocno-wschodniej Hiszpanii, nad Morzem ÅšrÃ³dziemnym, okoÅ‚o 110 km na poÅ‚udnie od grzbietu PirenejÃ³w i granicy hiszpaÅ„sko-francuskiej. Stolica prowincji o tej samej nazwie oraz wspÃ³lnoty autonomicznej Katalonii.&nbsp;</p>', 'przeloty, przelot, Warszawa, hiszpania, polska,barcelona, bilety, bilety lotnicze, bilet', 0, 'published', 1, 0),
(67, 83, 0, '', 'Przeloty, Polska (Warszawa) - Francja (ParyÅ¼)', 'Kacper', '2019-11-05', 'samolot1.jpg', '<ul><li>cena: 1400 zÅ‚ &nbsp;(1 os)</li><li>Wylot: 18.07.2019r. Warszawa -&gt; ParyÅ¼</li><li>PowrÃ³t : 29.07.2019r. ParyÅ¼ -&gt; Warszawa</li><li>Transport - samolot klasa Ekonomiczna</li></ul><p><strong>ParyÅ¼</strong> â€“ stolica i najwiÄ™ksze miasto Francji, poÅ‚oÅ¼one w centrum Basenu Paryskiego, nad SekwanÄ…. Miasto stanowi centrum polityczne, ekonomiczne i kulturalne kraju. W granicach administracyjnych ParyÅ¼a zamieszkujÄ… ponad 2 mln osÃ³b, w tzw. Wielkim ParyÅ¼u ok. 10 mln, a w caÅ‚ym zespole miejskim ponad 12 mln.</p>', 'przeloty, przelot, Warszawa, Francja, polska,ParyÅ¼, paris, bilety, bilety lotnicze, bilet', 0, 'published', 1, 0),
(68, 79, 0, '', 'Last Minute, Rejs, Karaiby', 'Kacper', '2019-11-05', 'Rejs3.jpg', '<ul><li>cena: 3500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 01.07.2019r.</li><li>PowrÃ³t: 29.07.2019r.</li><li>Transport: Statek</li><li>wypÅ‚ywamy z GdaÅ„ska</li><li>Statek posiada: wiele restauracji, dyskotekÄ™, basen, boisko do kosza i wiele innych.</li></ul><p><strong>Rejsy po Karaibach</strong> pokochajÄ… wszyscy! ZarÃ³wno ci, ktÃ³rzy udajÄ… siÄ™ na miesiÄ…c miodowy, jak i grupa przyjaciÃ³Å‚, ktÃ³ra chce razem spÄ™dziÄ‡ niezapomniane wakacje. Odkryj najpiÄ™kniejsze plaÅ¼e w trakcie jednego urlopu bez przepakowywania walizek i przeprowadzek z hotelu do hotelu.</p>', 'last minute, last, lastminute, rejs, Karaiby,', 0, 'published', 0, 0),
(69, 79, 0, '', 'Last Minute, Francja, Cannes', 'Kacper', '2019-11-05', 'Cannes.jpg', '<ul><li>cena: 2000 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 12.06.2019r.</li><li>PowrÃ³t 19.062019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel &nbsp;Posejdon (4 gwiazdki)</li></ul><p>Cannes â€“ miejscowoÅ›Ä‡ i gmina we Francji, w regionie Prowansja-Alpy-Lazurowe WybrzeÅ¼e, w departamencie Alpy Nadmorskie na Lazurowym WybrzeÅ¼u. Obecnie miasto znane jest na caÅ‚ym Å›wiecie dziÄ™ki miÄ™dzynarodowemu festiwalowi filmowemu i turystyce.</p>', 'last, last minute, lastminute, Francja, France, Cannes, Cann, cann, Lazurowe, wybrzeÅ¼e', 0, 'published', 1, 0),
(70, 79, 0, '', 'Last Minute, Hiszpania, Ibiza', 'Kacper', '2019-11-05', 'Ibiza.jpg', '<ul><li>cena: 2500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 10.06.2019r.</li><li>PowrÃ³t 17.06.2019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel &nbsp;Europa (4 gwiazdki)</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'last, last minute, lastminute, ibiza, island, spain, wakacje,', 0, 'published', 0, 0),
(71, 79, 0, '', 'Last Minute, Hiszpania, Ibiza', 'Kacper', '2019-11-05', 'lastminute.jpg', '<ul><li>cena: 1500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 10.07.2019r.</li><li>PowrÃ³t 17.07.2019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel Ibiza (4 gwiazdki)</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'Last Minute, last, ibiza, island, spain, wakacje,', 0, 'published', 1, 0),
(72, 81, 0, '', 'Wycieczka objazdowa , Francja, ParyÅ¼, Wersal, Disneyland', 'Kacper', '2019-11-05', 'objazdÃ³wka2.jpg', '<ul><li>cena: 5500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 10.07.2019r.</li><li>PowrÃ³t : 20.07.2019r.</li><li>Transport - Autokar (klimatyzowany z wygodnymi siedzeniami)</li><li>wyjazd z WrocÅ‚awia</li></ul><p>Planowana podrÃ³Å¼ WrocÅ‚aw-&gt;ParyÅ¼&gt; Wersal-&gt;Disneyland&gt;WrocÅ‚aw&nbsp;<br>Po drodze zwiedzanie wielu zabytkÃ³w jak i oglÄ…danie wielu malowniczych krajobrazÃ³w.</p>', 'objazdowka, wycieczka objazdowa, Francja, ParyÅ¼, Wersal, Disneyland', 0, 'published', 2, 0),
(73, 81, 0, '', 'Wycieczka objazdowa , Grecja, Kreta, Santorini', 'Kacper', '2019-11-05', 'objazdÃ³wka.jpg', '<ul><li>cena: 4500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 02.07.2019r.</li><li>PowrÃ³t : 20.07.2019r.</li><li>Transport - Autokar (klimatyzowany z wygodnymi siedzeniami)</li><li>wyjazd z WrocÅ‚awia</li></ul><p>Planowana podrÃ³Å¼ WrocÅ‚aw-&gt;Kreta&gt; Santorini-&gt;Kreta&gt;WrocÅ‚aw&nbsp;<br>Po drodze zwiedzanie wielu zabytkÃ³w jak i oglÄ…danie wielu malowniczych krajobrazÃ³w.</p>', 'objazdowka, wycieczka objazdowa, Grecja, Kreta, Santorini, greece', 0, 'published', 1, 0),
(74, 81, 0, '', 'Wycieczka objazdowa , WÅ‚ochy, Rzym, Wenecja', 'Kacper', '2019-11-05', 'objazdÃ³wka1.jpg', '<ul><li>cena: 3500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd: 12.07.2019r.</li><li>PowrÃ³t : 20.07.2019r.</li><li>Transport - Autokar (klimatyzowany z wygodnymi siedzeniami)</li><li>wyjazd z WrocÅ‚awia</li></ul><p>Planowana podrÃ³Å¼ WrocÅ‚aw-&gt;Rzym&gt; Wenecja-&gt;WrocÅ‚aw&nbsp;<br>Po drodze zwiedzanie wielu zabytkÃ³w jak i oglÄ…danie wielu malowniczych krajobrazÃ³w.</p>', 'objazdowka, wycieczka objazdowa, WÅ‚ochy, rzym, wenecja, Italy, Roma ,rome', 0, 'published', 2, 0),
(75, 79, 0, '', 'Last Minute, Hiszpania, Ibiza', 'Kacper', '2019-11-05', 'lastminute.jpg', '<ul><li>cena: 1500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 10.07.2019r.</li><li>PowrÃ³t 17.07.2019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel Ibiza (4 gwiazdki)</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'Last Minute, last, ibiza, island, spain, wakacje,', 0, 'published', 0, 0),
(76, 79, 0, '', 'Last Minute, Hiszpania, Ibiza', 'Kacper', '2019-11-05', 'Ibiza.jpg', '<ul><li>cena: 2500 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 10.06.2019r.</li><li>PowrÃ³t 17.06.2019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel &nbsp;Europa (4 gwiazdki)</li></ul><p>Ibiza to wyspa o dwÃ³ch harmonijnie wspÃ³Å‚grajÄ…cych obliczach. Z jednej strony Ibiza to najlepsze dyskoteki, sÅ‚ynni DJ-e, muzyka i radoÅ›Ä‡, z drugiej â€“ miejsca zatopione w ciszy i wszechobecnej atmosferze spokoju. Ten zakÄ…tek Europy, jeszcze do niedawna zapomniany, teraz jest obowiÄ…zkowÄ… przystaniÄ… dla osÃ³b kochajÄ…cych Å¼ycie i dobrÄ… zabawÄ™ w miÄ™dzynarodowym towarzystwie.</p>', 'last, last minute, lastminute, ibiza, island, spain, wakacje,', 0, 'published', 0, 0),
(77, 79, 0, '', 'Last Minute, Francja, Cannes', 'Kacper', '2019-11-05', 'Cannes.jpg', '<ul><li>cena: 2000 zÅ‚ All inclusive (1 os)</li><li>Wyjazd 12.06.2019r.</li><li>PowrÃ³t 19.062019r.</li><li>Transport - samolot</li><li>wylot z Warszawy</li><li>Hotel &nbsp;Posejdon (4 gwiazdki)</li></ul><p>Cannes â€“ miejscowoÅ›Ä‡ i gmina we Francji, w regionie Prowansja-Alpy-Lazurowe WybrzeÅ¼e, w departamencie Alpy Nadmorskie na Lazurowym WybrzeÅ¼u. Obecnie miasto znane jest na caÅ‚ym Å›wiecie dziÄ™ki miÄ™dzynarodowemu festiwalowi filmowemu i turystyce.</p>', 'last, last minute, lastminute, Francja, France, Cannes, Cann, cann, Lazurowe, wybrzeÅ¼e', 0, 'published', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `user_firstname` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `user_lastname` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `user_image` text COLLATE utf8_polish_ci NOT NULL,
  `user_role` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `randSalt` varchar(255) COLLATE utf8_polish_ci NOT NULL DEFAULT '$6$rounds=5000$iusesomecraystrings22',
  `token` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`, `token`) VALUES
(21, 'Kacper', '$2y$12$7FW/OcnTU6gkEEH.oYy54u5QWEERDkPSqLU29jGUvXAZEQZW/rid.', 'Kacper', 'Mazur', 'kacper@gmail.com', '', 'admin', '$6$rounds=5000$iusesomecraystrings22', ''),
(22, 'Jan', '$2y$12$C87YbfYSY9UV6/oRzu4MbuaDGGaSKIbY2sO4uF2rDzvnY.x9sylou', 'Jan', 'Mazur', 'jan@gmail.com', '', 'klient', '$6$rounds=5000$iusesomecraystrings22', '26e4c9166defd7b3bb54d8097a510340b467fb278ae4d12d29fed6feb1909f05a75020565e088fdaff79dd30e2013c4eafbd'),
(23, 'Dave', '$2y$12$c9qJ9OQ0WeytXTj78Sev.eL8.qNeHE8lbX0r13TLqu3gEpmk5qUDi', '', '', 'dave@gmail.com', '', 'klient', '$6$rounds=5000$iusesomecraystrings22', ''),
(46, 'Andrzej', '$2y$12$2JeHGxA4ifFwLTJuy.0YmeYk.bzAT4E.puW.5wqf7HEvgOXZuHNCu', '', '', 'andrzej@vp.pl', '', 'klient', '$6$rounds=5000$iusesomecraystrings22', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(1, 'ie1usbr90qcr8vh2e280lbg9gv', 1570478909),
(2, 'umt0rbsduc8sj5eek99gftsjmh', 1570480731),
(3, 'qhr90qh44pcjpf7mbl546uonhs', 1570477947),
(4, 'b3qi52nol481c8rglc2gq0u4kf', 1570477356),
(5, '2j4c218v35ddb2qqnbpd773vr9', 1570485311),
(6, '0kc634be9r4ifvb5bnfhq49s6f', 1571566726),
(7, 'bg9pgldk4ufa9adsdd6e5q5sjg', 1570528848),
(8, 'nibunnh8ki04k95ugfnprb0f7s', 1570569003),
(9, 'kmb3bb3eiajfm1bs5o67n832k7', 1570799041),
(10, 'jrdcbmd9c6erjrrh7qvho87dhq', 1570820692),
(11, '1fp3lmet7l9g05jduo8ug0j3em', 1570801762),
(12, '1f5l07vkvb5qfjt7atnvt8olvo', 1570821303),
(13, 'di1kcvq0ths2aag4n0pu90p9nu', 1570965957),
(14, 'rh1cdi0r77uc6odehhnhrc2klu', 1571089354),
(15, 'e5p1qfl6rr9sbnskp654tl7al9', 1571133880),
(16, '5q3hahg2o9olflt5b4oe2umq8j', 1571173575),
(17, 'rtc10l58e6b5qcilovh15jgntk', 1571175441),
(18, '6fc58mqk240fp4vnbgfrli5t3o', 1571433713),
(19, 'grtgbkth9fmlgoju1q1515m9k4', 1572191088),
(20, 'l0gfhkgfo2rkbq1suknn66pleb', 1571601671),
(21, 'n2fuh7vgeflub4tqgnjehqg4bq', 1571651321),
(22, 'lsq549p4pvp4flkidjv8cmrc7n', 1572010894),
(23, 'au4jcpthpa1qeo96qamdbvm75m', 1572040627),
(24, '1m1sgq6a32bs0nj8a2opg756ak', 1572185760),
(25, '8l3bif4smu1834rboicig7t85i', 1572185367),
(26, '57cnmjehttjuab7he239qf39sq', 1572799655),
(27, 'olt0uivbgeg8odfrqoalbgtn9i', 1572873608),
(28, 'lfp868gs11oeuqskd55j5c3a1n', 1572982109),
(29, '86f9k2jf55msvo3ihc17fo87g5', 1572988367);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indeksy dla tabeli `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT dla tabeli `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT dla tabeli `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
