struct CompleteRandomisation{Ts<:AbstractVector} <: MultiArmRandomisationModel
    target::Ts
    sequence::AbstractVector{Int}
    dist::AbstractVector{Int}
    CompleteRandomisation{Ts}(
        target::Ts,
        sequence::AbstractVector{Int},
        dist::AbstractVector{Int}) where {Ts<:AbstractVector} =
        new{Ts}(target, sequence, dist)
end

function CompleteRandomisation(target::AbstractVector{T}) where {T<:Real}
    if !Util.isposvec(target)
        throw(DomainError(target, "All values must be ≥ 0"))
    end
    if !Util.isnormvec(target)
        target = target ./ sum(target)
    end
    CompleteRandomisation{typeof(target)}(target, zeros(Int, 0), zeros(Int, length(target)))
end

prob(CR::CompleteRandomisation) = target(CR)

function update!(CR::CompleteRandomisation, y::Int)
    push!(CR.sequence, y)
    CR.dist[y] += 1
end
