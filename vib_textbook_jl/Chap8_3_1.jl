# Chap8_3_1.jl

using Roots
using Plots

f(y)=cos(y)+sin(y)/(3*y)
y=0.01:0.01:20
p=plot(y,f.(y))
display(p)

β=find_zeros(f,(0.1,20));
println("β = ", β')
