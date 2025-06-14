using ControlSystems
using Plots

T=tf([1],[1, 1, 10]) # x'' + x' + 10x = sin(t)
p=bodeplot(T)

savefig(p,"bode_plot.png")
display(p)