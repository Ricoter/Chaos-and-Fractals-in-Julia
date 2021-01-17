#= 

Implementation of the logistic map by Rico van Midde, 2021

The logistic map is a discrete 1-dimensional map in the form of a first order
quadratic difference equation. It was discovered in 1976 by Robert May when
he was modelling the population growth of biological species. The population
x at time t can have a value between 0 and 1.

                    x[t+1] = x[t] * r (1 - x[t])

The complex evolution of the map is chaotic and has a positive Lyapunov
exponent for most values r between 3.569.. and 4. There are, however, some
islands of stability in-between these values of r where the Lyapunov exponent
is not positive and the systems leaves the chaotic regime.
=#

Base.@kwdef mutable struct LogisticMap
    x::Float64 = 0.1
    r::Float64 = 3.8
end

function next!(l::LogisticMap)
    l.x *= l.r * (1 - l.x)
end

if isinteractive()
    """
        You can run this file to see an example
    """
    using Plots
    include("../Plots/Cobweb.jl")

    attractor = LogisticMap(r=3.9)      # Init logistic map variable
    x = [next!(attractor) for _=1:100]  # Evolve
    Cobweb(x, legend=false)             # Display a cobweb-plot

    x = 0:0.01:1                        # Add function mapping
    y = next!.(LogisticMap.(x, 3.9))
    plot!(x, y)

    # include("../Plots/Bifurcation.jl")
    # Bifurcation(LogisticMap, 0:0.1:4, 1000)
    default(
        xlim=(2,4),
        ylim=(0,1),
        legend=false,
        markersize= 0.1,
        alpha= 0.1,
    ); plot()

    bifdata = zeros(201,201)
    for r in 2:0.1:4
        a = LogisticMap(0.4,r)
        x = [next!(a) for _=1:1000][300:end]
        r = [r for _=1:length(x)]
        r = floor.(Int,(r .-2)*100) .+1
        x = floor.(Int,(x*100)) .+1
        for (ri, xi) in zip(r, x)
            bifdata[ri,xi] += 1
        end
        # plot_color!(pos, c=:blue, markeredge=false)
    end
    img  = plot_color(bifdata)
    plot(img)
end