U=[1 -1 3; 0 2 9; 0 0 1];
L=[1 0 0; -1 2 0; 3 4 5];
b=[1 9 -2];
[m,n]=size(U);
[x1]=BACKSOLVE(U,b,n);
[x2]=FORSOLVE(L,b,n);
disp(x1);
disp(x2);

function[x]= BACKSOLVE(U,b,n)
x(n) = b(n)/U(n,n);
for i = n-1:-1:1 
    x(i) = (b(i) - U(i,i+1:n)*x(i+1:n)') /U(i,i);
 end 
end

function[x]= FORSOLVE(L,b,n)
x(1) = b(1)/L(1,1);
for i = 2:n 
    x(i) = (b(i) - L(i,1:i-1)*x(1:i-1)') /L(i,i);
 end 
end