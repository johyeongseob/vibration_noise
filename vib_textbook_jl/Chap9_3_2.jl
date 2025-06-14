# Chap9_3_2.jl

using LinearAlgebra
using ControlSystems
using Plots

# Input Data
N = 2 # DOF
ωn=1;
ωa=1;
μ=0.1;
ζ=0.01;
ζa_data = [ 0.01, 0.1, 0.2]
w=range(0.1,2,length=1001);

# System without DVA
G1 = tf([ωn^2],[1, 2ζ*ωn, ωn^2]);
mag1, phase1, w = bode(G1, w)
p=plot(w,20*log10.(mag1[:,1,1]), label="w/o DVA", box=:on, lw=2, grid=true, dpi=600, xlabel="ω (rad/s)", ylabel="X/F(dB)"  )

labellist = ["ζa=0.01","ζa=0.1","ζa=0.2"]
for idata in 1:3
    global ζa, M, C, K, Bf, p, As, Bs, Cs, Ds, G, mag2, phase2, w
    ζa=ζa_data[idata];

    # define mass, damping, and stiffness matrices
    M=[1 0 ; 0 1];
    C=[2ζ*ωn -2*μ*ζa*ωa; -2ζa*ωa 2ζa*ωa];
    K=[ωn^2+μ*ωa^2 -μ*ωa^2; -ωa^2 ωa^2];
    Bf=[ωn^2; 0]

    # Form state-space equation
    As = [zeros(N,N) I; -inv(M)*K -inv(M)*C];
    Bs = [zeros(N,1); inv(M)*Bf];
    Cs = [1 0 0 0];
    Ds = [0];

    G=ss(As,Bs,Cs,Ds);

    # Bode Diagram
    mag2, phase2, w = bode(G, w)
    p=plot!(w,20*log10.(mag2[:,1,1]), lw=2, label=labellist[idata])
end

display(p)
savefig(p,"Fig_Chap9_3_2.png")
