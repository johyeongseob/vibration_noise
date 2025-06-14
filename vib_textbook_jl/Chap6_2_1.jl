# Chap6_2_1.jl

using Plots
using SpecialFunctions

x=0:0.01:10
u=besselj0.(x)
p=plot(x,u, leg=false, box=:on, lw=2, grid=true, dpi=600, xlabel="x", ylabel="J0(x)")
display(p)
