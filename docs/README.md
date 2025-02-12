# 🚧 Projekt w trakcie rozwoju 🚧
# 🚧 STATUS --> w trakcie udostępniania API przez ORDS🚧
Ten projekt jest nadal w fazie rozwoju. Projekt rozwijany w ramach nauki APEX i baz danych Oracle XE. Powstają nowe funkcjonalności oraz pakiety pl/sql. Rozpoczęta integracja z APEX.

# E-Pharmacy
Aplikacja bazodanowa umożliwiająca zarządzanie produktami aptecznymi, zamówieniami oraz danymi użytkowników.
Obejmuje model bazy danych w Data SQL Modeler, moduły PL/SQL, dane testowe oraz narzędzia pomocnicze wspierające logikę biznesową aplikacji

# Technologie/narzędzia
W projekcie wykorzystane zostały:

- Oracle Database Express Edition 21c – serwer bazy danych, idealny dla małych i średnich projektów, darmowy i wydajny.
- SQL Developer – narzędzie do tworzenia obiektów w bazie danych Oracle (tabele, procedury, funkcje).
- SQL Data Modeler – narzędzie do projektowania bazy danych, od modelu logicznego po fizyczny (generowanie DDL).
- Postman - narzędzie do testowania i wysyłania zapytań HTTP do API. Postman łączy się tylko z API (np. REST API udostępnionym przez ORDS). 
- Notepad++ – edytor tekstowy do skryptów SQL, procedur i plików konfiguracyjnych.
- Git i Git Bash – używane do zarządzania projektem i synchronizacji zmian z repozytorium GitHub.
- Oracle APEX (wersja Web) - platforma do tworzenia aplikacji webowych opartych na bazie danych Oracle
	- Oracle REST Data Services (ORDS) – serwer, który wystawia API, narzędzie do integracji bazy danych Oracle z aplikacjami webowymi
   

# Dokumentacja projektu

Folder zawiera dokumentację techniczną i użytkową projektu: `app_epharmacy`.

## Struktura katalogów

- `docs/`: Dokumentacja projektu.
  - `architecture/`: Dokumentacja architektury systemu, przechowuje m.in. diagram relacji encji.
	- `data_model/`: Szczegółowy opis struktury danych, w tym definicje tabel, kolumn, typów danych i kluczy. 
  - `database/schemas/epharmacy/`: Dokumentacja bazy danych(schematy, opis tabel, funkcji, procedur składowanych).  
  	- `constraints/`: Opis ograniczeń w bazie danych, które zapewniają integralność i spójność. 
  	- `functions/`: Dokumentacja funkcji (zastosowanie, zwracane wartości) 
  	- `indexes/`: Opisy indeksów i ich wpływu na wydajność. 
  	- `packages/`: Opisy pakietów PL/SQL (zawartość, interfejsy). 
  	- `procedures/`: Opisy procedur (parametry, działanie). 
  	- `sequences/`: Opis sekwencji (jeżeli istnieją) 
  	- `tables/`:  Opisy tabel (struktura, kolumny, zależności).  
  	- `triggers/`: Dokumentacja triggerów (kiedy i dlaczego są używane). 
  	- `views/`: Opisy widoków i ich zastosowania. 
  - `deployment_apex/`: Instrukcje dotyczące wdrażania aplikacji (m.in. integracja z Oracle APEX ORDS).
  - `other_docs`: inna dokumentacja np. instrukcja pracy w Git.  
- `database/schemas/epharmacy/`: Przechowuje skrypty, dane testowe oraz moduły PL/SQL, co jest niezbędne do prawidłowego funkcjonowania aplikacji.
  	- `constraints/`: Skrypty dla kluczy obcych i ograniczeń. 
  	- `functions/`: Funkcje PL/SQL (CREATE FUNCTION). 
  	- `indexes/`: Skrypty dla indeksów (CREATE INDEX). 
  	-  (...)    : Skrypty dla pozostałych obiektów bazy danych.
  - `test_data/`: Zawiera skrypty do wypełniania tabel przykładowymi danymi testowymi.
  - `utilities/`: Zawiera skrypty pomocnicze wspierające działanie bazy danych (obsługa logów, funkcje szyfrowania) .  
- `apex/`: Przechowuje komponenty aplikacji.
  - `applications/`: Zawiera skrypty eksportujące definicje aplikacji APEX.  
  - `static_files/`: Zawiera pliki statyczne wykorzystywane w aplikacji.  
  - `plugins/`: Zawiera skrypty definiujące niestandardowe pluginy dla aplikacji APEX.
