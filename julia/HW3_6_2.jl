using ControlSystems
using Plots
m = 100; k = 10000; c = 20; F0 = 1000; ω = 5;

G=tf([1],[m, c, k])
w=range(0.1,100,length=1001)

mag, phase, w = bode(G, w)

p=plot(w,20*log10.(mag[:,1,1]), leg=false, box=:on, lw=2, grid=true, dpi=600,
xaxis=:log, xlabel="ω (rad/s)", ylabel="G(dB)" )

display(p)

savefig(p,"Fig_Chap3_6_2_mag.png")

p2=plot(w,phase[:,1,1], leg=false, box=:on, lw=2, grid=true, dpi=600, xaxis=:log,
xlabel="ω (rad/s)", ylabel="ϕ (deg)")

display(p2)

savefig(p2,"Fig_Chap3_6_2_phase.png")