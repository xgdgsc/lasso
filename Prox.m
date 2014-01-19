function prox=Prox(k,x)
prox=sign(x).*max(abs(x)-k,0);
end