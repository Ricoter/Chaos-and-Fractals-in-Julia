#=
Implementation of bifuration diagram
Rico van Midde 2021
=#

function Bifurcation(
    attractor,  # 1d variable
    range,      
    i,       # i 
    T=300,      # thermolization
    )

    plot()
    for r in range
        x = next!(attractor(lims, r))[300:end]
        plot!(repeat(r, inner=length(x)), x)
    end
end