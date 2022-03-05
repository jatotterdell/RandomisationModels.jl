struct CompleteRandomisation{Ts<:AbstractVector} <: MultiArmRandomisationModel
    target::Ts
    CompleteRandomisation{Ts}(target::Ts) where {Ts<:AbstractVector} = new{Ts}(target)
end

function CompleteRandomisation(target::AbstractVector{T}) where {T<:Real}
    if !Util.isposvec(target)
        error("All values must be ≥ 0")
    end
    if !Util.isnormvec(target)
        target = target ./ sum(target)
    end
    CompleteRandomisation{typeof(target)}(target)
end

target(CR::CompleteRandomisation) = CR.target
narms(CR::CompleteRandomisation) = length(CR.target)
prob(CR::CompleteRandomisation) = target(CR)
update!(CR::CompleteRandomisation, y::Int) = nothing
