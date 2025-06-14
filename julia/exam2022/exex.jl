using DifferentialEquations
using Plots

# Define the ODE
function damped_oscillator!(du, u, p, t)
    m, c, k, f = p
    du[1] = u[2]
    du[2] = (1/m) * (f(t) - c * u[2] - k * u[1])
end

# Set up the initial conditions and parameters
u0 = [1.0, 0.0]
tspan = (0.0, 2.0)
m = 3.0
c = 7.0
k = 50.0

# Define the external force function f(t)
function f(t)
    F1 = 20 * (t) .* (t .>= 0) .* (t .< 0.5)
    F2 = -20 * (t .- 1) .* (t .>= 0.5) .* (t .< 1)
    F3 = 20 * (t .- 1) .* (t .>= 1) .* (t .< 1.5)
    F4 = -20 * (t .- 2) .* (t .>= 1.5) .* (t .< 2)
    return F1 + F2 + F3 + F4
end


# Solve the ODE
prob = ODEProblem(damped_oscillator!, u0, tspan, [m, c, k, f])
sol = solve(prob, Tsit5())

# Plot the solution
plot(sol, label=["x(t)", "x'(t)"], xlabel="Time (t)", ylabel="x(t) and x'(t)", lw=2)
