#HW_2_5

using SymPy
using Plots

x=SymFunction("x")

t=symbols("t")

diffeq=Eq(x''(t) + 2*x'(t) + 10*x(t) , 0)
ics=((x, 0, 1), (x', 0, -3))
res=dsolve(diffeq,ics=ics)
display(res)

t=0:0.1:10
p=plot(t,res,label="x(t)")
display(p)
savefig(p,"Fig_HW_2_5.png")