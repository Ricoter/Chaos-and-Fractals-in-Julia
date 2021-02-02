#=
Example of Bifurcation diagram en Cobweb-plots for various 1D maps
=#

using Plots

# include("../DynamicalSystems/SineMap.jl")
# include("../DynamicalSystems/TentMap.jl")
# include("../DynamicalSystems/LogisticMap.jl")

# include("../Plots/Cobweb.jl")
# include("../Plots/Bifurcation.jl")
using .ChaosAndFractals

const styles = Dict(
    # name          => (map, rspan)
    "Logistic Map"  => (LogisticMap, [3, 4]),
    "Sine Map"      => (SineMap, [.72, 1]),
    "Tent Map"      => (TentMap, [1, 2])
)

# Compare Cobweb-plots
for (name, (map, rspan)) ∈ styles

    r = 0.95 * rspan[2]                 # Some chaotic r-value
    attractor = map(r=r)                # Init map

    x = [next!(attractor) for _=1:200]  # Evolve
    Cobweb(x, legend=false, title=name) # Create Cobweb from time series

    # add xy mapping
    x = LinRange(0, 1, 1000)
    y = next!.(map.(x, r))

    display(plot!(x, y))
end


# Compare Bifurcation Diagrams
for (name, (map, rspan)) ∈ styles

    plt = Bifurcation(map, rspan=rspan, title=name)
    display(plt)
end

