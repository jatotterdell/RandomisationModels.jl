using ..RandomisationModels: Util

import Base.deepcopy

struct PermutedBlock{Tv<:AbstractVector,T<:Real} <: MultiArmRandomisationModel
    target::Tv
    b::T
    PermutedBlock{Tv,T}(target::Tv, b::T) where {Tv<:AbstractVector,T<:Real} = new{Tv,T}(target, b)
end
Base.deepcopy(m::PermutedBlock) = PermutedBlock(deepcopy(m.target), deepcopy(m.b))
