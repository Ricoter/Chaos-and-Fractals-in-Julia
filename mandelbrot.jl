#=
The mandelbrot set is the set of complex functions for which the function
does not diverge when iterated from z=0 (wikipedia)
=#

function mandelbrot(a)
    """Mandelbrot was Right"""
    z = 0 
    for i=1:30 # number of iterations
        z = z^2 + a
    end
    return z
end

picca = [abs(mandelbrot(complex(x,y))) for y=1.0:-0.001:-1.0, x=-2.0:0.001:0.5]

using Plots, Images

# colorview(Gray, picca)


plot_color(picca) # contourplot
