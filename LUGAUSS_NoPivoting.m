
A=[1 -1 3; 2 -3 1; 3 2 1];
[M,L,U,flag]=LU_GAUSS(A,ndims(A)+1);
if(flag==0)
    disp(M)
    disp(L)
    disp(U)
else
   disp('The algorithm has encountered a zero pivot.');
end

function [A,L,U,flag]=LU_GAUSS(A,n)
flag=0;
for i =1:n-1
    if(A(i,i)==0)
        flag=1;        
        break
    end
    A(i+1:n,i)=A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n);
end
U = triu(A);
I= eye(n);
L = I;
L=L+ tril(A,-1);
end