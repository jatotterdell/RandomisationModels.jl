using Test, Random, Distances
using RandomisationModels

macro include_testset(filename)
    @assert filename isa AbstractString
    quote
        @testset $(filename) begin
            include($(filename))
        end
    end
end

@include_testset "models/complete-randomisation.jl"
@include_testset "models/permuted-block.jl"
@include_testset "models/mass-weighted-urn.jl"