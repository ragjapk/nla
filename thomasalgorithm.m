a=[-1 -1];
b=[3 3 3];
c=[-1 -1];
rhs=[-1 7 7];
[X]=THOMAS(a,b,c,rhs,length(b));
disp(X)

function[x]= THOMAS(a,b,c,rhs,n)
c(1)= c(1)/b(1);
rhs(1) = rhs(1)/b(1);
for i = 2:n-1 
    c(i) = c(i)/(b(i) - a(i-1)*c(i-1));
    rhs(i) = (rhs(i)-a(i-1)*rhs(i-1)) / (b(i)- a(i-1)*c(i-1));
end 
rhs(n) = (rhs(n)-a(n-1)*rhs(n-1))/(b(n)-a(n-1)*c(n-1));
x(n) = rhs(n);
for i = n-1:-1:1 
    x(i) = rhs(i) - c(i)*x(i+1);
end     
end 