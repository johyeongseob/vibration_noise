# HW 5_5


using ControlSystems
using LinearAlgebra
using Plots


n = 10;
nf = 2; # 힘이 두개여서 nf는 2
M = 1 * Matrix(I, n, n);
C = 2 * Matrix(I, n, n);
K = 200 * Matrix(I, n, n);

for i in 1:n-1
    C[i, i+1] = -1
    C[i+1, i] = -1
    K[i, i+1] = -100
    K[i+1, i] = -100
end

BF = [0 1 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 1 0 0 0]'; # 힘이 두개여서 10x2행렬

As = [zeros(n, n) I; -M\K -M\C]
Bs = [zeros(n, nf); M \ BF]
Cs = [I zeros(n, n)]
Ds = zeros(n, nf)

Gs = ss(As, Bs, Cs, Ds)

t = 0:0.01:10;
F2 = 100 * sin.(4 * t)
F7 = 20 * sin.(2 * t)
#p1 = plot(t,F6, leg=false, lw=2,
#grid=true,dpi=600,
#xlabel="t(s)", ylabel="F" )

#display(p1)

z0 = zeros(2n)
F = [F2 F7]; # [F2, F7] 처럼 괄호 사이에 ,가 들어가면 오류가 생김
y, t, x, uout = lsim(Gs, F', t, x0=z0)
p = plot(t, y[6, :], leg=false, lw=2, # 6번째 질량 변위를 봄
    grid=true, dpi=600,
    xlabel="t(s)", ylabel="x6")

display(p)
savefig(p, "HW5_5.png")