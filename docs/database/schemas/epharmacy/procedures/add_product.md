**Opis procedury:** add\_product

Procedura add\_product służy do dodawania nowych produktów do tabeli products w bazie danych. Wykonuje szereg walidacji przed zapisaniem produktu, aby upewnić się, że dane wprowadzane do systemu są zgodne z określonymi regułami biznesowymi. Procedura sprawdza m.in. istnienie kategorii produktu, poprawność daty ważności, wymagania dotyczące recepty, poprawność ceny oraz unikalność nazwy produktu.

**Kluczowe informacje:**

Transakcyjność:   
Wszystkie działania w tej procedurze są częścią jednej transakcji, która zostaje zatwierdzona (COMMIT) lub wycofana (ROLLBACK) w zależności od sukcesu lub niepowodzenia operacji. Procedura add\_product wykonuje operacje DML (np. INSERT) na podstawowych tabelach, takich jak products, co czyni ją kluczowym elementem transakcji. Procedura logowania (log\_event) działa niezależnie od głównej transakcji, ale jej wywołanie w kontekście add\_product jest częścią przepływu transakcji, czyli to add\_product decyduje, co zostanie zalogowane i jakie działania zostaną wykonane.

Walidacje:   
Procedura sprawdza szereg warunków przed dodaniem produktu:  
Sprawdzenie istnienia kategorii produktu.  
Walidacja, czy kategoria wymaga daty ważności.  
Walidacja, czy kategoria wymaga recepty.  
Walidacja ceny, która musi być większa niż zero.  
Sprawdzenie unikalności nazwy produktu.

Zarządzanie błędami:   
Procedura korzysta z wyjątków, aby wychwycić błędy związane z niewłaściwymi danymi wejściowymi. W przypadku wystąpienia błędu, odpowiedni log jest zapisywany za pomocą procedury log\_event.

Parametry:  
p\_name: Nazwa produktu.  
p\_description: Opis produktu (domyślnie 'Brak opisu').  
p\_exp\_date: Data ważności produktu (domyślnie NULL).  
p\_price: Cena produktu.  
p\_status: Status dostępności produktu (domyślnie 'Available').  
p\_presc: Flaga określająca, czy produkt wymaga recepty (domyślnie 0).  
p\_category\_id: Identyfikator kategorii produktu.

Obsługa błędów:  
Procedura używa zdefiniowanych wyjątków do obsługi błędów związanych z:  
Nieistniejącą kategorią produktu (NO\_DATA\_FOUND).  
Błędami związanymi z datą ważności (dla sprzętu medycznego, który nie wymaga daty ważności, lub dla produktów, które datę ważności muszą mieć).  
Niewłaściwą ceną produktu.  
Problemami z unikalnością nazwy produktu. Wszystkie błędy są logowane za pomocą procedury log\_event, a następnie wyrzucany jest odpowiedni wyjątek (RAISE\_APPLICATION\_ERROR), który informuje użytkownika o problemie.

**Przykład wywołania procedury add\_product:**  
BEGIN  
    add\_product(  
        p\_name         \=\> 'Aspiryna 500mg',  
        p\_description  \=\> 'Lek przeciwbólowy i przeciwzapalny',  
        p\_exp\_date     \=\> TO\_DATE('2026-12-31', 'YYYY-MM-DD'),  
        p\_price        \=\> TO\_NUMBER('444.44', '999999.99'),  
        p\_status       \=\> 'Available',  
        p\_presc        \=\> 1,  
        p\_category\_id  \=\> 1700  
    );  
END;  
/  
Wyjaśnienie:  
p\_name: Nazwa produktu (np. 'Aspiryna 500mg').  
p\_description: Opis produktu (np. 'Lek przeciwbólowy i przeciwzapalny').  
p\_exp\_date: Data ważności (np. 2026-12-31).  
p\_price: Cena produktu (np. 15.99).  
p\_status: Status dostępności produktu (np. 'Available').  
p\_presc: Flaga określająca, czy produkt wymaga recepty (np. 1 oznacza, że wymaga).  
p\_category\_id: Identyfikator kategorii produktu (np. 1700).

