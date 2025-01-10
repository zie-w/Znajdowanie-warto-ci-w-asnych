function [res, err, it] = ...
    FindEigenvalue(a, n, dL, d, dU, tol, maxit)
% Funkcja dla podanej macierzy trójdiagonalnej A, rozmiaru n na n
% (przekazanej za pomocą trzech wektorów kolumnowych), próbuje znaleźć jej
% wartość własną, która leży najbliżej podanej wartości a, z dokładnością
% do parametru tol, za pomocą odwrotnej metody potęgowej z normowaniem.
% Rozwiązanie korzysta z odbić Householdera (do wyznaczenia rozkładu
% macierzy A - aI).
% Wejście:
% a       - parametr, dla którego szukamy najbliżej leżącej wartości
%           własnej macierzy A
% n       - rozmiar macierzy A, z przedziału [1,200000]
% dL      - wektor zawierający elementy pod główną przekątną macierzy A,
%           rozmiaru n - 1 (elementy o indeksach [i+1,i], 1 <= i <= n-1)
% d       - wektor zawierający elementy na głównej przekątnej macierzy A,
%           rozmiaru n (elementy o indeksach [i,i], 1 <= i <= n)
% dU      - wektor zawierający elementy nad główną przekątną macierzy A,
%           rozmiaru n - 1 (elementy o indeksach [i-1,i], 2 <= i <= n)
% tol     - tolerancja na błąd przybliżenia
% maxit   - maksymalna dopuszczalna liczba iteracji
% Wyjście:
% res     - przybliżona szukana wartość własna macierzy A, w przypadku
%           przekroczenia maksymalnej liczby iteracji jest zracana ostatnio
%           obliczona wartość
% err     - błąd dla zwróconej wartości
% it      - liczba wykonanych iteracji

if n == 1 % Osobny przypadek gdy macierz jest rozmiaru 1 na 1
    res = d(1);
    err = abs(d - a);
    it = 1;
    return;
end
A = PrepareMat(dL, d, dU, a); % Generowanie macierzy A używanej w programie
[H, R] = QRFactorization(A, n); % Wyznaczanie rozkładu QR macierzy A
x = rand(n, 1); % Zmienna będąca wektorem początkowym metody potęgowej
it = 0;
lmb = 0; % Zmienna przechowująca obecną wartość własną macierzy
err = 2*tol; % Zmienna przechowująca błąd obliczony w obecnej iteracji
while err > tol && it < maxit
    it = it + 1;
    %   Zmienna xp przechowuje znormalizowany wektor x z ostatniej iteracji
    xp = x/norm(x, 2);
%   Poniżej obliczane jest kolejne przybliżenie wektora własnego macierzy
%   (A - aI)^(-1) odpowiadajcego dominującej wartości własnej tej macierzy
    y = QTimesY(H, xp);
    x = SolveTriMat(R, y);
    err = norm(x - lmb*xp, 2)/abs(lmb); % Obliczanie błędu metody
    lmb = xp'*x; % Obliczanie dominującej wartości własnej (A - aI)^(-1)
end
% Wyznaczenie wartości własnej macierzy A najbliższej wartości a
res = 1/(xp'*x) + a;