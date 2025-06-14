# 3.5 조화기진력에 의한 비감쇠 진동계의 강제진동

# Chap3_5_1.jl 

using Plots

m = 10; k=1000; F0 = 100; w =1;

f0 = F0/k
wn = sqrt(k/m);
r = w/wn

t=0:0.01:10

xp = (f0/(1-r^2))*sin.(w*t)
p=plot(t,xp,label="x(t)")

savefig(p,"Fig_Chap3_5_1.png")

display((f0/(1-r^2)))
display(p)
