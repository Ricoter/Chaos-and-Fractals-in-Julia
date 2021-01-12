#=
The mandelbrot set is the set of complex functions for which the function
does not diverge when iterated from z=0 (wikipedia)
=#
using Plots, Images

const MAX_ITER = 40
const XRANGE = -2:0.001:0.5
const YRANGE = -1:0.001:1
const PLANE = complex.(XRANGE', YRANGE)

function mandelbrot(c)
    """Mandelbrot was Right"""
    z = 0 
    for _=1:MAX_ITER # number of iterations
        z = z^2 + c
    end
    return z
end

function mandelbrotfatou(c)
    """
        The fatouset are the lines 
    """
    z, n = 0, 0
    while abs(z) <= 2 && n < MAX_ITER
        z = z^2 + c
        n += 1
    end
    return n
end

# get data
@time data1 = abs.(mandelbrot.(PLANE))
@time data2 = abs.(mandelbrotfatou.(PLANE))

# to img
img1 = plot_color(data1)
img2 = plot_color(data2)

# show and save the honey
display(img1), display(img2)
save("mandelbrot_contourplot.png", img1)
save("mandelbrot_fatouplot.png", img2)