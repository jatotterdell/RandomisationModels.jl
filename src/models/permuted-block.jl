struct PermutedBlock{Tv<:AbstractVector} <: MultiArmRandomisationModel
    target::Tv
    blocksize::Int
    weights::FrequencyWeights{Int}
    sequence::AbstractVector{Int}
    dist::AbstractVector{Int}
    PermutedBlock{Tv}(
        target::Tv,
        blocksize::Int,
        weights::FrequencyWeights,
        sequence::AbstractVector{Int},
        dist::AbstractVector{Int},
    ) where {Tv<:AbstractVector} = new{Tv}(target, blocksize, weights, sequence, dist)
end

function PermutedBlock(target::AbstractVector{T}, blocksize::Int) where {T<:Real}
    if !Util.isposvec(target)
        error("All values must be ≥ 0")
    end
    if !Util.isnormvec(target)
        target = target ./ sum(target)
    end
    target = collect(target)
    weights = FrequencyWeights(round.(Int, target / minimum(target)))
    R = sum(weights)
    # check that blocksize is integer multiple of R
    if mod(blocksize, R) != 0
        error("blocksize must be an integer multiple of sum(weight).")
    end
    PermutedBlock{typeof(target)}(
        target,
        blocksize,
        weights,
        zeros(Int, 0),
        zeros(Int, length(target)),
    )
end

Base.deepcopy(m::PermutedBlock) = PermutedBlock(deepcopy(m.target), deepcopy(m.b))

function show(io::IO, PB::PermutedBlock)
    k = length(PB.target)
    n = length(PB.sequence)
    print(io, "PermutedBlock(arms = $k, blocksize = $(blocksize(PB)), n = $n)")
end

blocksize(PB::PermutedBlock) = PB.blocksize

function prob(PB::PermutedBlock)
    b = blocksize(PB)
    w = PB.weights ./ sum(PB.weights)
    n = dist(PB)
    i = sum(n) + 1
    k = floor((i - 1) / b) # completed blocks
    return (b * w + b * w * k - n) / (b + b * k - (i - 1))
end


function update!(PB::PermutedBlock, y::Int) 
    push!(PB.sequence, y)
    PB.dist[y] += 1
    return nothing
end
