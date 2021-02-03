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

Base.@kwdef mutable struct Lorenz
    # timestep size
    dt::Float64 = 0.02

    # position variables
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1

    # parameters
    σ::Float64 = 10
    ρ::Float64 = 28
    β::Float64 = 8/3
end

function step!(l::Lorenz)
    # difference
    dx = l.σ * (l.y - l.x)
    dy = l.x * (l.ρ - l.z) - l.y
    dz = l.x * l.y - l.β * l.z

    # update
    l.x += l.dt * dx
    l.y += l.dt * dy
    l.z += l.dt * dz

    return l.x, l.y, l.z
end