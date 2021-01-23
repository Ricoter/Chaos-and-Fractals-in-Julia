#=
Implementation of n-body simulator in d-dimensional space

- Bodies are point particle without volume. Therefore instead of collision, 
point particles will increase velocity

=#


Base.@kwdef mutable struct NBodySystem
    dt::Float64 = 0.02
    a::Float64 = 6.67e-4    # attraction/repulstion constant standard 
    # is based on the gravitational constant (G) in m^3/kg/s^2 * 1e7

    x::Array{Float64} = rand(10,3)      # Array of positions
    v::Array{Float64} = zeros(sizeof(x))# Array of velocity
    m::Array{Float64} = ones(sizeof(x)) # Array of mass
    
    n = sizeof(x)[1]    # number of bodies
    d = sizeof(x)[2]    # dimensionality of space
end

l2_norm(A, dims) = sqrt.(sum(x -> x^2, A, dims=dims))

function step!(nb::NBodySystem)
    # TODO add mass

    diff = reshape(nb.x, 1, :, nb.d) .- reshape(nb.x, :, 1, nb.d)
    dist = l2_norm(diff, nb.d)
    dist[dist .== 0] .= 1
    f = nb.a * diff ./ dist .^ nb.d
    dv = reshape(sum(f, dims=2), size(x, 1), nb.d)
    nb.v += nb.dt * dv
    nb.x += nb.dt * nb.v
    return nb.x, nb.v
end

function step!(nb::NBody)
    
    dx = l.σ * (l.y - l.x);         l.x += l.dt * dx
    dy = l.x * (l.ρ - l.z) - l.y;   l.y += l.dt * dy
    dz = l.x * l.y - l.β * l.z;     l.z += l.dt * dz
    return l.x, l.y, l.z
end