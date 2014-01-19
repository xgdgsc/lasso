function [w,z_array,time]=SubgradientSolver(X,y,lambda,a,b,epsilon)
[n,p]=size(X);
w=randn(p,1);
z_old=0;
z=sum((y-X*w).^2)+lambda*sum(abs(w));
z_array=[];
time=[];
t=1;
tic;
while abs(z-z_old)>epsilon
    grad=-2*transpose(X)*(y-X*w)+lambda*(sign(w));   
    at=a/(t+b);
    w=w-at*grad; 
    z_old=z;
    z=sum((y-X*w).^2)+lambda*sum(abs(w));
    time(t,1)=toc;
    z_array(t,1)=z;
    t=t+1;
end
end

