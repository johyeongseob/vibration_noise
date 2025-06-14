# Chap2_6_3.jl

using ControlSystems 
using Plots 

num = 1.0  # 분자: 1
den = [ 1, 2, 10 ]  # 분모: s^2 + 2s + 10
Gs=tf(num,den); # 전달함수: "과속방지턱에 의한 충격"에서 "차의 서스펜션 반응"으로의 변화를 설명

t=0:0.01:10; 
u = (t.<2).*sin.(0.5*pi*t); # 사인 파 형태의 힘(또는 외부 충격)이 가해지는 것
p1 = plot(t,u, leg=false, lw=2, grid=true, dpi=600, xlabel="t(s)", ylabel="f" )  # 입력
display(p1) 
x0 = [1.0,0];  # 초기조건: x(0) = 1, x'(0) = 0
y, t, x = lsim(Gs,u',t,x0=x0); # lsim은 "Linear Simulation"의 줄임말로, 선형 시스템의 시뮬레이션을 수행하는 함수

p=plot(t,x[1,:], leg=false, lw=2, grid=true, dpi=600, xlabel="t(s)", ylabel="x" ) # 출력
display(p)

savefig(p1,"Fig_Chap2_6_3a.png")
savefig(p,"Fig_Chap2_6_3b.png")