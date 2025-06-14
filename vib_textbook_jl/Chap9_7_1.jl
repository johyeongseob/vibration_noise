# Chap9_7_1.jl

using ControlSystems
using Plots

# system parameters
ωn = sqrt(10)
ζ = 0.02

# controller parameters
ωf = ωn
ζf = 0.3
g = 0.1

# Uncontrolled system
G = tf([ωn^2],[1, 2*ζ*ωn, ωn^2])

# PPF controller
H = -g*tf([ωf^2],[1, 2*ζf*ωf, ωf^2])

w = range(1,20,length=1001)
mag, phase, w = bode(H, w)
p = bodeplot(H,w,lw=2,label="H")
display(p)

# Closed-loop FRF
Gc = feedback(G,H)
p1 = bodeplot(G,w,lw=2,label="G(Unc)") 
p1 = bodeplot!(Gc,w,lw=2,label="Gc(Con)")
display(p1)
savefig(p1,"Fig_Chap9_7_1_FRF_PPF.png")

# Impulse response
y,t,x = impulse(G,10)
yc,tc,xc = impulse(Gc,10)
p3 = plot(t,x[1,:],lw=2,label="Uncontrolled", xlabel="t(s)", ylabel="x(m)")
p3 = plot!(tc,xc[1,:],lw=2,label="PPF Control")
display(p3)
savefig(p3,"Fig_Chap9_7_1_Impulse_Resp_PPF.png")
