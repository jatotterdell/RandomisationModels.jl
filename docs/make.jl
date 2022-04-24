using Documenter
using RandomisationModels

makedocs(
    modules = [RandomisationModels],
    sitename = "RandomisationModels.jl",
    authors = "James Totterdell",
    pages = [
        "Home" => "index.md",
        "Models" => ["models/multi-arm.md"],
        "Library" => ["lib/public.md"],
    ],
    format = Documenter.HTML(prettyurls = false),
)

deploydocs(repo = "github.com/jatotterdell/RandomisationModels.jl.git", devbranch = "main")
