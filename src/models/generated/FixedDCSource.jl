#=
This file is auto-generated. Do not edit.
=#
"""
    mutable struct FixedDCSource <: DCSource
        voltage::Float64
        P_ref::Float64
        ext::Dict{String, Any}
        states::Vector{Symbol}
        n_states::Int64
        internal::InfrastructureSystemsInternal
    end

Parameters of a Fixed DC Source that returns a fixed DC voltage

# Arguments
- `voltage::Float64`: rated VA, validation range: (0, nothing)
- `P_ref::Float64`: Reference Power Set-point, validation range: (0, nothing)
- `ext::Dict{String, Any}`
- `states::Vector{Symbol}`
- `n_states::Int64`: FixedDCSource has no states
- `internal::InfrastructureSystemsInternal`: power system internal reference, do not modify
"""
mutable struct FixedDCSource <: DCSource
    "rated VA"
    voltage::Float64
    "Reference Power Set-point"
    P_ref::Float64
    ext::Dict{String, Any}
    states::Vector{Symbol}
    "FixedDCSource has no states"
    n_states::Int64
    "power system internal reference, do not modify"
    internal::InfrastructureSystemsInternal
end

function FixedDCSource(voltage, P_ref=1.0, ext=Dict{String, Any}(), )
    FixedDCSource(voltage, P_ref, ext, Vector{Symbol}(), 0, InfrastructureSystemsInternal(), )
end

function FixedDCSource(; voltage, P_ref=1.0, ext=Dict{String, Any}(), )
    FixedDCSource(voltage, P_ref, ext, )
end

# Constructor for demo purposes; non-functional.
function FixedDCSource(::Nothing)
    FixedDCSource(;
        voltage=0,
        P_ref=0,
        ext=Dict{String, Any}(),
    )
end

"""Get FixedDCSource voltage."""
get_voltage(value::FixedDCSource) = value.voltage
"""Get FixedDCSource P_ref."""
get_P_ref(value::FixedDCSource) = value.P_ref
"""Get FixedDCSource ext."""
get_ext(value::FixedDCSource) = value.ext
"""Get FixedDCSource states."""
get_states(value::FixedDCSource) = value.states
"""Get FixedDCSource n_states."""
get_n_states(value::FixedDCSource) = value.n_states
"""Get FixedDCSource internal."""
get_internal(value::FixedDCSource) = value.internal

"""Set FixedDCSource voltage."""
set_voltage!(value::FixedDCSource, val::Float64) = value.voltage = val
"""Set FixedDCSource P_ref."""
set_P_ref!(value::FixedDCSource, val::Float64) = value.P_ref = val
"""Set FixedDCSource ext."""
set_ext!(value::FixedDCSource, val::Dict{String, Any}) = value.ext = val
"""Set FixedDCSource states."""
set_states!(value::FixedDCSource, val::Vector{Symbol}) = value.states = val
"""Set FixedDCSource n_states."""
set_n_states!(value::FixedDCSource, val::Int64) = value.n_states = val
"""Set FixedDCSource internal."""
set_internal!(value::FixedDCSource, val::InfrastructureSystemsInternal) = value.internal = val
