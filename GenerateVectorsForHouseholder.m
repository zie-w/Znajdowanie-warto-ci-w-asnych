function [v1, v2] = GenerateVectorsForHouseholder(a1, a2)
% Funkcja generuje elementy wektora v rozmiaru 2 na 1 wyznaczonego w
% następujący sposób: v = a + MySign(a(1))*norm(a, 2)*[1; 0], gdzie funkcja
% MySign(x) jest pisana w pliku MySign.m
% Wejście:
% a1      - pierwszy element wektora a
% a2      - drugi element wektora a
% Wyjście:
% v1      - pierwszy element wektora v
% v2      - drugi element wektora v

norm = sqrt(abs(a1)*abs(a1) + abs(a2)*abs(a2));

if a1 == 0
    sign = 1;
else
    sign = a1/abs(a1);
end

v1 = a1 + sign*norm;
v2 = a2;