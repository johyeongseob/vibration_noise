# Chap2_6_1.jl

using SymPy
using Plots

x=SymFunction("x")
t=symbols("t")

diffeq=Eq(x''(t)+x(t),sin(2t))
ics=((x,0,0),(x',0,0))
res=dsolve(diffeq,ics=ics)
display(res)

t=0:0.1:20
p=plot(t,res,label="x(t)")

xp = -1/3*sin.(2t)
p=plot!(t,xp,label="xp(t)")
display(p)
savefig(p,"Fig_Chap2_6_1.png")