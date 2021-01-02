A=[1 1 1; 1 2 1; 1 1 3];
b=[-1 5 7];
x=[0 0 0];
w=1.1
[x1]=SOR(A,b,w,x);
disp(x1)
f = @(x,m,n) reshape(randperm(x),m,n);
A=f(250000,500,500)
function[x]=SOR(A,b,w,x)
[m,n]=size(A);
U=triu(A,1);
L = tril(A,-1);
D1=diag(A);
D = diag(D1,0);
D_=inv(L+D);
x=x';
b=b';
resid=1;
steps=0;
while resid>=8.18*1e-7
    steps=steps+1;
    temp=(D_*U)*x;
    newx=(1-w)*x+w*((D_*b)-temp);
    newb=A*newx;
    num=norm(b-newb);
    den=norm(b);
    resid=num/den;
    x=newx;
end
disp(resid);
disp(steps);
end