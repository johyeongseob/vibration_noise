# m=49.2*10^-3 kg, c=0.11 Ns/m, k=857.8 N/m, x(0)=5 mm, v(0)=0.1 mm/s

using SymPy
using Plots

x = SymFunction("x")
t = symbols("t")

m = 49.2*10^-3; c = 0.11; k = 857.8; x0 = 5*10^-3; v0 = 0.1*10^-3;
diffeq = Eq(m*x''(t) + c*x'(t) + k*x(t), 0)
ics=((x, 0, x0), (x', 0, v0))
xp = dsolve(diffeq, ics = ics)
display(xp)

t = 0:00.01:10
p = plot(t, xp, label = "xp(t)")
display(p)

