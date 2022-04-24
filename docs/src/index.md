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
c = mean(c, dims = 2)
m = mean(m, dims = 2)
p = mean(p, dims = 2)
b = mean(b, dims = 2)
dat = DataFrame(
    t = 1:100, 
    CR_Imbalance = c[:,1,1],
    CR_Predictability  = c[:,1,2],
    MWU_Imbalance = m[:,1,1],
    MWU_Predictability  = m[:,1,2],
    PB_Imbalance = p[:,1,1],
    PB_Predictability  = p[:,1,2],
    BU_Imbalance = b[:,1,1],
    BU_Predictability = b[:,1,2])
dat = stack(dat, Not(:t), :t, 
    variable_name = "Model", value_name = "value")
transform!(dat, :Model => ByRow(x -> split(x, "_")) => [:Model, :Measure])
dat = unstack(dat, :Measure, :value)
dat |> 
@vlplot(repeat = {column=[:Imbalance, :Predictability]}, title = "10,000 simulations") +
(
    @vlplot(
        :line, 
        x = :t, 
        y = {field = {repeat=:column},aggregate=:mean,type=:quantitative}, 
        color = :Model)
)
```

```@example version
using InteractiveUtils
versioninfo()
```
