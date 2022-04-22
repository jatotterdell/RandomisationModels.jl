module RandomisationModels

using DocStringExtensions
using Random: AbstractRNG, GLOBAL_RNG
using StatsBase: sample, Weights, FrequencyWeights
using Distances: euclidean

import Base.deepcopy
import Base.show

export MultiArmRandomisationModel
export CompleteRandomisation
export MassWeightedUrn
export PermutedBlock

export target, narms, sequence, dist, imbalance, predictability, randomise, randomize, randomise!, randomize!
export prob, update!
export mass, blocksize

# Internal helper functions
include("util.jl")

include("types.jl")
include("models/complete-randomisation.jl")
include("models/mass-weighted-urn.jl")
include("models/permuted-block.jl")

end # module
