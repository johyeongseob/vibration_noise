# HW3_6_1.jl

m = 100; k = 10000; c = 20; F0 = 1000; ω = 20;
f0 = F0/k;
ωn = sqrt(k/m);
ζ = c/(2*m*ωn);
r = ω/ωn
G=1/sqrt((1-r^2)^2+(2ζ*r)^2);
ϕ=atan(2ζ*r,1-r^2);
X=f0*G

print("X = ")
println(X)

print("ϕ = ")
println(ϕ)

