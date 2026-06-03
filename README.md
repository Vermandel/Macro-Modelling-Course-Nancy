# Day 3 — Building a Sample for Time Series Analysis
**ENSAE Summer School on Macroeconomic Methods — Nancy**

---

## Session overview

This session bridges **data preparation** and **likelihood-based estimation** of macro models.
By the end, students can download real-time data, build stationary observables, and estimate a
simple DSGE model in Dynare.

---

## Files in this repository

| File | Description |
|---|---|
| `Slides.pdf` | Lecture slides (see section breakdown below) |
| `problem_set.pdf` | In-class lab — 1 hour, pairs allowed |
| `call_dbnomics.m` | MATLAB helper: downloads series from dbnomics/OECD |
| `my_db_US.m` | Builds the US quarterly dataset and saves `myobs.mat` |
| `simple_euler_real_rate.mod` | Dynare estimation file — run after `my_db_US` |

---

## How to run the code

```matlab
% Step 1 — build the dataset (requires an internet connection)
my_db_US

% Step 2 — estimate the toy DSGE model
dynare simple_euler_real_rate.mod
```

`my_db_US.m` downloads six OECD quarterly series for the US (output, consumption,
investment, GDP deflator, hours worked, nominal rate), constructs stationary
observables, runs ADF stationarity checks, and saves `myobs.mat`.

`simple_euler_real_rate.mod` estimates a two-equation model:

```
gc_obs_t  = -(1/σ) rr_obs_t
rr_obs_t  = ρ_r rr_obs_{t-1} + ε^r_t
```

with four estimated parameters: `ρ_r` (Beta), `σ` (Gamma), `σ_{ε^r}` (inv-Gamma),
and a measurement-error std on `gc_obs` (inv-Gamma).

---

## Slides — section breakdown

### 1. Data crafting
- Downloading data in real time with dbnomics (`call_dbnomics.m`).
- Stationarity: visual screening, ADF test, first-differencing vs HP filter.
- Seasonality: X-13ARIMA-SEATS.
- Building stationary observables: output/consumption/investment growth, inflation, real rate.

### 2. Principles of likelihood techniques
- State-space representation of a linear DSGE model.
- Kalman filter: prediction errors $S_t(\theta)$ and their variance $\Omega_t$.
- Log-likelihood:
  $\log p(Y_{1:T}|\theta) = -\tfrac{nT}{2}\log(2\pi)
  - \tfrac{1}{2}\sum_t \log|\Omega_t| - \tfrac{1}{2}\sum_t S_t'\Omega_t^{-1}S_t$
- MLE: $\min_\theta -\log p(Y_{1:T}|\theta)$.

### 3. Bayesian estimation *(appendix)*
- Bayes' theorem: posterior $\propto$ likelihood $\times$ prior.
- MAP: $\max_\theta \log p(Y_{1:T}|\theta) + \log p(\theta)$.
- MCMC: Metropolis-Hastings to draw from the full posterior.

### 4. Setting priors in Dynare
- Prior shapes: Normal, Gamma, Beta, inv-Gamma — when to use each.
- Identification check: data-dominated vs prior-dominated posteriors.

### 5. Toy Dynare exercise
- `my_db_US.m` → `dynare simple_euler_real_rate.mod`.
- Connects data work, observables, priors, and likelihood estimation end-to-end.

---

## Problem set — summary

Students choose one country, download at least four OECD quarterly series (GDP volume,
price index, interest rate, labor-market indicator) via `call_dbnomics`, transform them
into stationary variables, and extract a business-cycle component with a filter.

**Deliverables:** list of series, price/quantity classification, two figures (raw + transformed),
one figure of the cyclical component, short economic interpretation.
