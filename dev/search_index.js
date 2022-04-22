var documenterSearchIndex = {"docs":
[{"location":"lib/public.html#API","page":"API","title":"API","text":"","category":"section"},{"location":"lib/public.html#RandomisationModels-Module","page":"API","title":"RandomisationModels Module","text":"","category":"section"},{"location":"lib/public.html","page":"API","title":"API","text":"Modules = [RandomisationModels]\nPrivate = false","category":"page"},{"location":"lib/public.html#RandomisationModels.CompleteRandomisation","page":"API","title":"RandomisationModels.CompleteRandomisation","text":"struct CompleteRandomisation{Ts<:(AbstractVector)} <: MultiArmRandomisationModel\n\nFields\n\ntarget::AbstractVector\nsequence::AbstractVector{Int64}\ndist::AbstractVector{Int64}\n\n\n\n\n\n","category":"type"},{"location":"lib/public.html#RandomisationModels.MassWeightedUrn","page":"API","title":"RandomisationModels.MassWeightedUrn","text":"struct MassWeightedUrn{Tv<:(AbstractVector), T<:Real} <: MultiArmRandomisationModel\n\nFields\n\ntarget::AbstractVector\nα::Real\nmass::AbstractVector\nsequence::AbstractVector{Int64}\ndist::AbstractVector{Int64}\n\n\n\n\n\n","category":"type"},{"location":"lib/public.html#RandomisationModels.MassWeightedUrn-Union{Tuple{T}, Tuple{AbstractVector{T}, Real}} where T<:Real","page":"API","title":"RandomisationModels.MassWeightedUrn","text":"MassWeightedUrn(target::AbstractArray{T<:Real, 1}, α::Real) -> MassWeightedUrn\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.PermutedBlock","page":"API","title":"RandomisationModels.PermutedBlock","text":"struct PermutedBlock{Tv<:(AbstractVector)} <: MultiArmRandomisationModel\n\nFields\n\ntarget::AbstractVector\nblocksize::Int64\nweights::AbstractVector{Int64}\nsequence::AbstractVector{Int64}\ndist::AbstractVector{Int64}\n\n\n\n\n\n","category":"type"},{"location":"lib/public.html#RandomisationModels.PermutedBlock-Union{Tuple{T}, Tuple{AbstractVector{T}, Int64}} where T<:Real","page":"API","title":"RandomisationModels.PermutedBlock","text":"PermutedBlock(target::AbstractArray{T<:Real, 1}, blocksize::Int64) -> PermutedBlock\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise!-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel, Int64}","page":"API","title":"RandomisationModels.randomise!","text":"randomise!(rng::AbstractRNG, RM::RandomisationModel, n::Int)\n\nGenerate a n random allocation's from a randomisation model using prob(RM) and the random number generator provided.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise!-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel}","page":"API","title":"RandomisationModels.randomise!","text":"randomise!(rng::AbstractRNG, RM::RandomisationModel)\n\nGenerate a single random allocation from a randomisation model, RM,  using prob(RM) and the random number generator provided.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise!-Tuple{RandomisationModels.RandomisationModel, Int64}","page":"API","title":"RandomisationModels.randomise!","text":"randomise!(RM::RandomisationModel, n::Int)\n\nGenerate a n random allocation's from a randomisation model using prob(RM) and the global RNG.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise!-Tuple{RandomisationModels.RandomisationModel}","page":"API","title":"RandomisationModels.randomise!","text":"randomise!(RM::RandomisationModel)\n\nGenerate a single random allocation from a randomisation model using prob(RM) and the global RNG.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel, Int64}","page":"API","title":"RandomisationModels.randomise","text":"randomise(rng::AbstractRNG, RM::RandomisationModel, n::Int)\n\nGenerates n allocations\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel}","page":"API","title":"RandomisationModels.randomise","text":"randomise(rng::AbstractRNG, RM::RandomisationModel)\n\nGenerates allocations from the randomisation model without updating the models.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomize-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel}","page":"API","title":"RandomisationModels.randomize","text":"randomize(rng::AbstractRNG, RM::RandomisationModel)\n\nGenerates allocations from the randomisation model without updating the models.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.update!-Tuple{CompleteRandomisation, Int64}","page":"API","title":"RandomisationModels.update!","text":"update!(CR::CompleteRandomisation, y::Int64)\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.update!-Tuple{MassWeightedUrn, Int64}","page":"API","title":"RandomisationModels.update!","text":"update!(MWU::MassWeightedUrn, y::Int64)\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.update!-Tuple{PermutedBlock, Int64}","page":"API","title":"RandomisationModels.update!","text":"update!(PB::PermutedBlock, y::Int64)\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#Util-Sub-Module","page":"API","title":"Util Sub-Module","text":"","category":"section"},{"location":"lib/public.html","page":"API","title":"API","text":"Modules = [RandomisationModels.Util]\nPrivate = true","category":"page"},{"location":"index.html#RandomisationModels.jl","page":"Home","title":"RandomisationModels.jl","text":"","category":"section"},{"location":"index.html","page":"Home","title":"Home","text":"Documentation for RandomisationModels.jl","category":"page"},{"location":"index.html#Overview","page":"Home","title":"Overview","text":"","category":"section"},{"location":"index.html#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"index.html#Quick-Example","page":"Home","title":"Quick Example","text":"","category":"section"},{"location":"index.html","page":"Home","title":"Home","text":"using RandomisationModels\nusing StatsBase\n\nMWU = MassWeightedUrn(collect(1:4))\nrandomise!(MWU, 100);\nsort(countmap(sequence(MWU)))","category":"page"},{"location":"index.html","page":"Home","title":"Home","text":"using RandomisationModels\nusing StatsBase\nusing DataFrames\nusing VegaLite\n\nC = [CompleteRandomisation(1:4) for _ in 1:10_000]\nM = [MassWeightedUrn(1:4, 4) for _ in 1:10_000]\nP = [PermutedBlock(1:4, 10) for _ in 1:10_000]\nc = zeros(Real, 100, 10_000, 2)\nm = zeros(Real, 100, 10_000, 2)\np = zeros(Real, 100, 10_000, 2)\nfor i in 1:100\n    randomise!.(C)\n    randomise!.(M)\n    randomise!.(P)\n    c[i,:,:] = [imbalance.(C) predictability.(C)]\n    m[i,:,:] = [imbalance.(M) predictability.(M)]\n    p[i,:,:] = [imbalance.(P) predictability.(P)]\nend\nc = mean(c, dims = 2)\nm = mean(m, dims = 2)\np = mean(p, dims = 2)\ndat = DataFrame(\n    t = 1:100, \n    CR_Imbalance = c[:,1,1],\n    CR_Predictability  = c[:,1,2],\n    MWU_Imbalance = m[:,1,1],\n    MWU_Predictability  = m[:,1,2],\n    PB_Imbalance = p[:,1,1],\n    PB_Predictability  = p[:,1,2])\ndat = stack(dat, Not(:t), :t, \n    variable_name = \"Model\", value_name = \"value\")\ntransform!(dat, :Model => ByRow(x -> split(x, \"_\")) => [:Model, :Measure])\ndat = unstack(dat, :Measure, :value)\ndat |> \n@vlplot(repeat = {column=[:Imbalance, :Predictability]}, title = \"10,000 simulations\") +\n(\n    @vlplot(\n        :line, \n        x = :t, \n        y = {field = {repeat=:column},aggregate=:mean,type=:quantitative}, \n        color = :Model)\n)","category":"page"}]
}
