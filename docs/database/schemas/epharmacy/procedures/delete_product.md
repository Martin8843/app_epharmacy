**Opis procedury:** delete\_product

Procedura delete\_product służy do usuwania produktu z tabeli products na podstawie przekazanego identyfikatora produktu (p\_product\_id). Zanim produkt zostanie usunięty, procedura przeprowadza szereg walidacji, aby upewnić się, że usunięcie nie naruszy integralności danych w systemie.

**Kroki procedury:**  
Walidacja istnienia produktu:  
Procedura sprawdza, czy produkt o podanym p\_product\_id istnieje w tabeli products. Jeśli nie, zgłasza wyjątek NO\_DATA\_FOUND i zapisuje błąd do logów.

Walidacja, czy produkt jest powiązany z zamówieniem:  
Procedura sprawdza, czy produkt jest powiązany z jakimkolwiek zamówieniem w tabeli order\_details. Jeśli produkt występuje w zamówieniu, zgłasza wyjątek ex\_err\_prod\_is\_in\_order i zapisuje błąd do logów.

Walidacja stanu magazynowego produktu:  
Procedura sprawdza, czy produkt jest dostępny na magazynie (tj. jego ilość w tabeli stock jest większa niż 0). Jeśli produkt jest w magazynie, zgłasza wyjątek ex\_err\_prod\_is\_in\_stock i zapisuje błąd do logów.  
Usunięcie produktu:

Jeśli wszystkie walidacje przejdą pomyślnie, produkt zostaje usunięty                     z tabeli products.  
**Obsługa wyjątków:**  
NO\_DATA\_FOUND:   
Zgłaszany, gdy produkt o podanym identyfikatorze nie istnieje. Procedura zapisuje błąd do logów i zgłasza wyjątek użytkownika z komunikatem o błędzie.  
ex\_err\_prod\_is\_in\_order:   
Zgłaszany, gdy produkt jest powiązany z zamówieniem. Zapisuje błąd do logów i zgłasza wyjątek użytkownika z komunikatem o błędzie.

ex\_err\_prod\_is\_in\_stock:   
Zgłaszany, gdy produkt jest dostępny w magazynie. Zapisuje błąd do logów i zgłasza wyjątek użytkownika z komunikatem o błędzie.

OTHERS: Zgłaszany w przypadku innych nieoczekiwanych błędów. Procedura zapisuje ogólny błąd do logów i zgłasza wyjątek z komunikatem o błędzie.

Kod do wywołania procedury:

BEGIN  
    delete\_product(1);  \-- Wywołanie procedury dla produktu o ID 1  
END;

W tym przypadku procedura delete\_product zostaje wywołana z parametrem 1, co oznacza próbę usunięcia produktu o identyfikatorze 1\. Jeśli produkt spełnia wszystkie wymagania, zostanie usunięty; jeśli wystąpi jakikolwiek problem (np. produkt jest powiązany z zamówieniem lub dostępny na magazynie), odpowiedni wyjątek zostanie zgłoszony, a proces zostanie zatrzymany.