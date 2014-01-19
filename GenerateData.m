function [y,X,w]=GenerateData(n,p,s)
X=normrnd(0,1/n,[n,p]);
w=sprandn(p,1,1-s);
sigma = 0.01*(norm(X*w,2)^2)/n;
m=normrnd(0,sigma,[n,1]);
y=X*w+m;
end