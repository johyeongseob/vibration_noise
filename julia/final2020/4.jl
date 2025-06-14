#Chap5_5_1.jl


using LinearAlgebra
using ControlSystems
using Plots


# Input Data
N = 3 # DOF
# define mass, damping, and stiffness matrices
M = [2 0 0; 0 1 0; 0 0 3];
C = [2 -1 0; -1 3 -2; 0 -2 5];
K = [50 -30 0; -30 60 -30; 0 -30 70];

# Form state-space equation
As = [zeros(N, N) I; -inv(M)*K -inv(M)*C];
Bs = [zeros(N, N); inv(M)];
Cs = [I zeros(N, N)]; # 변위 계측
Ds = zeros(N, N);

G = ss(As, Bs, Cs, Ds);

# Simulation
t = 0:0.01:10;
Nt = length(t);
x0 = [0, 0, 0]; # Initial condition
v0 = [0, 0, 0];
z0 = [x0; v0];

F1 = 0 * t; # excitation force
F2 = 150 * (50 * t .* (t .< 2) .+ ((-50 * t .+ 200) .* ((2 .< t) .& (t .< 4))));
F3 = 0 * t;
F = [F1 F2 F3];

y, t, x, uout = lsim(G, F', t, x0=z0);


p = plot(t, y', lw=2, grid=true, dpi=600, xlabel="t(s)",
    ylabel="Displacement(m)", labels=["x1" "x2" "x3"])
display(p)