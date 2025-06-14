# Chap2_6_3.jl

using ControlSystems
using Plots

num = 1.0
den = [ 1, 2, 10 ]
Gs=tf(num,den);

t=0:0.01:10;
u = (t.<2).*sin.(0.5*pi*t);
p1 = plot(t,u, leg=false, lw=2, grid=true, 
    dpi=600, xlabel="t(s)", ylabel="f" )
display(p1)

x0 = [1.0,0];
y, t, x = lsim(Gs,u',t,x0=x0);

p=plot(t,x[1,:], leg=false, lw=2, grid=true,
   dpi=600, xlabel="t(s)", ylabel="x"  )
display(p)

savefig(p1,"Fig_Chap2_6_3a.png")
savefig(p,"Fig_Chap2_6_3b.png")
