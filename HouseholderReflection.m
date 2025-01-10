function [r1, r2] = HouseholderReflection(v1, v2, a1, a2)
% Funkcja generuje odbicie H*a wektora a, gdzie H jest macierzą
% Householdera, o postaci H*a = a - 2 * v'*a*v/v'*v
% Wejście:
% a1      - pierwszy element wektora a
% a2      - drugi element wektora a
% v1      - pierwszy element wektora v
% v2      - drugi element wektora v
% Wyjście:
% r1       - pierwszy element wektora H*a
% r2       - drugi element wektora H*a

v = [v1; v2];
a = [a1; a2];

res = a - 2*(v'*a)*v/(v'*v);

r1 = res(1);
r2 = res(2);