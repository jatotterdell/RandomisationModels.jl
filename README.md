# RandomisationModels.jl

|                                                                                                                                                                          **Build status**                                                                                                                                                                          |                                                                                                            **Documentation**                                                                                                            |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| [![Build status (Github Actions)](https://github.com/jatotterdell/RandomisationModels.jl/workflows/CI/badge.svg)](https://github.com/jatotterdell/RandomisationModels.jl/actions) [![codecov.io](http://codecov.io/github/jatotterdell/RandomisationModels.jl/coverage.svg?branch=main)](http://codecov.io/github/jatotterdell/RandomisationModels.jl?branch=main) | [![](https://img.shields.io/badge/docs-stable-blue.svg)](https://jatotterdell.github.io/RandomisationModels.jl/stable) [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://jatotterdell.github.io/RandomisationModels.jl/dev) |

Implementation of randomisation models used for generating treatment allocations in clinical trials.

## Overview

Plan for

- unrestricted randomisation
- restricted randomisation
  - two-arm
    - biased-coin
  - mult-arm
    - permuted block
    - brick-tunnel
    - urn models
- covariate-adjusted randomisation
  - minimisation
  - model-based
- utilities for simulations studies comparing models

## Installation

```julia
pkg> add https://github.com/jatotterdell/RandomisationModels.jl.git
```
