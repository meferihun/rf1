# Tesztjegyzőkönyv-`Kommentek olvasása, írása, törlése`

Az alábbi tesztdokumentum a `Hír` projekthez tartozó `8.3.5. Bejelentkezett felhasználó jogosultságainak megvalósítása` funkcióihoz készült. Felelőse: `Juhász Márk` 
 

## 1. Teszteljárások (TP)

### 1.1. Adott hírhez tartozó kommentek olvasásának tesztelése
- Azonosító: TP-01
- Tesztesetek: TC-01
- Leírás: Adott hírhez tartozó kommentek olvasása
    0. lépés: Nyissuk meg az alkalmazást
    1. lépés: Nyomjuk meg egy tetszőleges hír melleti felhő gombot
	2. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `EREDMENY`


### 1.2 Új komment hozzáadásának bejelentkezés nélküli tesztelése
- Azonosító: TP-02
- Tesztesetek: TC-01
- Leírás: Új komment hozzáadása bejelentkezés nélkül
    0. lépés: Nyissuk meg az alkalmazást
    1. lépés: Nyomjuk meg egy tetszőleges hír melleti felhő gombot
    2. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `EREDMENY`

	
### 1.3 Új komment hozzáadásának bejelentkezve történő tesztelése
- Azonosító: TP-03
- Tesztesetek: TC-01
- Leírás: Új komment hozzáadása bejelentkezve
    0. lépés: Nyissuk meg az alkalmazást, és jelentkezzünk be
    1. lépés: Nyomjuk meg egy tetszőleges hír melleti felhő gombot
    2. lépés: A Komment feliratú `INPUT1` szövegbeviteli mezőbe írjuk be a kommentünk szövegét
	3. lépés: Nyomjuk meg a `Komment feltöltése` gombot
	4. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `EREDMENY`

	
### 1.4. Komment törlésének bejelentkezés nélküli tesztelése
- Azonosító: TP-04
- Tesztesetek: TC-01
- Leírás: Komment törlése bejelentkezés nélkül
    0. lépés: Nyissuk meg az alkalmazást
    1. lépés: Nyomjuk meg egy tetszőleges hír melleti felhő gombot
	2. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `EREDMENY`


### 1.5. Komment törlésének bejelentkezve admin jogosultság nélkül történő tesztelése
- Azonosító: TP-05
- Tesztesetek: TC-01, TC-02
- Leírás: Bejelentkezés tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és jelentkezzünk be
    1. lépés: Nyomjuk meg egy tetszőleges hír melleti felhő gombot
	2. lépés: Válasszunk ki egy tetszőleges hírt
	3. lépés: Nyomjuk meg a `Törlés` gombot
	4. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `EREDMENY`
 
 
### 1.6. Komment törlésének bejelentkezve admin jogosultsággal történő tesztelése
- Azonosító: TP-06
- Tesztesetek: TC-01
- Leírás: Bejelentkezés tesztelése
    0. lépés: Nyissuk meg az alkalmazást
    1. lépés: Nyomjuk meg egy tetszőleges hír melleti felhő gombot
	2. lépés: Válasszunk ki egy tetszőleges hírt
	3. lépés: Nyomjuk meg a `Törlés` gombot
	4. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `EREDMENY`
   


## 2. Teszesetek (TC)

### 2.1. Adott hírhez tartozó kommentek olvasásának tesztelése

#### 2.1.1. TC-01
- TP: TP-01
- Leírás: Adott hírhez tartozó kommentek olvasása
- Elvárt kimenet: Megjelenik a hírhez tartozó kommentek listája


### 2.2 Új komment hozzáadásának bejelentkezés nélküli tesztelése

#### 2.2.1. TC-01
- TP: TP-01
- Leírás: Új komment hozzáadásának bejelentkezés nélküli tesztelése
- Elvárt kimenet: A komment hozzáadása felület nem jelenik meg

	
### 2.3 Új komment hozzáadásának bejelentkezve történő tesztelése

#### 2.3.1. TC-01
- TP: TP-01
- Leírás: Új komment hozzáadásának bejelentkezve történő tesztelése
- `INPUT1`="Szép volt!"
- Elvárt kimenet: A listában megjelenik a "Szép volt!" szövegű kommentünk

	
### 2.4. Komment törlésének bejelentkezés nélküli tesztelése

#### 2.4.1. TC-01
- TP: TP-01
- Leírás: Komment törlésének bejelentkezés nélküli tesztelése
- Elvárt kimenet: A törlés gomb nem jelenik meg a hírek mellett


### 2.5. Komment törlésének bejelentkezve admin jogosultság nélkül történő tesztelése

#### 2.5.1. TC-01
- TP: TP-01
- Leírás: Komment törlésének bejelentkezve admin jogosultság nélkül történő tesztelése (saját komment törlése)
- Elvárt kimenet: A komment törlődik a listából
	
#### 2.5.2. TC-02
- TP: TP-01
- Leírás: Komment törlésének bejelentkezve admin jogosultság nélkül történő tesztelése (más kommentjének törlése)
- Elvárt kimenet: A törlés gomb nem jelenik meg a hír mellett
 
 
### 2.6. Komment törlésének bejelentkezve admin jogosultsággal történő tesztelése

#### 2.6.1. TC-01
- TP: TP-01
- Leírás: Komment törlésének bejelentkezve admin jogosultsággal történő tesztelése
- Elvárt kimenet: A komment törlődik a listából


	
## 3. Tesztriportok (TR)

### 3.1. Adott hírhez tartozó kommentek olvasásának tesztriportja

#### TR-01 (TC-01)
- TP: TP-01
	0. lépés: Az alkalmazást megnyitottam
    1. lépés: Megnyomtam az egyik hír melletti felhő gombot
	2. lépés: Helyes eredményt kaptam (Megjelent a hírhez tartozó kommentek listája)

	
### 3.2. Új komment hozzáadásának bejelentkezés nélküli tesztriportja

#### TR-01 (TC-01)
- TP: TP-02
	0. lépés: Az alkalmazást megnyitottam
    1. lépés: Megnyomtam az egyik hír melletti felhő gombot
    2. lépés: Helyes eredményt kaptam (A komment hozzáadása felület nem jelent meg)

	
### 3.3. Új komment hozzáadásának bejelentkezve történő tesztriportja

#### TR-01 (TC-01)
- TP: TP-03
	0. lépés: Az alkalmazást megnyitottam
    1. lépés: Megnyomtam az egyik hír melletti felhő gombot
    2. lépés: Beírtam, hogy "Szép volt!"
	3. lépés: Megnyomtam a `Komment feltöltése` gombot
	4. lépés: Helyes eredményt kaptam (A listában megjelent a "Szép volt!" szövegű komment)

	
### 3.4. Komment törlésének bejelentkezés nélküli tesztriportja

#### TR-01 (TC-01)
- TP: TP-04
	0. lépés: Az alkalmazást megnyitottam
    1. lépés: Megnyomtam az egyik hír melletti felhő gombot
	2. lépés: Helyes eredményt kaptam (A törlés gomb nem jelenik meg a hírek mellett)

	
### 3.5. Komment törlésének bejelentkezve admin jogosultság nélkül történő tesztriportja

#### TR-01 (TC-01)
- TP: TP-05
	0. lépés: Az alkalmazást megnyitottam
    1. lépés: Megnyomtam az egyik hír melletti felhő gombot
	2. lépés: Kiválasztottam az egyik saját híremet
	3. lépés: Megnyomtam a `Törlés` gombot
	4. lépés: Helyes eredményt kaptam (A komment törlődött a listából)

#### TR-02 (TC-02)
- TP: TP-05
	0. lépés: Az alkalmazást megnyitottam
    1. lépés: Megnyomtam az egyik hír melletti felhő gombot
	2. lépés: Kiválasztottam egy olyan hírt, ami nem az enyém
	3. lépés: Helyes eredményt kaptam (A törlés gomb nem jelent meg a hír mellett)

	
### 3.6. Komment törlésének bejelentkezve admin jogosultsággal történő tesztriportja

#### TR-01 (TC-01)
- TP: TP-06
	0. lépés: Az alkalmazást megnyitottam
    1. lépés: Megnyomtam az egyik hír melletti felhő gombot
	2. lépés: Kiválasztottam egy hírt
	3. lépés: Megnyomtam a `Törlés` gombot
	4. lépés: Helyes eredményt kaptam (A komment törlődött a listából)