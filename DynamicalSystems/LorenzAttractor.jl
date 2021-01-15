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
    dt::Float64 = 0.02
    σ::Float64 = 10
    ρ::Float64 = 28
    β::Float64 = 8/3
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end

function step!(l::Lorenz)
    dx = l.σ * (l.y - l.x);         l.x += l.dt * dx
    dy = l.x * (l.ρ - l.z) - l.y;   l.y += l.dt * dy
    dz = l.x * l.y - l.β * l.z;     l.z += l.dt * dz
end


if isinteractive()
    """
        You can run this file to see an example
    """
    using Plots

    x, y, z = 3 * randn(3)
    attractor = Lorenz(x=x,y=y,z=z)

    # initialize a 3D plot with 1 empty series
    plt = plot3d(
        1,
        xlim = (-30, 30),
        ylim = (-30, 30),
        zlim = (0, 60),
        background = "Black",
        title = "Lorenz Attractor",
        marker = 2,
        label = "Euler Method"
    )

    # build an animated gif by pushing new points to the plot, saving every 10th frame
    @gif for i=1:1500
        step!(attractor)
        push!(plt, attractor.x, attractor.y, attractor.z)
    end every 10
end