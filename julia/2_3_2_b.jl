# Chap2_3_2.jl


using LinearAlgebra

A=[1 1; -1+3im -1-3im]

b=[1; 0]

x=A\b

display(A)
display(b)
display(x)