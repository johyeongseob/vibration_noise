using SymPy
using Plots

x=SymFunction("x")
t=symbols("t")

diffeq=Eq(17*x''(t)+17*x(t),40)
ics=((x,0,0),(x',0,0)) 
res=dsolve(diffeq,ics=ics) 
display(res)