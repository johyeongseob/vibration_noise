# Chap8_2_1.jl

using QuadGK
using LinearAlgebra

f(x,i)=sin((2i-1)/2*pi*x)
df(x,i)=(2i-1)/2*pi*cos((2i-1)/2*pi*x)
N = 4;

M = zeros(N,N);
K = zeros(N,N);

for i in 1:N
    for j in 1:N
        local res, err
        mij(x)=6/5*(1-0.5*x^2)*f(x,i)*f(x,j)
        kij(x)=6/5*(1-0.5*x^2)*df(x,i)*df(x,j)+0.2*f(1,i)*f(1,j)
        res, err = quadgk(mij, 0, 1);
        M[i,j]=res;
        res, err = quadgk(kij, 0, 1);
        K[i,j]=res;
    end
end

println("M = ")
display(M)
println("K = ")
display(K)

val, vec = eigen(K,M);
println("val = ")
display(val)
println("vec = ")
display(vec)

Mb=vec'*M*vec
Kb=vec'*K*vec
println("Mb = ")
display(Mb)
println("Kb = ")
display(Kb)

Norm = zeros(N,N)
for i in 1:N
  Norm[i,i] = 1.0/sqrt(Mb[i,i]);
end
Un = vec*Norm;
Mbn=Un'*M*Un
Kbn=Un'*K*Un
println("Mbn = ")
display(Mbn)
println("Kbn = ")
display(Kbn)
