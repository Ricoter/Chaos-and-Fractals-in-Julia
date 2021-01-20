#=
Implementation of bifuration diagram
Rico van Midde 2021
=#
include("../DynamicalSystems/LogisticMap.jl")
include("../DynamicalSystems/SineMap.jl")

function Bifurcation(
    attractor;              # Struct of the 1D system that has a next! function
    rspan = [3,4],          # Range of the variable
    n_samples = 1000,       # n samples
    T=100,                  # Number op iterations before Thermolization of the system
    iters=200,              # Number of iteration after Thermolization
    kwargs...)              # keyword aruments to pass to Plots

    default(                # Default keyword arguments
        legend=false,
        markersize=1,
        markerstrokewidth=0,
        alpha=0.1,
        color=:blue
    )

    r = LinRange(rspan[1], rspan[2], n_samples)
    a = attractor.(0.6,r)
    x = [next!.(a) for _=1:iters+T][T+1:end]
    return scatter(r, x, kwargs...)
end