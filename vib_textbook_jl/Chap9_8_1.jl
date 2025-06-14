# Chap9_8_1.jl

using ControlSystems
using Plots

# system parametersH
ωn = sqrt(10)
ζ = 0.02

# VTMD controller parameters
ωa = ωn
ζa = 0.3
μ = 0.1

# Uncontrolled system
Ga = tf([ωn^2,0,0],[1, 2*ζ*ωn, ωn^2])

# VTMD controller
H = -(μ/ωn^2)*tf([2*ζa*ωa, ωa^2],[1, 2*ζa*ωa, ωa^2])

w = range(1,10,length=1001)
mag, phase, w = bode(H, w)
p = bodeplot(H,w,lw=2,label="H")
display(p)

# Closed-loop FRF
Gc = feedback(Ga,-H)
p1 = bodeplot(Ga,w,lw=2,label="G")
p1 = bodeplot!(Gc,w,lw=2,label="Gc")
display(p1)
savefig(p1,"Fig_Chap9_8_1_FRF_VTMD.png")
