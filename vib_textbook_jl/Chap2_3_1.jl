# Chap2_3_1.jl

using Plots
t=range(0,10,length=1000)
x=exp.(-t)
p=plot(t,x,label="exp(-t)")
xlabel!("t(s)")
ylabel!("x(t)")

display(p)
