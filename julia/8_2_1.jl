# Chap8_2_1.jl
# AMM(Assumed Modes Method)

using QuadGK
using LinearAlgebra


f(x,i)=sin((2i-1)/2*pi*x) # ϕ, L = 1
df(x,i)=(2i-1)/2*pi*cos((2i-1)/2*pi*x)
N = 1; # 값이 클수록 근사가 잘됨
M = zeros(N,N);
K = zeros(N,N);

m = 1;
k = 0.2;

for i in 1:N
    for j in 1:N
        local res, err
        mij(x)=6/5*(1-0.5*x^2)*f(x,i)*f(x,j) # + m*f(1,i)*f(1,j) # M = 1
        kij(x)=6/5*(1-0.5*x^2)*df(x,i)*df(x,j) +k*f(1,i)*f(1,j) # K = 0.2
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
display(val) # 첫 번째 값이 lamda1 = sqrt(lamda1) = natural frequency (rad) -> *1/2π = (Hz)
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