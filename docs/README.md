# app_epharmacy
app_epharmacy to aplikacja webowa oparta na Oracle APEX, zaprojektowana do zarządzania operacjami apteki. Implementacja odbywa się w Oracle DB 21c XE za pomocą PL/SQL, a rozwój jest kontynuowany w APEX. Projekt obejmuje model bazy danych w Data SQL Modeler, moduły PL/SQL, dane testowe oraz narzędzia pomocnicze wspierające logikę biznesową aplikacji

# Dokumentacja projektu

Folder zawiera dokumentację techniczną i użytkową projektu `app_epharmacy`.

## Struktura katalogów

- `docs/`: Dokumentacja projektu.
  - `architecture/`: Dokumentacja architektury systemu.
	- `data_model/`: Szczegółowy opis struktury danych, w tym definicje tabel, kolumn, typów danych i kluczy. 
  - `pl_sql_modules/`: Opis modułów PL/SQL.
  - `utilities/`: Opis narzędzi pomocniczych.
  - `deployment/`: Instrukcje dotyczące wdrażania aplikacji.
- `database/`: Przechowuje skrypty, dane testowe oraz moduły PL/SQL, co jest niezbędne do prawidłowego funkcjonowania aplikacji.
  - `schema/`: Zawiera skrypty związane z tworzeniem i konfiguracją schematu bazy danych. 
	- `ddl/`: Podfolder zawierający skrypty DDL (Data Definition Language) do tworzenia obiektów bazy danych. 
  - `pl_sql_modules/`: Zawiera moduły PL/SQL, takie jak pakiety, procedury i funkcje. 
  - `test_data/`: Zawiera skrypty do wypełniania tabel przykładowymi danymi testowymi. 
- `apex/`: Przechowuje komponenty aplikacji.
  - `applications/`: Zawiera skrypty eksportujące definicje aplikacji APEX.  
  - `static_files/`: Zawiera pliki statyczne wykorzystywane w aplikacji.  
  - `plugins/`: Zawiera skrypty definiujące niestandardowe pluginy dla aplikacji APEX.
- `utilities/`: Zawiera skrypty pomocnicze wspierające logikę biznesową aplikacji.

 
  