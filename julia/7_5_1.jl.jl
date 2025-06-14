# Chap7_5_1.jl

using Roots
using Plots


f(y) = cos(y) + 1 / cosh(y)
y = 0:0.01:10
p = plot(y, f.(y))

display(p)

βL = find_zeros(f, (0, 10));
println("βL = ", βL')

σ = -(sin(βL[1]) + sinh(βL[1])) / (cos(βL[1]) + cosh(βL[1]));
x = 0:0.01:1;

W = sin.(βL[1] * x) - sinh.(βL[1] * x) + σ * (cos.(βL[1] * x) - cosh.(βL[1] * x))
p1 = plot(x, W, lw=2, leg=false, grid=true, dpi=600, xlabel="x/L", ylabel="W1")

display(p1)
savefig(p1, "Fig_Chap7_5_1_mode1.png")

σ2 = -(sin(βL[2]) + sinh(βL[2])) / (cos(βL[2]) + cosh(βL[2]));
x = 0:0.01:1;

W2 = sin.(βL[2] * x) - sinh.(βL[2] * x) + σ2 * (cos.(βL[2] * x) - cosh.(βL[2] * x))
p2 = plot(x, W2, lw=2, leg=false, grid=true, dpi=600, xlabel="x/L", ylabel="W2")

display(p2)
savefig(p2, "Fig_Chap7_5_1_mode2.png")