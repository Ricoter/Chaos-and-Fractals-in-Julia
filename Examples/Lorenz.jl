using Plots

include("../DynamicalSystems/LorenzAttractor.jl")
include("../DynamicalSystems/RosslerModel.jl")

styles = Dict(
    "Lorenz Attractor" => (Lorenz,  )
    "Rossler Model"    => (Rossler, )
)

x, y, z = 3 * randn(3) 
attractor = Lorenz(x=x,y=y,z=z)

# initialize a 3D plot with 1 empty series
plt = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    background = "Black",
    title = "Lorenz Attractor",
    marker = 2,
)

# build an animated gif by pushing new points to the plot, saving every 10th frame
@gif for i=1:1500
    step!(attractor)
    push!(plt, attractor.x, attractor.y, attractor.z)
end every 10