# Tuplers 

Tuplers.jl is a tiny library for creating tuples incrementally.

## Features

* Build simple or named tuples
* Appebd new elemenbts to the builder (Tupler) arbitrarily
* Build Tuple instances any time, continue appending, and rebuilding multiple times.

## Installation

```julia
] add Tuplers
```

## How to Use

* Create a Tupler object: `t = Tupler()`
* Append elements by calling well known Base.push! function, such as `push!(t, 123)`, or `push!(t, :a, 123)`, or `push!(t, (t, "a", 123))`
* Then build your tuple: `mytuple = build(t)`.
* Depending on your needs you can repeat the 2nd and 3rd steps arbitrarily

## Examples

The following code excerpts from [testing](test/runtests.jl) depicts usage scenarios.

### Simple tuple build" begi

```julia
using Tuplers

t = Tupler()
push!(t, 12)
push!(t, 34)
push!(t, 56)
tpl = build(t)   # (12, 34, 56)
````


### Named tuple build

```julia
t = Tupler()
push!(t, :a, 12)
push!(t, "b", 34)
push!(t, "c", 56)
tpl = build(t)    # (a = 12, b = 34, c = 56)
```

### Constructor arguments

```julia
t = Tupler(12)
push!(t, 34)
tpl = build(t)     # (12, 34)

tn = Tupler(:a, 12)
tpln = build(tn)    # (a = 12,)
```

### A multi-builded Tupler

```julia
t = Tupler(12)
push!(t, 34)
tpl1 = build(t)    # )12, 34)
push!(t, 56)
push!(t, 78)
tpl2 = build(t)    # (12, 34, 56, 78)
```

## API

### Constructors

```julia
Tupler()
Tupler(value::Any)
Tupler(name::String, value::Any)
Tupler(name::Symbol, value::Any)
```

Non-parameterised version create an empty builder.  The first `push!` call turns it a simple or named tuple builder.  The constructar with single parameter creates a simple tple builder with one element.  The constructures with pwo parameters create a named tuple builder with one element.  Element names would be in String or Symbol form.

### `push!()`

```julia
Base.push!(collection::Tupler, value::Any)
Base.push!(collection::Tupler, name::String, value::Any)
Base.push!(collection::Tupler, name::Symbol, value::Any)
```

These three methods added to `Base.push!`. The two-argument version appends a simple Tuple element, and three-argument versions append a named Tuple element to the builder.

### `build()`

```julia
build(collection::Tupler) -> Tuple
```

Returns an immutable Tuple object.  Because it does not destroy the builder object, you would continue to append elements and build new Tuples.

