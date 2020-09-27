clc
clear all
% po kolei x1,x2,x3 <= b
%jesli >= to wszystko z minusami

A = [
    -1 0 0 0 0 0 0 
    0 -1 0 0 0 0 0
    0 0 -1 0 0 0 0
    0 0 0 -1 0 0 0
    0 0 0 0 -1 0 0
    0 0 0 0 0 -1 0
    0 0 0 0 0 0 -1
    0 -9 -2 -2 -8 0 0
    0 -7 0 0 0 -7  0
    -1 0 0 0 -1 0 0
    0 0 0 -4 0 -5 0
    0 1 0 0 0 0 0
    1 0 0 0 0 0 0
    0 1 0 0 0 0 0
    ];

b = [0 0 0 0 0 0 0 -25 -22 -40 -18 2 39 1
   ];

 %Aeq = [0 1 0 0 0 0 0];
 %beq = [2];


f = [1 5 6 6 8 4 1];
[x value] = linprog(f,A,b)
%[x value] = linprog(f,A,b,Aeq,beq)