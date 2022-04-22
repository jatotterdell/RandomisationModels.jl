"""
$(TYPEDEF)

# Fields
$(TYPEDFIELDS)
"""
struct MassWeightedUrn{Tv<:AbstractVector,T<:Real} <: MultiArmRandomisationModel
    target::Tv
    α::T
    mass::Tv
    sequence::AbstractVector{Int}
    dist::AbstractVector{Int}
    MassWeightedUrn{Tv,T}(target::Tv, α::T, mass::Tv, sequence::AbstractVector{Int}, dist::AbstractVector{Int}) where {Tv<:AbstractVector,T<:Real} =
        new{Tv,T}(target, α, mass, sequence, dist)
end


"""
$(TYPEDSIGNATURES)
"""
function MassWeightedUrn(target::AbstractVector{T}, α::Real) where {T<:Real}
    if !isposvec(target)
        error("All values must be ≥ 0")
    end
    if !isprobvec(target)
        target = target ./ sum(target)
    end
    if α ≤ zero(typeof(α))
        error("α must be > 0")
    end
    target = collect(target)
    mass = α .* target
    MassWeightedUrn{typeof(target),typeof(α)}(target, α, mass, zeros(Int, 0), zeros(Int, length(target)))
end

function MassWeightedUrn(target::AbstractVector{T}) where {T<:Real}
    if !isprobvec(target)
        # error("target must sum to 1")
        target = target ./ sum(target)
    end
    α = 2 * length(target)
    MassWeightedUrn(target, α)
end

Base.deepcopy(m::MassWeightedUrn) = MassWeightedUrn(deepcopy(m.target), deepcopy(m.α))
function show(io::IO, MWU::MassWeightedUrn)
    k = length(MWU.target)
    n = length(MWU.sequence)
    print(io, "MassWeightedUrn(balls = $k, mass = $(MWU.α), n = $n)")
end

mass(MWU::MassWeightedUrn) = MWU.mass
prob(MWU::MassWeightedUrn) = max.(MWU.α .* mass(MWU), 0.0) ./ sum(max.(MWU.α .* mass(MWU), 0.0))


"""
$(TYPEDSIGNATURES)
"""
function update!(MWU::MassWeightedUrn, y::Int)
    MWU.mass[y] += target(MWU)[y] - 1.0
    MWU.mass[1:end.!=y] += target(MWU)[1:end.!=y]
    push!(MWU.sequence, y)
    MWU.dist[y] += 1
    if !(sum(mass(MWU)) ≈ MWU.α)
        error("Mass no longer equal to α, something went wrong")
    end
    return nothing
end
