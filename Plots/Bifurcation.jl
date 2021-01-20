#=
Implementation of bifuration diagram
Rico van Midde 2021
=#
include("../DynamicalSystems/LogisticMap.jl")

function scale(
    value;
    alim=[minimum(value), maximum(value)], 
    blim=[0,1],
    )
    
    value .-= alim[1]
    value .*= (diff(alim)/diff(blim))[1]
    value .+= blim[1]
    return value
end


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
    a = [attractor(r=r)
    x = [next!.(a) for _=1:iters+T][T+1:end]
    return scatter(r, x, kwargs...)
end

    
#     img = zeros(img_size)

#     for r in rspan
#         lm = attractor(r=r)
#         r = scale(
#             r, 
#             alim = [rspan[1],rspan[end]], 
#             blim = [1,img_size[1]]
#         )

#         for i=1:iters + T
#             x = scale(
#                 next!(lm), 
#                 alim = [0,1], 
#                 blim = [1,img_size[2]]
#             )

#             if i > T
#                 img[r,x] += 1
#             end
#         end

#     end
#     println(maximum(img))
#     # img = rotl90(img) .* 1
#     # img[img .== 0 ] .= -2
#     # plot_color(img)
#     img
# end
