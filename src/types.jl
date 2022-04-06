abstract type RandomisationModel end
abstract type TwoArmRandomisationModel <: RandomisationModel end
abstract type MultiArmRandomisationModel <: RandomisationModel end

target(RM::RandomisationModel) = RM.target
narms(RM::RandomisationModel) = length(RM.target)
sequence(RM::RandomisationModel) = RM.sequence
dist(RM::RandomisationModel) = RM.dist
imbalance(RM::RandomisationModel) = euclidean(dist(RM), sum(dist(RM)) * target(RM))
predictability(RM::RandomisationModel) = euclidean(prob(RM), target(RM))


"""
    randomise!(rng::AbstractRNG, RM::RandomisationModel)

Generate a single random allocation from a randomisation model, `RM`, 
using `prob(RM)` and the random number generator provided.
"""
function randomise!(rng::AbstractRNG, RM::RandomisationModel)
    y = sample(rng, 1:narms(RM), Weights(prob(RM)))
    update!(RM, y)
    return y
end
randomize!(rng::AbstractRNG, RM::RandomisationModel) = randomise!(rng::AbstractRNG, RM::RandomisationModel)


"""
    randomise!(RM::RandomisationModel)

Generate a single random allocation from a randomisation model using prob(RM) and the global RNG.
"""
function randomise!(RM::RandomisationModel)
    y = sample(1:narms(RM), Weights(prob(RM)))
    update!(RM, y)
    return y
end
randomize!(RM::RandomisationModel) = randomise!(RM::RandomisationModel)


"""
    randomise!(rng::AbstractRNG, RM::RandomisationModel, n::Int)

Generate a n random allocation's from a randomisation model using prob(RM) and
the random number generator provided.
"""
function randomise!(rng::AbstractRNG, RM::RandomisationModel, n::Int)
    # u = rand(rng, n)
    y = zeros(Int, n)
    for i in 1:n
        y[i] = sample(rng, 1:narms(RM), Weights(prob(RM)))
        update!(RM, y[i])
    end
    return y
end
randomize!(rng::AbstractRNG, RM::RandomisationModel, n::Int) = randomise!(rng::AbstractRNG, RM::RandomisationModel, n::Int)


"""
    randomise!(RM::RandomisationModel, n::Int)

Generate a n random allocation's from a randomisation model using prob(RM) and
the global RNG.
"""
function randomise!(RM::RandomisationModel, n::Int)
    # u = rand(rng, n)
    y = zeros(Int, n)
    for i in 1:n
        # y[i] = random_sample(prob(MWU), u[i])
        y[i] = sample(1:narms(RM), Weights(prob(RM)))
        update!(RM, y[i])
    end
    return y
end
randomize!(RM::RandomisationModel, n::Int) = randomise!(RM::RandomisationModel, n::Int)


"""
    randomise(rng::AbstractRNG, RM::RandomisationModel)

Generates allocations from the randomisation model without updating the models.
"""
randomise(rng::AbstractRNG, RM::RandomisationModel) = sample(rng, 1:narms(RM), Weights(prob(RM)))

"""
    randomize(rng::AbstractRNG, RM::RandomisationModel)

Generates allocations from the randomisation model without updating the models.
"""
randomize(rng::AbstractRNG, RM::RandomisationModel) = randomise(rng::AbstractRNG, RM::RandomisationModel)
randomise(RM::RandomisationModel) = sample(1:narms(RM), Weights(prob(RM)))
randomize(RM::RandomisationModel) = randomise(RM::RandomisationModel)


"""
    randomise(rng::AbstractRNG, RM::RandomisationModel, n::Int)

Generates n allocations
"""
function randomise(rng::AbstractRNG, RM::RandomisationModel, n::Int)
    y = zeros(Int, n)
    tmpRM = deepcopy(RM)
    for i in 1:n
        y[i] = sample(rng, 1:narms(tmpRM), Weights(prob(tmpRM)))
        update!(tmpRM, y[i])
    end
    return y
end
randomize(rng::AbstractRNG, RM::RandomisationModel, n::Int) = randomise(rng::AbstractRNG, RM::RandomisationModel, n::Int)


function randomise(RM::RandomisationModel, n::Int)
    y = zeros(Int, n)
    tmpRM = deepcopy(RM)
    for i in 1:n
        y[i] = sample(1:narms(tmpRM), Weights(prob(tmpRM)))
        update!(tmpRM, y[i])
    end
    return y
end
randomize(RM::RandomisationModel, n::Int) = randomise(RM::RandomisationModel, n::Int)
