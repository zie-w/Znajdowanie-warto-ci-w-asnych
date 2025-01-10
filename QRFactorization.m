function [H, R] = QRFactorization(M, n)
% Funkcja dla podanej macierzy trójdiagonalnej A, rozmiaru n na n
% (przekazanej za pomocą czterech wektorów), wyznacza jej rozkład QR.
% Wejście:
% M       - macierz rozmiaru n na 4 przechowująca elementy macierzy
%           A w sposób opisany w specyfikacji pliku PrepareMat.m
% n       - rozmiar macierzy A, z przedziału [1,200000]
% Wyjście:
% H       - macierz rozmiaru 2 na n - 1 wektorów dwuelementowych
%           zawierających elementy potrzebne do wyznaczenia macierzy Q
% R       - macierz R rozmiaru n na 4

H = zeros(2, n - 1);
R = M;
for i = 1:(n - 2)
%   Poniżej generowane są wektory w celu wyznaczenia takich macierzy 
%   Householdera, które wyzerują elementy pod diagonalą w macierzy A.
%   Następnie odpowiednia macierz Householdera jest wyznaczana a v1 i v2 są 
%   zapisywane aby po przeprowadzeniu rozkładu możliwe było odzyskanie 
%   wyznaczonych macierzy Householdera
    [v1, v2] = GenerateVectorsForHouseholder(R(i, 2), R(i + 1, 1));
    H(1, i) = v1;
    H(2, i) = v2;
    
%   Po wyznaczeniu macierzy Householdera macierz M jest mnożona 
%   lewostronnie przez kolejne macierze Householdera w celu wyznaczenia 
%   macierzy R
    [app11, app12] = HouseholderReflection(v1, v2, R(i, 2), R(i + 1, 1));
    [app21, app22] = HouseholderReflection(v1, v2, R(i, 3), R(i + 1, 2));
    [app31, app32] = HouseholderReflection(v1, v2, R(i, 4), R(i + 1, 3));
    R(i, 2) = app11;
    R(i + 1, 1) = app12;
    R(i, 3) = app21;
    R(i + 1, 2) = app22;
    R(i, 4) = app31;
    R(i + 1, 3) = app32;
end

% Ostatni krok jest wykonywany osobno z powodu innej liczby elementów 
% w dwóch ostatnich wierszach macierzy R
[v1, v2] = GenerateVectorsForHouseholder(R(n - 1, 2), R(n, 1));
H(1, n - 1) = v1;
H(2, n - 1) = v2;
[app11, app12] = HouseholderReflection(v1, v2, R(n - 1, 2), R(n, 1));
[app21, app22] = HouseholderReflection(v1, v2, R(n - 1, 3), R(n, 2));
R(n - 1, 2) = app11;
R(n, 1) = app12;
R(n - 1, 3) = app21;
R(n, 2) = app22;