using Test, Metalhead
using Flux
using Flux: Zygote

function gradtest(model, input)
  y, pb = Zygote.pullback(() -> model(input), Flux.params(model))
  gs = pb(ones(Float32, size(y)))

  # if we make it to here with no error, success!
  return true
end

# CNN tests
@testset verbose = true "ConvNets" begin
  include("convnets.jl")
end

# Other tests
@testset verbose = true "Other" begin
  include("other.jl")
end
