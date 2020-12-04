# Repozytorium Mrucznik-RP-obiekty 2.0
Repozytorium Mrucznik-RP-obiekty zostało stworzone, aby ułatwić wgrywanie obiektów na serwer. Od wydania 2.0 mogą w tym uczestniczyć starsi mapperzy


## Podstawowe pliki i foldery
W głównym folderze repozytorium znajdziesz pliki nowe_obiekty.pwn oraz stare_obiekty.pwn.

* W pliku stare_obiekty.pwn załączone są pliki z folderu stare_obiekty. Pliki te nie zostały jeszcze przekonwertowane na nowy system. Znajdziesz tam wszelkie stare
  obiekty, które kiedyś pojawiły się na Mruczniku. Nie zalecana jest ich edycja.
*  W pliku nowe_obiekty.pwn załączone są z folderu nowe_obiekty. Wszelkie nowe prace powinny być załączane do tego pliku i umieszczane w tym folderze.

## Nazewnictwo
Nazewnictwo, które powinno być stosowane przy wgrywaniu obiektów jest przedstawione na przykładzie obiektów "exampleObjects".

## Jak poprawnie wgrać obiekty?
Aby poprawnie wgrać obiekty na nasze repozytorium postępuj według określonych kroków:

1. Wejdź na swojego branch'a lub stwórz nowego (nazwij go swoim nickiem) na github'ie. Pamiętaj! - Aby stworzyć go na podstawie głównego branch'a - master
2. Wejdź w nowe_obiekty, stwórz folder przedstawiający to co chciałbyś dodać (krótka i prosta nazwa).
3. Stwórz plik o takiej samej nazwie, jak folder, z tym, że nazwa powinna zaczynać się z małej litery (camelCase) - lub jeśli masz więcej plików do tego folderu, stwórz pliki o prostej nazwie (aby od razu było wiadomo o co chodzi).
4. Dodaj swoje obiekty zgodnie z formatem, jaki jest podany w pliku: /nowe_obiekty/ExampleObjects/exampleObjects.pwn.
 * W razie, gdy posiadasz obiekty, które nie zgadzają się z formatem podanym w exampleObjects.pwn, skorzystaj z [konwertera obiektów](http://convertffs.com/). Jako output wybierz "Icognito's Streamer Plugin".
5. Dodaj do pliku nowe_obiekty.pwn dyrektywę #include załączającą twój plik projektu oraz wklej wywołania funkcji twojego projektu do ich odpowiedników w pliku nowe_obiekty.pwn. Przekładając na język polski skopiuj odniesienie (#include) do pliku nowe_obiekty.pwn (przykładowo: #include "../nowe/AmmuNationBananov/ammuNationBananov.pwn"(WAŻNE! Abyś to zrobił razy 2 - Pierwszy na Gamemode "objecttest", drugi na gamemode mrucznika. Różni się to jedynie początkiem(W mrucznikowym nie ma "../", tylko "modules/obiekty/")))
* Nie zapomnij dodać wywołania funkcji (które użyłeś w swojej pracy .pwn) - przykładowo "ammuNationBananov_Init();", bądź Connect'ów
6. Gdy skończysz sprawdź wszystko za pomocą Gamemoda dołączonego w folderze "skrypt"

* UWAGA WAŻNE! Przy edycji jakiegoś pliku, wrzucaniu nowego etc zawsze stosuj Commit (tkzw. Komentarz) i wyjaśniaj w nim co dodałeś. 
* UWAGA WAŻNE! Ołóweczek w githubie zmienia kodowanie pliku na UTF-8, Samp nie obsługuje tego formatowania. Najlepiej pobrać repozytorium i edytować na komputerze.. A następnie wrzucać poszczególne pliki (przykładowo za pomocą programu Git Bash)

## Nie umiem przygotować obiektów do wgrania, co teraz?
Jeżeli nie udało ci się przygotować obiektów do wgrania, ponieważ nie jesteś w stanie ogarnąć, jak zrobić to poprawnie lub masz pewne wątpliwości czy też napotkałeś pewne komplikacje, nie wszystko stracone.
Skontaktuj się z Simeone lub Mrucznik - Pomożemy Ci! 


## Dodatkowe pliki w folderze
Zachęcam do umieszczania dodatkowych plików związanych z danymi obiektami (jak na przykład opis, surowe obiekty z edytora, notatki autora) w folderze projektu obiektów. Format .txt

## Pytania, propozycje zmian (skryptu etc)
W razie jakichkolwiek pytań, propozycji i problemów zapraszamy na naszego discorda! 
Zgłoś się do Mrucznik bądź Simeone. 
