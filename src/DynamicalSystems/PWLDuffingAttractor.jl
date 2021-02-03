#=

Implementation of the piecewise-linear (PWL) Duffing system by Rico van Midde, 2021


=#

#TODO add examples + test


Base.@kwdef mutable struct PWLDuffing
    dt::Float64 = .02
    t::Float64 = 0.0

    x::Float64 = 0.0
    y::Float64 = 0.0

    e::Float64 = .25
    i::Float64 = -14            # {-25, 25}
    γ::Float64 = .14 + i/20 
    ω::Float64 = 1.0
    m0::Float64 = -.0845
    m1::Float64 = .66
end

function step!(s::PWLDuffing)
    # differences
    dx = s.y
    dy = -s.m1 * s.x - (s.m0-s.m1)/2 * (abs(s.x+1)-abs(s.x-1)) - s.e * s.y + s.γ*cos(s.ω*s.t)

    # update
    s.x += s.dt * dx
    s.y += s.dt * dy
    s.t += s.dt
    
    return s.x, s.y
end