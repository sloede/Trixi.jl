module TestExamples2D

using Test
using Trixi

include("test_trixi.jl")

# Start with a clean environment: remove Trixi output directory if it exists
outdir = "out"
isdir(outdir) && rm(outdir, recursive=true)

# pathof(Trixi) returns /path/to/Trixi/src/Trixi.jl, dirname gives the parent directory
const EXAMPLES_DIR = joinpath(pathof(Trixi) |> dirname |> dirname, "examples", "2d")

@testset "2D" begin

# Run basic tests
@testset "Examples 2D" begin
  @testset "elixir_advection_basic.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_advection_basic.jl"),
      l2   = [9.144681765639205e-6],
      linf = [6.437440532547356e-5])
  end

  @testset "elixir_advection_mortar.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_advection_mortar.jl"),
      l2   = [0.022356422238096973],
      linf = [0.5043638249003257])
  end

  @testset "elixir_advection_amr.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_advection_amr.jl"),
      l2   = [0.009801425100170215],
      linf = [0.04335954152178878])
  end

  @testset "elixir_advection_restart.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_advection_restart.jl"),
      l2   = [1.2148032444677485e-5],
      linf = [6.495644794757283e-5])
  end

  @testset "elixir_advection_timeintegration.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_advection_timeintegration.jl"),
      l2   = [9.144681778837444e-6],
      linf = [6.437440532436334e-5])
  end

  @testset "elixir_advection_callbacks.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_advection_callbacks.jl"))
  end


  @testset "elixir_hyp_diff_llf.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_hyp_diff_llf.jl"),
      l2   = [0.00015687751816056159, 0.001025986772217084, 0.0010259867722169909],
      linf = [0.0011986956416591976, 0.006423873516411049, 0.006423873516411049])
  end

  @testset "elixir_hyp_diff_harmonic_nonperiodic.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_hyp_diff_harmonic_nonperiodic.jl"),
      l2   = [8.61813235543625e-8, 5.619399844542781e-7, 5.6193998447443e-7],
      linf = [1.124861862180196e-6, 8.622436471039663e-6, 8.622436470151484e-6])
  end

  @testset "elixir_hyp_diff_nonperiodic.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_hyp_diff_nonperiodic.jl"),
      l2   = [8.523077653955306e-6, 2.8779323653065056e-5, 5.4549427691297846e-5],
      linf = [5.5227409524905013e-5, 0.0001454489597927185, 0.00032396328684569653])
  end

  @testset "elixir_hyp_diff_upwind.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_hyp_diff_upwind.jl"),
      l2   = [5.868147556385677e-6, 3.805179273239753e-5, 3.805179273248075e-5],
      linf = [3.7019654930525725e-5, 0.00021224229433514097, 0.00021224229433514097])
  end


  @testset "elixir_euler_source_terms.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_source_terms.jl"),
    l2   = [8.517783186497567e-7, 1.2350199409361865e-6, 1.2350199409828616e-6, 4.277884398786315e-6],
    linf = [8.357934254688004e-6, 1.0326389653148027e-5, 1.0326389654924384e-5, 4.4961900057316484e-5])
  end

  @testset "elixir_euler_density_wave.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_density_wave.jl"),
    l2   = [0.0010600778457965205, 0.00010600778457646603, 0.0002120155691588112, 2.6501946142012653e-5],
    linf = [0.006614198043407127, 0.0006614198043931596, 0.001322839608845383, 0.00016535495117153687],
    tspan = (0.0, 0.5))
  end

  @testset "elixir_euler_nonperiodic.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_nonperiodic.jl"),
    l2   = [2.3652137675654753e-6, 2.1386731303685556e-6, 2.138673130413185e-6, 6.009920290578574e-6],
    linf = [1.4080448659026246e-5, 1.7581818010814487e-5, 1.758181801525538e-5, 5.9568540361709665e-5])
  end

  @testset "elixir_euler_ec.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_ec.jl"),
    l2   = [0.061733846713578594, 0.05020086119442834, 0.05020836856347214, 0.2259064869636338],
    linf = [0.29894122391731826, 0.30853631977725215, 0.3084722538869674, 1.0652455597305965])
  end

  @testset "elixir_euler_blast_wave_shockcapturing.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_blast_wave_shockcapturing.jl"),
    l2   = [0.13575932799459445, 0.11346025131402862, 0.11346028941202581, 0.33371846538168354],
    linf = [1.4662633480487193, 1.3203905049492335, 1.320390504949303, 1.8131376065886553],
    tspan = (0.0, 0.13))
  end

  @testset "elixir_euler_weak_blast_wave_shockcapturing.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_weak_blast_wave_shockcapturing.jl"),
    l2   = [0.053797693352771236, 0.0469609422046655, 0.04696357535470453, 0.19685219525959569],
    linf = [0.18540098690235163, 0.2402949901937739, 0.23266805976720523, 0.6874635927547934])
  end

  @testset "elixir_euler_blast_wave_shockcapturing_amr.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_blast_wave_shockcapturing_amr.jl"),
    l2   = [0.6778339184192986, 0.28136085729167076, 0.2813607687129121, 0.7202946425475186],
    linf = [2.8891939545999277, 1.8038083274644838, 1.8036523839220984, 3.0363712085327177],
    tspan = (0.0, 1.0))
  end

  @testset "elixir_euler_sedov_blast_wave_shockcapturing_amr.jl with tend = 1.0" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_sedov_blast_wave_shockcapturing_amr.jl"),
    l2   = [0.48179128651635356, 0.16552908046011455, 0.16553045844776362, 0.6182628255460497],
    linf = [2.4847876521233907, 1.2814307117459813, 1.2814769220593392, 6.474196250771773],
    tspan = (0.0, 1.0))
  end

  @testset "elixir_euler_blob_shockcapturing_amr.jl" begin
    @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_blob_shockcapturing_amr.jl"),
      l2   = [0.2012143467980036, 1.1813241716700988, 0.10144725208346557, 5.230607564921326],
      linf = [14.111578610092542, 71.21944410118338, 7.304666476530256, 291.9385076318331],
      tspan = (0.0, 0.12))
  end

  @testset "elixir_euler_khi_shockcapturing.jl" begin
    if Threads.nthreads() == 1
      # This example uses random numbers to generate the initial condition.
      # Hence, we can only check "errors" if everything is made reproducible.
      # However, that's not enough to ensure reproducibility since the stream
      # of random numbers is not guaranteed to be the same across different
      # minor versions of Julia.
      # See https://github.com/trixi-framework/Trixi.jl/issues/232#issuecomment-709738400
      @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_khi_shockcapturing.jl"),
        l2   = [0.0020460050625351277, 0.0028624298590723372, 0.001971035381754319, 0.004814883331768111],
        linf = [0.02437585564403255, 0.018033033465721604, 0.00993916546672498, 0.02097263472404709],
        tspan = (0.0, 0.2))
    else
      @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_khi_shockcapturing.jl"),
        tspan = (0.0, 0.2))
    end
  end

  @testset "elixir_euler_khi_shockcapturing_amr.jl" begin
    if Threads.nthreads() == 1
      # This example uses random numbers to generate the initial condition.
      # Hence, we can only check "errors" if everything is made reproducible.
      # However, that's not enough to ensure reproducibility since the stream
      # of random numbers is not guaranteed to be the same across different
      # minor versions of Julia.
      # See https://github.com/trixi-framework/Trixi.jl/issues/232#issuecomment-709738400
      @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_khi_shockcapturing_amr.jl"),
        l2   = [0.001617236176233394, 0.0023394729603446697, 0.001296199247911843, 0.0033150160736185323],
        linf = [0.019002843896656074, 0.017242107049387223, 0.008179888370650977, 0.016885672229959958],
        tspan = (0.0, 0.2))
    else
      @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_khi_shockcapturing_amr.jl"),
        tspan = (0.0, 0.2))
    end
  end

  @testset "elixir_euler_vortex.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex.jl"),
    l2   = [3.6342636871275523e-6, 0.0032111366825032443, 0.0032111479254594345, 0.004545714785045611],
    linf = [7.903587114788113e-5, 0.030561314311228993, 0.030502600162385596, 0.042876297246817074])
  end

  @testset "elixir_euler_vortex_mortar.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex_mortar.jl"),
    l2   = [2.120307461394424e-6, 2.7929229084570266e-5, 3.759342242369596e-5, 8.813646673773311e-5],
    linf = [5.9320459189771135e-5, 0.0007491265403041236, 0.0008165690047976515, 0.0022122638048145404])
  end

  @testset "elixir_euler_vortex_mortar_split.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex_mortar_split.jl"),
    l2   = [2.1203693476896995e-6, 2.8053512416422296e-5, 3.76179445622429e-5, 8.840787521479401e-5],
    linf = [5.9005667252809424e-5, 0.0007554116730550398, 0.00081660478740464, 0.002209016304192346])
  end

  @testset "elixir_euler_vortex_mortar_split.jl with flux_central" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex_mortar_split.jl"),
    l2   = [2.120307461409829e-6, 2.7929229084583212e-5, 3.759342242369501e-5, 8.813646673812448e-5],
    linf = [5.932045918888296e-5, 0.0007491265403021252, 0.0008165690047987617, 0.002212263804818093],
    volume_flux = flux_central)
  end

  @testset "elixir_euler_vortex_mortar_split.jl with flux_shima_etal" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex_mortar_split.jl"),
    l2   = [2.120103291509122e-6, 2.805652562691104e-5, 3.759500428816484e-5, 8.841374592860891e-5],
    linf = [5.934103184424e-5, 0.0007552316820342853, 0.0008152449048961508, 0.002206987374638203],
    volume_flux = flux_shima_etal)
  end

  @testset "elixir_euler_vortex_mortar_split.jl with flux_ranocha" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex_mortar_split.jl"),
    l2   = [2.1201032806889955e-6, 2.8056528074361895e-5, 3.759500957406334e-5, 8.841379428954133e-5],
    linf = [5.934027760512439e-5, 0.0007552314317718078, 0.0008152450117491217, 0.0022069976113101575],
    volume_flux = flux_ranocha)
  end

  @testset "elixir_euler_vortex_shockcapturing.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex_shockcapturing.jl"),
    l2   = [3.80342739421474e-6, 5.561118953968859e-5, 5.564042529709319e-5, 0.0001570628548096201],
    linf = [8.491382365727329e-5, 0.0009602965158113097, 0.0009669978616948516, 0.0030750353269972663])
  end

  @testset "elixir_euler_vortex_mortar_shockcapturing.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex_mortar_shockcapturing.jl"),
    l2   = [2.1203693476896995e-6, 2.8053512416422296e-5, 3.76179445622429e-5, 8.840787521479401e-5],
    linf = [5.9005667252809424e-5, 0.0007554116730550398, 0.00081660478740464, 0.002209016304192346])
  end

  @testset "elixir_euler_vortex_amr.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_vortex_amr.jl"),
    l2   = [2.077084130934081e-6, 0.0032815991956917493, 0.0032807020145523757, 0.004646298951577697],
    linf = [4.435791998502747e-5, 0.03176757178286449, 0.031797053799604846, 0.045615287239808566])
  end


  @testset "elixir_mhd_alfven_wave.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_mhd_alfven_wave.jl"),
    l2   = [0.00011134312019581907, 5.880417517656501e-6, 5.880417517683334e-6, 8.433533326833135e-6, 1.2944026635567339e-6, 1.2259080543012733e-6, 1.2259080543038862e-6, 1.8334999489680995e-6, 8.098795948637635e-7],
    linf = [0.0002678907090871707, 1.6257637592484442e-5, 1.6257637592095864e-5, 2.7343412701746894e-5, 5.327954748168828e-6, 8.10079419122367e-6, 8.100794191445715e-6, 1.2083599637696674e-5, 4.179907421413125e-6])
  end

  @testset "elixir_mhd_alfven_wave_mortar.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_mhd_alfven_wave_mortar.jl"),
    l2   = [4.6108151315202035e-6, 1.6897860606321754e-6, 1.6208236429504275e-6, 1.6994662614575904e-6, 1.486435064660995e-6, 1.3875465211720615e-6, 1.3411325436690753e-6, 1.7155153011375413e-6, 9.813872476368202e-7],
    linf = [3.5225667207927636e-5, 1.5349379665866025e-5, 1.4264328575347429e-5, 1.4421439547898651e-5, 7.744170905765735e-6, 1.0187833250130396e-5, 9.861911995590056e-6, 1.6018139446766222e-5, 5.563892853177171e-6],
    tspan = (0.0, 1.0))
  end

  @testset "elixir_mhd_ec.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_mhd_ec.jl"),
    l2   = [0.03628315925311581, 0.04301306535453907, 0.042998910996002976, 0.025746791646914315, 0.1620587870592711, 0.01745580631201365, 0.01745656644392971, 0.02688212902288343, 0.00014263322984147517],
    linf = [0.23504901239438747, 0.31563591777956146, 0.3094412744514615, 0.21177505529310434, 0.9738775041875032, 0.09120517132559702, 0.0919645047337756, 0.15691668358334432, 0.0035581030835232378])
  end

  @testset "elixir_mhd_orszag_tang_shockcapturing_amr.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_mhd_orszag_tang_shockcapturing_amr.jl"),
    l2   = [0.21894721281911703, 0.26463302881957645, 0.31507117273918805, 0.0, 0.5152448296476039, 0.23023274798808147, 0.3441658797437742, 0.0, 0.0026733194007546126],
    linf = [1.2352286192592534, 0.6678377088690369, 0.8739431671403393, 0.0, 2.740788100988533, 0.6552251870441527, 0.9546253266155187, 0.0, 0.03816123862195953],
    tspan = (0.0, 0.09))
  end

  @testset "elixir_mhd_orszag_tang_shockcapturing_amr.jl with flux_hll" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_mhd_orszag_tang_shockcapturing_amr.jl"),
    l2   = [0.10811766489910432, 0.20202956511451342, 0.22988158838731435, 0.0, 0.29953446216629687, 0.1570994904887061, 0.24308871328334844, 0.0, 0.011100323402918071],
    linf = [0.5520018702830969, 0.5101514485370506, 0.6565173233469559, 0.0, 0.9528527119850311, 0.3990329190790233, 0.6737022346309564, 0.0, 0.18244193667531056],
    tspan = (0.0, 0.06), surface_flux = flux_hll)
  end

  @testset "elixir_mhd_rotor_shockcapturing_amr.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_mhd_rotor_shockcapturing_amr.jl"),
    l2   = [1.2635449181120562, 1.8356372101225815, 1.7037178920138905, 0.0, 2.3126474248436755, 0.21626214510814928, 0.23683073618598693, 0.0, 0.002132844459180628],
    linf = [10.353812749882609, 14.287005221052532, 15.749922601372482, 0.0, 17.089103075830185, 1.342006287193983, 1.4341241435029897, 0.0, 0.053488038358224646],
    tspan = (0.0, 0.05))
  end

  @testset "elixir_mhd_blast_wave_shockcapturing_amr.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_mhd_blast_wave_shockcapturing_amr.jl"),
    l2   = [0.2101138028554417, 4.4379574949560014, 2.6239651859752238, 0.0, 359.15092246795564, 2.458555512327778, 1.4961525378625697, 0.0, 0.01346996306689436],
    linf = [2.4484577379812915, 63.229017006957584, 15.321798382742966, 0.0, 2257.8231751993367, 13.692356305778407, 10.026947993726841, 0.0, 0.2839557716528234],
    tspan = (0.0, 0.003))
  end

  @testset "elixir_euler_gravity_jeans_instability.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_gravity_jeans_instability.jl"),
    l2   = [10733.633835505429, 13356.78041873671, 1.6035728244276416e-6, 26834.076946460955],
    linf = [15194.296496834606, 18881.481413976213, 7.967111441550177e-6, 37972.997184962034],
    tspan = (0.0, 0.1))
  end

  @testset "elixir_euler_gravity_sedov_blast_wave_shockcapturing_amr.jl" begin
  @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_gravity_sedov_blast_wave_shockcapturing_amr.jl"),
    l2   = [0.04630745182870653, 0.06507397069667138, 0.06507397069667123, 0.48971269294890085],
    linf = [2.383463161765847, 4.0791883314039605, 4.07918833140396, 16.246070713311475],
    tspan = (0.0, 0.05))
  end
end


@testset "Displaying components 2D" begin
  @test_nowarn include(joinpath(EXAMPLES_DIR, "elixir_advection_amr.jl"))

  # test both short and long printing formats
  @test_nowarn show(mesh); println()
  @test_nowarn println(mesh)
  @test_nowarn display(mesh)

  @test_nowarn show(equations); println()
  @test_nowarn println(equations)
  @test_nowarn display(equations)

  @test_nowarn show(solver); println()
  @test_nowarn println(solver)
  @test_nowarn display(solver)

  @test_nowarn show(solver.basis); println()
  @test_nowarn println(solver.basis)
  @test_nowarn display(solver.basis)

  @test_nowarn show(solver.mortar); println()
  @test_nowarn println(solver.mortar)
  @test_nowarn display(solver.mortar)

  @test_nowarn show(semi); println()
  @test_nowarn println(semi)
  @test_nowarn display(semi)

  @test_nowarn show(summary_callback); println()
  @test_nowarn println(summary_callback)
  @test_nowarn display(summary_callback)

  @test_nowarn show(amr_controller); println()
  @test_nowarn println(amr_controller)
  @test_nowarn display(amr_controller)

  @test_nowarn show(amr_callback); println()
  @test_nowarn println(amr_callback)
  @test_nowarn display(amr_callback)

  @test_nowarn show(stepsize_callback); println()
  @test_nowarn println(stepsize_callback)
  @test_nowarn display(stepsize_callback)

  @test_nowarn show(save_solution); println()
  @test_nowarn println(save_solution)
  @test_nowarn display(save_solution)

  @test_nowarn show(analysis_callback); println()
  @test_nowarn println(analysis_callback)
  @test_nowarn display(analysis_callback)

  @test_nowarn show(alive_callback); println()
  @test_nowarn println(alive_callback)
  @test_nowarn display(alive_callback)

  @test_nowarn println(callbacks)
end

# Only run extended tests if environment variable is set
if haskey(ENV, "TRIXI_TEST_EXTENDED") && lowercase(ENV["TRIXI_TEST_EXTENDED"]) in ("1", "on", "yes")
  @testset "Examples (long execution time)" begin
    @test_nowarn @test_trixi_include(joinpath(EXAMPLES_DIR, "elixir_euler_blob_shockcapturing_mortar.jl"))
  end
end

# Clean up afterwards: delete Trixi output directory
@test_nowarn rm(outdir, recursive=true)

end # 2D

end #module
