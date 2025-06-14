# Chap3_8_1.jl

using ControlSystems
using Plots

m=1; c=1; k=100; x0 = 1; v0 = 2;
ωn=sqrt(k/m); ζ=c/(2*m*ωn);
print("ωn = "); print(ωn); println(" rad/s") 
print("ζ = "); println(ζ)

As = [0 1; -k/m -c/m]
Bs = [0;1/m]
Cs = [1 0]
Ds = [0]

Gs=ss(As,Bs,Cs,Ds)

t=0:0.01:10;
F = 100*(t.>1).*(t.<2)
p1 = plot(t,F, leg=false, lw=2, grid=true, dpi=600, xlabel="t(s)", ylabel="F" )
display(p1)

z0 = [x0, v0]
y, t, x, uout = lsim(Gs,F',t,x0=z0)

p=plot(t,y', leg=false, lw=2, grid=true, dpi=600, xlabel="t(s)", ylabel="x" )
display(p)

savefig(p1,"Fig_Chap3_8_1a.png")
savefig(p,"Fig_Chap3_8_1b.png")
