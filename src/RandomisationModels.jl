module RandomisationModels

using Random: AbstractRNG, GLOBAL_RNG
using StatsBase: sample, Weights
using Distances: euclidean

import Base.deepcopy
import Base.show

export MultiArmRandomisationModel
export CompleteRandomisation
export MassWeightedUrn

export target, narms, sequence, dist, imbalance, predictability, randomise, randomize, randomise!, randomize!
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
