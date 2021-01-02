%A=[1 1 4 -1; 1 5 0 -1;4 0 21 -4; -1 -1 -4 10];
%A=[1 5 6; -7 12 5; 2 1 10];
%[m,n]=size(A);
%f = @(x,m,n) reshape(randperm(x),m,n);
%A=f(250000,500,500);
A = rand(5000,5000); 
A = 0.5*(A+A'); 
A = A + 5000*eye(5000);

disp('Matrix generated');
[m,n]=size(A);
[R,flag]=CHOLESKY(A,m,n);

if(flag==1)
    disp('Entered matrix is not positive definite');
else
    disp('R is calculated');
    %disp(R)
end    

function [R,flag]= CHOLESKY(A,m,n)
flag=0;
R=zeros(m,n);
for i =1:n 
    tmp=A(i,i) - sum(R(1:i-1,i).^2);
    if tmp <= 0
        flag=1;
        return
    end
    R(i,i) = sqrt(tmp);
    for j = i+1:n
        R(i,j) = (A(i,j)-sum(R(1:i-1,i).*R(1:i-1,j)))/R(i,i);
    end 
end 
end 