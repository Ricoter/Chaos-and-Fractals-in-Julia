#=
The mandelbrot set is the set of complex functions for which the function
does not diverge when iterated from z=0 (wikipedia)
=#

# TODO convert this code to something that is easy to include and an example

using Plots, Images

const MAX_ITER_FATOU = 40
const MAX_ITER_MANDELBROT = 200
const XRANGE = -2:0.001:0.5
const YRANGE = -1:0.001:1
const PLANE = complex.(XRANGE', YRANGE)

function mandelbrot(c)
    """Mandelbrot was Right"""
    z = 0 
    for _=1:MAX_ITER_MANDELBROT # number of iterations
        z = z^2 + c
    end
    return z
end

function mandelbrotfatou(c)
    """
        The fatouset are the lines 
    """
    z, n = 0, 0
    while abs(z) <= 2 && n < MAX_ITER_FATOU
        z = z^2 + c
        n += 1
    end
    return n
end

# Mandelbrot
@time data = abs.(mandelbrot.(PLANE))       # get data
img = plot_color(data)                      # to img
# save("mandelbrot_contour.png", img)         # save the honey

# # Fatou
# @time data = abs.(mandelbrotfatou.(PLANE))  # get data
# img = plot_color(data)                      # to img
# save("mandelbrot_fatou.png", img)           # save the honey