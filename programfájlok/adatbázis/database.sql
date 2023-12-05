DROP TABLE IF EXISTS users;

CREATE TABLE felhasznalok (
	nev VARCHAR(40) NOT NULL UNIQUE,
	email VARCHAR(90) NOT NULL UNIQUE PRIMARY KEY,
	jelszo VARCHAR(100) NOT NULL,
	szuldatum DATE NOT NULL,
	tiltallapot BOOLEAN NOT NULL,
	jogosultsag VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS kedvenckategoriak;

CREATE TABLE kedvenckategoriak (
	email VARCHAR(90) NOT NULL REFERENCES felhasznalok(email) ON DELETE CASCADE ON UPDATE CASCADE,
	kategoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(email, kategoria)
); 

DROP TABLE IF EXISTS hirek CASCADE;

CREATE TABLE hirek (
	hirid SERIAL PRIMARY KEY,
	cim VARCHAR(400) NOT NULL,
	kozetevesdatuma DATE NOT NULL,
	megtekintesekszama INT NOT NULL,
	fontose BOOLEAN NOT NULL,
	forras VARCHAR(400) NOT NULL,
	honnan VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS hirkategoriak;

CREATE TABLE hirkategoriak (
	hirid SMALLINT NOT NULL REFERENCES hirek(hirid) ON DELETE CASCADE ON UPDATE CASCADE,
	kategoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(hirid, kategoria)
);

DROP TABLE IF EXISTS kommentek;

CREATE TABLE kommentek (
	kommentid SERIAL PRIMARY KEY,
	kozetevesdatuma DATE NOT NULL,
	tartalom VARCHAR(500) NOT NULL,
	kozzetevo VARCHAR(90) NOT NULL REFERENCES felhasznalok(email) ON DELETE CASCADE ON UPDATE CASCADE,
	hirid SMALLINT NOT NULL REFERENCES hirek(hirid) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS users;

CREATE TABLE felhasznalok (
	nev VARCHAR(40) NOT NULL UNIQUE,
	email VARCHAR(90) NOT NULL UNIQUE PRIMARY KEY,
	jelszo VARCHAR(100) NOT NULL,
	szuldatum DATE NOT NULL,
	tiltallapot BOOLEAN NOT NULL,
	jogosultsag VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS kedvenckategoriak;

CREATE TABLE kedvenckategoriak (
	email VARCHAR(90) NOT NULL REFERENCES felhasznalok(email) ON DELETE CASCADE ON UPDATE CASCADE,
	kategoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(email, kategoria)
); 

DROP TABLE IF EXISTS hirek CASCADE;

CREATE TABLE hirek (
	hirid SERIAL PRIMARY KEY,
	cim VARCHAR(400) NOT NULL,
	kozetevesdatuma DATE NOT NULL,
	megtekintesekszama INT NOT NULL,
	fontose BOOLEAN NOT NULL,
	forras VARCHAR(400) NOT NULL,
	honnan VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS hirkategoriak;

CREATE TABLE hirkategoriak (
	hirid SMALLINT NOT NULL REFERENCES hirek(hirid) ON DELETE CASCADE ON UPDATE CASCADE,
	kategoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(hirid, kategoria)
);

DROP TABLE IF EXISTS kommentek;

CREATE TABLE kommentek (
	kommentid SERIAL PRIMARY KEY,
	kozetevesdatuma DATE NOT NULL,
	tartalom VARCHAR(500) NOT NULL,
	kozzetevo VARCHAR(90) NOT NULL REFERENCES felhasznalok(email) ON DELETE CASCADE ON UPDATE CASCADE,
	hirid SMALLINT NOT NULL REFERENCES hirek(hirid) ON DELETE CASCADE ON UPDATE CASCADE
);


-- 1. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Kovacs Zoltan az amerikai nagykovetrol: Presember ur a tortenelem szellemvasutjan ul', '2023-12-04', 0, true, 'https://telex.hu/belfold/2023/12/04/kovacs-zoltan-presemer-pressman-amerikai-nagykovet', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (1, 'Belfold');

-- 2. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Ujabb elfogatoparancsot adott ki a rendorseg a kemkedesert elitelt Kovacs Bela ellen', '2023-12-04', 0, true, 'https://telex.hu/belfold/2023/12/04/kovacs-bela-jobbik-kemkedes-korozes-rendorseg', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (2, 'Belfold');

-- 3. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Zug a betontoro legkalapacs, mar csak romok maradtak a hegyeshalmi hataratkelobol', '2023-12-02', 2000, false, 'https://telex.hu/belfold/2023/12/02/hataratkelo-hegyeshalom-bontas-polgarmester', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (3, 'Belfold');

-- 4. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Iden a villamosok mellett mar fenybuszok is kozlekednek Budapesten', '2023-12-01', 0, false, 'https://telex.hu/belfold/2023/12/01/budapest-bkv-unnepi-fenyflottaja-elindult', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (4, 'Belfold');

-- 5. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Valaki mashol tudta meg, hogy mar kivettek a penzet, amit a gyorsovenyhazi kispostan kotott le', '2023-12-01', 0, false, 'https://telex.hu/belfold/2023/12/01/posta-lekotes-gyorsovenyhaz-posta-belso-vizsgalat-hiany', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (5, 'Belfold');

-- 6. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Csak Janos L. Simon kirugasarol: Vannak olyanok, akik nehezen viselik Lacit', '2023-12-01', 0, false, 'https://telex.hu/belfold/2023/12/01/csak-janos-l-simon-meneszteserol-vannak-olyanok-akik-nehezen-viselik-lacit', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (6, 'Belfold');

-- 7. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Onos eso miatt lezartak a Normafat, a tomegkozlekedes is akadozik', '2023-12-01', 400, false, 'https://telex.hu/belfold/2023/12/01/bkk-jegesedes-nem-jar-60-as-busz-65-os-busz-szakaszos', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (7, 'Belfold');

-- 8. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Orban Viktor: Magyarorszag azt a taktikat valasztotta, hogy minden birodalom temetesen reszt tudjon venni, es ez a terveink a jovore nezve is', '2023-12-01', 0, false, 'https://telex.hu/belfold/2023/12/01/orban-viktor-kossuth-radio-december-1', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (8, 'Belfold');

-- 9. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Fegyelmi eljaras indult a Momentumban a Donath Annat kritizalo bajai polgarmester ellen', '2023-12-01', 0, false, 'https://telex.hu/belfold/2023/12/01/fegyelmi-eljaras-indult-a-momentumban-a-donath-annat-kritizalo-bajai-polgarmester-ellen', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (9, 'Belfold');

-- 10. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Levaltottak az Orszagos Korhazi Foigazgatosag vezetojet', '2023-11-30', 0, false, 'https://telex.hu/belfold/2023/11/30/okfo-jenei-zoltan-levaltas', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (10, 'Belfold');

-- 11. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Politico: Brusszeli tisztsegviselok szerint “politikai szinjatek” Orban Ukrajna EU-tagsagat elutasito makacssaga', '2023-12-04', 0, false, 'https://hvg.hu/itthon/20231204_Politico_Brusszeli_tisztsegviselok_szerint_politikai_szinjatek_Orban_Ukrajna_EUtagsagat_elutasito_makacssaga', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (11, 'Belfold');

-- 12. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Vadat emeltek a ferfi ellen, aki megfojtotta az elettarsat, majd moziba ment az anyjaval', '2023-12-04', 5034, false, 'https://hvg.hu/itthon/20231204_Vadat_emeltek_a_ferfi_ellen_aki_megfojtottra_elettarsat_majd_moziba_ment_az_anyjaval', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (12, 'Belfold');

-- 13. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Orban Viktort meglepte, hogy nincs Mikulas, hiszen o maga is helyettesitette a Skala Aruhaz elott', '2023-12-04', 141, false, 'https://hvg.hu/itthon/20231204_orban_viktort_mikulas_helyettesites_skala_aruhaz', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (13, 'Belfold');

-- 14. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Kirugtak tobb szaz katonat, de egy titkolt kormanydontes meg meg is neheziti az ujra elhelyezkedesuket', '2023-12-04', 0, false, 'https://hvg.hu/itthon/20231204_Kirugtak_tobb_szaza_katonat_de_egy_titkolt_kormanydontes_meg_meg_is_neheziti_az_ujra_elhelyezkedesuket', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (14, 'Belfold');

-- 15. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Kovacs Zoltan az amerikai nagykovetrol: "Presember ur a tortenelem szellemvasutjan ul, es ez az SZDSZ-es idokbe vitte vissza"', '2023-12-04', 0, true, 'https://hvg.hu/itthon/20231204_Kovacs_Zoltan_az_amerikai_nagykovetrol_Presember_ur_a_tortenelem_szellemvasutjan_ul', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (15, 'Belfold');

-- 16. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Demenciaprogramot indit a kormany', '2023-11-29', 0, true, 'https://hvg.hu/itthon/20231129_demencia_demenciaprogram_hornung_agnes', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (16, 'Belfold');

-- 17. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Rovarirtoszer keveredhetett ebbe a kurkuma porba, visszahivta a Nebih', '2023-11-29', 0, true, 'https://hvg.hu/itthon/20231129_Rovarirto_szer_keveredhetett_ebbe_a_kurkuma_porba_visszahivta_a_Nebih', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (17, 'Belfold');

-- 18. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Meg kerdes, osszeallna-e kozos listara az ellenzek', '2023-11-29', 0, true, 'https://hvg.hu/itthon/20231129_Meg_kerdes_osszeallnae_az_ellenzek_Budapesten_de_a_Mi_Hazankat_egysegesen_nacizzak_a_valasztasi_szabalyokat_atiro_javaslatuk_utan', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (18, 'Belfold');

-- 19. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Nepszava: Leszavazta az onkormanyzat a Club Aliga teruleten zajlo epitkezesrol szolo nepszavazast', '2023-11-29', 0, false, 'https://hvg.hu/itthon/20231129_Club_Aliga_nepszavazas_leszavazta_onkormanyzat', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (19, 'Belfold');

-- 20. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Magyarorszag a legutolso az EU friss, akademai szabadsag listajan', '2023-11-30', 0, false, 'https://hvg.hu/itthon/20231130_Magyarorszag_a_legutolso_az_EU_friss_akademiai_szabadsag_listajan', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (20, 'Belfold');

-- 21. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Sosem volt meg olyan magas a korhazak adossaga, mint oktober vegen', '2023-11-24', 0, false, 'https://444.hu/2023/11/24/sosem-volt-meg-olyen-magas-a-korhazak-adossaga-mint-oktober-vegen', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (21, 'Belfold');

-- 22. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Hadhazy utan Donath Anna is beleallt a DK-MSZP paktumba a zugloi Horvath Csaba miatt', '2023-11-25', 0, false, 'https://444.hu/2023/11/25/donath-anna-egyetert-hadhazy-akossal-csak-ugy-lehet-eselyunk-a-fidesz-ellen-ha-meggyozzuk-a-valasztokat-hogy-az-ellenzek-maskepp-csinalna-a-dolgokat-mint-a-fidesz', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (22, 'Belfold');

-- 23. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('A magyarok 47 szazaleka szerint jogos onvedelem, 37 szazaleka szerint nepirtas, amit Izrael csinal', '2023-11-26', 0, false, 'https://444.hu/2023/11/26/a-magyarok-47-szazaleka-szerint-jogos-onvedelem-37-szazaleka-szerint-nepirtas-amit-izrael-csinal', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (23, 'Belfold');

-- 24. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Pert inditott egy anya a gyamhatosag idohuzasa miatt, karteritest kapott', '2023-11-27', 0, false, 'https://444.hu/2023/11/27/pert-inditott-egy-anya-a-gyamhatosag-idohuzasa-miatt-karteritest-kapott', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (24, 'Belfold');

-- 25. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Faliujsagrol tudtak meg a makoi Continental-dolgozok, hogy kirugasok lesznek a gyarban', '2023-11-27', 4141, false, 'https://444.hu/2023/11/27/faliujsagrol-tudtak-meg-a-makoi-continental-dolgozok-hogy-kirugasok-lesznek-a-gyarban', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (25, 'Belfold');

-- 26. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('A kormany megszuntetne az Orszagos Meteorologiai Szolgalatot', '2023-12-01', 0, false, 'https://444.hu/2023/12/01/a-kormany-megszuntetne-az-orszagos-meteorologiai-szolgalatot', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (26, 'Belfold');

-- 27. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Ugy osztogatott unios penzeket a Kulugyminiszterium, hogy meg a szabalyozasi keret sem volt kesz', '2023-12-01', 0, true, 'https://444.hu/2023/12/01/ugy-osztogatott-unios-penzeket-a-kulugyminiszterium-hogy-meg-a-szabalyozasi-keret-sem-volt-kesz', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (27, 'Belfold');

-- 28. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Kirugtak meg ket vezetot az Orszagos Korhazi Foigazgatosagtol', '2023-12-02', 0, true, 'https://444.hu/2023/12/02/kirugtak-meg-ket-vezetot-az-orszagos-korhazi-foigazgatosagtol', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (28, 'Belfold');

-- 29. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Tovabb reformalna a valasztasi torvenyeket a Mi Hazank', '2023-12-03', 0, true, 'https://444.hu/2023/12/03/tovabb-reformalna-a-valasztasi-torvenyeket-a-mi-hazank', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (29, 'Belfold');

-- 30. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Tobb szaz katona munkahelyet szuntettek meg, majd megnehezitettek ujboli elhelyezkedesuket is', '2023-12-04', 0, true, 'https://444.hu/2023/12/04/tobb-szaz-katona-munkahelyet-szuntettek-meg-majd-megnehezitettek-ujboli-elhelyezkedesuket-is', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (30, 'Belfold');

-- 31. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Tobb europai drogbandanak is dolgozott a magyar pilota, akit Irorszagban fogtak el', '2023-12-04', 0, true, 'https://telex.hu/kulfold/2023/12/04/irorszag-magyar-gyanusitott-heroin-drogkereskedo', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (31, 'Kulfold');

-- 32. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Legalabb 47-en meghaltak a foldcsuszamlasokban Tanzania eszaki reszen', '2023-12-03', 0, true, 'https://telex.hu/kulfold/2023/12/03/legalabb-47-en-meghaltak-a-foldcsuszamlasokban-tanzania-eszaki-reszen', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (32, 'Kulfold');

-- 33. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('A dubaji klimacsupcs elnoke szerint nincs tudomanyos hattere a fosszilis tuzelouanyagok kivezetesenek', '2023-12-03', 400, false, 'https://telex.hu/techtud/2023/12/03/cop28-szultan-ahmed-el-dzsaber-tudomany-fosszilis-energiahordozok', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (33, 'Kulfold');

-- 34. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Izraeli belbiztonsagi fonok: Kiiktatjuk a Hamasz vezetoit Libanonban, Torokorszagban, Katarban is', '2023-12-03', 0, false, 'https://telex.hu/kulfold/2023/12/03/gaza-izrael-haboru-percrol-percre', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (34, 'Kulfold');

-- 35. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Orbannal tervezett talalkozoja miatt nem hagyhatta el Ukrajnat a volt elnok', '2023-12-02', 0, false, 'https://telex.hu/kulfold/2023/12/02/orbannal-tervezett-talalkozoja-miatt-nem-hagyhatta-el-ukrajnat-a-volt-elnok', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (35, 'Kulfold');

-- 36. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('New York Times: Az izraeli hadsereg mar egy eve ismerte a Hamasz haditervet, de nem vette azt komolyan', '2023-12-01', 0, false, 'https://telex.hu/kulfold/2023/12/01/new-york-times-hamasz-terrortamadas-terv-izrael-jelentes-jeriko-fal', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (36, 'Kulfold');

-- 37. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Heller Agnesrol neveztel el az innsbrucki egyetem legujabb epuletet', '2023-12-01', 505, false, 'https://telex.hu/kulfold/2023/12/01/heller-agnesrol-neveztek-el-az-innsbrucki-egyetem-legujabb-epuletet', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (37, 'Kulfold');

-- 38. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Helikopter zuhant az autopalyara Madrid mellett', '2023-12-01', 0, false, 'https://telex.hu/kulfold/2023/12/01/madrid-helikopter-baleset', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (38, 'Kulfold');

-- 39. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Lazar Janos 40 embere segit majd be a szerb valasztasokon', '2023-12-01', 0, false, 'https://telex.hu/kulfold/2023/12/01/lazar-janos-szabadka-kampany-palinka', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (39, 'Kulfold');

-- 40. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Milorad Dodik: Ha Trump megnyeri az amerikai valasztast, kikialom a boszniai Szerb Koztarsasag fuggetlenseget', '2023-12-04', 0, false, 'https://telex.hu/kulfold/2023/12/04/milorad-dodik-bosznia-szerb-koztarsasag', 'Telex');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (40, 'Kulfold');

-- 41. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Meghalt Henry Kissinger', '2023-11-30', 0, false, 'https://hvg.hu/vilag/20231130_Meghalt_Henry_Kissinger', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (41, 'Kulfold');

-- 42. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Az izraeli hatoosagok elhunytkent kezelik a Hamasz tamadasa utan eltuntek egy reszet', '2023-12-04', 4141, false, 'https://hvg.hu/vilag/20231204_haboru_Izrael_hatosagok_halal_Hamasz_tuszok', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (42, 'Kulfold');

-- 43. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Tobb holttest is elokerult, miutan kitort a Marapi vulkan Indoneziaban', '2023-12-04', 0, false, 'https://hvg.hu/vilag/20231204_TIndonezia_vulkankitores_Marapi', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (43, 'Kulfold');

-- 44. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Jemenbol kilott raketak harom kereskedelmi hajot talaltak el, amelyeknek amerikai hadihajo nyujtott segitseget a Voros-tengeren', '2023-12-04', 0, false, 'https://hvg.hu/vilag/20231204_USS_Carney_hadihajo_raketak_Jemen_lazadok_Voros_tenger', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (44, 'Kulfold');

-- 45. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Meg a brit legiero is a Hamasz tuszait probalja megtalalni', '2023-12-03', 0, true, 'https://hvg.hu/vilag/20231203_izrael_brit_legiero_hamasz_tuszok_gazai_ovezet', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (45, 'Kulfold');

-- 46. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Kizaradtak az amerikai kepviselohazbol a republikanus kamugepet, George Santost', '2023-12-01', 0, true, 'https://hvg.hu/vilag/20231201_george_santos_amerikai_kepviselohaz_kizaras', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (46, 'Kulfold');

-- 47. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Zelenszkij elismerte, hogy az ukran ellentamadas nem hozta meg a kivant eredmenyeket', '2023-12-01', 147, true, 'https://hvg.hu/vilag/20231201_ukrajna_haboru_zelenszkij_ellentamadas', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (47, 'Kulfold');

-- 48. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Ujabb orosz drontamadas erte az ejjel Ukrajnat', '2023-12-01', 0, true, 'https://hvg.hu/vilag/20231201_oroszukran_konfliktus_oroszukran_haboru_drontamadas_hadihajo', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (48, 'Kulfold');

-- 49. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Izraeli vadaszgepek „csapast mertek” a Hamaszra Gazaban – a tuzszunet lejart', '2023-12-01', 0, false, 'https://hvg.hu/vilag/20231201_izraelipalesztin_haboru_2023_Hamasz_Gazai_ovezet_tuzszunet_tamadas_Antony_Blinken', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (49, 'Kulfold');

-- 50. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('A tuzszuneti hatarido lejart, szirenak harsognak a gazai hatar kozelen – Frissitve', '2023-12-01', 0, false, 'https://hvg.hu/vilag/20231201_izraelipalesztin_haboru_2023_Hamasz_Gazai_ovezet_tuzszunet', 'HVG');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (50, 'Kulfold');

-- 51. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Letartoztattak Floridaban az USA volt boliviai nagykovetet, aki Kubanak kemkedett', '2023-12-04', 0, false, 'https://444.hu/2023/12/04/letartoztattak-floridaban-az-usa-volt-boliviai-nagykovetet-aki-kubanak-kemkedett', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (51, 'Kulfold');

-- 52. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Jemenbol inditott raketakkal es dronokkal tamadtak meg harom kereskedelmi hajot a Voros-tengeren', '2023-12-04', 4144, false, 'https://444.hu/2023/12/04/jemenbol-inditott-raketakkal-es-dronokkal-tamadtak-meg-harom-kereskedelmi-hajot-a-voros-tengeren', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (52, 'Kulfold');

-- 53. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Duhos volt a gazai tamadasok miatt, kessel es kalapaccsal tamadt turistakra a francia ferfi', '2023-12-03', 0, false, 'https://444.hu/2023/12/03/duhos-volt-a-gazai-tamadasok-miatt-kessel-es-kalapaccsal-tamadt-turistakra-a-francia-ferfi', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (53, 'Kulfold');

-- 54. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Az SZBU allitja: Orbanal talalkozott volna, ezert nem engedtek ki az orszagbol Petro Porosenko volt elnokot', '2023-12-02', 0, false, 'https://444.hu/2023/12/02/az-szbu-allitja-orbannal-talalkozott-volna-ezert-nem-engedtek-ki-az-orszagbol-petro-porosenko-volt-elnokot', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (54, 'Kulfold');

-- 55. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Zsakutcaba jutottak az ujabb tuzszunetrol szolo targyalasok, Izrael hazarendelte kepviseloit', '2023-12-02', 0, false, 'https://444.hu/2023/12/02/zsakutcaba-jutottak-az-ujabb-tuzszunetrol-szolo-targyalasok-izrael-hazarendelte-kepviseloit', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (55, 'Kulfold');

-- 56. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Valtoztatni kell a mozgositasi rendszeren Ukrajnaban, fiatalabb ujoncokra van szuksege a hadseregnek', '2023-12-02', 0, false, 'https://444.hu/2023/12/02/valtoztatni-kell-a-mozgositasi-rendszeren-ukrajnaban-fiatalabb-ujoncokra-van-szuksege-a-hadseregnek', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (56, 'Kulfold');

-- 57. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Feloszlott a francia baloldal 18 parti valasztasi szuperkoalicioja, mert a legnagyobb balos part annyira tamogatja a Hamaszt', '2023-12-01', 0, true, 'https://444.hu/2023/12/01/feloszlott-a-francia-baloldal-18-parti-valasztasi-szuperkoalicioja-mert-a-legnagyobb-balos-part-annyira-tamogatja-a-hamaszt', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (57, 'Kulfold');

-- 58. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Egy nem letezo orszaggal kotott megallapodast, lemondott a paraguayi tisztviselo', '2023-12-01', 5004, true, 'https://444.hu/2023/12/01/egy-nem-letezo-orszaggal-kotott-megallapodast-lemondott-a-paraguayi-tisztviselo', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (58, 'Kulfold');

-- 59. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('Orizetbe vett a nemet rendorseg egy 15 es egy 16 eves fiut, akik terrortamadasra keszultek', '2023-11-29', 0, true, 'https://444.hu/2023/11/29/orizetbe-vett-a-nemet-rendorseg-egy-15-es-egy-16-eves-fiut-akik-terrortamadasra-keszultek', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (59, 'Kulfold');

-- 60. Sor
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES ('A Hamasz azt allitja, hogy izraeli bombazasban halt meg legfiatalabb, 10 honapos tusza', '2023-11-29', 0, true, 'https://444.hu/2023/11/29/a-hamasz-azt-allitja-hogy-izraeli-bombazasban-halt-meg-legfiatalabb-10-honapos-tusza', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES (60, 'Kulfold');



-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('A Libri is zarva lesz december 24-en', '2023-12-04', 0, true, 'https://telex.hu/gazdasag/2023/12/04/a-libri-is-zarva-lesz-december-24-en', 'Telex'),
  ('Felfuggesztettek a godi Samsung-gyar egyes reszeinek ejszakai mukodeset', '2023-12-03', 0, true, 'https://telex.hu/gazdasag/2023/12/03/god-samsung-gyar-felfuggesztett-ejszakai-mukodes-zajszennyezes', 'Telex'),
  ('Rekord szintre okte a 4iG arbevetelét a Vodafone megvasarlasa', '2023-12-01', 0, false, 'https://telex.hu/gazdasag/2023/12/01/4ig-rekord-arbevetel-vodafone', 'Telex'),
  ('Miskolc atadja vizmu-vagyonat az allamnak', '2023-11-30', 0, false, 'https://telex.hu/gazdasag/2023/11/30/miskolc-vizikozmu-kozszolgaltatas-miskolci-onkormanyzat', 'Telex'),
  ('A kutyaevésert kiallo tenyesztoek dulakodtak a rendorokkel Del-Koreaban', '2023-11-30', 51350, false, 'https://telex.hu/kulfold/2023/11/30/del-korea-kutyahuseves-tuntetes', 'Telex');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (61, 'Gazdasag'),
  (62, 'Gazdasag'),
  (63, 'Gazdasag'),
  (64, 'Gazdasag'),
  (65, 'Gazdasag');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Harmezer uj dolgozot vesz fel a kecskemeti Mercedes-Benz', '2023-11-30', 0, false, 'https://telex.hu/gazdasag/2023/11/30/dolgozo-mercedes-bovites-gyartas-gyartouzem', 'Telex'),
  ('Tortenelmi minuszban a beruhazasok, de a kormanyt ez sem zavarja a sikerpropagandaban', '2023-11-30', 0, false, 'https://hvg.hu/gazdasag/20231130_Osszeroppant_beruhazasok_az_allamtitkar_nem_hazudott_csak_a_dolgok_jo_oldalat_nezte', 'HVG'),
  ('Hat honaprol ket evre nott az elektromosjaromu-toltoallomasok telepitesi ideje az EU-ban', '2023-12-04', 0, false, 'https://hvg.hu/zhvg/20231204_elektromos_jarmu_toltoallomasok_telepites_engedelyeztetes_lassulas_energiahalozat', 'HVG'),
  ('Es akkor a 94 eves Orban Viktor szemelyesen kapcsolhatja le Paks I-et', '2023-12-03', 0, true, 'https://hvg.hu/gazdasag/20231203_Es_akkor_paks_recesszio_eu_napelem_csok_kozeposztaly_arak', 'HVG'),
  ('Megujulo energiaforrasok, atomenergia es tob milliard dollarnyi hozzajarulas a Zold Klima Alaphoz - igy telt a COP28 masodik napja', '2023-12-03', 0, true, 'https://hvg.hu/zhvg/20231202_COP28_klimacsucs', 'HVG');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (66, 'Gazdasag'),
  (67, 'Gazdasag'),
  (68, 'Gazdasag'),
  (69, 'Gazdasag'),
  (70, 'Gazdasag');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Meg majdnem negyed evszazadig mukodtetnek a paksi atomeromuvet', '2023-12-01', 5150, false, 'https://hvg.hu/gazdasag/20231201_paks_i_uzemidomeghosszabbitas_paksi_atomeromuv_mvm_nuklearis_energiatermeles', 'HVG'),
  ('A fiatalok ketharmada szerint az oktatas pocsek, egyharmad kulfoldon dolgozna', '2023-12-01', 0, false, 'https://hvg.hu/gazdasag/20231201_fiatalok_ketharmad_oktatas_kulfoldi_munkavallalas', 'HVG'),
  ('A Libri is csatlakozott a december 24-en zarvatarto uzletek sorahoz', '2023-12-01', 0, true, 'https://444.hu/2023/12/04/a-libri-is-csatlakozott-a-december-24-en-zarvatarto-uzletek-sorahoz', '444'),
  ('Az uj epitesugyi torveny szigoruan tiltana a kulteruletek belteruletbe vonasat a kovetkezo evekben', '2023-12-04', 0, false, 'https://444.hu/2023/12/04/az-uj-epitesugyi-torveny-szigoruan-tiltana-a-kulteruletek-belteruletbe-vonasat-a-kovetkezo-evekben', '444'),
  ('133 ceget alapitottak oroszok Magyarorszagon a haboru kitorese ota, vannak koztuk gyanusak', '2023-12-04', 0, false, 'https://444.hu/2023/12/04/133-ceget-alapitottak-oroszok-magyarorszagon-a-haboru-kitorese-ota-vannak-koztuk-gyanusak', '444'),
  ('Elmagyazta a KSH, mi is rantotta ki a magyar gazdasagot a recessziobol', '2023-12-01', 54, false, 'https://444.hu/2023/12/01/elmagyazta-a-ksh-mi-is-rantotta-ki-a-magyar-gazdasagot-a-recessziobol', '444'),
  ('A makoi Continental gyar szerint nem a kulfoldi vendegmunkasok miatt kezdtek elbocsatasokba', '2023-12-01', 5555, false, 'https://444.hu/2023/12/01/a-makoi-continental-gyar-szerint-nem-a-kulfoldi-vendegmunkasok-miatt-kezdtek-elbocsatasokba', '444'),
  ('Szingapur es Zurich a vilag legdragabb varosai', '2023-12-01', 0, true, 'https://444.hu/2023/12/01/szingapur-es-zurich-a-vilag-legdragabb-varosai', '444');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (71, 'Gazdasag'),
  (72, 'Gazdasag'),
  (73, 'Gazdasag'),
  (74, 'Gazdasag'),
  (75, 'Gazdasag'),
  (76, 'Gazdasag'),
  (77, 'Gazdasag'),
  (78, 'Gazdasag');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Megvan a magyar valogatott pontos Eb-programja', '2023-12-03', 0, true, 'https://telex.hu/sport/2023/12/03/futball-magyar-valogatott-2024-europa-bajnoksag-pontos-menetrend', 'Telex'),
  ('A szovetsegi kapitany Milakrol: Penzt kap erte, ne beszeljunk mellé', '2023-12-03', 40, true, 'https://telex.hu/sport/2023/12/03/sos-csaba-uszokapitany-milak-kristof-uszas', 'Telex'),
  ('Meghurcolva erte magat a doppingvad alol felmentett magyar uszo', '2023-11-30', 0, false, 'https://telex.hu/sport/2023/11/30/ilyes-laura-vanda-wada-dopping', 'Telex'),
  ('Noi kezi-vb: Az ut jarhato az olimpiai selejtezore, csak vegig kell menni rajta', '2023-11-30', 0, false, 'https://telex.hu/sport/2023/11/30/noi-kezilabda-vilagbajnoksag-olimpiai-selejtezo', 'Telex'),
  ('A Real Madrid csoportelsokent jutott tovabb a Bajnokok Ligajaban', '2023-11-29', 51350, false, 'https://telex.hu/sport/2023/11/29/bajnokok-ligaja-csoportkor-eredmenyek', 'Telex');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (79, 'Sport'),
  (80, 'Sport'),
  (81, 'Sport'),
  (82, 'Sport'),
  (83, 'Sport');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Szalah: Szoboszlai meg gyerek, nem szeretnem, ha a szurkolok tul nagy nyomast helyeznek ra', '2023-11-29', 0, false, 'https://telex.hu/sport/2023/11/29/mohamed-szalah-nem-szeretnem-ha-a-szurkolok-tul-nagy-nyomast-helyeznenek-szoboszlaira', 'Telex'),
  ('Szalah: Szoboszlai csak egy kolyok, hadd jatsszon nyomas nelkul – video', '2023-11-29', 0, false, 'https://hvg.hu/elet/20231129_Szalah_Szoboszlai_csak_egy_kolyok_hadd_jatsszon_nyomas_nelkul__video', 'HVG'),
  ('Nincs szuksegunk tularazott stadionokra – kilepett az olimpia szervezobizottsagabol Brisbane fopolgarmestere', '2023-12-04', 0, false, 'https://hvg.hu/gazdasag/20231204_ausztralia_olimpia_brisbane_adrian_schinner', 'HVG'),
  ('Akkora ho esett le Munchenben, hogy elmarad Schaferek meccse', '2023-12-02', 0, true, 'https://hvg.hu/elet/20231202_Akkora_ho_esett_le_Munchenben_hogy_elmarad_Schaferek_meccse', 'HVG'),
  ('Nadal erzelmes videoban jelentette be, hogy januarban visszater', '2023-12-01', 0, true, 'https://hvg.hu/elet/20231201_rafael_nadal_visszateres_tenisz', 'HVG'),
  ('Ez az igazi karriervaltas: korcsolyaval a laban tert vissza a brit elvonalba Petr Cech', '2023-11-30', 5150, false, 'https://hvg.hu/elet/20231130_Korcsolyaval_a_laban_tert_vissza_a_brit_elvonalba_Petr_Cech', 'HVG'),
  ('Harom helyet javitott a magyar valogatott a FIFA vilaglistajan', '2023-11-30', 0, false, 'https://hvg.hu/sport/20231130_labdarugas_magyar_valogatott_fifa_vilagranglista', 'HVG');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (84, 'Sport'),
  (85, 'Sport'),
  (86, 'Sport'),
  (87, 'Sport'),
  (88, 'Sport'),
  (89, 'Sport'),
  (90, 'Sport');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Mar be lehet jelentkezni a foci Eb-jegyekert az UEFA-nal', '2023-12-03', 0, true, 'https://444.hu/2023/12/03/mar-be-lehet-jelentkezni-a-foci-eb-jegyekert-az-uefa-nal', '444'),
  ('„Aki le tud gyalogolni 15 kilometeret, kello akarattal egy 4270 kilometeres turat is vegig tud jarni"', '2023-12-02', 0, false, 'https://444.hu/tldr/2023/12/02/aki-le-tud-gyalogolni-15-kilometert-kello-akarattal-egy-4270-kilometeres-turat-is-vegig-tud-jarni', '444'),
  ('A szovetsegi kapitany megismetelte: Milak tartozik maganak es Magyarorszagnak annyival, hogy lejar edzeni', '2023-12-01', 500, false, 'https://444.hu/2023/12/01/a-szovetsegi-kapitany-megismetelte-milak-tartozik-maganak-es-magyarorszagnak-annyival-hogy-lejar-edzeni-penzt-kap-erte-ne-beszeljunk-melle4', '444'),
  ('A 98. percben gyozott a Fradi a Konferencia-ligaban', '2023-11-30', 0, false, 'https://444.hu/2023/11/30/a-98-percben-gyozott-a-fradi-a-konferencia-ligaban', '444'),
  ('A NOB Franciaorszagnak adna a 2030-as teli olimpiat, Salt Lake Citynek pedig a 2034-est', '2023-11-29', 0, false, 'https://444.hu/2023/11/29/a-nob-franciaorszagnak-adna-a-2030-as-teli-olimpiat-salt-lake-citynek-pedig-a-2034-est', '444'),
  ('Hosszu Katinka indulna a parizsi olimpian', '2023-11-27', 0, true, 'https://444.hu/2023/11/27/hosszu-katinka-indulna-a-parizsi-olimpian', '444');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (91, 'Sport'),
  (92, 'Sport'),
  (93, 'Sport'),
  (94, 'Sport'),
  (95, 'Sport'),
  (96, 'Sport');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Kagylok dronzottak, majd egy 128 eves hajoroncsot talalt ket filmes Amerikaban egy to feneken', '2023-12-03', 0, true, 'https://telex.hu/techtud/2023/12/03/ket-filmes-egy-viz-alatti-dronnal-veletlenul-egy-128-eves-hajoroncsot-talalt-a-huron-to-feneken', 'Telex'),
  ('Uzleti titkokat kotyog ki az Amazon csetbotja', '2023-12-03', 0, true, 'https://telex.hu/techtud/2023/12/03/uzleti-titkokat-kotyog-ki-az-amazon-csetbotja', 'Telex'),
  ('Felavattak a legujabb kiserleti fuzios berendezest, magyarok adtak a plazmafigyelo kamerajat', '2023-12-02', 0, false, 'https://telex.hu/techtud/2023/12/02/jt-60sa-japan-fuzios-berendezes-hun-ren-energiatudomanyi-kutatokozpont', 'Telex'),
  ('Igy nezett ki belulrol az OpenAI felrobbanasa', '2023-11-30', 0, false, 'https://telex.hu/techtud/2023/11/30/openai-sam-altman-kirugas-visszavetel-chatgpt-kaosz', 'Telex'),
  ('Regen nem hasznalta a Google-fiokjat? Nincs mese, december elsejen torolni fogjak', '2023-11-28', 51350, false, 'https://telex.hu/techtud/2023/11/28/google-inaktiv-fiok-torles', 'Telex'),
  ('Ezek kozt a tipusok kozt van az europai Ev Autoja dij gyoztese', '2023-11-27', 0, false, 'https://telex.hu/techtud/2023/11/27/ezek-kozt-van-az-europai-ev-autoja-dij-gyoztese', 'Telex');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (97, 'Tech'),
  (98, 'Tech'),
  (99, 'Tech'),
  (100, 'Tech'),
  (101, 'Tech'),
  (102, 'Tech');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Oriasi napelem-paradoxonra mutattak ra: az egyenlet vege egyaltalan nem biztos, hogy megtakaritas', '2023-12-04', 0, false, 'https://hvg.hu/tudomany/20231204_napelem_paradoxon_a_napnergia_visszapattano_hatas_miatt', 'HVG'),
  ('Uj idok szele: valtozik az idojaras-elorejelzes, osszefogott a NASA es az IBM', '2023-12-04', 0, false, 'https://hvg.hu/tudomany/20231204_nasa_ibm_osszefogas_mesterseges_intelligencia_alapmodell_idojaras_klimacelok_prognozis_elorejelzes_pontossaganak_javitasa', 'HVG'),
  ('Talaltak egy feherjet, amely lelassithatja a rak terjedeset', '2023-12-04', 0, true, 'https://hvg.hu/tudomany/20231203_rak_feherje_daganat_egeszsegugy', 'HVG'),
  ('Apple, Facebook, Google, Tesla – megis hova akar menni dolgozni, aki ezeknel felmondana?', '2023-12-03', 0, true, 'https://hvg.hu/tudomany/20231203_fluktuacio_technologiai_oriasvallalatok_apple_microsoft_linkedin_google_meta_tesla', 'HVG'),
  ('Ilyen robotkez eddig nem letezett: nyomtattak egy olyat, amelyben mar ott vannak a csontok es az inak is', '2023-12-03', 5150, false, 'https://hvg.hu/tudomany/20231201_muvegtag_mukez_robotkez_3d_nyomtatas_csont_inak', 'HVG'),
  ('Megvalosulhat minden cukorbeteg alma: nem naponta, hanem csak evente haromszor kell alkalmazni egy uj hidrogelt', '2023-12-01', 0, false, 'https://hvg.hu/tudomany/20231201_2_es_tipusu_cukorbetegseg_kezelese_gyogyszer_diabetesz_hidrogel', 'HVG'),
  ('Hatalmas leepites a Spotifynal, minden hatodik embert elbocsatanak', '2023-12-04', 0, true, 'https://444.hu/2023/12/04/hatalmas-leepites-a-spotifynal-minden-hatodik-embert-elbocsatanak', '444'),
  ('Nem csak akkugyarat hoznak Magyarorszagra a kinaik', '2023-11-26', 0, false, 'https://444.hu/2023/11/26/nem-csak-akkutgyarat-hoznak-magyarorszagra-a-kinaiak', '444');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (103, 'Tech'),
  (104, 'Tech'),
  (105, 'Tech'),
  (106, 'Tech'),
  (107, 'Tech'),
  (108, 'Tech'),
  (109, 'Tech'),
  (110, 'Tech');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Sam Altman visszater az OpenAI elere (:D)', '2023-11-22', 0, false, 'https://444.hu/2023/11/22/sam-altman-visszater-az-openai-elere-d', '444'),
  ('A techvilag legorultebb hetvegeje', '2023-11-21', 0, false, 'https://444.hu/2023/11/21/a-techvilag-legorultebb-hetvegeje', '444'),
  ('Az OpenAI alkalmazottainak tobb mint fele koveteli az igazgatosag lemondasat', '2023-11-20', 0, false, 'https://444.hu/2023/11/20/az-openai-alkalmazottainak-tobb-mint-a-fele-koveteli-a-vezetoseg-lemondasat-kulonben-felmondanak', '444'),
  ('Kiraktak a ChatGPT atyjat az igazgatoi szekbol, de meg visszamaszhat', '2023-11-19', 0, true, 'https://444.hu/2023/11/19/kiraktak-a-chatgpt-atyjat-az-igazgatoi-szekbol-de-meg-visszamaszhat', '444');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (111, 'Tech'),
  (112, 'Tech'),
  (113, 'Tech'),
  (114, 'Tech');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Rogan-Gaal Cecilia lapja a bulvarmezoynyben is gyenge, megis milliardos profitokat termel', '2023-09-13', 0, true, 'https://telex.hu/gazdasag/2023/09/13/rogan-gaal-cecilia-sarka-kata-twn-top-news-hungary-kft-bulvar-ujsag-kiemelkedo-bevetel-profit', 'Telex'),
  ('Ugy trollkodja szet a sajat nyalrovatat a SZON, hogy a bogy adja a masikat', '2023-06-30', 0, true, 'https://telex.hu/zacc/2023/06/30/szon-cikk-cim-feminista-csocskontent', 'Telex'),
  ('Kallay-Saunders Andras eltunt, de meglett, Jarai Kira sexi, es ezt a ferje is tudja, Csuti szerint Viki hozta a formajat', '2023-04-22', 0, false, 'https://telex.hu/zacc/2023/04/22/bulvarhirek-sztarok-celebek-magyarazo', 'Telex'),
  ('A KESMA-lapok is rajottek, hogyan lehet halalhirrel kattintasra vadaszni', '2023-04-19', 0, false, 'https://telex.hu/zacc/2023/04/19/kesma-bulvarmedia-halalhir-kovacs-istvan-koko', 'Telex'),
  ('Verprofi televiziosnak tartjak magukat a TV2 bulvaros propagandajanak arcai', '2023-04-06', 51350, false, 'https://telex.hu/zacc/2023/04/06/tv2-tenyek-marsi-aniko-gonczi-gabor-blikk-interju', 'Telex'),
  ('Hat hetre felfuggeszti az RTL Klub Jarai Matet, miutan az egyik musor bizalmas kerdesekrol beszelt nyilvanosan', '2022-05-19', 0, false, 'https://telex.hu/after/2022/05/19/jarai-mate-rtl-reggeli-felfuggesztettek', 'Telex');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (115, 'Bulvar'),
  (116, 'Bulvar'),
  (117, 'Bulvar'),
  (118, 'Bulvar'),
  (119, 'Bulvar'),
  (120, 'Bulvar');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Megvan, kik verekszenek a Sztarbox dontojeben, es a kek majom is szinre lepett', '2023-12-03', 0, false, 'https://hvg.hu/elet/20231203_Sztarbox_donto_molnar_aron_racz_jeno_jozan_laszlo_dobos_evelin_nyari_dia_pinter_tibor', 'HVG'),
  ('Toth Gabi is gratulalt exferjenek a Dancing with the Starshoz', '2023-12-03', 0, false, 'https://hvg.hu/elet/20231203_Toth_Gabi_gratulalt_Dancing_with_the_Stars_krausz_gabor', 'HVG'),
  ('Kabat Petert meg kell muteni a sztarboxos kiutes utan', '2023-11-25', 0, true, 'https://hvg.hu/elet/20231125_Kabat_Petert_meg_kell_muteni_a_sztarboxos_kiutes_utan', 'HVG'),
  ('Megint bepanaszoltak a Sztarboxot, ezzuttal Kabat Peter ajulasaeert', '2023-11-24', 0, true, 'https://hvg.hu/itthon/20231124_Megint_bepanaszoltak_a_Sztarboxot_ezuttal_egy_ajulasert', 'HVG'),
  ('Van-e olyan jo az RTL gyilkosos realityje, mint egy Poirot-film vagy a Cluedo?', '2023-11-21', 5150, false, 'https://hvg.hu/elet/20231121_Arulo_reality_RTL', 'HVG'),
  ('Blikk: Megszuletett Orban Viktor hatodik unokaja', '2023-11-17', 0, false, 'https://hvg.hu/itthon/20231117_orban_viktor_hatodik_unoka', 'HVG');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (121, 'Bulvar'),
  (122, 'Bulvar'),
  (123, 'Bulvar'),
  (124, 'Bulvar'),
  (125, 'Bulvar'),
  (126, 'Bulvar');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Gulyas Gergely bulvartemanak tartja, hogy mit csinal a kormany a kormanyzati plakatokon Alex Soros kezevel', '2023-11-30', 0, true, 'https://444.hu/2023/11/30/gulyas-gergely-bulvartemanak-tartja-hogy-mit-csinal-a-kormany-a-kormanyzati-plakatokon-alex-soros-kezevel', '444'),
  ('Lemond az altala alapitott zenei teve elerol Puff Daddy', '2023-11-29', 0, false, 'https://444.hu/2023/11/29/lemond-az-altala-alapitott-zenei-teve-elerol-puff-daddy', '444'),
  ('Szijjarto Peter szemelyesen hivta fel Kabat Petert, miutan az exfocistat kiutottek a Sztarboxban', '2023-11-23', 0, false, 'https://444.hu/2023/11/23/szijjarto-peter-szemelyesen-hivta-fel-kabat-petert-miutan-az-exfocistat-kiutottek-a-sztarboxban', '444'),
  ('Alec Baldwin eloszor szerepelt nyilvanosan operatore leleve ota', '2023-11-12', 0, false, 'https://444.hu/2023/11/12/alec-baldwin-eloszor-szerepelt-nyilvanosan-az-operator-lelovese-ota', '444'),
  ('Schobert Norbertnek van nehany kerdes a Holdra szallasrol', '2023-11-11', 0, false, 'https://444.hu/2023/11/11/schobert-norbertnek-van-nehany-kerdese-a-holdra-szallasrol', '444'),
  ('130 millio forintert barki megveheti Zambo Jimmy csepeli hazat', '2023-11-08', 0, true, 'https://444.hu/2023/11/08/130-millio-forintert-barki-megveheti-zambo-jimmy-csepeli-hazat', '444');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (127, 'Bulvar'),
  (128, 'Bulvar'),
  (129, 'Bulvar'),
  (130, 'Bulvar'),
  (131, 'Bulvar'),
  (132, 'Bulvar');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Hamarabb gyogyul a beteg, ha normalisan beszelnek vele, es az orszag is sporal egy csomo penzt', '2023-12-03', 0, true, 'https://telex.hu/eletmod/2023/12/03/orvos-beteg-hozzatartozo-kommunikacio-korhaz-egeszsegugyi-dolgozok-kiegese', 'Telex'),
  ('Kevesebbet keresnek a nok, ha elhiznak', '2023-11-29', 200, true, 'https://telex.hu/eletmod/2023/11/29/nok-fizetes-testsuly-tulsuly-elhizas-karrier-kutatas', 'Telex'),
  ('Ot ev alatt erdo nott ki egy pesti murvas parkolo helyen', '2023-11-13', 0, false, 'https://telex.hu/eletmod/2023/11/13/parkolobol-erdo-a-8-keruletben-klimakert-erdokert-zseberdo-komposzt-aurora', 'Telex'),
  ('Az alkoholista ember gyerek akar maradni', '2023-11-10', 0, false, 'https://telex.hu/eletmod/2023/11/10/gorog-zita-kovacs-orsolya-alkoholizmus-fuggoseg-pszichologia-csalad-gyerekek', 'Telex'),
  ('Onmagunkkal foglalkozni a legnehezebb feladat', '2023-11-02', 51350, false, 'https://telex.hu/eletmod/2023/11/02/erzelmi-ongondoskodas-pszichologus', 'Telex'),
  ('A halott szerettunk a hamvain keresztul sincsen mar velunk, hiaba tartjuk kozel magunkhoz', '2023-10-31', 0, false, 'https://telex.hu/eletmod/2023/10/31/hamvasztas-urna-otthon-tarolas-kampany-gyaszfeldolgozas-pszichologiai-folyamat-elakadas-revesz-renata-liliana', 'Telex'),
  ('Meghalt bungee jumpingolas kozben egy turista, amikor leugrott egy 233 meter magas toronyrol', '2023-12-04', 0, false, 'https://hvg.hu/elet/20231204_Belehalt_a_bungee_jumpingba_egy_turista_amikor_leugrott_egy_233_meter_magas_toronyrol', 'HVG'),
  ('Fabiny Tamas evangelikus puspok Karsai Danielnek: „Szeretnem biztosítani elismeresemrol és tamogatasomrol”', '2023-12-04', 0, false, 'https://hvg.hu/elet/20231204_Fabiny_Tamas_evangelikus_puspok_Karsai_Daniel_ALS', 'HVG');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (133, 'Eletmod'),
  (134, 'Eletmod'),
  (135, 'Eletmod'),
  (136, 'Eletmod'),
  (137, 'Eletmod'),
  (138, 'Eletmod'),
  (139, 'Eletmod'),
  (140, 'Eletmod');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Otven eve elvesztett baratjat talalta meg egy idos ferfi, amikor meccsen veletlenul melle ult', '2023-12-04', 0, true, 'https://hvg.hu/elet/20231203_Otven_eve_elvesztett_baratjat_talalta_meg_egy_idos_ferfi_amikor_meccsen_veletlenul_melle_ult', 'HVG'),
  ('Tenyleg nem lehet aterni az uj, Rakoczi uti zebran?', '2023-12-03', 0, true, 'https://hvg.hu/elet/20231203_Tenyleg_nem_lehet_aterni_az_uj_Rakoczi_uti_zebran', 'HVG'),
  ('A Deak terre felhokarcolot, Csillaghegyre 40 emeletes, harom kilometer hosszu hazat terveztek', '2023-12-03', 5150, false, 'https://hvg.hu/elet/20231203_Sosemvolt_Budapest_epiteszet_kiallitas_Ero_Zoltan_tarlatvezetes', 'HVG'),
  ('„Fopolgarmesteri Abbey Roaddal” avattak fel az uj zebrat, a propaganda megtalalta a hibat', '2023-12-03', 0, false, 'https://hvg.hu/elet/20231203_uj_zebra_rakoczi_ut_karacsony_gergely_abby_road_propaganda_bohar_daniel', 'HVG'),
  ('Kevesebbet szulnenek az europai fiatalok, hogy vedjek a kornyezetet', '2023-10-25', 0, true, 'https://444.hu/2023/10/25/kevesebbet-szulnenek-az-europai-fiatalok-hogy-vedjek-a-kornyezetet', '444');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (141, 'Eletmod'),
  (142, 'Eletmod'),
  (143, 'Eletmod'),
  (144, 'Eletmod'),
  (145, 'Eletmod');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Az aktiv eutanziaarol szolo hatarozati javaslatot adott be a Momentum', '2023-12-04', 0, false, 'https://444.hu/2023/12/04/az-aktiv-eutanaziarol-szolo-hatarozati-javaslatot-adott-be-a-momentum', '444'),
  ('Nenik es bacsik, most elmagyarazzuk, mit jelent az ev szava', '2023-12-04', 0, false, 'https://444.hu/2023/12/04/nenik-es-bacsik-most-elmagyarazzuk-mit-jelent-az-ev-szava', '444'),
  ('Fantasztikus nemetalfoldi festmeny kerult elo egy tehetetlen dugheben tombolo elkenyeztetett milliardosrol, akinek epp nem teljesult az akarata', '2023-12-04', 0, false, 'https://444.hu/2023/12/04/fantasztikus-nemetalfoldi-festmeny-kerult-elo-egy-tehetetlen-duheben-tombolo-elkenyeztetett-milliardosrol-akinek-epp-nem-teljesult-az-akarata', '444'),
  ('Ha ok meghalnak, akkor ez mar nem egy megelt dolog lesz, hanem csak egy beszelt', '2023-12-03', 0, false, 'https://444.hu/2023/12/03/ha-ok-meghalnak-akkor-ez-mar-nem-egy-megelt-dolog-lesz-hanem-csak-egy-beszelt', '444'),
  ('Michael Jacksonnal es Habony Arpaddal viccelodnek Orban uj videojaban', '2023-12-03', 0, true, 'https://444.hu/2023/12/03/michael-jacksonnal-es-habony-arpaddal-viccelodnek-orban-uj-videojaban', '444');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (146, 'Eletmod'),
  (147, 'Eletmod'),
  (148, 'Eletmod'),
  (149, 'Eletmod'),
  (150, 'Eletmod');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Ezek az eszkozok nem vedik meg a varandos not egy autobaleset soran', '2023-12-01', 0, true, 'https://telex.hu/techtud/2023/12/01/auto-kozlekedesbiztonsag-adac-ovadapter-karambol', 'Telex'),
  ('Tippek a felkeszuleshez, hogy ne legyen remalom a teli autozas', '2023-12-01', 0, true, 'https://telex.hu/belfold/2023/12/01/auto-kozlekedes-telivezetes-biztonsag-baleset-akkumulator', 'Telex'),
  ('Fontos reszletek derultek ki a Xiaomi autojarol', '2023-11-17', 0, false, 'https://telex.hu/techtud/2023/11/17/xiaomi-auto-villanyauto-apple-elektromos-auto-kozlekedes-autoipar', 'Telex'),
  ('Ez a Ferrari valakinek 18 milliard forintnyi penzt is meger', '2023-11-15', 0, false, 'https://telex.hu/techtud/2023/11/15/auto-ferrari-arveres-kozlekedes-aukcio-rmsothebys', 'Telex'),
  ('Az Audie, a BMW-e vagy a Mercedese a legjobb elektromos hajtasu kompakt SUV?', '2023-10-28', 51350, false, 'https://telex.hu/techtud/2023/10/28/audi-bmw-mercedes-villanyauto-teszt-eqb-q4-e-tron-ix1', 'Telex'),
  ('Benzinmotorral, de elektromos hajtassal kepzeli el a jovot a Mazda', '2023-10-27', 0, false, 'https://telex.hu/techtud/2023/10/27/auto-mazda-wankelmotor-japan-tokyo-autoipar-kozlekedes-villanyauto', 'Telex');

-- INSERT INTO utasítások a hirkategoriak táblához
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (151, 'Auto'),
  (152, 'Auto'),
  (153, 'Auto'),
  (154, 'Auto'),
  (155, 'Auto'),
  (156, 'Auto');
  
-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Elektromos Porschet ehet reggelire: megneztuk a Toyota izgalmas uj villany-sportkocsijat', '2023-12-04', 0, false, 'https://hvg.hu/cegauto/20231204_elektromos_porschet_ehet_reggelire_a_toyota_izgalmas_uj_villanysportkocsija_ftse', 'HVG'),
  ('Meg mindig jol fizet az F1: 90 milliard forintot vittek haza iden az elit pilotak', '2023-12-04', 0, false, 'https://hvg.hu/cegauto/20231204_tiz_F1es_pilota_kereste_a_legtobb_penzt_iden', 'HVG'),
  ('Pillantas a jovobe: testkozelbol ismerkedtunk meg a Toyota kicsi es olcso 2024-es villanyautojaval', '2023-12-04', 0, true, 'https://hvg.hu/cegauto/20231204_pillantas_a_jovobe_testkozelbol_ismerkedtunk_meg_a_toyota_urban_suv_kicsi_es_olcso_uj_villanyautojaval', 'HVG'),
  ('Kedves fotokon pozol ez a 2,5 ev alatt nem kis penzbol megepitett miniatur Ikarus busz', '2023-12-03', 0, false, 'https://hvg.hu/cegauto/20231203_kedves_fotokon_pozol_ez_a_25_ev_alatt_megepitett_miniatur_ikarus_260_busz', 'HVG'),
  ('Lepett a rendorseg a Magyarorszag fele kerulo kamionosok tomegrei miatt', '2023-12-02', 5150, false, 'https://hvg.hu/itthon/20231202_Lepett_a_rendorseg_a_Magyarorszag_fele_kerulo_kamionosok_tomegei_miatt', 'HVG'),
  ('Most csak a nedves utak, kesobb ho, a suru kod, vagy a viharos szel okoz majd balesetveszelyt', '2023-12-02', 0, true, 'https://hvg.hu/cegauto/20231202_Most_csak_a_nedves_utak_kesobb_ho_a_suru_kod_vagy_a_viharos_szel_okoz_majd_balesetveszelyt', 'HVG');
  
INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (157, 'Auto'),
  (158, 'Auto'),
  (159, 'Auto'),
  (160, 'Auto'),
  (161, 'Auto'),
  (162, 'Auto');

-- INSERT INTO utasítások a hirek táblához
INSERT INTO hirek (cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan)
VALUES
  ('Kiengedtek, jelenleg haziorizetben van az Arpad hidi halalos baleset okozoja', '2023-11-24', 0, true, 'https://444.hu/2023/11/24/kiengedtek-jelenleg-haziorizetben-van-az-arpad-hidi-halalos-baleset-okozoja', '444'),
  ('Reszegen vezetett, elvettek a jogositvanyat, majd fel ora mulva megint megszondaztattak', '2023-11-27', 0, false, 'https://444.hu/2023/11/27/reszegen-vezetett-elvettek-a-jogositvanyat-majd-fel-ora-mulva-megint-megszondaztattak', '444'),
  ('Nagyon ugy nez ki hogy nem celszeru buntetofekezni mert vegul a buntetofekezoket buntetik meg', '2023-11-21', 300, false, 'https://444.hu/2023/11/21/nagyon-ugy-nez-ki-hogy-nem-celszeru-buntetofekezni-mert-vegul-oket-buntetik-meg', '444'),
  ('A kormanyhivatallal vitetik el az embercsempeszek elhagyatott autoit a szerb hatar melol', '2023-11-16', 0, false, 'https://444.hu/2023/11/16/a-kormanyhivatallal-vitetik-el-az-embercsempeszek-elhagyott-autoit-a-szerb-hatar-mellol', '444'),
  ('Kromofaggal rongaltak meg tobb tucat szabalytalanul parkolo autot Ujlipotvarosban', '2023-11-10', 0, false, 'https://444.hu/2023/11/10/kromofaggal-rongaltak-meg-tobb-tucat-szabalytalanul-parkolo-autot-ujlipotvarosban', '444'),
  ('A pizzafutarral egyutt vitte el a pizzafutar autojat', '2023-11-02', 0, true, 'https://444.hu/2023/11/02/a-pizzafutarral-egyutt-vitte-el-a-pizzafutar-autojat', '444');

INSERT INTO hirkategoriak (hirid, kategoria)
VALUES
  (163, 'Auto'),
  (164, 'Auto'),
  (165, 'Auto'),
  (166, 'Auto'),
  (167, 'Auto'),
  (168, 'Auto');









