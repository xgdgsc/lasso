%% Task 1

clear;
n=50;
p=10;
s=0.5;

[y,X,w]=GenerateData(n,p,s);
% dlam=java.util.ArrayList;
% li=dlam.listIterator;
lamb=[0:0.001:0.1];
iterNum=length(lamb);
i=1;
%z_array=zeros(iterNum,1);
w_array=zeros(iterNum,p);
for lambda=lamb
    %[ws,z]=SubgradientSolver(X,y,lambda,1000,500);
    %z_array(i,1)=z;
    %[ws,z]=ProximalSolver(X,y,lambda);
    [ws,z,~]=CoordinateDescentSolver(X,y,lambda,10^-5);
    w_array(i,:)=ws;
    i=i+1;
end

for i=1:p
    hold on
    plot(lamb,w_array(:,i),'Color',rand(1,3));
    xlabel('\lambda');
    ylabel('value', 'FontSize', 14);
end

hold off
