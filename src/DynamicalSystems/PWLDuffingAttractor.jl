#=

Implementation of the piecewise-linear (PWL) Duffing system by Rico van Midde, 2021


=#

#TODO add examples + test

Base.@kwdef mutable struct PWLDuffing
    dt::Float64 = .02
    t::Float64 = 0

    x::Float64 = 0
    y::Float64 = 0

    e::Float64 = .25
    i::Float64 = -14            # {-25, 25}
    γ::Float64 = .14 + im/20 
    ω::Float64 = 1
    m0::Float64 = -.0845
    m1::Float64 = .66
end

function step!(s::PWLDuffing)
    # differences
    dx = s.x + s.y
    dy = s.y + (-s.m1 * s.x - (s.m0 - s.m1) / 2(abs(s.x+1)-abs(s.x-1)) - s.e * s.y + s*γ*cos(s.ω*s.t))

    # update
    s.x += s.dt * dx
    s.y += s.dt * dy
    s.t += dt
    
    return l.x, l.y
end