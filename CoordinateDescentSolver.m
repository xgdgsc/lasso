function [w,z_array,time]=CoordinateDescentSolver(X,y,lambda,epsilon)
[n,p]=size(X);
w=randn(p,1);
z_old=0;
z=sum((y-X*w).^2)+lambda*sum(abs(w));
z_array=[];
time=[];
t=1;
tic;
while abs(z-z_old)>epsilon
    for j=1:p
        w(j,1)=Prox(lambda/(2*transpose(X(:,j))*X(:,j)),w(j,1)-transpose(X(:,j))*(X*w-y)/(transpose(X(:,j))*X(:,j)));
    end
    z_old=z;
    z=sum((y-X*w).^2)+lambda*sum(abs(w));
    time(t,1)=toc;
    z_array(t,1)=z;
    t=t+1;
end
end