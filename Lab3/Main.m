clc
close all
clear all

x(1) = 200;
N = 16;
epsilon = 0.01;
J=0;
z=0;
%Wspolczynniki do metody bisekcji
a = -100000;
b = 100000;

%Sprawdzanie warunku stosowania metody bisekcji
[x, p, u] = bisekcja(x(1), a, N);
A = p(N+1);
[x, p, u] = bisekcja(x(1), b, N);
B = p(N+1);

if ~((A>0 && B<0) || (A<0 && B>0)) 
    disp('Brak rozwiazania')
end

%Algorytm metody strzalow
while 1
    c = (a + b)/2;
    [x, p, u] = bisekcja( x(1), c, N);
    C = p(N+1);
    
    if (abs(C) < epsilon)
        break
    end
    
    [x, p, u] = bisekcja(x(1), a, N);
    A = p(N+1);   
    
    if (A * C <= 0)
       b = c;
    else
       a = c;
    end
    z=z+1;
end

%Wskazanik jakosci:

for(i=1:1:16)
    J = x(i)^2+u(i)^2 + J;
end

%Wyswietlanie rezultatow
figure
plot(0:16,x,'ko:')
title('Wektor stanu')
figure
plot(0:15,u,'ko:')
title('Wektor sterowan')
figure
plot(0:16,p,'ko:')
title('Wektor p')
J
%liczba iteracji połowienia
z

