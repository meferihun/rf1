# Tesztjegyzőkönyv-`Regisztráció, Bejelentkezés`

Az alábbi tesztdokumentum a `Hír` projekthez tartozó `8.3.1. Felhasználók kezelése (regisztráció, bejelentkezés)` funkcióihoz készült. Felelőse: `Szalai István` 
 

## 1. Teszteljárások (TP)

### 1.1. Sikeres regisztráció funkció tesztelése 
- Azonosító: TP-01
- Tesztesetek: TC-01
- Leírás: Sikeres regisztráció tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
    1. lépés: A `Felhasználónév` szövegbeviteli mezőbe írjunk be a `TesztElek` nevet
    2. lépés: Az `E-Mail` szövegbeviteli mezőbe írjunk be a `tesztelek@gmail.com` email címet
	3. lépés: A `Jelszó` szövegbeviteli mezőbe írjunk be a `TesztElek123` jelszót
	4. lépés: A `Jelszó újra` szövegbeviteli mezőbe írjunk be a `TesztElek123` jelszót ismét
	5. lépés: A `Születési dátum` szövegbeviteli mezőbe írjunk be a `2000-01-01` dátumot
    3. lépés: Nyomjuk meg a `Regisztráció` gombot 
    4. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Sikeres regisztráció`

### 1.2. Sikertelen regisztráció funkció tesztelése
- Azonosító: TP-02
- Tesztesetek: TC-02
- Leírás: Sikertelen regisztráció tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
    1. lépés: A `Felhasználónév` szövegbeviteli mezőbe írjunk be a `TesztElek` nevet
    2. lépés: Az `E-Mail` szövegbeviteli mezőbe írjunk be a `tesztelek@gmail.com` email címet
	3. lépés: A `Jelszó` szövegbeviteli mezőbe írjunk be a `TesztElek123` jelszót
	4. lépés: A `Jelszó újra` szövegbeviteli mezőbe írjunk be a `TesztElek1234` jelszót
	5. lépés: A `Születési dátum` szövegbeviteli mezőbe írjunk be a `2000-01-01` dátumot
    3. lépés: Nyomjuk meg a `Regisztráció` gombot 
    4. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Sikertelen regisztracio!`
	
### 1.3. Bejelentkezés funkció tesztelése
- Azonosító: TP-03
- Tesztesetek: TC-03
- Leírás: Bejelentkezés tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
    1. lépés: A `E-mail` szövegbeviteli mezőbe írjunk be a `tesztelek@gmail` email címet
    2. lépés: A `Jelszó` szövegbeviteli mezőbe írjunk be a `TesztElek123` jelszót
    3. lépés: Nyomjuk meg a `Belépés` gombot 
    4. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Sikeres bejelentkezés!`	

### 1.4. Hír hozzáadása tesztelése
- Azonosító: TP-04
- Tesztesetek: TC-04
- Leírás: Hír hozzáadás tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
    1. lépés: A `Cím` szövegbeviteli mezőbe írjunk be a `Teszt` címet
    2. lépés: A `Közzétevés dátuma` szövegbeviteli mezőbe írjunk be a `2001.01.01` dátumot
    3. lépés: A `Fontos-e` mezőt pipáljuk be
    4. lépés: A `Forrás` szövegbeviteli mezőbe írjunk be a `teszt.hu` dátumot
    5. lépés: Nyomjuk meg a `Submit` gombot 
    6. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Sikeres hozzáadás!`	


## 2. Teszesetek (TC)

### 2.1. Regisztráció tesztesetei

#### 2.1.1. TC-01
- TP: TP-01
- Leírás: Sikeres regisztráció tesztelése
- Bemenet: `Felhasználónév` = `TesztElek` ; `E-Mail` = `tesztelek@gmail.com` ; `Jelszó` = `TesztElek123` ; `Jelszó újra` = `TesztElek123` ; `Születési dátum` = `2000-01-01`
- Művelet: nyomjuk meg a `Regisztráció` gombot 
- Elvárt kimenet: Sikeres regisztráció

#### 2.1.2. TC-02
- TP: TP-02
- Leírás: Sikertelen regisztráció tesztelése
- Bemenet: `Felhasználónév` = `TesztElek` ; `E-Mail` = `tesztelek@gmail.com` ; `Jelszó` = `TesztElek123` ; `Jelszó újra` = `TesztElek1234` ; `Születési dátum` = `2000-01-01`
- Művelet: nyomjuk meg a `Regisztráció` gombot 
- Elvárt kimenet: Sikertelen regisztráció

### 2.2. Bejelentkezés tesztesete

#### 2.2.1. TC-01
- TP: TP-02
- Leírás: Bejelentkezés tesztelése
- Bemenet: `E-Mail` = `tesztelek@gmail.com` ; `Jelszó` = `TesztElek123`
- Művelet: nyomjuk meg az `Belépés` gombot 
- Elvárt kimenet: Sikeres belépés

### 2.3. Hír hozzáadás tesztesete

#### 2.3.1. TC-01
- TP: TP-02
- Leírás: Hír hozzáadás tesztelése
- Bemenet: `Cím` = `Teszt` ; `Közzétevés dátuma` = `2001.01.01` ; `Fontos-e` = `checked` ; `Forrás` = `teszt.hu`
- Művelet: nyomjuk meg az `Submit` gombot 
- Elvárt kimenet: Sikeres hozzáadás

## 3. Tesztriportok (TR)

### 3.1. Regisztráció tesztriportjai

#### 3.1.1. TR-01 (TC-01)
- TP: TP-01
    1. lépés: `TesztElek` nevet beírtam
    2. lépés: `tesztelek@gmail.com` email címet beírtam
	3. lépés: `TesztElek123` jelszót beírtam
	4. lépés: `TesztElek123` jelszót újra beírtam
	5. lépés: `2000-01-01` dátumot beírtam
    6. lépés: a gomb egyszeri megnyomás után sikeresen regisztráltam
    

#### 3.1.2. TR-02 (TC-02)
- TP: TP-01
    1. lépés: `TesztElek` nevet beírtam
    2. lépés: `tesztelek@gmail.com` email címet beírtam
	3. lépés: `TesztElek123` jelszót beírtam
	4. lépés: `TesztElek1234` jelszót beírtam
	5. lépés: `2000-01-01` dátumot beírtam
    6. lépés: a gomb egyszeri megnyomás után sikertelenül regisztráltam

### 3.2. Bejelentkezés funkció tesztriportjai

#### 3.2.1. TR-01 (TC-01)
- TP: TP-02
    1. lépés: `tesztelek@gmail` email címet beírtam
    2. lépés: `TesztElek123` jelszót beírtam
    3. lépés: sikeresen beléptem

### 3.3. Hír hozzáadás funkció tesztriportjai

#### 3.3.1. TR-01 (TC-01)
- TP: TP-02
    1. lépés: `Teszt` címet beírtam
    2. lépés: `2001.01.01` dátumot beírtam
    3. lépés: `checked` bepipáltam a Fontos-e checkbox-ot
    4. lépés: `teszt.hu` forrást beírtam
    5. lépés: sikeresen hozzáadtam