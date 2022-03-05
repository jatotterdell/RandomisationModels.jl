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
# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/jatotterdell/RandomisationModels.jl.git",
    devbranch = "main"
)