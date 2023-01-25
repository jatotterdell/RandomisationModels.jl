Random.seed!(7103)
rng = MersenneTwister(123)

euclid(x, y) = sqrt(sum((x .- y) .^ 2))

@test_throws DomainError MassWeightedUrn([-0.5, 0.5])

m = MassWeightedUrn(repeat([1/4], 4))
@test prob(m) == target(m)

n = 10_000
res = randomise!(m, n)
tab = [(i, count(==(i), res)) for i in sort(unique(res))]
imb = zeros(n)
del = zeros(n)
dif = zeros(n)
for i in 1:n
    cnt = [count(==(j), res[1:i]) for j in sort(unique(res))]
    tar = i * target(m)
    imb[i] = euclid(cnt, tar)
    del[i] = maximum(cnt .- tar)
    dif[i] = maximum(cnt) - minimum(cnt)
end
# Should not exceed imbalance tolerance
@test maximum(dif) <= m.α