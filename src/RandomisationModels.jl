module RandomisationModels

using DocStringExtensions
using Random: AbstractRNG, GLOBAL_RNG
using StatsBase: sample, Weights, FrequencyWeights
using Distances: euclidean
using LinearAlgebra: normalize

import Base.deepcopy
import Base.show
import Base.==

export MultiArmRandomisationModel
export CompleteRandomisation
export MassWeightedUrn
export PermutedBlock
export BlockUrn

export target, narms, sequence, dist, imbalance, predictability, randomise, randomize, randomise!, randomize!
export prob, update!
export mass, blocksize, weights

# Internal helper functions
include("util.jl")

include("types.jl")
include("models/complete-randomisation.jl")
include("models/mass-weighted-urn.jl")
include("models/permuted-block.jl")
include("models/block-urn.jl")

end # module
