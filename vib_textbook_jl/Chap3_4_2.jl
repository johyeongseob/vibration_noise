# Chap3_4_2.jl

using Plots

m = 1; c=2; k=10; x0 = 1; v0=0;
wn = sqrt(k/m);
zt = c/(2*m*wn);
wd = sqrt(1-zt^2)*wn;
A=sqrt(x0^2+((v0+zt*wn*x0)/wd)^2)
ph = atan(v0+zt*wn*x0,wd*x0);

t=0:0.01:10
x = A*exp.(-zt*wn*t).*cos.(wd*t.-ph);
p=plot(t,x,label="x(t)")
savefig(p,"Fig_Chap3_4_2.png")
display(p)
