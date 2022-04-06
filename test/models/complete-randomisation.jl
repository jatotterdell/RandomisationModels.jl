Random.seed!(7103)
rng = MersenneTwister(123)


@test_throws DomainError CompleteRandomisation([-0.5, 0.5])

CR1 = CompleteRandomisation([1, 1])
@test narms(CR1) == 2
@test target(CR1) == [0.5, 0.5]
@test sequence(CR1) == zeros(0)
@test dist(CR1) == zeros(narms(CR1))
@test imbalance(CR1) == 0.0
@test predictability(CR1) == 0.0
@test prob(CR1) == target(CR1)

# Check that randomise does not alter state
res = randomise(rng, CR1)
@test narms(CR1) == 2
@test target(CR1) == [0.5, 0.5]
@test sequence(CR1) == zeros(0)
@test dist(CR1) == zeros(narms(CR1))
@test imbalance(CR1) == 0.0
@test predictability(CR1) == 0.0

# Check that randomise! does alter state
res1 = randomise!(rng, CR1)
@test narms(CR1) == 2
@test target(CR1) == [0.5, 0.5]
@test sequence(CR1) == [res1]
@test imbalance(CR1) == euclidean(target(CR1), [0, 1])
@test dist(CR1) == Int.([x == res1 for x in 1:2])

res2 = randomise!(rng, CR1, 10)
@test length(res2) == 10
