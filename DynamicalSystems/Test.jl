using Plots

include("SineMap.jl")
include("TentMap.jl")
include("LogisticMap.jl")
include("LorenzAttractor.jl")
include("../Plots/Bifurcation.jl")
# include("NBodySimulation.jl")

function tCobweb(attractor)    # Init logistic map variable
    include("../Plots/Cobweb.jl")

    x = [next!(attractor) for _=1:100]  # Evolve
    Cobweb(x, legend=false)             # Display a cobweb-plot

    # Add function mapping
    x = 0:0.01:1
    y = next!.(SineMap.(x, 0.99))
    display(plot!(x, y))
end


function tLorenz()
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
        label = "Euler Method"
    )

    # build an animated gif by pushing new points to the plot, saving every 10th frame
    @gif for i=1:1500
        step!(attractor)
        push!(plt, attractor.x, attractor.y, attractor.z)
    end every 10
end

function tBifurcation(
    attractor;
    rspan = [3,4],
    save=false
)

    plt = Bifurcation(
        attractor,
        rspan=rspan,
    )

    display(plt)
    if save!=false
        savefig(plt, save)
    end
end

# @time tCobweb(LogisticMap(r=3.9))
# @time tLorenz()
# @time tBifurcation(SineMap, rspan=[0.7, 1])
# @time tCobweb(SineMap(x=0.6,r=0.99))

@time tBifurcation(TentMap, rspan=[1,2])