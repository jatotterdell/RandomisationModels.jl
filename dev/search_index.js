var documenterSearchIndex = {"docs":
[{"location":"lib/public.html#API","page":"API","title":"API","text":"","category":"section"},{"location":"lib/public.html","page":"API","title":"API","text":"Modules = [RandomisationModels]\nPrivate = false","category":"page"},{"location":"lib/public.html#RandomisationModels.BlockUrn","page":"API","title":"RandomisationModels.BlockUrn","text":"struct BlockUrn <: MultiArmRandomisationModel\n\nImplements the Block Urn Design (BUD) of Zhao and Wang (2011).\n\nThe BUD has conditional allocation probability\n\nP_im = fracw_mlambda + w_mk_i-1-n_i-1mWlambda + Wk_i-1 - (i - 1)\nquad k_i-1 = min_m=1M leftlfloor fracn_i-1kw_k rightrfloor\n\nFields\n\ntarget::AbstractVector{<:AbstractFloat}\nblocksize::Integer\nweights::AbstractVector{<:Integer}\nW::Integer\nsequence::AbstractVector{<:Integer}\ndist::AbstractVector{<:Integer}\n\n\n\n\n\n","category":"type"},{"location":"lib/public.html#RandomisationModels.BlockUrn-Tuple{AbstractVector{<:AbstractFloat}, Int64}","page":"API","title":"RandomisationModels.BlockUrn","text":"BlockUrn(\n    target::AbstractVector{<:AbstractFloat},\n    blocksize::Int64\n) -> BlockUrn\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.BlockUrn-Tuple{AbstractVector{<:Integer}, Int64}","page":"API","title":"RandomisationModels.BlockUrn","text":"BlockUrn(\n    weights::AbstractVector{<:Integer},\n    blocksize::Int64\n) -> BlockUrn\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.CompleteRandomisation","page":"API","title":"RandomisationModels.CompleteRandomisation","text":"struct CompleteRandomisation{Ts<:(AbstractVector)} <: MultiArmRandomisationModel\n\nFields\n\ntarget::AbstractVector\nsequence::AbstractVector{Int64}\ndist::AbstractVector{Int64}\n\n\n\n\n\n","category":"type"},{"location":"lib/public.html#RandomisationModels.CompleteRandomisation-Union{Tuple{AbstractVector{T}}, Tuple{T}} where T<:Real","page":"API","title":"RandomisationModels.CompleteRandomisation","text":"CompleteRandomisation(\n    target::AbstractArray{T<:Real, 1}\n) -> CompleteRandomisation\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.MassWeightedUrn","page":"API","title":"RandomisationModels.MassWeightedUrn","text":"struct MassWeightedUrn{Tv<:(AbstractVector), T<:Real} <: MultiArmRandomisationModel\n\nImplements the Mass Weighted Urn Design (MWUD) of Zhao (2015).\n\nThe MWU has conditional allocation probability\n\nP_im = fracmaxalpha w_m - n_i-1m + (i - 1)w_m 0sum maxalpha w_m - n_i-1m + (i - 1)w_m 0\n\nFields\n\ntarget::AbstractVector\nα::Real\nmass::AbstractVector\nsequence::AbstractVector{Int64}\ndist::AbstractVector{Int64}\n\n\n\n\n\n","category":"type"},{"location":"lib/public.html#RandomisationModels.MassWeightedUrn-Union{Tuple{AbstractVector{T}}, Tuple{T}} where T<:Real","page":"API","title":"RandomisationModels.MassWeightedUrn","text":"MassWeightedUrn(\n    target::AbstractArray{T<:Real, 1}\n) -> MassWeightedUrn\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.MassWeightedUrn-Union{Tuple{T}, Tuple{AbstractVector{T}, Real}} where T<:Real","page":"API","title":"RandomisationModels.MassWeightedUrn","text":"MassWeightedUrn(\n    target::AbstractArray{T<:Real, 1},\n    α::Real\n) -> MassWeightedUrn\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.PermutedBlock","page":"API","title":"RandomisationModels.PermutedBlock","text":"struct PermutedBlock <: MultiArmRandomisationModel\n\nFields\n\ntarget::AbstractVector{<:AbstractFloat}\nblocksize::Integer\nweights::AbstractVector{<:Integer}\nW::Integer\nsequence::AbstractVector{<:Integer}\ndist::AbstractVector{<:Integer}\n\n\n\n\n\n","category":"type"},{"location":"lib/public.html#RandomisationModels.PermutedBlock-Tuple{AbstractVector{<:AbstractFloat}, Int64}","page":"API","title":"RandomisationModels.PermutedBlock","text":"PermutedBlock(\n    target::AbstractVector{<:AbstractFloat},\n    blocksize::Int64\n) -> PermutedBlock\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.PermutedBlock-Tuple{AbstractVector{<:Integer}, Int64}","page":"API","title":"RandomisationModels.PermutedBlock","text":"PermutedBlock(\n    weights::AbstractVector{<:Integer},\n    blocksize::Int64\n) -> PermutedBlock\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.prob-Tuple{BlockUrn}","page":"API","title":"RandomisationModels.prob","text":"prob(BU::BlockUrn) -> Any\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.prob-Tuple{PermutedBlock}","page":"API","title":"RandomisationModels.prob","text":"prob(PB::PermutedBlock) -> Any\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise!-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel, Int64}","page":"API","title":"RandomisationModels.randomise!","text":"randomise!(rng::AbstractRNG, RM::RandomisationModel, n::Int)\n\nGenerate a n random allocation's from a randomisation model using prob(RM) and the random number generator provided.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise!-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel}","page":"API","title":"RandomisationModels.randomise!","text":"randomise!(rng::AbstractRNG, RM::RandomisationModel)\n\nGenerate a single random allocation from a randomisation model, RM,  using prob(RM) and the random number generator provided.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise!-Tuple{RandomisationModels.RandomisationModel, Int64}","page":"API","title":"RandomisationModels.randomise!","text":"randomise!(RM::RandomisationModel, n::Int)\n\nGenerate a n random allocation's from a randomisation model using prob(RM) and the global RNG.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise!-Tuple{RandomisationModels.RandomisationModel}","page":"API","title":"RandomisationModels.randomise!","text":"randomise!(RM::RandomisationModel)\n\nGenerate a single random allocation from a randomisation model using prob(RM) and the global RNG.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel, Int64}","page":"API","title":"RandomisationModels.randomise","text":"randomise(rng::AbstractRNG, RM::RandomisationModel, n::Int)\n\nGenerates n allocations\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomise-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel}","page":"API","title":"RandomisationModels.randomise","text":"randomise(rng::AbstractRNG, RM::RandomisationModel)\n\nGenerates allocations from the randomisation model without updating the models.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.randomize-Tuple{Random.AbstractRNG, RandomisationModels.RandomisationModel}","page":"API","title":"RandomisationModels.randomize","text":"randomize(rng::AbstractRNG, RM::RandomisationModel)\n\nGenerates allocations from the randomisation model without updating the models.\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.update!-Tuple{BlockUrn, Int64}","page":"API","title":"RandomisationModels.update!","text":"update!(BU::BlockUrn, y::Int64)\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.update!-Tuple{CompleteRandomisation, Int64}","page":"API","title":"RandomisationModels.update!","text":"update!(CR::CompleteRandomisation, y::Int64)\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.update!-Tuple{MassWeightedUrn, Int64}","page":"API","title":"RandomisationModels.update!","text":"update!(MWU::MassWeightedUrn, y::Int64)\n\n\n\n\n\n\n","category":"method"},{"location":"lib/public.html#RandomisationModels.update!-Tuple{PermutedBlock, Int64}","page":"API","title":"RandomisationModels.update!","text":"update!(PB::PermutedBlock, y::Int64)\n\n\n\n\n\n\n","category":"method"},{"location":"index.html#RandomisationModels.jl","page":"Home","title":"RandomisationModels.jl","text":"","category":"section"},{"location":"index.html","page":"Home","title":"Home","text":"Documentation for RandomisationModels.jl","category":"page"},{"location":"index.html#Overview","page":"Home","title":"Overview","text":"","category":"section"},{"location":"index.html#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"index.html","page":"Home","title":"Home","text":"using Pkg\nPkg.add(\"https://github.com/jatotterdell/RandomisationModels.jl.git\")","category":"page"},{"location":"index.html#Quick-Example","page":"Home","title":"Quick Example","text":"","category":"section"},{"location":"index.html","page":"Home","title":"Home","text":"using RandomisationModels\nusing StatsBase\n\nMWU = MassWeightedUrn(collect(1:4))\nrandomise!(MWU, 100);\nsort(countmap(sequence(MWU)))","category":"page"},{"location":"index.html","page":"Home","title":"Home","text":"using RandomisationModels\nusing StatsBase\nusing DataFrames\nusing VegaLite\n\nC = [CompleteRandomisation(1:4) for _ in 1:10_000]\nM = [MassWeightedUrn(1:4, 4) for _ in 1:10_000]\nP = [PermutedBlock(1:4, 10) for _ in 1:10_000]\nB = [BlockUrn(1:4, 10) for _ in 1:10_000]\nc = zeros(Real, 100, 10_000, 2)\nm = zeros(Real, 100, 10_000, 2)\np = zeros(Real, 100, 10_000, 2)\nb = zeros(Real, 100, 10_000, 2)\nfor i in 1:100\n    randomise!.(C)\n    randomise!.(M)\n    randomise!.(P)\n    randomise!.(B)\n    c[i,:,:] = [imbalance.(C) predictability.(C)]\n    m[i,:,:] = [imbalance.(M) predictability.(M)]\n    p[i,:,:] = [imbalance.(P) predictability.(P)]\n    b[i,:,:] = [imbalance.(B) predictability.(B)]\nend\nc_mean = mean(c, dims = 2)\nm_mean = mean(m, dims = 2)\np_mean = mean(p, dims = 2)\nb_mean = mean(b, dims = 2)\nc_max = maximum(c, dims = 2)\nm_max = maximum(m, dims = 2)\np_max = maximum(p, dims = 2)\nb_max = maximum(b, dims = 2)\ndat = DataFrame(\n    t = 1:100, \n    CR_Mean_Imbalance = c_mean[:,1,1],\n    CR_Mean_Predictability  = c_mean[:,1,2],\n    CR_Max_Imbalance = c_max[:,1,1],\n    CR_Max_Predictability  = c_max[:,1,2],\n    MWU_Mean_Imbalance = m_mean[:,1,1],\n    MWU_Mean_Predictability  = m_mean[:,1,2],\n    MWU_Max_Imbalance = m_max[:,1,1],\n    MWU_Max_Predictability  = m_max[:,1,2],\n    PB_Mean_Imbalance = p_mean[:,1,1],\n    PB_Mean_Predictability  = p_mean[:,1,2],\n    PB_Max_Imbalance = p_max[:,1,1],\n    PB_Max_Predictability  = p_max[:,1,2],\n    BU_Mean_Imbalance = b_mean[:,1,1],\n    BU_Mean_Predictability = b_mean[:,1,2],\n    BU_Max_Imbalance = b_max[:,1,2],\n    BU_Max_Predictability = b_max[:,1,2]\n)\ndat = stack(dat, Not(:t), :t, \n    variable_name = \"Model\", value_name = \"value\")\ntransform!(dat, :Model => ByRow(x -> split(x, \"_\")) => [:Model, :Summary, :Measure])\ndat |>\n    @vlplot(\n        :line,\n        x = :t, \n        y = {field = :value, type=:quantitative, axis = {title = \"Value\"}},\n        color = :Model,\n        row = {field = :Summary, typ = :nominal}, \n        column = {field = :Measure, typ = :nominal},\n        resolve = {scale = {y = \"independent\"}}\n    )","category":"page"},{"location":"index.html","page":"Home","title":"Home","text":"using InteractiveUtils\nversioninfo()","category":"page"},{"location":"models/multi-arm.html#Multi-arm-Randomisation-Models","page":"Multi-arm Randomisation Models","title":"Multi-arm Randomisation Models","text":"","category":"section"},{"location":"models/multi-arm.html","page":"Multi-arm Randomisation Models","title":"Multi-arm Randomisation Models","text":"CompleteRandomisation","category":"page"},{"location":"models/multi-arm.html","page":"Multi-arm Randomisation Models","title":"Multi-arm Randomisation Models","text":"BlockUrn","category":"page"},{"location":"models/multi-arm.html","page":"Multi-arm Randomisation Models","title":"Multi-arm Randomisation Models","text":"MassWeightedUrn","category":"page"},{"location":"models/multi-arm.html#Index","page":"Multi-arm Randomisation Models","title":"Index","text":"","category":"section"},{"location":"models/multi-arm.html","page":"Multi-arm Randomisation Models","title":"Multi-arm Randomisation Models","text":"Pages = [\"multi-arm.md\"]","category":"page"}]
}
