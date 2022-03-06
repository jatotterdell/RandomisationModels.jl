module RandomisationModels

using Random: AbstractRNG, GLOBAL_RNG
using StatsBase: sample, Weights
import Base.deepcopy

export MultiArmRandomisationModel
export CompleteRandomisation
export MassWeightedUrn

export target, narms, randomise, randomize, randomise!, randomize!
export prob, update!
export mass

# Internal helper functions
include("util.jl")
using .Util
export Util

include("types.jl")
include("models/complete-randomisation.jl")
include("models/mass-weighted-urn.jl")

end # module
