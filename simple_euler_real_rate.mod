// =============================================================================
// simple_euler_real_rate.mod
// -----------------------------------------------------------------------------
// Toy Bayesian DSGE estimation example for Dynare.
//
// Model
//   A two-equation log-linearised system:
//     gc_obs(t)  = sigma * rr_obs(t)          [Euler / IS equation]
//     rr_obs(t)  = rho_r * rr_obs(t-1) + eps_r(t)  [AR(1) real rate]
//
//   where gc_obs is consumption growth and rr_obs is the ex-ante real rate.
//
// Data
//   Produced by my_db_US.m (OECD/dbnomics, US quarterly).
//   Saved to myobs.mat.  Two observables: gc_obs, rr_obs.
//
// Estimation
//   Posterior mode via csminwel (mode_compute=4), no MCMC (mh_replic=0).
//   prefilter=1 removes the sample mean of each observable.
//   diffuse_filter handles loose initial conditions.
//
// Usage
//   my_db_US                          % build myobs.mat
//   dynare simple_euler_real_rate     % estimate & simulate
// =============================================================================

var gc_obs rr_obs;
varexo eps_r;

parameters rho_r sigma;

rho_r = 0.8;
sigma = 1.0;

model(linear);
    gc_obs = sigma * rr_obs;
    rr_obs = rho_r * rr_obs(-1) + eps_r;
end;

steady;
check;

// -----------------------------------------------------------------------------
// Observables
// -----------------------------------------------------------------------------

varobs gc_obs rr_obs;

// -----------------------------------------------------------------------------
// Priors
// -----------------------------------------------------------------------------

estimated_params;

    // Persistence of the real-rate process: stays in (0,1) with a Beta prior.
    rho_r,       beta_pdf,     0.8,   0.10;

    // Slope of the IS curve (sigma > 0): Gamma prior centred around 2.
    sigma,       gamma_pdf,    2,     0.20;

    // Structural shock standard deviation: strictly positive (inv-Gamma).
    stderr eps_r,   inv_gamma_pdf,  0.01,  2;

    // Measurement-error standard deviation on consumption growth (Weibull).
    stderr gc_obs,  weibull_pdf,    0.001, 0.001;

end;

// -----------------------------------------------------------------------------
// Estimation
// -----------------------------------------------------------------------------

estimation(datafile      = myobs,
           first_obs     = 1,
           presample     = 0,
           prefilter     = 1,
           mode_compute  = 4,
           mh_replic     = 0,
           diffuse_filter);

// -----------------------------------------------------------------------------
// IRF simulation
// -----------------------------------------------------------------------------

stoch_simul(order = 1, irf = 12);
