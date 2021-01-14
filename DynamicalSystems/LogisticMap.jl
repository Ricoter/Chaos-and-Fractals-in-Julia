#=
Implementation of the Logistic Map which is a 
simplistic toymodel of discrete chaos in 1 dimension
Rico van Midde 2021
=#

Base.@kwdef mutable struct LogisticMap
    x::Float64 = 0.1
    r::Float64 = 3.8
end

function next!(l::LogisticMap)
    l.x *= l.r * (1 - l.x) 
end

if isinteractive()
    using Plots
    attractor = LogisticMap()
    x = [next!(attractor) for _=1:100]
    
    x = [([[e, e] for e ∈ x]...)...]
end