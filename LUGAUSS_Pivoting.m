
A=[3 8 1; 5 2 0 ;6 1 12];
[L,U,P]=LU_GAUSS(A,ndims(A)+1);
disp(L)
disp(U)
disp(P)

function [L,U,P]=LU_GAUSS(A,n)
L= eye(n);
P= eye(n);
for i =1:n-1
    [val, maxdx] = max(A(i:n,i));
    disp(maxdx);
    k=maxdx;
    pivotindex = i + k - 1;
    disp(pivotindex);
    if(pivotindex ~= i)
        tmp = A(i,i:n);
        A(i,i:n) = A(pivotindex,i:n);
        A(pivotindex,i:n) = tmp;
        tmp = P(i,1:n);
        P(i,1:n) = P(pivotindex,1:n);
        P(pivotindex,1:n) = tmp;
        tmp = L(i,1:i-1);
        L(i,1:i-1) = L(pivotindex,1:i-1);
        L(pivotindex,1:i-1) = tmp;
    end 
    multipliers = A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n) = A(i+1:n,i+1:n) - multipliers*A(i,i+1:n);
    A (i + 1 : n, i) = 0;
    L(i+1:n,i) = multipliers;
end 
U=A;
end