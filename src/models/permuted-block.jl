"""
$(TYPEDEF)

# Fields
$(TYPEDFIELDS)
"""
struct PermutedBlock{Tv<:AbstractVector} <: MultiArmRandomisationModel
    target::Tv
    blocksize::Int
    weights::AbstractVector{Int}
    sequence::AbstractVector{Int}
    dist::AbstractVector{Int}
    PermutedBlock{Tv}(
        target::Tv,
        blocksize::Int,
        weights::AbstractVector{Int},
        sequence::AbstractVector{Int},
        dist::AbstractVector{Int},
    ) where {Tv<:AbstractVector} = new{Tv}(target, blocksize, weights, sequence, dist)
end


"""
$(TYPEDSIGNATURES)
"""
function PermutedBlock(target::AbstractVector{T}, blocksize::Int) where {T<:Real}
    if !isposvec(target)
        throw(DomainError(target, "All values must be ≥ 0"))
    end
    if !isnormvec(target)
        target = target ./ sum(target)
    end
    target = collect(target)
    weights = convert_prob_to_intweight(target)
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

Base.deepcopy(m::PermutedBlock) = PermutedBlock(deepcopy(m.target), deepcopy(m.blocksize))

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


"""
$(TYPEDSIGNATURES)
"""
function update!(PB::PermutedBlock, y::Int)
    push!(PB.sequence, y)
    PB.dist[y] += 1
    return nothing
end
