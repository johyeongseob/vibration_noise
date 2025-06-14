# Chap3_4_1.jl

using SymPy
using Plots

x=SymFunction("x")
t=symbols("t")

m = 1; c=2; k=10; x0 = 1; v0=0;

diffeq=Eq(m*x''(t)+c*x'(t)+k*x(t),0)
ics=((x,0,x0),(x',0,v0))
xp=dsolve(diffeq,ics=ics)

display(xp)

t=0:0.01:10
p=plot(t,xp,label="xp(t)")

savefig(p,"Fig_Chap3_4_1.png")

display(p)