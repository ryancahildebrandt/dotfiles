using Pkg
if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
end
ENV["JULIA_SSL_NO_VERIFY_HOSTS"] = "github.com"
ENV["JULIA_SSL_NO_VERIFY_HOSTS"] = "pkg.julialang.org"
ENV["BINARYPROVIDER_DOWNLOAD_ENGINE"] = "wget"
#ENV["JULIA_DEBUG"]="all"
