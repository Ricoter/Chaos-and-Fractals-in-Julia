using Plots, Random

include("../DynamicalSystems/LorenzAttractor.jl")
include("../DynamicalSystems/RosslerModel.jl")

styles = Dict(
    "Lorenz Attractor" => (Lorenz,  (a=0.1, b=0.1, c=14)),
    "Rossler Model"    => (Rossler, (σ=10, β=8/3, ρ=28))
)

dt = 0.02
attractor = Lorenz(dt=dt)



# l = @layout([a [b; c; d]])



# initialize a 3D plot with 1 empty series
p1 = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    background = :Black,
    title = "Lorenz Attractor",
    marker = 2,
)


# build an animated gif by pushing new points to the plot, saving every 10th frame
@gif for i=1:50


    l = @layout([a [b; c; d]])


    plt = plot(layout = l, st = [:p1 :line :line :line], leg = false, ticks = nothing, border = :none)
    
    
    step!(attractor)

    xyz = [attractor.x, attractor.y, attractor.z]

    plot3d!(xyz, subplot = plt[1])

    plot!(xyz)
    # for j =1:3
    #     plot!([xyz[j]], subplot =plt[j])
    # end

end every 10