#=
Runge-kutte method for iteration

RK4 is a fourth-order method. This means that the local truncation error is of the order O(h^5) 
while the global truncation error (total accumulated error) is of the order O(h^4)
=#

#TODO add example

function RK4(f, t, h, y)
    k1 = f(t, y)
    k2 = f(t + h / 2, y + h * k1 / 2)
    k3 = f(t + h / 2, y + h * k2 / 2)
    k4 = f(t + h, y + h * k3)
    t += h
    y += h/6 * (k1 + 2k2 + 2k3 + k4)
    return y, t
end