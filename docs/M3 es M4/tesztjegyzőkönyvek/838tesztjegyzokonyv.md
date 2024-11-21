# Tesztjegyzőkönyv-`Hír kezelése`

Az alábbi tesztdokumentum a `Hír` projekthez tartozó `8.3.8. Hír kezelése` funkcióihoz készült. Felelőse: `Somogyi László` 
 

## 1. Teszteljárások (TP)

### 1.1. Hír hozzáadása tesztelése
- Azonosító: TP-01
- Tesztesetek: TC-01
- Leírás: Hír hozzáadás tesztelése
    0. lépés: Nyissuk meg az alkalmazást, és írjuk be a megfelelő adatokat
    1. lépés: A `Cím` szövegbeviteli mezőbe írjunk be a `Teszt` címet
    2. lépés: A `Közzétevés dátuma` szövegbeviteli mezőbe írjunk be a `2001.01.01` dátumot
    3. lépés: A `Fontos-e` mezőt pipáljuk be
    4. lépés: A `Forrás` szövegbeviteli mezőbe írjunk be a `teszt.hu` dátumot
    5. lépés: Nyomjuk meg a `Submit` gombot 
    6. lépés: Ellenőrizzük az eredményt. Elvárt eredmény: `Sikeres hozzáadás!`

## 2. Teszesetek (TC)

### 2.1. Hír hozzáadás tesztesete

#### 2.1.1. TC-01
- TP: TP-01
- Leírás: Hír hozzáadás tesztelése
- Bemenet: `Cím` = `Teszt` ; `Közzétevés dátuma` = `2001.01.01` ; `Fontos-e` = `checked` ; `Forrás` = `teszt.hu`
- Művelet: nyomjuk meg az `Submit` gombot 
- Elvárt kimenet: Sikeres hozzáadás

## 3. Tesztriportok (TR)

### 3.1. Hír hozzáadás funkció tesztriportjai

#### 3.1.1. TR-01 (TC-01)
- TP: TP-01
    1. lépés: `Teszt` címet beírtam
    2. lépés: `2001.01.01` dátumot beírtam
    3. lépés: `checked` bepipáltam a Fontos-e checkbox-ot
    4. lépés: `teszt.hu` forrást beírtam
    5. lépés: sikeresen hozzáadtam
