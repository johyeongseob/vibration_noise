using LinearAlgebra


M = [10 0; 0 10]
K = [400 -200; -200 200]
val, vec = eigen(K, M)


display(val)
display(vec)

w1 = sqrt.(val[1])
w2 = sqrt.(52.9)

display(w1)
display(w2)