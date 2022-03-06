# RandomisationModels.jl

Documentation for RandomisationModels.jl

## Overview

## Installation

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
c = zeros(Real, 100, 10_000)
m = zeros(Real, 100, 10_000)
for i in 1:100
    randomise!.(C)
    randomise!.(M)
    c[i,:] = imbalance.(C)
    m[i,:] = imbalance.(M)
end
dat = DataFrame(
    t = 1:100, 
    CR = mean(c, dims = 2)[:,1],
    MWU = mean(m, dims = 2)[:,1])
dat = stack(dat, [:CR, :MWU], :t, 
    variable_name = "Model", value_name = "Imbalance")
dat |> @vlplot(width = 400, height = 300,
    :line, :t, :Imbalance, color = :Model, 
    title = "Average imbalance (10,000 simulations)")
```
