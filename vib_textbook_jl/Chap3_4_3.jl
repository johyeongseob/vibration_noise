# Chap3_4_3.jl

using Plots

zt_list = 0.0:0.01:1.2
Nz = length(zt_list)
x1 = zeros(Nz)
y1 = zeros(Nz)
x2 = zeros(Nz)
y2 = zeros(Nz)

i = 1
for zt in zt_list
    global i, s1, s2
    println(zt)
    s1 = -zt + sqrt(complex(zt^2-1))
    s2 = -zt - sqrt(complex(zt^2-1))
    x1[i] = real(s1)
    y1[i] = imag(s1)
    x2[i] = real(s2)
    y2[i] = imag(s2)
    i = i + 1
end

p=plot(x1,y1, 
    leg=false, box=:on, lw=2, grid=true, dpi=600,
    xlabel="Real(s)", ylabel="Imag(s)")
p=plot!(x2,y2, lw=2)
display(p)
savefig(p,"Fig_Chap3_4_3.png")
