#= 

Implementation of the Tent map by Rico van Midde, 2021

The tent map is a 1-dimensional map defined by

                     {  rx   for x < 1/2
            x[t+1] = { r-rx  for x >= 1/2
                             
For r ∈ {0,2} and x ∈ {0,1} and is chaotic for r > 1
=#

Base.@kwdef mutable struct TentMap
    x::Float64 = 0.6
    r::Float64 = 1.1
end

function next!(t::TentMap)
    t.x = t.x < .5 ? t.r * t.x : t.r * (1 - t.x)
end