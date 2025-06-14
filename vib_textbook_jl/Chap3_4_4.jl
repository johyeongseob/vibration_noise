# Chap3_4_4.jl
using SymPy
using Plots

x=SymFunction("x")
t=symbols("t")
wn = 1
zt = 0.1
diffeq=Eq(x''(t)+2*zt*wn*x'(t)+wn^2*x(t),0)
ics=((x,0,1),(x',0,0))
x=dsolve(diffeq,ics=ics)
display(x)

t=0:0.01:10
p=plot(t,x,leg=false, box=:on, lw=2, grid=true, dpi=600,xlabel="t(s)", ylabel="x(m)")
display(p)
savefig(p,"Fig_Chap3_4_4.png")
