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
VALUES ('Zelenszkij elismerte, hogy az ukrán ellentamadas nem hozta meg a kivant eredmenyeket', '2023-12-01', 147, true, 'https://hvg.hu/vilag/20231201_ukrajna_haboru_zelenszkij_ellentamadas', 'HVG');

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















