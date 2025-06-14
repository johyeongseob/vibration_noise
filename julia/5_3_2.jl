# Non homogeneous


using LinearAlgebra
using SymPy
using Plots


q1 = SymFunction("q1")
q2 = SymFunction("q2")
t = symbols("t")


M = [1 0; 0 1]
K = [2 -1; -1 2]
ω2, U = eigen(K, M)


#display(ω2);
ω = sqrt.(ω2);

#display(ω)
#display(U)

# Orthonormality check

#display(vec'*M*vec)
#display(vec'*K*vec)

# x domain -> q domain

x0 = [ 0, 0 ];
xd0 = [ 0, 0 ]
q0 = U'*M*x0;
qd0 = U'*M*xd0;
q10 = q0[1]; q20 = q0[2];
qd10 = qd0[1]; qd20 = qd0[2];

display(U')

diffeq=Eq(q1(t).diff(t,t)+q1(t),sin(1.5*t))
ics=((q1,0.0,q10),(q1',0.0,qd10))
res1=dsolve(diffeq,ics=ics)
display(res1)

diffeq2=Eq(q2(t).diff(t,t)+3*q2(t),sin(1.5*t))
ics=((q2,0.0,q20),(q2',0.0,qd20))
res2=dsolve(diffeq2,ics=ics)
display(res2)

#Back to original coordinates

x = U*[ res1.rhs, res2.rhs ]
display(x)
t=0:0.1:10

p2=plot(t,x[1],label="x1(t)")
p2=plot!(t,x[2],label="x2(t)")
display(p2)