**Nume: SAMSON Alexandru-Valentin**
**Grupă: 312CC**


## Tema 2 – The race is on


### Descriere:

## Task 1

* Funcția "simple" criptează un șir de caractere utilizând algoritmul simple cipher.
În cadrul funcției, valorile parametrilor sunt încărcate în registrele corespunzătoare.
Apoi, programul utilizează un ciclu repetitiv pentru a cripta fiecare caracter din șirul
de intrare, adăugând numărul de pași specificat ca parametru și utilizând instrucțiuni de
comparare pentru a asigura că caracterul rămâne în alfabetul englez.

## Task 2

* Funcția "sort_procs" scade lungimea cu 1 pentru a putea face comparății între elemente
consecutive. Apoi se face o buclă externă care va rula până când vectorul este sortat. În
interiorul acestei bucle, se face o buclă internă care va parcurge vectorul și va compara
elementele consecutive. Dacă un element este mai mic decât cel din față lui, se interschimbă,
și se marchează vectorul ca nesortat. Dacă la finalul buclei interne vectorul a rămas sortat,
programul se termină. Altfel, bucla externă se repetă.

* Funcția "run_procs" parcurge vectorul de procese și se calculează media timpului de rulare
pentru fiecare prioritate în parte. Acest lucru se face prin utilizarea unui contor care
reprezintă prioritatea curentă și care este incrementat la fiecare iterație. Se verifică
dacă prioritatea curentă corespunde cu prioritatea procesului curent și, în caz afirmativ,
se adaugă timpul procesului la suma totală pentru acea prioritate. La sfârșit, această sumă
totală este împărțită la numărul de procese cu aceeași prioritate pentru a obține media.
Rezultatele pentru fiecare prioritate sunt stocate în tablourile globale menționate mai
devreme, iar la sfârșit sunt copiate în structura avg.

## Task 3

* Funcția "rotate_x_positions", în cazul unei rotații spre stânga, salvează primul element
din prima linie și primul element din a doua linie în stivă, apoi se inițializează un contor
și se realizează permutări în matrice pe ambele linii. Aceste permutări se realizează prin
mutarea fiecărui element la stânga cu o poziție și plasarea primului element salvat anterior
pe ultima poziție. Procesul se repetă de x ori. În cazul unei rotații spre dreapta, se salvează
ultimul element din prima linie și ultimul element din a doua linie în stivă, apoi se realizează
permutări în matrice pe ambele linii prin mutarea fiecărui element la dreapta cu o poziție și
plasarea ultimului element salvat anterior pe prima poziție. Procesul se repetă de x ori.

## Task 4

* Funcția "checkers" verifică dacă se pot accesa pozițiile adiacente, adică în cazul poziției
din stânga jos verifică dacă linia și coloana sunt diferite de 0, iar în cazul poziției din
dreapta jos verifică dacă linia este diferită de 0 și coloana este diferită de 7. Funcția face
același lucru pentru celelalte două poziții. După ce se verifică dacă se pot accesa pozițiile
adiacente, funcția calculează adresa celulei din tabel corespunzătoare poziției adiacente,
stocând-o într-un registru. Apoi, funcția pune valoarea 1 în celula corespunzătoare. Astfel,
la finalul execuției funcției, pozițiile adiacente corespunzătoare poziției (x, y) vor fi
marcate cu valoarea 1 în tabel.

## Bonus

* Programul începe prin inițializarea unui contor la zero și se mută în stânga-jos pentru
a verifica dacă poate accesa poziția. Dacă poziția este validă, calculează distanța dintre
acea poziție și începutul matricii, o salvează și crește contorul. Apoi, merge în dreapta-jos
pentru a verifica dacă poate accesa poziția și procedează în același mod. Programul continuă
să verifice și celelalte 2 poziții valide și să calculeze distanța dintre fiecare dintre ele
și începutul matricii. După ce toate distanțele sunt calculate și salvate în stiva, programul
începe să calculeze sumele. Începe prin a scoate o distanță din stivă și verifica dacă
distanța este mai mare sau egală cu 32. Dacă este adevărat, calculează puterea a doua egală
cu distanța redusă cu 32, o adaugă la suma de sus și revine la începutul buclei. Dacă
distanța este mai mică decât 32, calculează puterea a doua a lui 2 egală cu distanța, o
adaugă la suma de jos și revine la începutul buclei. În cele din urmă, programul verifică
dacă mai există poziții valide pentru a calcula sumele. Dacă da, se reia procesul de adăugare
a puterilor a doua în sume, altfel se stochează suma de sus și suma de jos în vector și
funcția se termină.

### Comentarii asupra temei:

* Implementarea mi se pare destul de bună, dar sigur era posibil să fie și mai
eficientă sau mai scurtă. Totuși sunt mulțumit cu această rezolvare.

* Tema această mi-a stabilit bazele în assembly.

### Punctajul obținut la teste local:

* Total: 100.0/120