function [Y] = QTimesY(H, Y0)
% Funkcja dla podanego wektora kolumnowego Y0 i macierzy H potrzebnej do
% wyznaczenia macierzy Q oblicza iloczyn Q'*Y0.
% Wejście:
% H       - macierz rozmiaru 2 na n - 1 wektorów dwuelementowych
%           zawierających elementy potrzebne do wyznaczenia macierzy Q
% Y0      - wektor kolumnowy
% Wyjście:
% V       - wektor będący szukanym iloczynem

n = length(Y0);

% Poniżej wyznaczony jest iloczyn Q'*Y0, gdzie macierz Q' jest iloczynem
% H_n*...*H_1 a H_i to macierz Householdera wyznaczona z elementów w
% macierzy H
for i = 1:(n - 1)
    Hi = GenerateHouseholder(H(1,i), H(2,i));
    V1 = Hi(1, 1)*Y0(i) + Hi(1, 2)*Y0(i + 1);
    V2 = Hi(2, 1)*Y0(i) + Hi(2, 2)*Y0(i + 1);
    Y0(i) = V1;
    Y0(i + 1) = V2;
end

Y = Y0;