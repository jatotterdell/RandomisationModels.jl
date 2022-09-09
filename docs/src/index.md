# RandomisationModels.jl

Documentation for RandomisationModels.jl

## Overview

## Installation

```julia
using Pkg
Pkg.add("https://github.com/jatotterdell/RandomisationModels.jl.git")
```

## Quick Example

```@example quick
using RandomisationModels
using StatsBase

MWU = MassWeightedUrn(collect(1:4))
randomise!(MWU, 100);
sort(countmap(sequence(MWU)))
```

```@example imbalance
using RandomisationModels
using StatsBase
using DataFrames
using VegaLite

C = [CompleteRandomisation(1:4) for _ in 1:10_000]
M = [MassWeightedUrn(1:4, 4) for _ in 1:10_000]
P = [PermutedBlock(1:4, 10) for _ in 1:10_000]
B = [BlockUrn(1:4, 10) for _ in 1:10_000]
c = zeros(Real, 100, 10_000, 2)
m = zeros(Real, 100, 10_000, 2)
p = zeros(Real, 100, 10_000, 2)
b = zeros(Real, 100, 10_000, 2)
for i in 1:100
    randomise!.(C)
    randomise!.(M)
    randomise!.(P)
    randomise!.(B)
    c[i,:,:] = [imbalance.(C) predictability.(C)]
    m[i,:,:] = [imbalance.(M) predictability.(M)]
    p[i,:,:] = [imbalance.(P) predictability.(P)]
    b[i,:,:] = [imbalance.(B) predictability.(B)]
end
c_mean = mean(c, dims = 2)
m_mean = mean(m, dims = 2)
p_mean = mean(p, dims = 2)
b_mean = mean(b, dims = 2)
c_max = maximum(c, dims = 2)
m_max = maximum(m, dims = 2)
p_max = maximum(p, dims = 2)
b_max = maximum(b, dims = 2)
dat = DataFrame(
    t = 1:100, 
    CR_Mean_Imbalance = c_mean[:,1,1],
    CR_Mean_Predictability  = c_mean[:,1,2],
    CR_Max_Imbalance = c_max[:,1,1],
    CR_Max_Predictability  = c_max[:,1,2],
    MWU_Mean_Imbalance = m_mean[:,1,1],
    MWU_Mean_Predictability  = m_mean[:,1,2],
    MWU_Max_Imbalance = m_max[:,1,1],
    MWU_Max_Predictability  = m_max[:,1,2],
    PB_Mean_Imbalance = p_mean[:,1,1],
    PB_Mean_Predictability  = p_mean[:,1,2],
    PB_Max_Imbalance = p_max[:,1,1],
    PB_Max_Predictability  = p_max[:,1,2],
    BU_Mean_Imbalance = b_mean[:,1,1],
    BU_Mean_Predictability = b_mean[:,1,2],
    BU_Max_Imbalance = b_max[:,1,2],
    BU_Max_Predictability = b_max[:,1,2]
)
dat = stack(dat, Not(:t), :t, 
    variable_name = "Model", value_name = "value")
transform!(dat, :Model => ByRow(x -> split(x, "_")) => [:Model, :Summary, :Measure])
dat |>
    @vlplot(
        :line,
        x = :t, 
        y = {field = :value, type=:quantitative, axis = {title = "Value"}},
        color = :Model,
        row = {field = :Summary, typ = :nominal}, 
        column = {field = :Measure, typ = :nominal},
        resolve = {scale = {y = "independent"}}
    )
```

```@example version
using InteractiveUtils
versioninfo()
```
