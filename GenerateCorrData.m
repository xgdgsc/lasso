function [y, X, w] = GenerateCorrData(n, p, s, p_c)
X=normrnd(0,1/n,[n,p]);
C=p_c*eye(n)+(1-p_c)*ones(n);
D=chol(C,'lower');
X=D*X;
w=sprandn(p,1,1-s);
sigma = 0.01*(norm(X*w,2)^2)/n;
m=normrnd(0,sigma,[n,1]);
y=X*w+m;
end