DROP TABLE IF EXISTS users;

CREATE TABLE felhasznalok (
    	felhasznalonev VARCHAR(30) NOT NULL PRIMARY KEY,
	email VARCHAR(30) NOT NULL UNIQUE,
	jelszo VARCHAR(100) NOT NULL,
	szuldatum DATE NOT NULL,
	tiltallapot BOOLEAN NOT NULL,
	jogosultsag VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS kedvenckategoriak;

CREATE TABLE kedvenckategoriak (
	felhasznalonev VARCHAR(30) NOT NULL REFERENCES felhasznalok(felhasznalonev) ON DELETE CASCADE ON UPDATE CASCADE,
	kategoria VARCHAR(30) NOT NULL,
	PRIMARY KEY(felhasznalonev, kategoria)
); 

DROP TABLE IF EXISTS hirek CASCADE;

CREATE TABLE hirek (
	hirid SERIAL PRIMARY KEY,
	cim VARCHAR(50) NOT NULL,
	kozetevesdatuma DATE NOT NULL,
	megtekintesekszama INT NOT NULL,
	fontose BOOLEAN NOT NULL,
	forras VARCHAR(200) NOT NULL
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
	kozzetevo VARCHAR(30) NOT NULL REFERENCES felhasznalok(felhasznalonev) ON DELETE CASCADE ON UPDATE CASCADE,
	hirid SMALLINT NOT NULL REFERENCES hirek(hirid) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS usersdog CASCADE;

CREATE TABLE usersdog (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS dogs;

CREATE TABLE dogs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    owner_id INT NOT NULL
);



