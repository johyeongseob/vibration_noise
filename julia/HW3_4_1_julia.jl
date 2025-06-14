# m=49.2*10^-3 kg, c=0.11 Ns/m, k=857.8 N/m, x(0)=5 mm, v(0)=0.1 mm/s

using Plots

m = 49.2*10^-3; c = 0.11; k = 857.8; x0 = 5*10^-3; v0 = 0.1*10^-3;

wn = sqrt(k/m);
zt=c/(2*m*wn);
wd = sqrt(1-zt^2)*wn;
A = sqrt(x0^2+((v0 + zt*wn*x0)/wd)^2)
ph = atan(v0 + zt*wn*x0, wd*x0);

t = 0:0.01:10
x = A*exp.(-zt*wn*t).*cos.(wd*t.-ph);
p = plot(t, x, label = "x(t)")

display(p)


