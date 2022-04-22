Random.seed!(91247)
rng = MersenneTwister(817)

@test_throws DomainError PermutedBlock([-0.5, 0.5], 2)
@test_throws DomainError PermutedBlock([-1, 2], 2)
@test_throws DomainError PermutedBlock([1, 2], 4)

PB0 = PermutedBlock([1 / 3, 0, 1 / 3, 1 / 3], 3)
PB1 = PermutedBlock(1:4, 10)

@test begin
    p = [10, 14, 17]
    b = 41
    PermutedBlock(p, b) == PermutedBlock(p ./ sum(p), b)
end
