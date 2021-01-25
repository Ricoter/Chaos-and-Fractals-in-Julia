#=
Simple example to show a 3d attractor in a combined plot.
=#


# TODO add titles
# TODO combine models
# TODO make this into an animation


using GLMakie, AbstractPlotting

include("../DynamicalSystems/LorenzAttractor.jl")
include("../DynamicalSystems/RosslerModel.jl")

styles = Dict(
    "Lorenz Attractor" => [Lorenz, (σ=10, β=8/3, ρ=28)],
    "Rossler Model"    => [Rossler, (a=0.1, b=0.1, c=14)]
)

dt = 0.01
name = "Lorenz Attractor"
name = "Rossler Model"

model, kwargs = styles[name]
attractor = model(dt=dt; kwargs...)
xyz = [step!(attractor) for _=1:20000]
x = [x for (x,_,_) in xyz]
y = [y for (_,y,_) in xyz]
z = [z for (_,_,z) in xyz]

f = Figure()

lines(f[1:3,1], xyz, markersize=0.5, color=:blue)
lines(f[1,2], x)
lines(f[2,2], y)
lines(f[3,2], z)

f