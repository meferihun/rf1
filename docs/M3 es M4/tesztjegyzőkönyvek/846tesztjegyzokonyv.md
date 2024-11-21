# Tesztjegyzőkönyv-`Email-es értesítés`

Az alábbi tesztdokumentum a `Hír` projekthez tartozó `8.4.6. Email-es értesítés tesztelése funkcióhoz készült.` Felelőse: `Bialkó Ádám Csaba`

## 1. Teszteljárások (TP)

### 1.1. Email-es értesítés regisztrációkor funkció tesztelése 
- Azonosító: TP-01
- Tesztesetek: TC-01, TC-02
- Leírás: Email-es értesítés regisztrációkor funkció tesztelése 
    0. lépés: Nyissuk meg az alkalmazást, és indítsuk el a regisztráció funkciót
    1. lépés: Az `INPUT1` mezőbe írjuk be az `FELHASZNALONEV` szöveget
    2. lépés: Az `INPUT2` mezőbe írjuk be az `EMAIL` e-mail címet
    3. lépés: Az `INPUT3` mezőbe írjuk be az `JELSZO` szöveget
    4. lépés: Az `INPUT5` mezőbe írjuk be az `JELSZOUJRA` szöveget
    5. lépés: Az `INPUT6` mezőbe írjuk be az `SZULDATUM` dátumot
    6. lépés: Az `INPUT7` lenyíló menüből válasszuk ki a `JOGOSULTSAG` jogosultságot
    7. lépés: Nyomjuk meg a `REGISZTRACIO` gombot 
    8. lépés: Ellenőrizzük az eredményt az e-mailes értesítéssel kapcsolatban. Elvárt eredmény: `EREDMENY`

### 1.2. Email-es értesítés fiók törlésekor funkció tesztelése 
- Azonosító: TP-02
- Tesztesetek: TC-02
- Leírás: Email-es értesítés fiók törlésekor funkció tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és indítsuk el a bejelentkezés funkciót
    1. lépés: Az `INPUT1` mezőbe írjuk be az `EMAIL` e-mail címet
    2. lépés: Az `INPUT2` mezőbe írjuk be a `JELSZO` szöveget
    3. lépés: Nyomjuk meg a `BEJELENTKEZES` gombot 
    4. lépés: Navigáljunk a Profil oldalra
    5. lépés: Nyomjuk meg a `FIOK TORLESE` gombot
    6. lépés: Ellenőrizzük az eredményt az e-mailes értesítéssel kapcsolatban. Elvárt eredmény: `EREDMENY`

## 2. Teszesetek (TC)

### 2.1. Email-es értesítés regisztrációkor funkció tesztelése 

#### 2.1.1. TC-01
- TP: TP-01
- Leírás: Email-es értesítés regisztrációkor funkció tesztelése 
- Bemenet: `FELHASZNALONEV` = jani81; `EMAIL` = jani@gmail.com ; `JELSZO` = Janos1981 ;  `JELSZOUJRA` = Janos1981 ; `SZULDATUM` = 1981-05-01; `JOGOSULTSAG` = Felhasználó 
- Művelet: nyomjuk meg a `REGISZTRACIO` gombot 
- Elvárt kimenet: az eredmény mező tartalma: `EREDMENY` = Sikeres regisztráció! (e-mailes értesítés megérkezett a megadott e-mail címre)

#### 2.1.2. TC-02
- TP: TP-01
- Leírás: Email-es értesítés regisztrációkor funkció tesztelése 
- Bemenet: `FELHASZNALONEV` = gizi92; `EMAIL` = gizi@gmail.com ; `JELSZO` = Gizi1992 ;  `JELSZOUJRA` = Gizi1929 ; `SZULDATUM` = 1992-09-18; `JOGOSULTSAG` = Felhasználó 
- Művelet: nyomjuk meg a `REGISZTRACIO` gombot 
- Elvárt kimenet: az eredmény mező tartalma: `EREDMENY` = Sikertelen regisztráció (e-mailes értesítés nem lett kiküldve)

#### 2.1.3. TC-03
- TP: TP-02
- Leírás: Email-es értesítés fiók törlésekor funkció tesztelése 
- Bemenet: `EMAIL` = jani@gmail.com ; `JELSZO` = Janos1981; Bejelentkezés; Profil oldalra navigálás
- Művelet: nyomjuk meg a `FIOK TORLESE` gombot 
- Elvárt kimenet: az eredmény mező tartalma: `EREDMENY` = Sikeres törlés! (e-mailes értesítés megérkezett a törölt fiók e-mail címére)

## 3. Tesztriportok (TR)

### 3.1. Email-es értesítés regisztrációkor funkció tesztriportjai

#### 3.1.1. TR-01 (TC-01)
- TP: TP-01
    1. lépés: `jani81` szöveget beírtam az `FELHASZNALONEV` mezőbe
    2. lépés: `jani@gmail.com` szöveget beírtam a `EMAIL` mezőbe
    2. lépés: `Janos1981` szöveget beírtam a `JELSZO` mezőbe
    2. lépés: `Janos1981` szöveget beírtam a `JELSZOUJRA` mezőbe
    2. lépés: `1981-05-01` dátumot beírtam a `SZULDATUM` mezőbe
    2. lépés: `Felhasznalo` szöveget kiválasztottam a `JOGOSULTSAG` mezőben
    3. lépés: a gomb egyszeri megnyomás után inaktív lett
    4. lépés: helyes eredményt kaptam (SIKERES REGISZTRÁCIÓ) - email-es értesítés megérkezett

#### 3.1.2. TR-02 (TC-02)
- TP: TP-01
    1. lépés: `gizi92` szöveget beírtam az `FELHASZNALONEV` mezőbe
    2. lépés: `gizi@gmail.com` szöveget beírtam a `EMAIL` mezőbe
    2. lépés: `Gizi1992` szöveget beírtam a `JELSZO` mezőbe
    2. lépés: `Gizi1929` szöveget beírtam a `JELSZOUJRA` mezőbe
    2. lépés: `1992-09-18` dátumot beírtam a `SZULDATUM` mezőbe
    2. lépés: `Felhasznalo` szöveget kiválasztottam a `JOGOSULTSAG` mezőben
    3. lépés: a gomb egyszeri megnyomás után inaktív lett
    4. lépés: helyes eredményt kaptam (SIKERTELEN REGISZTRÁCIÓ) - email-es értesítés ennek megfelelően nem érkezett

### 3.2. Email-es értesítés fiók törlésekor funkció tesztriportjai

#### 3.2.1. TR-01 (TC-01)
- TP: TP-02
    1. lépés: `jani@gmail.com` szöveget beírtam az `EMAIL` mezőbe
    2. lépés: `Janos1981` szöveget beírtam a `JELSZO` mezőbe
    3. lépés: a gomb egyszeri megnyomás után inaktív lett
    4. lépés: sikeresen bejelentkeztem, elnavigáltam a Profil oldalra.
    5. lépés: a fiók törlése gomb egyszeri megnyomás után inaktív lett
    6. lépés: helyes eredményt kaptam (SIKERES TÖRLÉS) - email-es értesítés megérkezett
