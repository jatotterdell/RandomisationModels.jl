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