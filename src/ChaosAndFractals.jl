#TODO change examples to import

module ChaosAndFractals


include("AnalysisTools/Binning.jl");    export Binning

export next!, step!,            # evolution functions #TODO choose step! or next!
LogisticMap, SineMap, TentMap,  # 1 dimensional maps
PWLDuffing,                     # 2 dimensional
Chua, Henon, Lorenz, Rossler,   # 3 dimensional
NBodySystem                     # n dimensional
include("DynamicalSystems/ChuaAttractor.jl")
include("DynamicalSystems/HenonAttractor.jl")
include("DynamicalSystems/LogisticMap.jl")
include("DynamicalSystems/LorenzAttractor.jl")
include("DynamicalSystems/NBodySystem.jl")
include("DynamicalSystems/PWLDuffingAttractor.jl")
include("DynamicalSystems/RosslerModel.jl")
include("DynamicalSystems/SineMap.jl")
include("DynamicalSystems/TentMap.jl")

# # TODO seperate example from function
# include("Fractals/Julia.jl")
# include("Fractals/Manderbrot.jl")

# # TODO add iteration model
# include("IterativeMethods/RK4.jl")

# include("Makie/Bifurcation.jl")
# include("Makie/Cobweb.jl")

include("Plots/Bifurcation.jl")
include("Plots/Cobweb.jl")

end