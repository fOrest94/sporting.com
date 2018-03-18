SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET collation_connection = 'utf8_general_ci';

DROP DATABASE IF EXISTS `obiekt_rekreacyjno_sportowy`;
CREATE DATABASE `obiekt_rekreacyjno_sportowy` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `obiekt_rekreacyjno_sportowy`;

DROP TABLE IF EXISTS `aktualnosci`;
CREATE TABLE  IF NOT EXISTS `aktualnosci` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_obiektu` bigint(20) NOT NULL,
  tytul VARCHAR(20) NOT NULL ,
  opis VARCHAR(1000),
  data DATE NOT NULL,
  PRIMARY KEY (`id`) ,
  KEY `id_obiektu` (`id_obiektu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*
DROP TABLE IF EXISTS `aktualnosci`;
CREATE TABLE IF NOT EXISTS `aktualnosci` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tytul_aktualnosci` varchar(50),
  `opis_aktualnosci` varchar(2000),
  `data_utworzenia` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
*/

DROP TABLE IF EXISTS `cennik`;
CREATE TABLE IF NOT EXISTS `cennik` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_obiektu` bigint(20) NOT NULL,
  `wynajecie_robocze_taryfa_pierwsza` int(2) NOT NULL,
  `wynajecie_robocze_taryfa_druga` int(2) NOT NULL,
  `wynajecie_weekend_taryfa_pierwsza` int(2) NOT NULL,
  `wynajecie_weekend_taryfa_druga` int(2) NOT NULL,
  `karnet_taryfa_pierwsza` int(2),
  `karnet_taryfa_druga` int(2),
  `jednorazowe_wejscie` int(2),
  `opis_ulgi` VARCHAR (50),
  `wartosc_ulgowa` int(3),
  `godzina_zmiany_taryfy` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `czas_otwarcia_obiektu`;
CREATE TABLE IF NOT EXISTS `czas_otwarcia_obiektu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_obiektu` bigint(20) NOT NULL,
  `poniedzialek_otwarcie` varchar(5),
  `poniedzialek_zamkniecie` varchar(5),
  `wtorek_otwarcie` varchar(5),
  `wtorek_zamkniecie` varchar(5),
  `sroda_otwarcie` varchar(5),
  `sroda_zamkniecie` varchar(5),
  `czwartek_otwarcie` varchar(5),
  `czwartek_zamkniecie` varchar(5),
  `piatek_otwarcie` varchar(5),
  `piatek_zamkniecie` varchar(5),
  `sobota_otwarcie` varchar(5),
  `sobota_zamkniecie` varchar(5),
  `niedziela_otwarcie` varchar(5),
  `niedziela_zamkniecie` varchar(5),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `karnet`;
CREATE TABLE IF NOT EXISTS `karnet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` bigint(20) NOT NULL,
  `id_obiektu` bigint(20) NOT NULL,
  `data_waznosci` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_obiektu` (`id_obiektu`),
  KEY `id_uzytkownika` (`id_uzytkownika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `rezerwacja`;
CREATE TABLE IF NOT EXISTS `rezerwacja` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` bigint(20) NOT NULL,
  `id_obiektu` bigint(20) NOT NULL,
  `dzien_rezerwacji` varchar(16) NOT NULL,
  `godzina_rezerwacji` varchar(10) NOT NULL,
  `godzina_zakonczenia_rezerwacji` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_uzytkownika` (`id_uzytkownika`),
  KEY `id_obiektu` (`id_obiektu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `obiekt`;
CREATE TABLE IF NOT EXISTS `obiekt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(64) NOT NULL,
  `opis` varchar(1255) NOT NULL,
  `zdjecie` varchar(255) NULL,
  `miasto` VARCHAR(255) null,
  `ulica` VARCHAR(255) null,
  `kod_pocztowy` VARCHAR(255) null,
  `ocena` varchar(6)  NULL,
  `ocena_ilosc` int(6) NULL ,
  `cena` int(6) NULL,
  `cena_ulgowa` int(2) NULL ,
  `cena_ulgowa_wartosc` int(6) NULL ,
  `zatwierdzony` int(2) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `uzytkownik`;
CREATE TABLE IF NOT EXISTS `uzytkownik` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nazwa_uzytkownika` varchar(128) NOT NULL,
  `haslo` varchar(128) NOT NULL,
  `poziom_dostepu` varchar(128) NOT NULL,
  `adres_email` varchar(64)  ,
  `numer_telefonu` varchar(20) ,
  `imie` varchar(64)  ,
  `nazwisko` varchar(64) ,
  `obiekt_id` bigint(20) null,
  `created` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `wiadomosci`;
CREATE TABLE IF NOT EXISTS `wiadomosci` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  `kontakt_imie` varchar(50),
  `kontakt_email` varchar(50),
  `kontakt_tresc` varchar(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `aktualnosci` ADD FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`);
ALTER TABLE `cennik` ADD FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`);
ALTER TABLE `czas_otwarcia_obiektu` ADD FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`);
ALTER TABLE `karnet` ADD FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`);
ALTER TABLE `karnet` ADD  FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);
ALTER TABLE `rezerwacja` ADD FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`);
ALTER TABLE `rezerwacja` ADD FOREIGN KEY (`id_obiektu`) REFERENCES `obiekt` (`id`);



