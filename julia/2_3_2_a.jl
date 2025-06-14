# Chap2_3_2.jl
using Plots
t=range(0,10,length=1000)
x=exp.(-t)
x1=exp.(-2t)
p=plot(t,[x,x1],label=["exp(-t)" "exp(-2t)"])
xlabel!("t(s)")
ylabel!("x(t)")
savefig(p,"fig_Chap2_3_2.png")
display(p)