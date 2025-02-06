
# 馃毀 Projekt w trakcie rozwoju 馃毀
Ten projekt jest nadal w fazie rozwoju. Projekt rozwijany w ramach nauki APEX i baz danych Oracle XE. Powstaj膮 nowe funkcjonalno艣ci oraz pakiety pl/sql. Rozpocz臋ta integracja z APEX.
=======
# 🚧 Projekt w trakcie rozwoju 🚧
Ten projekt jest nadal w fazie rozwoju. Projekt rozwijany w ramach nauki APEX i baz danych Oracle XE. Powstają nowe funkcjonalności oraz pakiety pl/sql. Rozpoczęta integracja z APEX.xxx
>>>>>>> 8092fe3655c98ff85114a578b4b63b4836a39239

# app_epharmacy
Aplikacja bazodanowa stworzona w Oracle APEX, umo偶liwiaj膮ca zarz膮dzanie produktami aptecznymi, zam贸wieniami oraz danymi u偶ytkownik贸w.
Obejmuje model bazy danych w Data SQL Modeler, modu艂y PL/SQL, dane testowe oraz narz臋dzia pomocnicze wspieraj膮ce logik臋 biznesow膮 aplikacji

# Dokumentacja projektu

Folder zawiera dokumentacj臋 techniczn膮 i u偶ytkow膮 projektu `app_epharmacy`.

## Struktura katalog贸w

- `docs/`: Dokumentacja projektu.
  - `architecture/`: Dokumentacja architektury systemu, przechowuje m.in. diagram relacji encji.
	- `data_model/`: Szczeg贸艂owy opis struktury danych, w tym definicje tabel, kolumn, typ贸w danych i kluczy. 
  - `database/schemas/epharmacy/`: Dokumentacja bazy danych(schematy, opis tabel, funkcji, procedur sk艂adowanych).  
  	- `constraints/`: Opis ogranicze艅 w bazie danych, kt贸re zapewniaj膮 integralno艣膰 i sp贸jno艣膰. 
  	- `functions/`: Dokumentacja funkcji (zastosowanie, zwracane warto艣ci) 
  	- `indexes/`: Opisy indeks贸w i ich wp艂ywu na wydajno艣膰. 
  	- `packages/`: Opisy pakiet贸w PL/SQL (zawarto艣膰, interfejsy). 
  	- `procedures/`: Opisy procedur (parametry, dzia艂anie). 
  	- `sequences/`: Opis sekwencji (je偶eli istniej膮) 
  	- `tables/`:  Opisy tabel (struktura, kolumny, zale偶no艣ci).  
  	- `triggers/`: Dokumentacja trigger贸w (kiedy i dlaczego s膮 u偶ywane). 
  	- `views/`: Opisy widok贸w i ich zastosowania. 
  - `deployment_apex/`: Instrukcje dotycz膮ce wdra偶ania aplikacji (m.in. integracja z Oracle APEX 鈥?ORDS).
- `database/schemas/epharmacy/`: Przechowuje skrypty, dane testowe oraz modu艂y PL/SQL, co jest niezb臋dne do prawid艂owego funkcjonowania aplikacji.
  	- `constraints/`: Skrypty dla kluczy obcych i ogranicze艅. 
  	- `functions/`: Funkcje PL/SQL (CREATE FUNCTION). 
  	- `indexes/`: Skrypty dla indeks贸w (CREATE INDEX). 
  	-  (...)    : Skrypty dla pozosta艂ych obiekt贸w bazy danych.
  - `test_data/`: Zawiera skrypty do wype艂niania tabel przyk艂adowymi danymi testowymi.
  - `utilities/`: Zawiera skrypty pomocnicze wspieraj膮ce dzia艂anie bazy danych (obs艂uga log贸w, funkcje szyfrowania) .  
- `apex/`: Przechowuje komponenty aplikacji.
  - `applications/`: Zawiera skrypty eksportuj膮ce definicje aplikacji APEX.  
  - `static_files/`: Zawiera pliki statyczne wykorzystywane w aplikacji.  
  - `plugins/`: Zawiera skrypty definiuj膮ce niestandardowe pluginy dla aplikacji APEX.

 
  
>>>>>>> 4b40ff84b206f60afc0a9085ce81833d59ac2efa
