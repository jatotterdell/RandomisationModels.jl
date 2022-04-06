push!(LOAD_PATH, "../src/")

using Documenter
using RandomisationModels

makedocs(sitename = "RandomisationModels.jl Documentation",
    pages = [
        "Home" => "index.md",
        "Library" => [
            "lib/public.md"
        ]
    ],
    format = Documenter.HTML(prettyurls = false)
)

deploydocs(
    repo = "github.com/jatotterdell/RandomisationModels.jl.git",
    devbranch = "main"
)