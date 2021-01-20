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