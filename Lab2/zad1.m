clc
clear all
% po kolei x1,x2,x3 <= b
%jesli >= to wszystko z minusami

A = [
    -1 0 0 0 0 0
    0 -1 0 0 0 0
    0 0 -1 0 0 0
    0 0 0 -1 0 0
    0 0 0 0 -1 0
    0 0 0 0 0 -1
    1 0 0 0 0 0
    0 1 0 0 0 0
    0 0 1 0 0 0
    0 0 0 1 0 0
    0 0 0 0 1 0
    0 0 0 0 0 1
    6 3 2 4 4 2
    ];

b = [0 0 0 0 0 0  1 1 1 1 1 1 10];

 Aeq = [0 0 0 0 1 0 
     0 1 0 0 0 0 
     0 0 1 0 0 0 
     0 0 0 0 0 1 ];
%     0 0 0 1 0 0];
 beq = [1 1 1 0];


f = -[2 6 4 1 7 5];
%[x value] = linprog(f,A,b)
[x value] = linprog(f,A,b,Aeq,beq)