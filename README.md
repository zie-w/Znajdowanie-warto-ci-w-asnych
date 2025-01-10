# Wstęp

W programie dla podanej wartości $\mu$ i podanej macierzy trójdiagonalnej $A\in \mathbb{R}^{n\times n}$ szukana jest wartość własna $A$ leżąca najbliżej wartości $\mu$. Do przeprowadzenia tego zadania zastosowana jest odwrotna metoda potęgowa z rozkładem QR macierzy $A$ za pomocą odbić Householdera. W testach numerycznych sprawdzana jest zależność liczby iteracji od odległości między dominującą wartością własną macierzy a parametrem, dla którego szukamy wartości własnej.

# Opis odwrotnej metody potęgowej

Dana jest macierz $A\in \mathbb{R}^{n\times n}$, taka że istnieje jej najmniejsza co do modułu wartość własna oraz $n$ niezależnych liniowo wektorów własnych. Dzięki odwrotnej metodzie potęgowej można wyznaczyć wartość własną macierzy $A$ leżącą najbliżej wartości $\mu$ w następujący sposób: tworzymy macierz $A - I\mu$ oraz wybieramy losowo wektor początkowy $x^{(0)}$, a następnie tworzymy ciąg wektorów
$x^{(0)},x^{(1)},...$ w następujący sposób:

$x^{(k+1)}=(A - I\mu)^{-1}x^{(k)};\ (k=0,1,...).$

Proces ten można przerwać gdy wartość

$\frac{\parallel x^{(k+1)}-\lambda _{1}^{(k)}\tilde{x}^{(k)}||}{|\lambda _{1}^{(k)}|};\ (k=1,2,...).$

jest dostatecznie mała.

Aby zastosować w metodzie normowanie należy zastąpić wzór (1) wzorem następującym:

$\tilde{x}^{(k)}=\frac{x^{(k)}}{\parallel x^{(k)}\parallel };\ x^{(k+1)}=(A - I\mu)^{-1}\tilde{x}^{(k)}$


W iteracji (3) można zastąpić obliczanie rozwiązania układu równań liniowych obliczaniem dwóch rozwiązań układów, zmniejszając przy tym liczbę operacji arytmetycznych. Do tego celu można zastosować rozkład $QR$ macierzy $A - I\mu$, gdzie macierz $Q$ to macierz ortogonalna a macierz $R$ to macierz trójkątna górna.
Wtedy w każdej iteracji rozwiązujemy następujące równania:

$Qy=\tilde{x}^{(k)},\ Rx^{(k+1)}=y$


Aby wyznaczyć wspomniany rozkład trzeba najpierw wyznaczyć kolejne macierze Householdera, które w tym przypadku mają postać $H=I-\frac{2}{u^{*}u}uu^{\*}$, gdzie wektor $u$ to pewien wektor, taki że dla dla pewnego wektora $x$ wektor $Hx$ jest odbiciem wektora $x$ względem hiperpłaszczyzny ortogonalnej do wektora $u$.
