# Chap3_7_2.jl


using ControlSystems
using Plots


w=range(0.1,3,length=1001)

ζ=0.01;
G1=tf(-[2ζ, 1, 0, 0],[1, 2ζ, 1])
mag1, phase1, w = bode(G1, w)

ζ=0.1;
G2=tf(-[2ζ, 1, 0, 0],[1, 2ζ, 1])
mag2, phase2, w = bode(G2, w)

ζ=0.3;
G3=tf(-[2ζ, 1, 0, 0],[1, 2ζ, 1])
mag3, phase3, w = bode(G3, w)

ζ=0.5;
G4=tf(-[2ζ, 1, 0, 0],[1, 2ζ, 1])
mag4, phase4, w = bode(G4, w)

ζ=1.0;
G5=tf(-[2ζ, 1, 0, 0],[1, 2ζ, 1])
mag5, phase5, w = bode(G5, w)

p1=plot(w,20*log10.(mag1[1,1,:]),box=:on, lw=2, grid=true, dpi=600,
label="ζ=0.01", xlabel="ω/ωn", ylabel="X/Y(dB)" )

p1=plot!(w,20*log10.(mag2[1,1,:]), lw=2, label="ζ=0.1")
p1=plot!(w,20*log10.(mag3[1,1,:]), lw=2, label="ζ=0.3")
p1=plot!(w,20*log10.(mag4[1,1,:]), lw=2, label="ζ=0.5")
p1=plot!(w,20*log10.(mag5[1,1,:]), lw=2, label="ζ=1.0")
display(p1)
savefig(p1,"Fig_Chap3_7_2.png")