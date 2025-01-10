function V = SolveTriMat(R, Y)
% Funkcja dla podanej macierzy R, z niezerowymi elementami na głównej
% przekątnej i na dwóch kolejnych przekątnych nad główną, i wektora Y
% rozwiązuje układ równań liniowych RV = Y
% Wejście:
% R       - macierz o wymiarach n na 5, przekątna macierzy jest umieszczona
%           w kolumnie numer 3, w kolumnie numer 4 znajduje się wektor
%           elementów nad przekątną oraz 0 w ostatnim elemencie kolumny,
%           w kolumnie numer 5 znajduje wektor elementów na kolejnej
%           przekątnej oraz 0 w dwóch ostatnich elementach kolumny
% Y       - kolumnowy wektor wyrazów wolnych
% Wyjście:
% V       - kolumnowy wektor rozwiązań układu

% Do wyznaczenia rozwiązania układu stosowana jest eliminacja Gaussa
R1 = R./R(:, 2);
V = zeros(length(Y), 1);
Y = Y./R(:, 2);

V(length(Y)) = Y(length(Y));
V(length(Y) - 1) = Y(length(Y) - 1) - R1(length(Y) - 1, 3)*V(length(Y));

for i = (length(Y) - 2):-1:1
    V(i) = Y(i) - R1(i, 3)*V(i + 1) - R1(i, 4)*V(i + 2);
end