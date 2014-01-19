function [w,z_array,time]=ProximalSolver(X,y,lambda,epsilon)
[n,p]=size(X);
w=randn(p,1);
factor=1.2;
z_old=0;
z=sum((y-X*w).^2)+lambda*sum(abs(w));
z_array=[];
time=[];
t=1;
tic;
while abs(z-z_old)>epsilon

    grad_smooth=-2*transpose(X)*(y-X*w);
    L=1;
    w=getW(grad_smooth,w,L,factor,X,y,lambda);
    z_old=z;
    z=sum((y-X*w).^2)+lambda*sum(abs(w));
    %if mod(t,10)==0
       % toc;
%         time(t/10,1)=toc;
%         z_array(t/10,1)=z;
        time(t,1)=toc;
        z_array(t,1)=z;
    %end
    t=t+1;
end
end

function f_w=fw(w,wt,X,y,grad_smooth,L)
f_w=f(X,y,wt)+transpose(grad_smooth)*(w-wt)+(L/2)*norm(w-wt,2)^2;
end

function w=getW(grad_smooth,w_old,L,factor,X,y,lambda)
    w_L_asterisk=Prox(lambda/L,w_old-grad_smooth/L);
    if f(X,y,w_L_asterisk) <= fw(w_L_asterisk,w_old,X,y,grad_smooth,L)
        w=w_L_asterisk;
    else
        w=getW(grad_smooth,w_old,L*factor,factor,X,y,lambda);
    end
end