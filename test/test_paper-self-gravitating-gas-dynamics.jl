module TestPaperSelfgravitatingGasDynamics

using Test
using Trixi

include("test_trixi.jl")

# Start with a clean environment: remove Trixi output directory if it exists
outdir = "out"
isdir(outdir) && rm(outdir, recursive=true)

# pathof(Trixi) returns /path/to/Trixi/src/Trixi.jl, dirname gives the parent directory
const EXAMPLES_DIR = joinpath(pathof(Trixi) |> dirname |> dirname, "examples", "paper-self-gravitating-gas-dynamics")

# Numerical examples from the Euler-gravity paper
@testset "paper-self-gravitating-gas-dynamics" begin
  @testset "parameters_eoc_test_euler.toml" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_euler.toml"),
            l2   = [0.00017409779099463607, 0.0003369287450282371, 0.00033692874502819616, 0.0006099035183426747],
            linf = [0.0010793454782482836, 0.0018836374478419238, 0.0018836374478410356, 0.003971446179607874])
  end

  @testset "parameters_eoc_test_euler.toml with polydeg=4" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_euler.toml"),
            l2   = [1.7187032983384504e-5, 2.6780178144541376e-5, 2.678017814469407e-5, 4.952410417693103e-5],
            linf = [0.00015018092862240096, 0.00016548331714294484, 0.00016548331714405506, 0.00043726245511699346],
            polydeg=4)
  end

  @testset "parameters_eoc_test_hyperbolic_diffusion.toml" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_hyperbolic_diffusion.toml"),
            l2   = [0.00315402168051244, 0.012394424055283394, 0.021859728673870843],
            linf = [0.017332075119072865, 0.07843510773347322, 0.11325788389718668])
  end

  @testset "parameters_eoc_test_hyperbolic_diffusion.toml with polydeg=4" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_hyperbolic_diffusion.toml"),
            l2   = [0.00025112830138292663, 0.0008808243851096586, 0.0016313343234903468],
            linf = [0.001719090967553516, 0.0031291844657076145, 0.00994609342322228],
            polydeg=4)
  end

  @testset "parameters_eoc_test_coupled_euler_gravity.toml" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_coupled_euler_gravity.toml"),
            l2   = [0.0002487158370511598, 0.0003370291440916084, 0.00033702914409161063, 0.0007231934514459757, 0.00013852406160669235, 0.0007541252869723029, 0.0007541252869723299],
            linf = [0.001581173125044355, 0.002049389755695241, 0.0020493897556961294, 0.004793721268126383, 0.0009549587622960237, 0.0030981236291827237, 0.003098123629182964],
            t_end=0.1)
  end

  @testset "parameters_eoc_test_coupled_euler_gravity.toml with polydeg=4" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_coupled_euler_gravity.toml"),
            l2   = [1.9536732064098693e-5, 2.756381055173374e-5, 2.7563810551703437e-5, 5.688705902953846e-5, 1.0684325470325204e-5, 5.829033623593028e-5, 5.829033623591347e-5],
            linf = [0.00012335977351507488, 0.00020086338378089152, 0.00020086338378044744, 0.0004962132679873221, 8.5358666522109e-5, 0.0002927883863423353, 0.00029278838634330673],
            t_end=0.1, polydeg=4)
  end

  @testset "parameters_eoc_test_coupled_euler_gravity.toml with update_gravity_once_per_stage=false" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_coupled_euler_gravity.toml"),
            l2   = [0.00039754984075255105, 0.0011317710289437735, 0.00113177102894379, 0.002302567979915388, 0.0002449228820755184, 0.0009838245219995854, 0.0009838245219995676],
            linf = [0.0013753628419428399, 0.0031706120730756737, 0.0031706120730756737, 0.0069469754604232214, 0.0008251489152860739, 0.0030597255494218545, 0.0030597255494215977],
            t_end=0.1, update_gravity_once_per_stage=false)
  end

  @testset "parameters_eoc_test_coupled_euler_gravity.toml with 1st order RK3S*" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_coupled_euler_gravity.toml"),
            l2   = [0.00024871583705119436, 0.0003370291440915927, 0.0003370291440916112, 0.0007231934514459859, 0.00013852406160669225, 0.0007541252869723031, 0.0007541252869723208],
            linf = [0.001581173125044355, 0.002049389755695241, 0.0020493897556961294, 0.004793721268126383, 0.0009549587622960237, 0.0030981236291827237, 0.003098123629182964],
            t_end=0.1, time_integration_scheme_gravity="timestep_gravity_erk51_3Sstar!")
  end

  @testset "parameters_eoc_test_coupled_euler_gravity.toml with 3rd order RK3S*" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_eoc_test_coupled_euler_gravity.toml"),
            l2   = [0.000248715837047647, 0.0003370291440257414, 0.00033702914402587556, 0.0007231934513057375, 0.0001385240616293125, 0.0007541252869544295, 0.0007541252869544261],
            linf = [0.00158117312532835, 0.0020493897540796446, 0.0020493897540800887, 0.0047937212650124295, 0.000954958762033685, 0.0030981236303003834, 0.003098123630300921],
            t_end=0.1, time_integration_scheme_gravity="timestep_gravity_erk53_3Sstar!")
  end

  @testset "parameters_jeans_instability.toml" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_jeans_instability.toml"),
            l2   = [10734.053145619571, 13357.12732342943, 1.689152281530251e-6, 26835.125221793754],
            linf = [15194.889945842326, 18881.97158566768, 8.787452968447721e-6, 37974.480818059295],
            t_end=0.1)
  end

  @testset "parameters_jeans_instability.toml with update_gravity_once_per_stage=false" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_jeans_instability.toml"),
            l2   = [10723.612237729343, 13336.21827245215, 2.602694645664843e-6, 26809.022944817934],
            linf = [15180.113784657791, 18852.413654859887, 9.130954929048019e-6, 37937.54015407339],
            t_end=0.1, update_gravity_once_per_stage=false)
  end

  @testset "parameters_jeans_instability.toml with RK3S*" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_jeans_instability.toml"),
            l2   = [10734.450531008228, 13358.15805096243, 2.0427912643500984e-6, 26836.118685698464],
            linf = [15195.451979616657, 18883.428240704106, 1.0980410384074066e-5, 37975.88591177389],
            t_end=0.1, time_integration_scheme_gravity="timestep_gravity_erk52_3Sstar!",
            cfl_gravity=1.2)
  end

  @testset "parameters_sedov_self_gravity.toml" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_sedov_self_gravity.toml"),
            l2   = [0.04630745182870653, 0.06507397069667138, 0.06507397069667123, 0.48971269294890085],
            linf = [2.3861430058270847, 4.083635578775231, 4.083635578775232, 16.246070713311475],
            t_end=0.05)
  end

  @testset "parameters_sedov_self_gravity.toml with amr_interval=0 and ref-level=8" begin
    test_trixi_run(joinpath(EXAMPLES_DIR, "parameters_sedov_self_gravity.toml"),
            l2   = [0.0028922121586238323, 0.013724796675028317, 0.013724796675028307, 0.05822941648860658],
            linf = [0.26747911779347966, 1.385822018653034, 1.385822018653034, 4.071204772447614],
            t_end=0.005, amr_interval=0, initial_refinement_level=8)
  end
end

# Clean up afterwards: delete Trixi output directory
@test_nowarn rm(outdir, recursive=true)

end #module
