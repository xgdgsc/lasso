function w=filter_w(w)
ind=find(w<10^-5);
w(ind)=0;
