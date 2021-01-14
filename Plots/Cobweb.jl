#=
Implementation of cobweb plot
Rico van Midde 2021
=#

function cobweb(x::Array)
    x1 = x[begin:end-1]
    x2 = [0, x[3:end]...]
    limits = [floor(minimum(x)), ceil(maximum(x))]
    plot(x1,x2, xlims=lims, ylims=lims)
    plot!([0,1], [0,1], label = "x == y")
end

function cobweb!(x::Array)
    x1 = x[begin:end-1]
    x2 = [0, x[3:end]...]
    lims = [floor(minimum(x)), ceil(maximum(x))]
    plot!(x1,x2, xlims=lims, ylims=lims)
    # plot!([0,1], [0,1], label = "x == y")
end