#=

Implementation of the Rossler system by Rico van Midde, 2021

=#
export Rossler, step!

Base.@kwdef mutable struct Rossler
    dt::Float64 = 0.02

    # position variables
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1

    # parameters
    a::Float64 = 0.1
    b::Float64 = 0.1
    c::Float64 = 14
end

function step!(r::Rossler)
    # differences
    dx = -r.y - r.z
    dy = r.x + r.a * r.y
    dz = r.b + r.z * (r.x - r.c)

    # update
    r.x += r.dt * dx
    r.y += r.dt * dy
    r.z += r.dt * dz
    return r.x, r.y, r.z
end