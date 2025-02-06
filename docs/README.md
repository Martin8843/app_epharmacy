
# ?? Projekt w trakcie rozwoju ??
Ten projekt jest nadal w fazie rozwoju. Projekt rozwijany w ramach nauki APEX i baz danych Oracle XE. Powstają nowe funkcjonalności oraz pakiety pl/sql. Rozpoczęta integracja z APEX.

# app_epharmacy
Aplikacja bazodanowa stworzona w Oracle APEX, umo?liwiaj?ca zarz?dzanie produktami aptecznymi, zam?wieniami oraz danymi u?ytkownik?w.
Obejmuje model bazy danych w Data SQL Modeler, modu?y PL/SQL, dane testowe oraz narz?dzia pomocnicze wspieraj?ce logik? biznesow? aplikacji

# Dokumentacja projektu

Folder zawiera okumentacj? techniczn? i u?ytkow? projektu `app_epharmacy`.

## Struktura katalog?w

- `docs/`: Dokumentacja projektu.
  - `architecture/`: Dokumentacja architektury systemu, przechowuje m.in. diagram relacji encji.
	- `data_model/`: Szczeg??owy opis struktury danych, w tym definicje tabel, kolumn, typ?w danych i kluczy. 
  - `database/schemas/epharmacy/`: Dokumentacja bazy danych(schematy, opis tabel, funkcji, procedur sk?adowanych).  
  	- `constraints/`: Opis ogranicze? w bazie danych, kt?re zapewniaj? integralno?? i sp?jno??. 
  	- `functions/`: Dokumentacja funkcji (zastosowanie, zwracane warto?ci) 
  	- `indexes/`: Opisy indeks?w i ich wp?ywu na wydajno??. 
  	- `packages/`: Opisy pakiet?w PL/SQL (zawarto??, interfejsy). 
  	- `procedures/`: Opisy procedur (parametry, dzia?anie). 
  	- `sequences/`: Opis sekwencji (je?eli istniej?) 
  	- `tables/`:  Opisy tabel (struktura, kolumny, zale?no?ci).  
  	- `triggers/`: Dokumentacja trigger?w (kiedy i dlaczego s? u?ywane). 
  	- `views/`: Opisy widok?w i ich zastosowania. 
  - `deployment_apex/`: Instrukcje dotycz?ce wdra?ania aplikacji (m.in. integracja z Oracle APEX ??ORDS).
- `database/schemas/epharmacy/`: Przechowuje skrypty, dane testowe oraz modu?y PL/SQL, co jest niezb?dne do prawid?owego funkcjonowania aplikacji.
  	- `constraints/`: Skrypty dla kluczy obcych i ogranicze?. 
  	- `functions/`: Funkcje PL/SQL (CREATE FUNCTION). 
  	- `indexes/`: Skrypty dla indeks?w (CREATE INDEX). 
  	-  (...)    : Skrypty dla pozosta?ych obiekt?w bazy danych.
  - `test_data/`: Zawiera skrypty do wype?niania tabel przyk?adowymi danymi testowymi.
  - `utilities/`: Zawiera skrypty pomocnicze wspieraj?ce dzia?anie bazy danych (obs?uga log?w, funkcje szyfrowania) .  
- `apex/`: Przechowuje komponenty aplikacji.
  - `applications/`: Zawiera skrypty eksportuj?ce definicje aplikacji APEX.  
  - `static_files/`: Zawiera pliki statyczne wykorzystywane w aplikacji.  
  - `plugins/`: Zawiera skrypty definiuj?ce niestandardowe pluginy dla aplikacji APEX.
