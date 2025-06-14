# Chap2_4_1.jl

using SymPy
using Plots

x=SymFunction("x")
t=symbols("t")
diffeq=Eq(x'(t)+x(t),0)
ics=(x,0,1)
res=dsolve(diffeq,ics=ics)
display(res)

t=0:0.1:10
p=plot(t,res,label="x(t)")
display(p)
savefig(p,"Fig_Chap2_4_1.png")

import Pkg
Pkg.add("SymPy")
