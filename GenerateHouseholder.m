function [H] = GenerateHouseholder(v1, v2)
% Funkcja generuje macierz Householdera w postaci H = I - 2*u*u'/u'*u
% Wejście:
% v1      - pierwszy element wektora u
% v2      - drugi element wektora u
% Wyjście:
% H       - macierz Householdera rozmiaru 2 na 2

u = [v1;v2];

H = [1,0;0,1] - 2*(u*u')/(u'*u);