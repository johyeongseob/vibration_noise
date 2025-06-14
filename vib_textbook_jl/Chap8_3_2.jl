# Chap8_3_2.jl

using QuadGK
using LinearAlgebra
using Roots

# compute β
char_fcn(y)=cos(y)+sin(y)/(3*y)
β=find_zeros(char_fcn,(0.1,20));
println("β = ", β')

# comparison function
f(x,i,β)=sin(β[i]*x)
df(x,i,β)=β[i]*cos(β[i]*x)
ddf(x,i,β)=-β[i]^2*sin(β[i]*x)

N = 3; 

# define mass, damping, and stiffness matrices
M = zeros(N,N);
K = zeros(N,N);

for i in 1:N
    for j in 1:N
        local res, err
        mij(x)=(1-0.5*x^2)*f(x,i,β)*f(x,j,β)
        kij(x)=-(1-0.5*x^2)*f(x,i,β)*ddf(x,j,β)+x*f(x,i,β)*df(x,j,β)
        res, err = quadgk(mij, 0, 1);
        M[i,j]=res;
        res, err = quadgk(kij, 0, 1);
        K[i,j]=res;
    end
end

println("Mass Matrix")
display(M)
println("Stiffness Matrix")
display(K)

# Solve Eigenvalue problem
val, vec = eigen(K,M);
println("Eigenvalue Matrix")
display(val)
println("Eigenvector Matrix")
display(vec)
