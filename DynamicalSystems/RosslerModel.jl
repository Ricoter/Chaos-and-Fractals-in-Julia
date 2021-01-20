#=

Implementation of the Rossler system by Rico van Midde, 2021

=#

Base.@kwdef mutable struct Rossler
    dt::Float64 = .02
    a::Float64 = .2
    b::Float64 = .2
    c::Float64 = .2
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end

function step!(r::Rossles)
    dx = - r.y - r.z;           r.x += r.dt * dx
    dy = r.x + r.z;             r.y += r.dt * dy
    dz = b + r.z * (r.x - c);   r.z += r.dt * dz
end