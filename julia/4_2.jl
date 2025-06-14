# Chap4_2_1.jl

using LinearAlgebra

# 2*x1 - x2  = λ*x1
# -x1 + 2*x2 = λ*x2
# Kx = λMx

M=[1 0 ; 0 1]
K=[2 -1 ; -1 2]

val, vec = eigen(K,M)

display(val)
display(vec) # unit vector

# res = vec'*M*vec
# display(res)

# a = [1; 2]
# x = [3; 4]

# y =a*x'




