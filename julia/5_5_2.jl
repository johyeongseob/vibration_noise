# Chap5_5_2.jl


using LinearAlgebra
using ControlSystems
using Plots

# Input Data
N = 2 # DOF
m1=m2=1;
c1=c2=c3=0.05;
k1=k2=k3=1;

# define mass, damping, and stiffness matrices
M=[m1 0 ; 0 m2];
C=[c1+c2 -c2; -c2 c2+c3];
K=[k1+k2 -k2; -k2 k2+k3];
Bf=[1; 0]

# Solve Eigenvalue problem
lambda, U = eigen(K,M);
fn = sqrt.(lambda)/(2pi);
println("Natural Freq. (Hz) =", fn')
println("Eigenvector")
display(U)

# Form state-space equation
As = [zeros(N,N) I; -inv(M)*K -inv(M)*C];
Bs = [zeros(N,1); inv(M)*Bf];
Cs = [1 0 0 0];
Ds = [0];
G=ss(As,Bs,Cs,Ds);

# Bode Diagram
w=range(0.1,3,length=1001)
mag1, phase1, w = bode(G, w)
p=plot(w, 20*log10.(mag1[1,1,:]), leg=false, box=:on, lw=2, grid=true, dpi=600, xlabel="ω (rad/s)", ylabel="X1/F(dB)" )
display(p)
savefig(p,"Fig_Chap5_5_2.png")