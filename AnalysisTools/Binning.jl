#=
Implementation of binning analysis by Rico van Midde, 2021
(based on old python code of mine)

Perform a binning analysis over samples and return 
    errors: an array of the error estimate at each binning level, 
    tau: the estimated integrated autocorrelation time, 
    converged: a flag indicating if the binning has converged, and 
    bins: the last bin values

=#
using Statistics

function Binning(x::Array)

    minbin = 2^6                           # minimum number of bins  
    maxlevel = Int(log2(length(x)/minbin)) # number of binning steps
    maxsamples = minbin * 2^maxlevel       # the maximal number of samples considered 
    
    bins = x[end-maxsamples:end]
    errors = zeros(maxlevel + 1)

    for k=1:maxlevel
        errors[k] = std(bins) / sqrt(length(bins) - 1)
        bins = (bins[1:2:end] .+ bins[2:2:end]) ./ 2
    end
    errors[maxlevel+1] = std(bins) / sqrt(length(bins) - 1)

    tau = .5((errors[end] / errors[begin])^2 - 1)
    relchange = (errors[2:end] .- errors[begin:end-1]) ./ errors[2:end]
    meanlastchanges = mean(relchange[end-3:end])    # get the average over last changes
    
    converged = 1
    if meanlastchanges > 0.05
        println("warning: binning maybe not converged, meanlastchanges: $meanlastchanges")
        converged = 0
    end

    return errors, tau, converged, bins
end