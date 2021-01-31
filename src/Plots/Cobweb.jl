#=
Implementation of a cobweb-plot by Rico van Midde, 2021
=#

function Cobweb(x::Array; kwargs...)
    x = repeat(x, inner=2)      # Create doubles
    x1 = x[1:end-1]
    x2 = [0; x[3:end]]

    lims = [floor(minimum(x)), ceil(maximum(x))]
    default(
        xlims = lims,
        ylims = lims,
        markersize=2,
    )

    plot(x1, x2; kwargs...)
    plot!(lims, lims)#, label = "x = y")
end

function Cobweb!(x::Array, args...)
    x = repeat(x, inner=2)      # Create doubles
    x1 = x[1:end-1]
    x2 = [0; x[3:end]]

    plot!(x1, x2, args...)
end