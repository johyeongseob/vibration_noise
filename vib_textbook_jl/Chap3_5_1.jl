# Chap3_5_1.jl

m = 1; k = 10; F0 = 5; ω = 2;
 
f0 = F0/k;
ωn = sqrt(k/m);
 
X = f0/(1-(ω/ωn)^2)

print("X = ")
println(X)
