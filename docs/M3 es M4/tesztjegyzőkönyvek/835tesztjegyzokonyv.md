# Tesztjegyzőkönyv-`Bejelentkezett felhasználó jogosultságainak megvalósítása`

Az alábbi tesztdokumentum a `Hír` projekthez tartozó `8.3.5. Bejelentkezett felhasználó jogosultságainak megvalósítása` funkcióihoz készült. Felelőse: `György József` 
 

## 1. Teszteljárások (TP)

### 1.1. Profil funkció tesztelése 
- Azonosító: TP-01
- Tesztesetek: TC-01
- Leírás: Profil oldal megnyitása 
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
  1. lépés: Nyomjuk meg a `Bejelentkezés` gombot 
  2. lépés: Nyomjuk meg a `Profil` gombot
  2. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Megjelenik a profil oldal`

### 1.2. Helyes adatok a profilon funkció tesztelése
- Azonosító: TP-02
- Tesztesetek: TC-02
- Leírás: Helyes adatok a profilon
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
    1. lépés: Nyomjuk meg a `Bejelentkezés` gombot
    2. lépés: Nyomjuk meg a `Profil` gombot
    2. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Megjelenik a profil oldal a felhasználónak megfelelő adatokat kiírva`
	
### 1.3. Profil adatok megváltoztatása funkció tesztelése
- Azonosító: TP-03
- Tesztesetek: TC-03
- Leírás: Profil adatok megváltoztatása
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
    1. lépés: Nyomjuk meg a `Bejelentkezés` gombot
    2. lépés: Nyomjuk meg a `Profil` gombot
  3. lépés: A `Név` szövegbeviteli mezőbe írjuk be a `GamerPisti2009` nevet
  4. lépés: A `Születési dátum` dátum mezőbe írjuk be a `2009.01.01` dátumot
  5. lépés: Nyomjuk meg a `Módosítás` gombot
  6. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Sikeres módosítás!`	

### 1.4. Hírlevélre feliratkozás tesztelése
- Azonosító: TP-04
- Tesztesetek: TC-04
- Leírás: Hírlevélre feliratkozás
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
    1. lépés: Nyomjuk meg a `Bejelentkezés` gombot
    2. lépés: Nyomjuk meg a `Profil` gombot	
  3. lépés: Nyomjuk meg a `Belfold` és a `Tech` négyzeteket
  4. lépés: Nyomjuk meg a `Főoldal` gombot
  5. lépés: Nyomjuk meg a `Profil` gombot
  6. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: a `Belfold` és a `Tech` négyzetek pipálva vannak


## 2. Tesztesetek (TC)

### 2.1. Profil funkció tesztelése

#### 2.1.1. TC-01
- TP: TP-01
- Leírás: Sikeres profil funkció tesztelése
- Bemenet: `Felhasználónév` = `TesztElek` ; `E-Mail` = `tesztelek@gmail.com` ; `Jelszó` = `TesztElek123` ; `Jelszó újra` = `TesztElek123` ; `Születési dátum` = `2000-01-01`
- Művelet: nyomjuk meg a `Regisztráció` gombot
- Művelet: nyomjuk meg a `Bejelentkezés` gombot
- Művelet: nyomjuk meg a `Profil` gombot
- Elvárt kimenet: Megjelenik a `Profil` oldal


### 2.2. Helyes adatok a profilon  funkció tesztesete

#### 2.2.1. TC-01
- TP: TP-02
- Leírás: Helyes adatok a profilon  funkció tesztelése
- Bemenet: `Felhasználónév` = `TesztElek` ; `E-Mail` = `tesztelek@gmail.com` ; `Jelszó` = `TesztElek123` ; `Jelszó újra` = `TesztElek123` ; `Születési dátum` = `2000-01-01`
- Művelet: nyomjuk meg az `Bejelentkezés` gombot
- Művelet: nyomjuk meg a `Profil` gombot
- Elvárt kimenet: `Név` = `TesztElek` ; `Születési dátum` = `2000-01-01`

### 2.3. Profil adatok megváltoztatása funkció tesztesete

#### 2.3.1. TC-01
- TP: TP-02
- Leírás: Profil adatok megváltoztatása funkció tesztelése
- Bemenet: `Név` = `TesztElek` ; `E-Mail` = `tesztelek@gmail.com` ; `Jelszó` = `TesztElek123`
- Művelet: nyomjuk meg az `Bejelentkezés` gombot
- Művelet: nyomjuk meg a `Profil` gombot
- Bemenet: `Név` = `Elek Robi` ; `Születési dátum` = `2020.10.0`
- Művelet: nyomjuk meg a `Módosítás` gombot
- Művelet: nyomjuk meg a `Főoldal` gombot
- Művelet: nyomjuk meg a `Profil` gombot
- Elvárt kimenet: `Név` = `Elek Robi` ; `Születési dátum` = `2020.10.0`

### 2.4. Hírlevélre feliratkozás tesztesete

#### 2.4.1. TC-01
- TP: TP-03
- Leírás: Hírlevélre feliratkozás tesztelése
- Bemenet: `Név` = `TesztElek` ; `E-Mail` = `tesztelek@gmail.com` ; `Jelszó` = `TesztElek123`
- Művelet: nyomjuk meg az `Bejelentkezés` gombot
- Művelet: nyomjuk meg a `Profil` gombot
- Bemenet: `Külföld` = `checked` ; `Autó` = `checked`
- Művelet: nyomjuk meg a `Módosítás` gombot
- Művelet: nyomjuk meg a `Főoldal` gombot
- Művelet: nyomjuk meg a `Profil` gombot 
- Elvárt kimenet: `Külföld` = `checked` ; `Autó` = `checked`

