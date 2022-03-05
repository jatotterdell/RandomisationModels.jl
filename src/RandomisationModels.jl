module RandomisationModels

using Random: AbstractRNG, GLOBAL_RNG
using StatsBase: sample, Weights
import Base.deepcopy

export MultiArmRandomisationModel
export CompleteRandomisation
export MassWeightedUrn

export randomise, randomize, randomise!, randomize!
export target, narms, prob, update!

# Internal helper functions
include("util.jl")
using .Util
export Util

include("types.jl")
include("models/complete-randomisation.jl")
include("models/mass-weighted-urn.jl")

end # module
