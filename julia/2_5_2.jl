# Chap2_5_2.jl
# x'' + x = 0

using ControlSystems 
using Plots 

num = [1.0, 0] # 분자: s
den = [ 1, 0, 1 ] # 분모: s^2+1
Gs=tf(num,den); 

t=0:0.01:10; 
u = 0*t;
x0 = [0, 1.0]; # 초기조건: x(0) = 0, x'(0) = 1
y, t, x = lsim(Gs, u', t, x0=x0);

p=plot(t, x[1,:], leg=false, lw=2, grid=true, dpi=600, xlabel="t(s)", ylabel="x" )
display(p)