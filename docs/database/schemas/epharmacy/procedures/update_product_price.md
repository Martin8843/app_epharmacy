Opis procedury: **update\_product\_price**

Procedura update\_product\_price została zaprojektowana do masowej aktualizacji cen produktów w bazie danych aplikacji apteki internetowej.    W celu zapewnienia optymalnej wydajności oraz elastyczności, zastosowano w niej tablice zagnieżdżone (nested tables), które umożliwiają dynamiczne przekazywanie wartości w postaci kolekcji. Dzięki temu rozwiązaniu możliwe jest jednoczesne aktualizowanie cen wielu produktów, co znacząco usprawnia operacje na bazie danych.

**Zastosowanie tablic zagnieżdżonych**

Tablice zagnieżdżone (product\_id\_nt, price\_nt) zostały wykorzystane do przechowywania identyfikatorów produktów oraz ich nowych cen. Wybór tego typu kolekcji wynika z potrzeby dynamicznego przekazywania wielu wartości jednocześnie, co sprawia, że procedura jest bardziej elastyczna w kontekście liczby aktualizowanych rekordów. Tablice zagnieżdżone w przeciwieństwie do VARRAY nie mają ograniczonego rozmiaru i mogą być wypełniane dynamicznie, co sprawia, że idealnie nadają się do przetwarzania zestawów danych o zmiennej długości.

**Walidacja danych**

Procedura zawiera szereg mechanizmów walidacyjnych, które zapewniają poprawność przetwarzanych danych:

1. Sprawdzenie, czy product\_id nie zaczyna się od '0', co mogłoby wskazywać na błędnie wprowadzone wartości.  
2. Porównanie rozmiaru obu tablic wejściowych, aby uniknąć sytuacji, w której liczba identyfikatorów produktów nie odpowiada liczbie nowych cen.  
3. Walidacja wartości cen, aby upewnić się, że żadna z przekazywanych cen nie jest ujemna.  
4. Sprawdzenie istnienia produktów w bazie, co zapobiega próbom aktualizacji nieistniejących rekordów.  
5. Logowanie błędów w przypadku, gdy którekolwiek z przekazanych ID nie istnieje w bazie.

**Zastosowanie mechanizmów optymalizacyjnych**

Procedura została zoptymalizowana pod kątem wydajności poprzez zastosowanie mechanizmu FORALL, który pozwala na masowe wykonywanie operacji DML. FORALL znacząco redukuje liczbę kontekstowych przełączeń między PL/SQL a SQL, co przekłada się na lepszą wydajność w porównaniu do standardowej pętli FOR.

**Obsługa wyjątków**

Sekcja wyjątków (EXCEPTION) obsługuje różne typy błędów i loguje je do systemu:

1. er\_err\_size\_array – zgłaszany, gdy rozmiary tablic wejściowych się różnią.  
2. er\_err\_is\_minus\_price – pojawia się w przypadku podania ujemnej ceny produktu.  
3. er\_err\_first\_char\_zero – wyzwalany, gdy product\_id zaczyna się od '0'.  
4. Obsługa SQL%BULK\_EXCEPTIONS – procedura przechodzi przez kolekcję błędów i rejestruje każdy z nich w systemie logów.

**Wywołanie procedury**  
Aby wywołać procedurę update\_product\_price, należy utworzyć i zainicjalizować tablice zagnieżdżone (product\_id\_nt oraz price\_nt), a następnie przekazać je jako argumenty do procedury.

Przykład wywołania:  
DECLARE  
    \-- Tworzenie tablicy z ID produktów  
    v\_product\_ids product\_id\_nt := product\_id\_nt('941', '1000', '433');  

    \-- Tworzenie tablicy z nowymi cenami  
    v\_new\_prices price\_nt := price\_nt(460, 90, 22);   

BEGIN  
    \-- Wywołanie procedury aktualizującej ceny produktów  
    update\_product\_price(v\_product\_ids, v\_new\_prices);  
END;  
/

Opis wywołania:  
Deklaracja i inicjalizacja tablic:

v\_product\_ids zawiera listę identyfikatorów produktów, których ceny mają zostać zaktualizowane.  
v\_new\_prices zawiera odpowiadające im nowe wartości cenowe.  
Przekazanie tablic do procedury:

Procedura update\_product\_price wykorzystuje przekazane dynamicznie tablice do masowej aktualizacji cen.  
Weryfikuje poprawność danych, sprawdza istnienie produktów i loguje ewentualne błędy.

**Podsumowanie**

Procedura update\_product\_price jest wydajnym i skalowalnym rozwiązaniem umożliwiającym dynamiczną aktualizację cen wielu produktów jednocześnie. Dzięki zastosowaniu tablic zagnieżdżonych możliwe jest elastyczne przekazywanie wartości, natomiast mechanizm FORALL zapewnia optymalizację operacji DML. Dodatkowo, wbudowane mechanizmy walidacyjne i logowanie błędów podnoszą bezpieczeństwo i stabilność działania procedury. Jest to kluczowy element logiki biznesowej aplikacji, który pozwala na szybkie i efektywne zarządzanie cenami produktów w bazie danych.