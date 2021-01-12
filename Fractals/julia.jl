#=
Julia Set

https://en.wikipedia.org/wiki/Julia_set

In the context of complex dynamics, a topic of mathematics, the Julia set 
and the Fatou set are two complementary sets (Julia "laces" and Fatou "dusts") 
defined from a function. Informally, the Fatou set of the function consists of
values with the property that all nearby values behave similarly under repeated
iteration of the function, and the Julia set consists of values such that an 
arbitrarily small perturbation can cause drastic changes in the sequence of 
iterated function values. Thus the behavior of the function on the Fatou set 
is "regular", while on the Julia set its behavior is "chaotic".

The Julia set of a function f is commonly denoted J(f), and the Fatou set is 
denoted F(f). These sets are named after the French mathematicians Gaston 
Julia and Pierre Fatou whose work began the study of complex dynamics 
during the early 20th century.
=#
using Plots, Images

const C = complex(-0.1, 0.651)#-.08im
global z_init = 0
const MAX_ITER = 750
const XRANGE = -2:0.001:2
const YRANGE = -1.5:0.001:1.5
const PLANE = complex.(XRANGE', YRANGE)

function Julia(c)
    """Mandelbrot was Right"""
    z = 0 
    for _=1:MAX_ITER # number of iterations
        z = z^2 + C
    end
    return z
end

function Fatou(z, c)
    """
        The fatouset are the lines 
    """
    n = 0
    while abs(z) <= 2 && n < MAX_ITER
        z = z^2 + c
        n += 1
    end
    return n
end

# while true
#     z = C = rand(PLANE)
#     i = 0
#     for i in 1:MAX_ITER
#         if abs(z) > 2
#             break
#         end
#         z = z^2 + C
#     end
#     if i > 10 && i < 100
#         break
#     end
# end

# plot_color.([abs.(Fatou.(PLANE, 0.66exp(im*ϕ*pi))) for ϕ=0:1:2pi])


@time data2 = abs.(Fatou.(PLANE, C))
img2 = plot_color(data2)
display(img2)

frames = []
for ϕ in 0:1:2pi
    c = 0.66 * exp(im*ϕ*pi)
    println(c)
    fatou = abs.(Fatou.(PLANE, c))
    plot = plot_color(fatou)
    append!(frames, plot)
    
    # data2 = abs.(Fatou.(PLANE, c))

    # implot_color(data2)
    # append!(x,[img2])
end
println("dibe")

# gif(anim, "julia.gif", fps=2)

# # show and save the honey
# @time data2 = abs.(Fatou.(PLANE))
# img2 = plot_color(data2)

# display(x[end])
# save("julia_contourplot.png", img1)
# save("julia_fatouplot.png$c", img2)   