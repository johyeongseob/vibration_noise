# Chap2_7_1.jl

using ControlSystems
using Plots

As = [0 1; -10 -2]
Bs = [0;1]
Cs = [1 0]
Ds = [0]

Gs=ss(As,Bs,Cs,Ds)

t=0:0.01:10;
u = (t.<2).*sin.(0.5*pi*t)
p1 = plot(t,u, leg=false, lw=2, grid=true, 
    dpi=600, xlabel="t(s)", ylabel="F" )
display(p1)

x0 = [1,0]
y, t, x, uout = lsim(Gs,u',t,x0=x0)
p=plot(t,y', leg=false, lw=2, grid=true,
   dpi=600, xlabel="t(s)", ylabel="x"  )
display(p)

