# Chap8_4_1.jl

using LinearAlgebra

α(x)=6/5*(1-0.5*x^2)

n = 6;  # No. of elements
N = n + 1; # No. of nodes
h = 1/n; # element length

# Initialize
M = zeros(N,N);
K = zeros(N,N);

x=0:h:1;

# Assemble
for ie in 1:n
   xim = (x[ie]+x[ie+1])/2;
   αi = α(xim);
   M[ie:ie+1,ie:ie+1]=M[ie:ie+1,ie:ie+1]+αi*h*[1/3 1/6; 1/6 1/3];
   K[ie:ie+1,ie:ie+1]=K[ie:ie+1,ie:ie+1]+αi/h*[1 -1; -1 1];
end
K[n+1,n+1]=K[n+1,n+1]+0.2;

# Apply BC
Mr = M[2:N,2:N];
Kr = K[2:N,2:N];

println("Mass Matrix")
display(Mr)
println("Stiffness Matrix")
display(Kr)
val, vec = eigen(Kr,Mr);
println("Eigenvalue Matrix")
display(val)
println("Eigenvector Matrix")
display(vec)
