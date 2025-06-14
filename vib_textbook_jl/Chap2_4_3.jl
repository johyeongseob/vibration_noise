# Chap2_4_3.jl

using SymPy
using Plots

x=SymFunction("x")
t=symbols("t")
diffeq=Eq(x''(t)+2x'(t)+10*x(t),0)
ics=((x,0,1),(x',0,0))
res=dsolve(diffeq,ics=ics)
display(res)

tt=0:0.1:5
p=plot(tt,res)
display(p)