#=

Implementation of the Hénon system by Rico van Midde, 2021


"The Hénon map , sometimes called Hénon-Pomeau attractor/map, is a discrete-time dynamical system. 
It is one of the most studied examples of dynamical systems that exhibit chaotic behavior. 
The Hénon map takes a point (xn, yn) in the plane and maps it to a new point. 

                            {x[t+1] = 1 - a * x[t]^2 + y[t]
                            {y[t+1] = b * x[t]

The map depends on two parameters, a and b, which for the classical Hénon map have values of a = 1.4 and b = 0.3. 
For the classical values the Hénon map is chaotic. For other values of a and b the map may be chaotic, intermittent, 
or converge to a periodic orbit. An overview of the type of behavior of the map at different parameter values may be 
obtained from its orbit diagram." ~ (wikipedia)
=#

# TODO Add examples and test

Base.@kwdef mutable struct Henon
    dt::Float64 = 0.02
    a::Float64 = 1.4
    b::Float64 = 0.3
    x::Float64 = 1
    y::Float64 = 1
end

function step!(h::Henon)
    dx = 1 - h.a * h.x^2 + h.y;     h.x += h.dt * dx
    dy = h.b * h.x;                 h.y += h.dt * dy
    return h.x, h.y
end