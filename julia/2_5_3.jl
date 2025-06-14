# Chap2_5_3.jl
# x'' + 3x' + 2x = 0

using ControlSystems 
using Plots 

num = [1.0, 3] # 분자: s + 3
den = [ 1, 3, 2 ] # 분모: s^2 + 3s + 2
Gs=tf(num,den); 

t=0:0.01:10; 
u = 0*t;
x0 = [1.0, 0]; # 초기조건: x(0) = 1, x'(0) = 0
y, t, x = lsim(Gs, u', t, x0=x0);

p=plot(t, x[1,:], leg=false, lw=2, grid=true, dpi=600, xlabel="t(s)", ylabel="x" )
display(p)