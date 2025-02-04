**Opis procedury, procedura logowania jako autonomiczna**: log\_event  
Procedura log\_event służy do rejestrowania zdarzeń w tabeli system\_logs. Przyjmuje pięć parametrów wejściowych, z których trzy są opcjonalne (użytkownik, produkt i zamówienie). Procedura zapisuje zdarzenia w tabeli logów, w tym typ logu, szczegóły zdarzenia oraz powiązane identyfikatory (użytkownika, produktu, zamówienia). Kolumna log\_id w tabeli jest generowana automatycznie jako klucz główny, co zapewnia unikalność każdego rekordu.

**Kluczowe informacje:**  
Kolumna log\_id: Jest generowana automatycznie i stanowi klucz główny w tabeli system\_logs.  
Transakcyjność:   
Procedura log\_event została oznaczona jako autonomiczna transakcja za pomocą dyrektywy PRAGMA AUTONOMOUS\_TRANSACTION. Oznacza to, że każda operacja DML wykonywana w procedurze log\_event jest realizowana w odrębnym kontekście transakcyjnym i wymaga jawnego zatwierdzenia (COMMIT).  Procedura log\_event musi być niezależna od głównej transakcji, ponieważ logowanie zdarzenia nie powinno wpływać na powodzenie lub niepowodzenie operacji w transakcji głównej

Wyzwalacze: Procedura jest również wywoływana przez wyzwalacze w innych miejscach systemu, co umożliwia automatyczne rejestrowanie zdarzeń w odpowiedzi na różne akcje w aplikacji.

**Parametry**:  
p\_log\_type: Typ logu (np. informacja, błąd).  
p\_log\_details: Szczegóły dotyczące zdarzenia.  
p\_user\_id: Identyfikator użytkownika (opcjonalnie).  
p\_product\_id: Identyfikator produktu (opcjonalnie).  
p\_order\_id: Identyfikator zamówienia (opcjonalnie).

**Obsługa błędów:**  
W przypadku wystąpienia błędu, procedura przekazuje wyjątek dalej (z wykorzystaniem klauzuli RAISE), zapewniając, że potencjalne problemy w zapisie logów będą odpowiednio obsługiwane na wyższym poziomie aplikacji.

**Przykład wywołania procedury log\_event:**

BEGIN  
    log\_event(  
        p\_log\_type    \=\> 'INFO',  
        p\_log\_details \=\> 'Zdarzenie logowania użytkownika.',  
        p\_user\_id     \=\> 123,  
        p\_product\_id  \=\> NULL,  
        p\_order\_id    \=\> NULL  
    );  
END;  
/

**Wyjaśnienie**:  
p\_log\_type: Typ logu – w tym przypadku 'INFO' oznacza, że jest to informacyjne zdarzenie.  
p\_log\_details: Szczegóły zdarzenia – opisuje, co się wydarzyło, np. "Zdarzenie logowania użytkownika".  
p\_user\_id: Identyfikator użytkownika, który wykonał akcję (np. 123).  
p\_product\_id oraz p\_order\_id: Te parametry są opcjonalne, więc w tym przykładzie są ustawione na NULL.