# Chap2_6_2.jl

using SymPy
using Plots

x=SymFunction("x")
t=symbols("t")

diffeq=Eq(x''(t)+2x'(t)+10*x(t),sin(3t))
ics=((x,0,0),(x',0,0))
res=dsolve(diffeq,ics=ics)
display(res)

t=0:0.01:20
p=plot(t,res, label="Transient")

xp = 1/37*sin.(3t)-6/37*cos.(3t)
p=plot!(t,xp,label="xp(t)")
display(p)

savefig(p,"Fig_Chap2_6_2.png")