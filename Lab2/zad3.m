clc
clear all
% po kolei x1,x2,x3 <= b
%jesli >= to wszystko z minusami

A = [
    -1 0 0 0 0 0 0 0 0
    0 -1 0 0 0 0 0 0 0
    0 0 -1 0 0 0 0 0 0
    0 0 0 -1 0 0 0 0 0
    0 0 0 0 -1 0 0 0 0
    0 0 0 0 0 -1 0 0 0
    0 0 0 0 0 0 -1 0 0
    0 0 0 0 0 0 0 -1 0
    0 0 0 0 0 0 0 0 -1
    -1*10 -1.05*11 -1.03*10 -1.12*8 -0.94*9 -0.96*10 -1*11 -0.84*5 -0.88*7
    0 0 0 0 0 -0.96*10 -1*11 0 0
    ];

b = [0 0 0 0 0 0 0 0 0 -190 -13
   ];

  Aeq = [0 0 0 0 0 0 1 0 0 
  0 0 1 0 0 0 0 0 0 
    0 1 0 0 0 0 0 0 0 
0 0 0 1 0 0 0 0 0 ];
  beq = [3 17 0 2];
 
f = [43 35 29 31 40 54 50 25 30];
% 43x1 + 35x2 + 29x3 + 31x4 + 40x5 + 54x6 + 50x7 + 25x8 + 30x9....
%[x value] = linprog(f,A,b)
[x value] = linprog(f,A,b,Aeq,beq)