# Chap3_8_2.jl


using ControlSystems
using Plots

m=1; c=1; k=100; x0 = 0; v0 = 0;
ωn=sqrt(k/m); ζ=c/(2*m*ωn);
print("ωn = "); print(ωn); println(" rad/s")
print("ζ = "); println(ζ)

As = [0 1; -k/m -c/m]
Bs = [0;1/m]
Cs = [1 0]
Ds = [0]

Gs=ss(As,Bs,Cs,Ds)

t = 0:0.01:2;
F1 = 20 * (t) .* (t .>= 0) .* (t .< 0.5)
F2 = -20 * (t .- 1) .* (t .>= 0.5) .* (t .< 1)
F3 = 20 * (t .- 1) .* (t .>= 1) .* (t .< 1.5)
F4 = -20 * (t .- 2) .* (t .>= 1.5) .* (t .< 2)
F = F1 + F2 + F3 + F4;


p1 = plot(t,F, leg=false, lw=2, grid=true, dpi=600,
xlabel="t(s)", ylabel="F" )
display(p1)

z0 = [x0, v0]
y, t, x, uout = lsim(Gs,F',t,x0=z0)

p=plot(t,y', leg=false, lw=2, grid=true, dpi=600,
xlabel="t(s)", ylabel="x" )
display(p)

savefig(p1,"Fig_Chap3_8_2a.png")
savefig(p,"Fig_Chap3_8_2b.png")