#Chap5_5_1.jl


using LinearAlgebra
using ControlSystems
using Plots


# Input Data
N = 2 # DOF
m1 = m2 = 1;
c1 = c2 = c3 = 0.05;
k1 = k2 = k3 = 1;

# define mass, damping, and stiffness matrices
M = [m1 0; 0 m2];
C = [c1+c2 -c2; -c2 c2+c3];
K = [k1+k2 -k2; -k2 k2+k3];

# Solve Eigenvalue problem
lambda, U = eigen(K, M);
fn = sqrt.(lambda) / (2pi);

println("Natural Freq. (Hz) =", fn')
println("Eigenvector")
display(U)

# Form state-space equation
As = [zeros(N, N) I; -inv(M)*K -inv(M)*C];
Bs = [zeros(N, N); inv(M)];
Cs = [I zeros(N, N)]; # 변위 계측
Ds = zeros(N, N);

G = ss(As, Bs, Cs, Ds);


# Simulation
t = 0:0.01:10;
Nt = length(t);
x0 = [1, 0]; # Initial condition
v0 = [0, 0];
z0 = [x0; v0];

F1 = 0 * t; # excitation force
F2 = sin.(1.5t);

# F1 = 10*(t .< 2); # excitation force
# F2 = 0*t;
F = [F1 F2];

y, t, x, uout = lsim(G, F', t, x0=z0);

#p1 = plot(t, F1)
#display(p1)

p = plot(t, y', lw=2, grid=true, dpi=600, xlabel="t(s)",
    ylabel="Displacement(m)", labels=["x1" "x2"])
display(p)

savefig(p, "Fig_5_5_1.png")