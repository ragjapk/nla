A=[5 -1 2; -1 4 1; 1 6 -7];
b=[1 -2 5];
x=[0 0 0];
[x1]=JACOBI(A,b,x);
disp(x1)

function[x]=JACOBI(A,b,x)
[m,n]=size(A);
U=triu(A,1);
L = tril(A,-1);
D1=diag(A);
D = diag(D1,0);
D_=inv(D);
x=x';
b=b';
resid=1;
steps=0;
while resid>=0.0011116
    steps=steps+1;
    temp=(D_*(L+U))*x;
    newx=(D_*b)-temp;
    newb=A*newx;
    num=norm(b-newb);
    den=norm(b);
    resid=num/den;
    x=newx;
end
disp(resid);
disp(steps);
end