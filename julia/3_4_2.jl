# Chap3_4_2.jl


using Plots

m = 1; c=2; k=10; x0 = 1; v0=0;

ωn = sqrt(k/m);
ζ = c/(2*m*ωn);
ωd = sqrt(1-ζ^2)*ωn;
A=sqrt(x0^2+((v0+ζ*ωn*x0)/ωd)^2)
ph = atan(v0+ζ*ωn*x0,ωd*x0);

t=0:0.01:10
x = A*exp.(-ζ*ωn*t).*cos.(ωd*t.-ph);
p=plot(t,x,label="x(t)")
display(p)