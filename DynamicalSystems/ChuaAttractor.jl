#=
Rico van Midde
Implementation of the Chua attractor. I used the same variables as chen (2006). For simplicity ̄m0 and ̄m1 from chen (2006),
are replaced with the m0 and m1. (de bar is hard to write)  

For a clear overview of multiscroll attractors review:
Chen, Guanrong; Jinhu Lu (2006). "GENERATING MULTISCROLL CHAOTIC ATTRACTORS: THEORIES, METHODS AND APPLICATIONS"
=#

#TODO needs test and example
#FIXME the evolution diverges, chen used Runge Kutta, that could possibly be the problem

Base.@kwdef mutable struct Chua
    dt::Float64 = 0.02

    # position variables
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1

    # parameters
    α::Float64 = 10
    β::Float64 = 14.87
    m0::Float64 = -0.68
    m1::Float64 = -1.27
end

# piecewise linear function
ϕ(x, m0, m1) = m1*x + (m0-m1) * (abs(x+1) - abs(x-1))

function step!(s::Chua)
    # differences
    dx = s.α * (-s.x + s.y - ϕ(s.x, s.m0, s.m1))
    dy = s.x - s.y + s.z
    dz = -s.β * s.y

    # update
    s.x += s.dt * dx
    s.y += s.dt * dy
    s.z += s.dt * dz

    return s.x, s.y, s.z
end