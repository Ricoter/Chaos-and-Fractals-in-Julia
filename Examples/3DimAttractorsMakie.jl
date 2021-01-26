#=
Example: plots in Makie of 3D dynamical system
=#

# TODO make this into an animation

using GLMakie, AbstractPlotting

include("../DynamicalSystems/LorenzAttractor.jl")
include("../DynamicalSystems/RosslerModel.jl")

# 
styles = Dict(
    "Lorenz Attractor" => [Lorenz, (σ=10, β=8/3, ρ=28)],
    "Rossler Model"    => [Rossler, (a=0.1, b=0.1, c=14)]
)

dt = 0.02
name = "Lorenz Attractor"
# name = "Rossler Model"

model, kwargs = styles[name]
attractor = model(dt=dt; kwargs...)
xyz = [step!(attractor) for _=1:10000]
x = [x for (x,_,_) in xyz]
y = [y for (_,y,_) in xyz]
z = [z for (_,_,z) in xyz]

f = Figure()

lines(f[1:3,1], xyz, markersize=0.5, color=(:blue, 0.8))
lines(f[1,2], x, axis = (ylabel = "x",), color=(:green, 0.8))
lines(f[2,2], y, axis = (ylabel = "y",), color=(:purple, 0.8))
lines(f[3,2], z, axis = (ylabel = "z", xlabel = "t"), color=(:red, 0.8))

Label(f[0,:], name, textsize = 45, color = (:black, 0.25))

f