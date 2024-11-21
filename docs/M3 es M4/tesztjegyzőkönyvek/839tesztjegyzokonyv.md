# Tesztjegyzőkönyv-`Hírek kezelése (UD)`

Az alábbi tesztdokumentum a `Hír` projekthez tartozó `8.3.9. Hírek kezelése (UD)` funkcióihoz készült. Felelőse: `Somogyi László`

## 1. Teszteljárások (TP)

### 1.1. Hír módosítása funkció tesztelése
- Azonosító: TP-01
- Tesztesetek: TC-01, TC-02
- Leírás: hír módosítása funkció tesztelése
    0. lépés: Nyissuk meg az alkalmazást, jelentkezzünk be a megfelelő jogkörü fiókunkba, keressünk egy hírt és indítsuk el a szerkesztés funkciót
    1. lépés: Az `UJCIM` szövegbeviteli mezőbe írjunk be az `ERTEK1` szöveget, vagy hagyjuk az eredetit
    2. lépés: A `FONTOSE` checkbox mező értékét állítsuk be `ERTEK2`-re, vagy hagyjuk az eredetit
    3. lépés: Az `FORRAS` szövegbeviteli mezőbe írjunk be az `ERTEK3` szöveget, vagy hagyjuk az eredetit
    4. lépés: Az `FORRASOLDAL` szövegbeviteli mezőbe írjunk be az `ERTEK4` szöveget, vagy hagyjuk az eredetit
    5. lépés: Az `KATERGORIA` legördülő menüből válasszuk ki az `ERTEK5` értéket, vagy hagyjuk az eredetit
    6. lépés: Nyomjuk meg a `SUBMIT` gombot
    7. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `EREDMENY`

### 1.2. Hír törlése funkció tesztelése
- Azonosító: TP-02
- Tesztesetek: TC-01
- Leírás: hír törlése funkció tesztelése
    0. lépés: Nyissuk meg az alkalmazást, jelentkezzünk be a megfelelő jogkörü fiókunkba, keressük meg a választott hírt az admin menüponton belül
    1. lépés: Nyomjuk meg az `TORLES` gombot
    3. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `EREDMENY`

## 2. Teszesetek (TC)

### 2.1. Hír módosítása funkció tesztesetei

#### 2.1.1. TC-01
- TP: TP-01
- Leírás: hír módosítása funkció tesztelése
- Bemenet: `ERTEK1` = `Alonso: Győzni akarok, nem mostanában fogom abbahagyni!`  ; `ERTEK2` = `0`  ;  `ERTEK3` = `https://f1vilag.hu/hirek/alonso-gyozni-akarok-nem-mostanaban-fogom-abbahagyni/`  ;  `ERTEK4` = `F1VILÁG`  ;  `ERTEK5` = `Sport`
- Művelet: nyomjuk meg az `SUBMIT` gombot
- Elvárt kimenet: `EREDMENY` = `HELYES (Adatok módosítva)`
-
#### 2.1.2. TC-02
- TP: TP-01
- Leírás: hír módosítása funkció tesztelése
- Bemenet: `ERTEK1` = `Alonso: Győzni akarok, nem mostanában fogom abbahagyni!` (eredeti) ; `ERTEK2` = `1` (VÁLTOZOTT!)  ;  `ERTEK3` = `https://f1vilag.hu/hirek/alonso-gyozni-akarok-nem-mostanaban-fogom-abbahagyni/` (eredeti) ;  `ERTEK4` = `F1VILÁG` (eredeti) ;  `ERTEK5` = `Sport` (eredeti)
- Művelet: nyomjuk meg az `SUBMIT` gombot
- Elvárt kimenet: `EREDMENY` = `HELYES (Csak az új értékek változtak)`

### 2.2. Hír törlése funkció tesztesetei

#### 2.2.1. TC-01
- TP: TP-02
- Leírás: hír törlése funkció tesztesetei
- Művelet: nyomjuk meg az `TORLES` gombot
- Elvárt kimenet: `EREDMENY` = `HELYES (Hír sikeresen törölve lett)`

## 3. Tesztriportok (TR)

### 3.1. Hír módosítása funkció tesztriportjai

#### 3.1.1. TR-01 (TC-01)
- TP: TP-01
  1. lépés: `Alonso: Győzni akarok, nem mostanában fogom abbahagyni!`-t beírtam
  2. lépés: `Jelölőnégyzetet beállítottam üresre`
  3. lépés: `https://f1vilag.hu/hirek/alonso-gyozni-akarok-nem-mostanaban-fogom-abbahagyni/` -t beírtam
  4. lépés: `F1VILÁG`-t beírtam
  5. lépés: `Sport`-ot kiválasztottam a legördülő menüből
  6. lépés: a gomb egyszeri megnyomás után inaktív lett
  7. lépés: helyes eredményt kaptam (Adatok módosítva lettek)


#### 3.1.2. TR-02 (TC-02)
- TP: TP-01
  1. lépés: `UJCIM` szövegbeviteli mezőt eredeti értéken hagytam
  2. lépés: `Jelölőnégyzetet beállítottam igaz értékre`
  3. lépés: `FORRAS` szövegbeviteli mezőt eredeti értéken hagytam
  4. lépés: `FORRASOLDAL` szövegbeviteli mezőt eredeti értéken hagytam
  5. lépés: `KATERGORIA` legördülő menüt az eredetin hagytam
  6. lépés: a gomb egyszeri megnyomás után inaktív lett
  7. lépés: helyes eredményt kaptam (Az újonnan beírt adatok módosultak)

### 3.2. Hír törlése funkció tesztriportjai

#### 3.2.1. TR-01 (TC-01)
- TP: TP-02
  1. lépés: a gomb egyszeri megnyomás után inaktív lett
  2. lépés: helyes eredményt kaptam (A hír törlődött)
