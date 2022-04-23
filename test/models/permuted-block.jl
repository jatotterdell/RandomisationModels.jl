Random.seed!(91247)
rng1 = MersenneTwister(817)
rng2 = deepcopy(rng1)

@test_throws DomainError PermutedBlock([-0.5, 0.5], 2)
@test_throws DomainError PermutedBlock([-1, 2], 2)
@test_throws DomainError PermutedBlock([1, 2], 4)
@test_throws DomainError PermutedBlock([1, 2, 2], 3)

p0 = [1 / 3, 0, 1 / 3, 1 / 3]
w1 = 1:4
PB0 = PermutedBlock(p0, 3)
PB1 = PermutedBlock(w1, 10)

@test narms(PB0) == 4
@test target(PB0) == p0
@test prob(PB0) ≈ target(PB0)
@test sequence(PB0) == zeros(0)
@test dist(PB0) == zeros(narms(PB0))
@test imbalance(PB0) == 0.0
@test predictability(PB0) == 0.0
@test weights(PB0) == round.(Int, blocksize(PB0) .* target(PB0))

@test target(PB1) ≈ collect(w1 ./ sum(w1))
@test prob(PB1) ≈ target(PB1)

@test begin
    p = [10, 14, 17]
    b = 41
    PermutedBlock(p, b) == PermutedBlock(p ./ sum(p), b)
end

# Check that randomise! does alter state
# Both intialises lead to same sequence
w = 1:4
PB1 = PermutedBlock(w, 20)
PB2 = PermutedBlock(w ./ sum(w), 20)
res1 = randomise!(rng1, PB1, 20)
res2 = randomise!(rng2, PB2, 20)
@test sequence(PB1) == res1
@test sequence(PB2) == res2
@test prob(PB1) ≈ prob(PB2)
@test dist(PB1) == dist(PB2)
@test imbalance(PB0) == 0.0
randomise!(PB1, 19)
@test maximum(prob(PB1)) ≈ 1.0