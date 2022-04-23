"""
$(TYPEDEF)

# Fields
$(TYPEDFIELDS)
"""
struct PermutedBlock <: MultiArmRandomisationModel
    target::AbstractVector{<:AbstractFloat}
    blocksize::Integer
    weights::AbstractVector{<:Integer}
    W::Integer
    sequence::AbstractVector{<:Integer}
    dist::AbstractVector{<:Integer}
    PermutedBlock(
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
function PermutedBlock(weights::AbstractVector{<:Integer}, blocksize::Int)
    if !all(weights .≥ zero(eltype(weights)))
        throw(DomainError(weights, "All values must be ≥ 0"))
    end
    target = normalize(weights, 1)
    W = sum(weights)
    if mod(blocksize, W) != 0
        throw(DomainError(blocksize, "blocksize not integer multiple of sum(weights)."))
    end
    PermutedBlock(target, blocksize, weights, W, zeros(Int, 0), zeros(Int, length(target)))
end


"""
$(TYPEDSIGNATURES)
"""
function PermutedBlock(target::AbstractVector{<:AbstractFloat}, blocksize::Int)
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
    PermutedBlock(target, blocksize, weights, W, zeros(Int, 0), zeros(Int, length(target)))
end

Base.deepcopy(m::PermutedBlock) = PermutedBlock(deepcopy(m.target), deepcopy(m.blocksize))

function show(io::IO, PB::PermutedBlock)
    k = length(PB.target)
    n = length(PB.sequence)
    print(io, "PermutedBlock(arms = $k, blocksize = $(blocksize(PB)), n = $n)")
end

blocksize(PB::PermutedBlock) = PB.blocksize
weights(PB::PermutedBlock) = PB.weights
target(PB::PermutedBlock) = PB.target

"""
$(TYPEDSIGNATURES)
"""
function prob(PB::PermutedBlock)
    b = blocksize(PB)
    w = weights(PB)
    W = PB.W
    λ = b ÷ W
    n = dist(PB)
    i = sum(n) + 1
    k = floor((i - 1) ÷ b) # completed blocks
    return (λ * w + λ * w * k - n) / (b + b * k - (i - 1))
end


"""
$(TYPEDSIGNATURES)
"""
function update!(PB::PermutedBlock, y::Int)
    push!(PB.sequence, y)
    PB.dist[y] += 1
    return nothing
end
