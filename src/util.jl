"""
    Util

A submodule that provides various utility functions used elsewhere in the main Module.
"""
module Util


"""
    isposvec(p)

Check whether in abstract vector `p` is a positive vector, i.e. that pᵢ≥0∀i.
"""
isposvec(p::AbstractVector{<:Real}) = all(p .≥ zero(eltype(p)))


"""
    isnormvec(p)

Check whether in abstract vector `p` sums to 1.
"""
isnormvec(p::AbstractVector{<:Real}) = isapprox(sum(p), one(eltype(p)))


"""
    isprobvec(p)

Check whether in abstract vector `p` is a probability vector, i.e. that ∑p=1 and pᵢ≥0∀i.
"""
isprobvec(p::AbstractVector{<:Real}) = isposvec(p) && isnormvec(p)


"""
    convert_prob_to_intweight(target::Vector{<:Real})

Convert a vector to a vector of integer weights
"""
convert_prob_to_intweight(target::Vector{<:Real}) = trunc.(Int, target / minimum(target))


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

end # End Util Module
