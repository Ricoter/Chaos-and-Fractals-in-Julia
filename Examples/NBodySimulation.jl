#=
Play around with different plots and animations
of n body system

Rico van Midde, 2021
=# 

#TODO replace particle generation and gravity pull with struct and next! in DynamicalSystems

# std plotlib
using Plots, LinearAlgebra, Random

# Gravitational constant
const G = 6.67e-11 # m^3/kg/s^2

# std backend
gr()

# default setting (no grid)
default(
    legend = false,
    background = "black",
    # axis=([],false)
    )

function ParticleCreation()
    "make a simple gif of 3d particle creation"
    scatter3d(
        xlims=(0,1),
        ylims=(0.1),
        zlims=(0,1)
    )

    @gif for ϕ in range(0, stop=2π, length=100)
        scatter3d!(
            rand(10),rand(10),rand(10),
            camera = (10 * (1 + cos(ϕ)), 40)
            )
    end

end

import Base.wait
wait(anim, t) = [frame(anim) for _=1:t]
l2_norm(A, dims) = sqrt.(sum(x -> x^2, A, dims=dims))


function gravity!(x)
    "Apply gravity for particles with equal mass"
    diff = reshape(x, 1, :, 3) .- reshape(x, :, 1, 3)
    dist = l2_norm(diff, 3)
    dist[dist .== 0] .= 1
    f = G * diff ./ dist .^ 3
    return reshape(sum(f, dims=2), size(x, 1), 3)
end

function UniverseAnimation(n=3)
    "3D animation of n-body system"
    
    # init animation
    anim = Animation()

    # define plot variables
    default(
        xlims=(-1,2),
        ylims=(-1,2),
        zlims=(-1,2),
        camera=(20,40)
    )
 
    # welcome text
    scatter3d(title="Welcome to the real world...")
    wait(anim, 10)

    # create particles
    scatter3d!(title="Lets create some particles...")
    wait(anim, 10)

    # create list of n random 3-tups
    x = rand(n,3) 

    for i=1:n
        scatter3d!(
            x[i:i,1], 
            x[i:i,2],
            x[i:i,3],
        ); frame(anim)
    end

    # add motion and gravity (equal mass)
    v = randn(n,3) * 0.01 # initial velocity
    for ϕ in range(0, stop=2π, length=300)
        
        # Accaleration
        v += gravity(x) * 1e7
        x += v
        scatter3d(
            x[:,1],
            x[:,2],
            x[:,3],
            title = "Time for planetary motion",
            # camera = (10 * (1 + cos(ϕ)), 40)
        ); frame(anim)
    end

   # goodby text
   text = "Sooon.."
   wait(anim, 20)
   display(gif(anim))
end

# ParticleCreation()
UniverseAnimation()