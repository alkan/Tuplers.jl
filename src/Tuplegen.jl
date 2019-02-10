baremodule Tuplegen

using Base
eval(s) = Core.eval(Tuplegen, s)

const eq = Symbol("=")
mutable struct Builder
    tuple::Expr
    function Builder()
        new(Expr(:tuple))
    end
end

function Base.push!(t::Builder, it)
    push!(t.tuple.args, it)
    t
end

function Base.push!(t::Builder, name::Symbol, val)
    ex = Expr(eq, name, val)
    push!(t.tuple.args, ex)
    t
end

Base.push!(t::Builder, name::String, val) = push!(t, Symbol(name), val)

function build(t::Builder)
    eval(t.tuple)
end

export Builder, build

end # module
