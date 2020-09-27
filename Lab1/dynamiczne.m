clear all
clc
close all

Ci=[3 5 3 5 3];    %WEKTOR WAG poszczególnych obszarów

%%
%Pierwsza Tabelka
g=1;
for j=0:1:3      
  A(j+1,1)= 3-j;
  A(j+1,2)= j;
  A(j+1,3) = sqrt(1+A(j+1,2)*A(j+1,2))*Ci(5);
end
%%
%Druga Tabelka
for j=0:1:3  
    for i=0:1:j
    B(g,1) = 3-j;
    B(g,2) = j-i;
    B(g,3) = sqrt(1+B(g,2)*B(g,2))*Ci(4);
    B(g,4) = B(g,1) + B(g,2);
    
    if(B(g,4)==3)
    B(g,5) = A(1,3);
    end
    
    if(B(g,4)==2)
    B(g,5) = A(2,3);
    end
    
    if(B(g,4)==1)
    B(g,5) = A(3,3);
    end
    
    if(B(g,4)==0)
    B(g,5) = A(4,3);
    end
    
    B(g,6) = B(g,3)+B(g,5);
    g=g+1;
    end  
end

%Wyznaczanie wartoœci optymalnych

[B(1,7),B(1,8)]=min([B(1,6)]);
[B(2,7),B(2,8)]=min([B(2,6) B(3,6)]);
[B(3,7),B(3,8)]=min([B(4,6) B(5,6) B(6,6)]);
[B(4,7),B(4,8)]=min([B(7,6) B(8,6) B(9,6) B(10,6)]);
B(2,8)=B(2,8)+1;
B(3,8)=B(3,8)+3;
B(4,8)=B(4,8)+6;

%%

%Trzecia tabelka

g=1;
for j=0:1:3  
    for i=0:1:j
    C(g,1) = 3-j;
    C(g,2) = j-i;
    C(g,3) = sqrt(1+C(g,2)*C(g,2))*Ci(3);
    C(g,4) = C(g,1) + C(g,2);
    
    if(C(g,4)==3)
    C(g,5) = B(1,7);
    end
    
    if(C(g,4)==2)
    C(g,5) = B(2,7);
    end
    
    if(C(g,4)==1)
    C(g,5) = B(3,7);
    end
    
    if(C(g,4)==0)
    C(g,5) = B(4,7);
    end
    
    
    C(g,6) = C(g,3)+C(g,5);
    g=g+1;
    end  
end

%Wyznaczanie wartoœci optymalnych

[C(1,7),C(1,8)]=min([C(1,6)]);
[C(2,7),C(2,8)]=min([C(2,6) C(3,6)]);
[C(3,7),C(3,8)]=min([C(4,6) C(5,6) C(6,6)]);
[C(4,7),C(4,8)]=min([C(7,6) C(8,6) C(9,6) C(10,6)]);
C(2,8)=C(2,8)+1;
C(3,8)=C(3,8)+3;
C(4,8)=C(4,8)+6;

%%

%Czwarta Tabelka

g=1;
for j=0:1:3  
    for i=0:1:j
    D(g,1) = 3-j;
    D(g,2) = j-i;
    D(g,3) = sqrt(1+D(g,2)*D(g,2))*Ci(2);
    D(g,4) = D(g,1) + D(g,2);
    
    if(D(g,4)==3)
    D(g,5) = C(1,7);
    end
    
    if(D(g,4)==2)
    D(g,5) = C(2,7);
    end
    
    if(D(g,4)==1)
    D(g,5) = C(3,7);
    end
    
    if(D(g,4)==0)
    D(g,5) = C(4,7);
    end
    
    
    D(g,6) = D(g,3)+D(g,5);
    g=g+1;
    end  
end

%Wyznaczanie wartoœci optymalnych

[D(1,7),D(1,8)]=min([D(1,6)]);
[D(2,7),D(2,8)]=min([D(2,6) D(3,6)]);
[D(3,7),D(3,8)]=min([D(4,6) D(5,6) D(6,6)]);
[D(4,7),D(4,8)]=min([D(7,6) D(8,6) D(9,6) D(10,6)]);
D(2,8)=D(2,8)+1;
D(3,8)=D(3,8)+3;
D(4,8)=D(4,8)+6;

%%

%Ostatnia tabelka

g=1;
for j=0:1:3  
    E(g,1) = 0;
    E(g,2) = j;
    E(g,3) = sqrt(1+E(g,2)*E(g,2))*Ci(1);
    E(g,4) = E(g,1) + E(g,2);
   
    if(E(g,4)==3)
    E(g,5) = D(1,7);
    end
    
    if(E(g,4)==2)
    E(g,5) = D(2,7);
    end
    
    if(E(g,4)==1)
    E(g,5) = D(3,7);
    end
    
    if(E(g,4)==0)
    E(g,5) = D(4,7);
    end
    
    
    E(g,6) = E(g,3)+E(g,5);
    g=g+1;

end

%Wyznaczanie wartoœci optymalnych
[E(1,7),E(1,8)]=min([E(1,6) E(2,6) E(3,6) E(4,6)]);


%%

%Wypisanie rozwi¹zania:

x=[];
x(1)=0;
u(1)=E(E(1,8),2);
x(2)=u(1)+x(1);
u(2)=D(D(4-x(2),8),2);
x(3)=u(2)+x(2);
u(3)=C(C(4-x(3),8),2);
x(4)=u(3)+x(3);
u(4)=B(B(4-x(4),8),2);
x(5)=u(4)+x(4);
u(5)=A(4-x(4),2);
x(6)=u(5)+x(5);

plot([1,2,3,4,5,6],x)
title('Rozwiazanie');
xlabel('Kroki(i)')
ylabel('x')
x
u
