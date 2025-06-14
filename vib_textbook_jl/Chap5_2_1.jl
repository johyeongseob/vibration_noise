# Chap5_2_1.jl

using LinearAlgebra

M=[1 0 ; 0 1]
K=[2 -1 ; -1 2]
val, vec = eigen(K,M)

display(val)
display(vec)
