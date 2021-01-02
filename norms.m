A=[3 8 1; 5 2 0 ;6 1 12];
[m,n]=size(A);
FROBENIUS(A,m,n);
OneNorm(A);
InfNorm(A);
function[fro]= FROBENIUS(A,m,n)
fro = 0.0
for i = 1:m
    for j = 1:n
        fro = fro + power(A(i,j),2);
    end
end
fro=sqrt(fro)
disp('Frobenius Norm is:')
disp(fro);
end

function[norm]= OneNorm(A)
colsum=sum(A);
norm=max(colsum);
disp('1 Norm is:')
disp(norm);
end

function[norm]= InfNorm(A)
rowsum=sum(A,2);
norm=max(rowsum);
disp('Infinity Norm is:')
disp(norm);
end