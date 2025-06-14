# CH 5_7_2


using ControlSystems
using LinearAlgebra
using Plots


n = 10;
nf = 1;
M = 1 * Matrix(I, n, n); # n x n 단위행렬
C = 2 * Matrix(I, n, n);
K = 200 * Matrix(I, n, n);

for i in 1:n-1
    C[i, i+1] = -1
    C[i+1, i] = -1
    K[i, i+1] = -100
    K[i+1, i] = -100
end

BF = [0 0 0 0 0 1 0 0 0 0]';

As = [zeros(n, n) I; -M\K -M\C]
Bs = [zeros(n, nf); M\BF]
Cs = [I zeros(n, n)]
Ds = zeros(n, nf)

Gs = ss(As, Bs, Cs, Ds)

t = 0:0.01:10;
F6 = 100 * sin.(4 * t)

z0 = zeros(2n)
y, t, x, uout = lsim(Gs, F6', t, x0=z0)
p = plot(t, y[6, :], leg=false, lw=2,
    grid=true, dpi=600,
    xlabel="t(s)", ylabel="x6")

display(p)
savefig(p, "MDOF_02_2.png")