struct MassWeightedUrn{Tv<:AbstractVector,T<:Real} <: MultiArmRandomisationModel
    target::Tv
    α::T
    mass::Tv
    MassWeightedUrn{Tv,T}(target::Tv, α::T, mass::Tv) where {Tv<:AbstractVector,T<:Real} = new{Tv,T}(target, α, mass)
end

function MassWeightedUrn(target::AbstractVector{T}, α::Real) where {T<:Real}
    if !Util.isprobvec(target)
        # error("target must sum to 1")
        target = target ./ sum(target)
    end
    if α ≤ zero(typeof(α))
        error("α must be > 0")
    end
    mass = α .* target
    MassWeightedUrn{typeof(target),typeof(α)}(target, α, mass)
end

Base.deepcopy(m::MassWeightedUrn) = MassWeightedUrn(deepcopy(m.target), deepcopy(m.α))

target(MWU::MassWeightedUrn) = MWU.target
narms(MWU::MassWeightedUrn) = length(MWU.target)
mass(MWU::MassWeightedUrn) = MWU.mass
prob(MWU::MassWeightedUrn) = max.(MWU.α .* mass(MWU), 0.0) ./ sum(max.(MWU.α .* mass(MWU), 0.0))

function update!(MWU::MassWeightedUrn, y::Int)
    MWU.mass[y] += (target(MWU)[y] - 1.0)
    MWU.mass[1:end.!=y] += target(MWU)[1:end.!=y]
    if !(sum(mass(MWU)) ≈ MWU.α)
        error("Mass no longer equal to α, something went wrong")
    end
    return nothing
end
