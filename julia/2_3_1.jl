# Chap2_3_1.jl

using Plots

t=0:0.01:10
x=exp.(-t)

p=plot(t,x,label="exp(-t)")
xlabel!("t(s)")
ylabel!("x(t)")
display(p)

savefig(p,"Fig_Chap2_3_1.png")