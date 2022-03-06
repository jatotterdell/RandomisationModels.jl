struct PermutedBlock{Tv<:AbstractVector} <: MultiArmRandomisationModel
    target::Tv
    b::Int
    PermutedBlock{Tv}(target::Tv, b::Int) where {Tv<:AbstractVector} = new{Tv}(target, b)
end

function PermutedBlock(target::AbstractVector{T}, blocksize::Int) where {T<:Real}
    if !Util.isposvec(target)
        error("All values must be ≥ 0")
    end
    if !Util.isnormvec(target)
        target = target ./ sum(target)
    end
    PermutedBlock{typeof(target)}(target, blocksize)
end

Base.deepcopy(m::PermutedBlock) = PermutedBlock(deepcopy(m.target), deepcopy(m.b))

blocksize(PB::PermutedBlock) = PB.b
prob(PB::PermutedBlock) = nothing
update!(PB:PermutedBlock) = nothing