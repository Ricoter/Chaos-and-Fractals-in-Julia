#=
Runge-kutte method for iteration

RK4 is a fourth-order method. This means that the local truncation error is of the order O(h^5) 
while the global truncation error (total accumulated error) is of the order O(h^4)

=#

#TODO add example

function RK4(f, t, h, y)
    k1 = f(t, y)                        # Slope at beginning of the interval
    k2 = f(t + h / 2, y + h * k1 / 2)   # Slope at midpoint (y and k1)
    k3 = f(t + h / 2, y + h * k2 / 2)   # Slope at midpoint (y and k2)
    k4 = f(t + h, y + h * k3)           # Slope at end (y and k3)
    
    # Update
    t += h
    y += h * (k1 + 2k2 + 2k3 + k4) / 6  # Weighted average
    return y, t
end

function RK4!(f, t, h, y)
    k1 = f(t, y)                        # Slope at beginning of the interval
    k2 = f(t + h / 2, y + h * k1 / 2)   # Slope at midpoint (y and k1)
    k3 = f(t + h / 2, y + h * k2 / 2)   # Slope at midpoint (y and k2)
    k4 = f(t + h, y + h * k3)           # Slope at end (y and k3)
    
    # Update
    t += h
    y += h * (k1 + 2k2 + 2k3 + k4) / 6  # Weighted average
end