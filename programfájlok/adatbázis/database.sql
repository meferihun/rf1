DROP TABLE IF EXISTS users;

CREATE TABLE felhasznalok (
	nev VARCHAR(40) NOT NULL UNIQUE,
	email VARCHAR(30) NOT NULL UNIQUE PRIMARY KEY,
	jelszo VARCHAR(100) NOT NULL,
	szuldatum DATE NOT NULL,
	tiltallapot BOOLEAN NOT NULL,
	jogosultsag VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS kedvenckategoriak;

CREATE TABLE kedvenckategoriak (
	email VARCHAR(30) NOT NULL REFERENCES felhasznalok(email) ON DELETE CASCADE ON UPDATE CASCADE,
	kategoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(email, kategoria)
); 

DROP TABLE IF EXISTS hirek CASCADE;

CREATE TABLE hirek (
	hirid SERIAL PRIMARY KEY,
	cim VARCHAR(50) NOT NULL,
	kozetevesdatuma DATE NOT NULL,
	megtekintesekszama INT NOT NULL,
	fontose BOOLEAN NOT NULL,
	forras VARCHAR(200) NOT NULL,
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
	kozzetevo VARCHAR(30) NOT NULL REFERENCES felhasznalok(email) ON DELETE CASCADE ON UPDATE CASCADE,
	hirid SMALLINT NOT NULL REFERENCES hirek(hirid) ON DELETE CASCADE ON UPDATE CASCADE
);

