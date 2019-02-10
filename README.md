# Tuplegen

Tuples are immutable, and you can call the constructor once per Tuple. Tiny Tuplegen package allows you to push Tuple elements incrementally to its builder and create the it when you are ready.

```julia
Pkg> add Tuplegen
```

```julia
julia> using Tuplegen
[ Info: Precompiling Tuplegen [8d8f192e-2bb7-11e9-3a3b-fd36ecdba0d6]

julia> tb = Builder()
Builder(:(()))

julia> push!(tb, 12)
Builder(:((12,)))

julia> push!(tb, 34)
Builder(:((12, 34)))

julia> push!(tb, 56)
Builder(:((12, 34, 56)))

julia> t = build(tb)
(12, 34, 56)
```

```julia
julia> using Tuplegen

julia> ntb = Builder()
Builder(:(()))

julia> push!(ntb, :a, 12)
Builder(:((a = 12,)))

julia> push!(ntb, "b", 34)
Builder(:((a = 12, b = 34)))

julia> nt = build(ntb)
(a = 12, b = 34)
```
