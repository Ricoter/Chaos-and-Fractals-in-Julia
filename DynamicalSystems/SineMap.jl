#= 

Implementation of the sine map by Rico van Midde, 2021

Just like the Logistic Map, the sine map is an 1D unimodal mapping.

                    x[t+1] = r sin(pi*x[t])

The evolution of the map is chaotic and has a positive Lyapunov
exponent for most values r between 0.8.. and 1. The qualitative
dynamics of any unimodal map is identical, this proved to 
Metropolis thay the only the shape of the map matters and not 
the algebraic form of f(x)
=#

Base.@kwdef mutable struct SineMap
    x::Float64 = 0.6
    r::Float64 = 0.9
end

function next!(s::SineMap)
    s.x *= (s.r / s.x) * sin(π * s.x)
end