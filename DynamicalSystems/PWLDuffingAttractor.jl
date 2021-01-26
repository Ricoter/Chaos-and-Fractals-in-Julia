#=

Implementation of the Lorenz system by Rico van Midde, 2021
(Code is based on http://docs.juliaplots.org/latest/#simple-is-beautiful)

The Lorenz system is a continuous time, three-dimensional system that is
described by a set of ordinary differential equation. It was discovered in
1963 by Edward Lorenz when he was searching for the most simple equations
that could mimic the sensitive evolution that he found earlier in his more
complex weather model (the one from section 2.1). The equations describes
an oversimplified model of atmospheric convection when the parameters σ,
ρ, β are positive.

=#

Base.@kwdef mutable struct PWLDuffing
    dt::Float64 = .02
    t::Float64 = 0

    x::Float64 = 0
    y::Float64 = 0

    e::Float64 = .25
    i::Float64 = -14
    γ::Float64 = .14 + im/20 
    ω::Float64 = 1
    m0::Float64 = -.0845
    m1::Float64 = .66
end

function step!(s::PWLDuffing)
    dx = s.x + s.y
    dy = s.y + (-s.m1 * s.x - (s.m0 - s.m1) / 2(abs(s.x+1)-abs(s.x-1)) - s.e * s.y + s*γ*cos(s.ω*s.t))

    s.x += s.dt * dx
    s.y += s.dt * dy
    s.t += dt
    return l.x, l.y
end