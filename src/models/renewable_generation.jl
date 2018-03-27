export RenewableGen
export TechRE
export EconRE
export ReFix
export ReCurtailment

abstract type 
    RenewableGen <: Generator
end

struct TechRE
    installedcapacity::Real # [MW]
    reactivepowerlimits::Union{NamedTuple,Nothing}
    powerfactor::Union{Real,Nothing}
end

TechRE(; installedcapacitys = 0, reactivepowerlimits = nothing, powerfactor = nothing) = TechRE(installedcapacitys, reactivepowerlimits, powerfactor)

struct EconRE
    curtailcost::Real # [$/MWh]
    interruptioncost::Union{Real,Nothing} # [$]
end

EconRE(; curtailcost = 0.0, interruptioncost = nothing) = EconRE(curtailcost, interruptioncost)

struct ReFix <: RenewableGen
    name::String
    status::Bool
    bus::Bus
    tech::TechRE
    scalingfactor::TimeSeries.TimeArray
    function ReFix(name, status, bus, installedcapacity::Real, scalingfactor)
        tech = TechRE(installedcapacity, nothing, 1.0)      
        new(name, status, bus, tech, scalingfactor)
    end
end

ReFix(; name="init", 
        status = false, 
        bus = Bus(), 
        installedcapacity = 0.0, 
        scalingfactor = TimeSeries.TimeArray(today(), [1.0])) = ReFix(name, status, bus, installedcapacity, scalingfactor)

struct ReCurtailment <: RenewableGen
    name::String
    status::Bool
    bus::Bus
    tech::TechRE
    econ::Union{EconRE,Nothing}
    scalingfactor::TimeSeries.TimeArray 
    function ReCurtailment(name, status, bus, installedcapacity::Real, econ, scalingfactor)
        tech = TechRE(installedcapacity, nothing, 1.0)      
        new(name, status, bus, tech, econ, scalingfactor)
    end
end

ReCurtailment(; name = "init", 
                status = false, 
                bus= Bus(), 
                tech = TechRE(),
                econ = EconRE(),
                scalingfactor = TimeSeries.TimeArray(today(), [1.0])) = ReCurtailment(name, status, bus, tech, econ, scalingfactor)

struct ReReactiveDispatch <: RenewableGen
    name::String
    status::Bool
    bus::Bus
    tech::TechRE
    econ::Union{EconRE,Nothing}
    scalingfactor::TimeSeries.TimeArray
end