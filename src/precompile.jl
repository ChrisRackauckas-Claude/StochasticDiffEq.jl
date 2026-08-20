@setup_workload begin
    f = (u, p, t) -> p[1] * u
    g = (u, p, t) -> p[2] * u
    prob = SDEProblem(f, g, 1.0, (0.0, 0.1), (0.1, 0.2))

    @compile_workload begin
        solve(prob, EM(); dt = 0.05, adaptive = false)
    end
end
