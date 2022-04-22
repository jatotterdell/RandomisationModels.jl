"""
$(TYPEDSIGNATURES)

Check whether in abstract vector `p` is a positive vector, i.e. that pᵢ≥0∀i.
"""
isposvec(p::AbstractVector{<:Real}) = all(p .≥ zero(eltype(p)))


"""
$(TYPEDSIGNATURES)

Check whether in abstract vector `p` sums to 1.
"""
isnormvec(p::AbstractVector{<:Real}) = isapprox(sum(p), one(eltype(p)))


"""
$(TYPEDSIGNATURES)

Check whether in abstract vector `p` is a probability vector, i.e. that ∑p=1 and pᵢ≥0∀i.
"""
isprobvec(p::AbstractVector{<:Real}) = isposvec(p) && isnormvec(p)


"""
$(TYPEDSIGNATURES)

Return non-zero elements of a vector.
"""
nonzero(p::AbstractVector{<:Real}) = p[p.!=zero(eltype(p))]


"""
$(TYPEDSIGNATURES)

Convert a vector to a vector of integer weights
"""
convert_prob_to_intweight(target::Vector{<:Real}) =
    round.(Int, target / minimum(nonzero(target)))


"""
$(TYPEDSIGNATURES)
"""
calculate_min_blocksize(target::Vector{<:Real}) = sum(convert_prob_to_intweight(target))


function random_sample(p::AbstractVector{<:Real})
    isprobvec(p) ? searchsortedlast([0.0; cumsum(p)], rand()) :
    error("p must be a probability vector")
end
function random_sample(p::AbstractVector{<:Real}, u::Real)
    if u ≤ 0 || u ≥ 1
        error("Must have 0 < u < 1")
    end
    isprobvec(p) ? searchsortedlast([0.0; cumsum(p)], u) :
    error("p must be a probability vector")
end
