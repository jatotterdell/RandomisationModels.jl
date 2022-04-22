using Test, Random, Distances
using RandomisationModels


begin

    @testset "CompleteRandomisation" begin
        include("models/complete-randomisation.jl")
    end

    @testset "PermutedBlockRandomisation" begin
        include("models/permuted-block.jl")
    end

end