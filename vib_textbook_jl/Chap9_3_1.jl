# Chap9_3_1.jl

using Plots

# uncontrolled
g(r) = abs(1/(1-r^2));

# controlled
f(r) = abs((1-r^2)/((1+0.1-r^2)*(1-r^2)-0.1));

# trimming function 
function trim(f; val=8)
    r -> f(r) > val ? NaN : f(r)
end

# plot trimed datas
p = plot(trim(f),0.1,2, lw=2)
p = plot!(trim(g),0.1,2, lw=2, line=(:dot,3))
p = plot!(leg=false, box=:on, lw=2, grid=true, dpi=600, xlabel="r", ylabel="|X/f0|" )
display(p)
savefig(p,"Fig_Chap9_3_1.png")
