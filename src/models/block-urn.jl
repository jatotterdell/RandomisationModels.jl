"""
$(TYPEDEF)

# Fields
$(TYPEDFIELDS)
"""
struct BlockUrn <: MultiArmRandomisationModel
    target::AbstractVector{<:AbstractFloat}
    blocksize::Integer
    weights::AbstractVector{<:Integer}
    W::Integer
    sequence::AbstractVector{<:Integer}
    dist::AbstractVector{<:Integer}
    BlockUrn(
        target::AbstractVector{<:AbstractFloat},
        blocksize::Integer,
        weights::AbstractVector{<:Integer},
        W::Integer,
        sequence::AbstractVector{<:Integer},
        dist::AbstractVector{<:Integer},
    ) = new(target, blocksize, weights, W, sequence, dist)
end


"""
$(TYPEDSIGNATURES)
"""
function BlockUrn(weights::AbstractVector{<:Integer}, blocksize::Int)
    if !all(weights .≥ zero(eltype(weights)))
        throw(DomainError(weights, "All values must be ≥ 0"))
    end
    target = normalize(weights, 1)
    W = sum(weights)
    if mod(blocksize, W) != 0
        throw(DomainError(blocksize, "blocksize not integer multiple of sum(weights)."))
    end
    BlockUrn(target, blocksize, weights, W, zeros(Int, 0), zeros(Int, length(target)))
end


"""
$(TYPEDSIGNATURES)
"""
function BlockUrn(target::AbstractVector{<:AbstractFloat}, blocksize::Int)
    if !isposvec(target)
        throw(DomainError(target, "All values must be ≥ 0"))
    end
    if !isnormvec(target)
        target = target ./ sum(target)
    end
    weights = round.(Int, target .* blocksize)
    W = sum(weights)
    if mod(blocksize, W) != 0
        errstr = "blocksize not integer multiple of sum(target*blocksize)."
        throw(DomainError(blocksize, errstr))
    end
    BlockUrn(target, blocksize, weights, W, zeros(Int, 0), zeros(Int, length(target)))
end



Base.deepcopy(m::BlockUrn) = BlockUrn(deepcopy(m.weights), deepcopy(m.blocksize))

function show(io::IO, BU::BlockUrn)
    k = length(BU.target)
    n = length(BU.sequence)
    print(io, "BlockUrn(arms = $k, blocksize = $(blocksize(BU)), n = $n)")
end

blocksize(BU::BlockUrn) = BU.blocksize
weights(BU::BlockUrn) = BU.weights
target(BU::BlockUrn) = BU.target


"""
$(TYPEDSIGNATURES)
"""
function prob(BU::BlockUrn)
    b = blocksize(BU)
    w = weights(BU)
    W = sum(w)
    λ = b ÷ W
    n = dist(BU)
    i = sum(n) + 1
    k = minimum(floor.(Int, n ./ w)) # minimal balanced sets in previous assignments
    return (λ * w + w * k - n) / (W * λ + W * k - (i - 1))
end


"""
$(TYPEDSIGNATURES)
"""
function update!(BU::BlockUrn, y::Int)
    push!(BU.sequence, y)
    BU.dist[y] += 1
    return nothing
end
