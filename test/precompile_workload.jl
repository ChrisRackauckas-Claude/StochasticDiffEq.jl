using Random, StochasticDiffEq, Test

@testset "Precompile workload" begin
    f = (u, p, t) -> p[1] * u
    g = (u, p, t) -> p[2] * u
    prob = SDEProblem(f, g, 1.0, (0.0, 0.1), (0.1, 0.2))

    Random.seed!(42)
    sol = solve(prob, EM(); dt = 0.05, adaptive = false)

    @test length(sol.t) == 3
    @test sol.t[end] == 0.1
    @test isfinite(sol.u[end])
end
