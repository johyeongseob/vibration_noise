using LinearAlgebra

# case 1

A = [1 1; 1 -1]
b = [2; 1]

x = A\b
x2 = inv(A)*b

display(x)
display(x == x2)
