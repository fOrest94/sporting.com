SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET collation_connection = 'utf8_general_ci';

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu,created, adres_email, numer_telefonu, imie)
VALUES('1','admin','$2a$04$KWeGmrnv.s7rn/zWFN4p/emjZDCdW5pjD6DwsIxaj.GBHnfb6LoF6','ADMINISTRATOR',CURRENT_DATE, 'administrator@gmail.com','657435324', 'Fryderyk');

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, numer_telefonu,created,obiekt_id,imie,adres_email)
VALUES('2','user123','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,CURRENT_DATE, 1, 'Olek', 'kros@wp.pl');

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, numer_telefonu,created,obiekt_id,imie,adres_email)
VALUES('3','user124','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,CURRENT_DATE, 2, 'Olek', 'kros@wp.pl');

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, numer_telefonu,created,obiekt_id,imie,adres_email)
VALUES('4','user125','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,CURRENT_DATE, 3, 'Olek', 'kros@wp.pl');

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, numer_telefonu,created,obiekt_id,imie,adres_email)
VALUES('5','user126','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,CURRENT_DATE, 4, 'Olek', 'kros@wp.pl');

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, numer_telefonu,created,obiekt_id,imie,adres_email)
VALUES('6','user127','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,CURRENT_DATE,5, 'Olek', 'kros@wp.pl');

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, numer_telefonu,created,obiekt_id,imie,adres_email)
VALUES('7','user128','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,CURRENT_DATE,6, 'Olek', 'kros@wp.pl');

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, numer_telefonu,created,obiekt_id,imie,adres_email)
VALUES('8','user129','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,CURRENT_DATE,7, 'Olek', 'kros@wp.pl');

INSERT INTO obiekt_rekreacyjno_sportowy.uzytkownik(id, nazwa_uzytkownika, haslo, poziom_dostepu, numer_telefonu,created,obiekt_id,imie,adres_email)
VALUES('9','user130','$2a$04$65my72NWs9afeZ88pN95se8w4CpZUcirwQWd5MG5f.vy8leFGRYWu','USER',null,CURRENT_DATE,8, 'Olek', 'kros@wp.pl');

INSERT INTO `obiekt`(`nazwa`,`ulica`, `miasto`, `opis` ,`ocena`,`ocena_ilosc`, `zdjecie`, zatwierdzony, cena_ulgowa, cena_ulgowa_wartosc, cena)
VALUES ('Sala gimnastyczna UJ','Rejtana 23, Stare Miasto','Kraków', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker' ,'5' ,2, 'resources/img/1.jpg',0,1,20, 40);

INSERT INTO `obiekt`(`nazwa`,`ulica`, `miasto`, `opis` ,`ocena`,`ocena_ilosc`, `zdjecie`, zatwierdzony, cena_ulgowa, cena_ulgowa_wartosc, cena)
VALUES ('Hala Sportowa Mosir','Rejtana 23, Stare Miasto','Kraków', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker','3.4' ,2, 'resources/img/2.jpg',0,1,20, 40);

INSERT INTO `obiekt`(`nazwa`,`ulica`, `miasto`, `opis` ,`ocena`,`ocena_ilosc`, `zdjecie`, zatwierdzony, cena_ulgowa, cena_ulgowa_wartosc, cena)
VALUES ('Hala sportowa UP','Rejtana 23, Stare Miasto', 'Jasło', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker','5' ,1, 'resources/img/3.jpg',0,1,20, 40);

INSERT INTO `obiekt`(`nazwa`,`ulica`, `miasto`, `opis` ,`ocena`,`ocena_ilosc`, `zdjecie`, zatwierdzony, cena_ulgowa, cena_ulgowa_wartosc, cena)
VALUES ('Sala gimnastyczna UEK','Rejtana 23, Stare Miasto','Kraków', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker','4' ,2, 'resources/img/4.jpg',0,1,20, 40);

INSERT INTO `obiekt`(`nazwa`,`ulica`, `miasto`, `opis` ,`ocena`,`ocena_ilosc`, `zdjecie`, zatwierdzony, cena_ulgowa, cena_ulgowa_wartosc, cena)
VALUES ('Centrum Sportu PK','Rejtana 23, Stare Miasto','Kraków', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker','4.5' ,2, 'resources/img/5.jpg',0,1,20, 40);

INSERT INTO `obiekt`(`nazwa`,`ulica`, `miasto`, `opis` ,`ocena`,`ocena_ilosc`, `zdjecie`, zatwierdzony, cena_ulgowa, cena_ulgowa_wartosc, cena)
VALUES ('Hala Sportowa Sasiek','Rejtana 23, Stare Miasto', 'Jasło', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker','3' ,3, 'resources/img/6.jpg',0,1,20, 40);

INSERT INTO `obiekt`(`nazwa`,`ulica`, `miasto`, `opis` ,`ocena`,`ocena_ilosc`, `zdjecie`, zatwierdzony, cena_ulgowa, cena_ulgowa_wartosc, cena)
VALUES ('Hala Sportowa SP3','Rejtana 23, Stare Miasto','Kraków', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker' ,'2.4',2, 'resources/img/7.jpg',0,1,20, 40);

INSERT INTO `obiekt`(`nazwa`,`ulica`, `miasto`, `opis` ,`ocena`,`ocena_ilosc`, `zdjecie`, zatwierdzony, cena_ulgowa, cena_ulgowa_wartosc, cena)
VALUES ('Boisko siatkarskie','Rejtana 23, Stare Miasto', 'Jasło', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker' ,'3.8',7, 'resources/img/8.jpg',0,1,20, 40);

/*INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Basen'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Mala sala gimnastyczna'), 45, 60, 60, 80, null, null, null, '17:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Hala tenisowa'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Hala sztuk walki'), 45, 60, 60, 80, null, null, null, '17:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Sala BJJ'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Sauna'), 45, 60, 60, 80, null, null, null, '17:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Silownia'), 80, 100, 100, 150, 90, 120, 10, '15:00');

INSERT INTO `cennik`(`id_obiektu`, `wynajecie_robocze_taryfa_pierwsza`, `wynajecie_robocze_taryfa_druga`, `wynajecie_weekend_taryfa_pierwsza`,
`wynajecie_weekend_taryfa_druga`, `karnet_taryfa_pierwsza`, `karnet_taryfa_druga`, `jednorazowe_wejscie`, `godzina_zmiany_taryfy`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Boisko siatkarskie'), 45, 60, 60, 80, null, null, null, '17:00');

INSERT INTO `czas_otwarcia_obiektu`(`id_obiektu`, `poniedzialek_otwarcie`, `poniedzialek_zamkniecie`, `wtorek_otwarcie`, `wtorek_zamkniecie`, `sroda_otwarcie`, `sroda_zamkniecie`, `czwartek_otwarcie`, `czwartek_zamkniecie`, `piatek_otwarcie`, `piatek_zamkniecie`, `sobota_otwarcie`, `sobota_zamkniecie`, `niedziela_otwarcie`, `niedziela_zamkniecie`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Basen'), '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '06:00', '23:00', '07:30', '24:00', '07:30', '24:00');


INSERT INTO `czas_otwarcia_obiektu`(`id_obiektu`, `poniedzialek_otwarcie`, `poniedzialek_zamkniecie`, `wtorek_otwarcie`, `wtorek_zamkniecie`, `sroda_otwarcie`, `sroda_zamkniecie`, `czwartek_otwarcie`, `czwartek_zamkniecie`, `piatek_otwarcie`, `piatek_zamkniecie`, `sobota_otwarcie`, `sobota_zamkniecie`, `niedziela_otwarcie`, `niedziela_zamkniecie`)
VALUES ((SELECT `id` from `obiekt` where `nazwa` = 'Mala sala gimnastyczna'), '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '08:00', '23:00', '10:30', '24:00', '10:30', '24:00');
*/
INSERT INTO `rezerwacja`(`id_uzytkownika`, `id_obiektu` ,`dzien_rezerwacji`,`godzina_rezerwacji`, `godzina_zakonczenia_rezerwacji`)
VALUES (2,1,'03/20/2018' ,'08:00', '09:00');

INSERT INTO `rezerwacja`(`id_uzytkownika`, `id_obiektu` ,`dzien_rezerwacji`,`godzina_rezerwacji`, `godzina_zakonczenia_rezerwacji`)
VALUES (3,2,'03/20/2018' ,'08:00', '09:00');

INSERT INTO `rezerwacja`(`id_uzytkownika`, `id_obiektu` ,`dzien_rezerwacji`,`godzina_rezerwacji`, `godzina_zakonczenia_rezerwacji`)
VALUES (4,3,'03/20/2018' ,'08:00', '09:00');

INSERT INTO `rezerwacja`(`id_uzytkownika`, `id_obiektu` ,`dzien_rezerwacji`,`godzina_rezerwacji`, `godzina_zakonczenia_rezerwacji`)
VALUES (5,4,'03/20/2018' ,'08:00', '09:00');

INSERT INTO `rezerwacja`(`id_uzytkownika`, `id_obiektu` ,`dzien_rezerwacji`,`godzina_rezerwacji`, `godzina_zakonczenia_rezerwacji`)
VALUES (2,1,'03/20/2018' ,'10:00', '13:00');

# username : admin, password administrator
# username : user123, password user123
