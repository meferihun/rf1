# Tesztjegyzőkönyv-`Keresés hírek között`

Az alábbi tesztdokumentum a `Hír` projekthez tartozó `8.4.7. Keresés hírek között` funkcióihoz készült. Felelőse: `Megyesi Ferenc` 
 

## 1. Teszteljárások (TP)

### 1.1. Keresési funkció tesztelése
- Azonosító: TP-01
- Tesztesetek: TC-01
- Leírás: Sikeres keresés tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és lépjünk a főoldalra
    1. lépés: A `Kulcsszó` szövegbeviteli mezőbe írjunk be a `legkalapacs` szót
    2. lépés: Nyomjuk meg a `Keresés` gombot 
    3. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Cikk legkalapacs szóval a címben`
	
### 1.2. Keresési funkció tesztelése
- Azonosító: TP-01
- Tesztesetek: TC-02
- Leírás: Üres kulcsszó mező tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és lépjünk a főoldalra
    1. lépés: A `Kulcsszó` szövegbeviteli mezőt hagyjuk üresen
    2. lépés: Nyomjuk meg a `Keresés` gombot 
    3. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Hibaüzenet: Kérjük töltse ki ezt a mezőt.`


## 2. Teszesetek (TC)

### 2.1. Keresés tesztesetei

#### 2.1.1. TC-01
- TP: TP-01
- Leírás: Sikeres keresés tesztelése
- Bemenet: `Kulcsszó` = `legkalapacs`
- Művelet: nyomjuk meg a `Keresés` gombot 
- Elvárt kimenet: Sikeres keresés, a cikk megjelenik

#### 2.1.2. TC-02
- TP: TP-01
- Leírás: Üres kulcsszó mező tesztelése
- Bemenet: Nincs, üresen hagyott kulcsszó mező
- Művelet: nyomjuk meg a `Keresés` gombot 
- Elvárt kimenet: Hibaüzenet: Kérjük töltse ki ezta a mezőt.



## 3. Tesztriportok (TR)

### 3.1. Keresés tesztriportjai

#### 3.1.1. TR-01 (TC-01)
- TP: TP-01
    1. lépés: `legkalapacs` szót beírtam
    2. lépés: a keresés gomb egyszeri megnyomás után sikeresen rákerestem a `legkalapacs` szóra, és megjelent a megfelelő cikk
	
#### 3.1.2. TR-01 (TC-02)
- TP: TP-01
    1. lépés: kulcsszó mezőt üresen hagyom
    2. lépés: a keresés gomb egyszeri megnyomás után megjelenik a következő hibaüzenet: Kérjük töltse ki ezt a mezőt
    

