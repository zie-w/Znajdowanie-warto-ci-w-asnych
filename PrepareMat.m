function [M] = PrepareMat(dL, d, dU, a)
% Funkcja tworzy macierz M odpowiadającą trójdiagonalnej macierzy A gdy ta 
% jest zapisana w macierzy o wymiarach n na n. 
% 
% WEJŚCIE:
% dL      - wektor kolumnowy zawierający wartości macierzy A pod główną
%           przekątną
% d       - wektor kolumnowy zawierający wartości macierzy A na głównej
%           przekątnej
% dU      - wektor kolumnowy zawierający wartości macierzy A nad główną
%           przekątną
% a       - parametr, dla którego szukamy najbliżej leżącej wartości
%           własnej macierzy A
% WYJŚCIE:
% M       - macierz rozmiaru 4 na n

% Pierwsza kolumna macierzy M zawiera elementy leżące pod główną przekątną
% macierzy A. Druga kolumna macierzy M zawiera elementy leżące na głównej 
% przekątnej a trzecia zawiera elementy leżące nad główną przekątną.
% Elementy w kolumnach są ustawione tak aby te, które leżą w tym samym 
% wierszu w macierzy A były również w tym samym wierszu w macierzy M.
% Nieuzupełnione miejsca są wypełnione zerami.
n = length(d);
dL = [0; dL];
d = d - a;
dU = [dU; 0];
M = [dL, d, dU, zeros(n, 1)];