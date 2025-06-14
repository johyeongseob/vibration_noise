# Chap9_5_1.jl

using DifferentialEquations
using Plots

function SMD_unc(dx,x,p,t)
    y = 0.1*sin.(pi*t/2).*(t.<2)
    yd = 0.1*pi/2*cos.(pi*t/2).*(t.<2)
    dx[1] = x[2]
    dx[2] = -10*(x[1]-y) - (x[2]-yd)
end

function SMD_sky(dx,x,p,t)
    y = 0.1*sin.(pi*t/2).*(t.<2)
    yd = 0.1*pi/2*cos.(pi*t/2).*(t.<2)
    Cmax = 10;
    Cmin = 1;
    Csky = 3;
    Dum = Csky*x[2]/(x[2]-yd);
    if Dum>=0.0
        C = max(Cmin,min(Dum,Cmax));       
    else
        C = Cmin;
    end
    dx[1] = x[2]
    dx[2] = -10*(x[1]-y) - C*(x[2]-yd)
end

x0 = [0.0; 0.0]
tspan = (0.0,10.0)

prob_unc = ODEProblem(SMD_unc,x0,tspan)
solu = solve(prob_unc)

prob_sky = ODEProblem(SMD_sky,x0,tspan)
solc = solve(prob_sky)

p=plot(solu,vars=(0,1),leg=false,box=:on,lw=2,grid=true,dpi=600, xaxis="t(s)",yaxis="x(m)")
p=plot!(solc,vars=(0,1),lw=2,dpi=600,xaxis="t(s)",yaxis="x(m)")
display(p)
savefig(p,"Fig_Chap9_5_1_Resp_Sky_Hook.png")

tt=0:0.01:10;
yb = 0.1*sin.(pi*tt/2).*(tt.<2);
p1=plot(tt,yb,leg=false,box=:on,lw=2,grid=true,dpi=600, xaxis="t(s)",yaxis="y(m)")
display(p1)
savefig(p1,"Fig_Chap9_5_1_y_Sky_HookHook.png")
