using Test, Random, Distances
using RandomisationModels


begin

    @testset "CompleteRandomisation" begin
        include("models/complete-randomisation.jl")
    end

end