using LinearAlgebra
using SparseArrays

m = 3
n = 3

# Create a vector of n random m×1 blocks (dense matrices)
blocks = [rand(m, 1) for _ in 1:n]

# Create block-diagonal matrix (sparse version)
A_sparse = blockdiag(sparse.(blocks)...)

# Or create dense version (alternative methods)
A_dense = reduce(vcat, [b for b in blocks]) 