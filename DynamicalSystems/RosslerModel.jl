#=

Implementation of the Rossler system by Rico van Midde, 2021

=#

Base.@kwdef mutable struct Rossler
    dt::Float64 = 0.02
    a::Float64 = 0.1
    b::Float64 = 0.1
    c::Float64 = 14
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end

function step!(r::Rossler)
    dx = - r.y - r.z;               r.x += r.dt * dx
    dy = r.x + r.a * r.y;           r.y += r.dt * dy
    dz = r.b + r.z * (r.x - r.c);   r.z += r.dt * dz
    return r.x, r.y, r.z
end