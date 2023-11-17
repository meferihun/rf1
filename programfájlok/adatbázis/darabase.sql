DROP TABLE IF EXISTS users;

CREATE TABLE felhasznalok (
    felhasznalonev VARCHAR(30) NOT NULL PRIMARY KEY,
	email VARCHAR(30) NOT NULL UNIQUE,
	jelszo VARCHAR(100) NOT NULL,
	szuldatum DATE NOT NULL,
	tiltallapot BOOLEAN NOT NULL,
	jogosultsag UNSIGNED TINYINT(1) NOT NULL,
);

DROP TABLE IF EXISTS kedvenckategoriak;

CREATE TABLE kedvenckategoriak (
	felhasznalonev VARCHAR(30) NOT NULL REFERENCES felhasznalok(felhasznalonev) ON DELETE CASCADE ON UPDATE CASCADE,
	kategoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(felhasznalonev, kategoria)
); 

DROP TABLE IF EXISTS hirek;

CREATE TABLE hirek (
	hirid UNSIGNED SMALLINT(5) NOT NULL PRIMARY KEY,
	cim VARCHAR(50) NOT NULL,
	kozetevesdatuma DATE NOT NULL,
	tartalom TEXT,
	megtekintesekszama UNSIGNED INT NOT NULL,
	fontose BOOLEAN NOT NULL,
	forras VARCHAR(200) NOT NULL,
)

DROP TABLE IF EXISTS hirkategoriak;

CREATE TABLE hirkategoriak (
	hirid UNSIGNED SMALLINT(5) NOT NULL REFERENCES hirek(hirid) ON DELETE CASCADE ON UPDATE CASCADE,
	kategoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(hirid, kategoria)
)

DROP TABLE IF EXISTS kommentek;

CREATE TABLE kommentek (
	kommentid UNSIGNED SMALLINT(3) NOT NULL,
	kozetevesdatuma DATE NOT NULL,
	tartalom VARCHAR(500) NOT NULL,
	kozzetevo VARCHAR(30) NOT NULL REFERENCES felhasznalok(felhasznalonev) ON DELETE CASCADE ON UPDATE CASCADE,
	hirid UNSIGNED SMALLINT(5) NOT NULL REFERENCES hirek(hirid) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(hirid, kommentid)
)


