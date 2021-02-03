#=
Example: plots in Makie of 3D dynamical system
=#

# TODO make this into an animation

using .ChaosAndFractals, GLMakie, AbstractPlotting

# 
styles = Dict(
    "Henon Attractor"       => [Henon, (a=1.4, b=0.3)],
    "PWLDuffing Attractor"  => [PWLDuffing, (e=.25, i=-14, γ=.14 + im/20, ω=1, m0=-.0845, m1=.66)],
)

name = "Henon Attractor"
name = "PWLDuffing Attractor"

model, kwargs = styles[name]
attractor = model()#;kwargs...)
xy = [ChaosAndFractals.step!(attractor) for _=1:10000]
x = [x for (x,_) in xy]
y = [y for (_,y) in xy]

f = Figure()

lines(f[1:2,1], xy, markersize=0.5, color=(:blue, 0.8))
lines(f[1,2], x, axis = (ylabel = "x",), color=(:green, 0.8))
lines(f[2,2], y, axis = (ylabel = "y", xlabel= "t"), color=(:purple, 0.8))

Label(f[0,:], name, textsize = 45, color = (:black, 0.25))

f