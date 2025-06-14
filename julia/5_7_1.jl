using ControlSystems
using LinearAlgebra
using Plots


n = 10;
M = 1*Matrix(I,n,n);
K = 200*Matrix(I,n,n);

for i in 1:n-1
K[i,i+1]=-100;
K[i+1,i]=-100;
end

# Solve Eigenvalue problem
lambda, U = eigen(K,M);
fn = sqrt.(lambda)/(2pi);
println("Natural Freq. (Hz) =", fn')
println("Eigenvector")
display(U)

UU = [ zeros(1,n); U; zeros(1,n) ];
xx=[0:n+1];
p=plot(xx, UU[:,2], leg=false, lw=2,
dpi=600, xlabel="t(s)", ylabel="x" )
display(p)
savefig(p,"MDOF_MODE2.png")