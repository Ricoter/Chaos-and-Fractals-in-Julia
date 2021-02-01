#TODO change examples to import

module ChaosAndFractals

include("AnalysisTools/Binning.jl")

include("DynamicalSystems/ChuaAttractor.jl")
include("DynamicalSystems/HenonAttractor.jl")
include("DynamicalSystems/LogisticMap.jl")
include("DynamicalSystems/LorenzAttractor.jl")
include("DynamicalSystems/NBodySystem.jl")
include("DynamicalSystems/PWLDuffingAttractor.jl")
include("DynamicalSystems/RosslerModel.jl")
include("DynamicalSystems/SineMap.jl")
include("DynamicalSystems/TentMap.jl")

include("Fractals/Julia.jl")
include("Fractals/Manderbrot.jl")

include("IterativeMethods/RK4.jl")

include("Makie/Bifurcation.jl")
include("Makie/Cobweb.jl")

include("Plots/Bifurcation.jl")
include("Plots/Cobweb.jl")

end