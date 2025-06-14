# Chap5_2_1.jl

using LinearAlgebra

m = [5, 6, 7]
j = 0.5
k = [400, 300, 200, 300, 100]
r = 0.2


M = [m[1] 0 0; 0 m[2] 0; 0 0 j+m[3]*r^2]
K = [k[1]+k[2]+k[5] -k[2] -k[5]*r; -k[2] k[2]+k[3]+k[4] 0; -k[5]*r 0 k[5]*r*r]

val, vec = eigen(K, M)

for i in 1:3
    frequency[i] = sqrt(val[i]) / (2 * pi)
end

display(frequency) # should be written in ascending order
display(vec)

# display(vec'*M*vec)
# display(vec'*K*vec)