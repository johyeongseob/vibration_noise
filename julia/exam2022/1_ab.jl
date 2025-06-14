# 2022_1_a,b

using SymPy
using Plots

x=SymFunction("x")
t=symbols("t")

# 1_a

m = 2; c=10; k=100; x0 = 3; v0=-7;

diffeq=Eq(m*x''(t)+c*x'(t)+k*x(t),0)
ics=((x,0,x0),(x',0,v0))
xp=dsolve(diffeq,ics=ics)

display(xp)

#------------------------------------#

# 1-b

m = 1; c=10; k=99; F0 = 100; w = 10;

diffeq=Eq(m*x''(t) + c*x'(t) + k*x(t),F0*sin(w*t))
ics=((x,0,0),(x',0,0))
res=dsolve(diffeq,ics=ics)
display(res)
