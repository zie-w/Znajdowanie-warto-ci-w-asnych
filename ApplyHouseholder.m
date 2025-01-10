function [x1,x2] = ApplyHouseholder(a1, a2, H)
% Funkcja generuje wektor x powstały z pomnożenia macierzy H przez wektor a 
% Wejście:
% a1      - pierwszy element wektora a
% a2      - drugi element wektora a
% H       - macierz H, rozmiaru 2 na 2
% Wyjście:
% x1      - pierwszy element wektora x
% x2      - drugi element wektora x

x1 = a1*H(1, 1) + a2*H(1, 2);
x2 = a1*H(2, 1) + a2*H(2, 2);