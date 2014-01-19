function fw=f(X,y,w)
fw=norm(y-X*w,2)^2;
end