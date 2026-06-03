% US quarterly observables for a simple New Keynesian dataset.
% Series: output, consumption, investment, GDP deflator, hours worked, nominal rate.
[raw_table,~,dates_nb] = call_dbnomics( ...
	'OECD/QNA/USA.B1_GE.CQRSA.Q', ...
	'OECD/QNA/USA.P31DC.CQRSA.Q', ...
	'OECD/QNA/USA.P51.CQRSA.Q', ...
	'OECD/QNA/USA.B1_GE.DNBSA.Q', ...
	'OECD/MEI/USA.HOHWMN02.STSA.Q', ...
	'OECD/KEI/IR3TIB01.USA.ST.Q');

% Keep only observations with all required series available.
valid_idx = all(~isnan(raw_table(:,2:end)),2);
raw_table = raw_table(valid_idx,:);
dates_nb = dates_nb(valid_idx);

% Normalize the GDP deflator to 1 at the first observation recorded in 2015.
base_idx = find(floor(dates_nb) == 2015,1,'first');
if isempty(base_idx)
	error('No 2015 observation found in the sample.');
end
gdp_deflator = raw_table(:,5) / raw_table(base_idx,5);

% Build stationary observables for the model.
gy_obs = diff(log(raw_table(:,2) ./ gdp_deflator));
gc_obs = diff(log(raw_table(:,3) ./ gdp_deflator));
gi_obs = diff(log(raw_table(:,4) ./ gdp_deflator));
pi_full_obs = diff(log(gdp_deflator));

% Convert weekly hours into a daily fraction and annualized percent rate into a quarterly rate.
h_obs = raw_table(2:end,6) / (7 * 24);
r_full_obs = raw_table(2:end,7) / 400;
dates_full_obs = dates_nb(2:end);

% Proxy for the ex-ante real rate using realized next-quarter inflation.
rr_obs = r_full_obs(1:end-1) - pi_full_obs(2:end);

% Align all transformed observables to the sample available for the real rate.
gy_obs = gy_obs(1:end-1);
gc_obs = gc_obs(1:end-1);
gi_obs = gi_obs(1:end-1);
pi_obs = pi_full_obs(1:end-1);
h_obs = h_obs(1:end-1);
r_obs = r_full_obs(1:end-1);
dates_obs = dates_full_obs(1:end-1);
T = dates_obs;

% Illustrate stationarity diagnostics with ADF tests.
log_real_gdp = log(raw_table(:,2) ./ gdp_deflator);
test_names = {'log real GDP level','output growth','consumption growth', ...
	'investment growth','inflation','hours worked','nominal rate','real rate'};
test_series = {log_real_gdp, gy_obs, gc_obs, gi_obs, pi_obs, h_obs, r_obs, rr_obs};

fprintf('\nADF stationarity checks (5%% level)\n');
fprintf('----------------------------------\n');
for i = 1:numel(test_names)
	[h_adf,p_adf] = adftest(test_series{i});
	if h_adf == 1
		verdict = 'the ADF test rejects a unit root: this series looks stationary.';
	else
		verdict = 'the ADF test does not reject a unit root: this series does not look stationary.';
	end
	fprintf('%s: p-value = %.4f, %s\n', test_names{i}, p_adf, verdict);
end

fprintf(['\nInterpretation: for macro data, the level of real GDP is usually non-stationary, ', ...
	'while growth rates and inflation are much closer to stationarity.\n\n']);

save myobs gy_obs gc_obs gi_obs h_obs dates_obs T pi_obs r_obs rr_obs;

figure('Color','w');
subplot(2,2,1)
plot(dates_obs,gy_obs,'LineWidth',1.1)
xlim([min(dates_obs) max(dates_obs)]);
title('Output growth')
subplot(2,2,2)
plot(dates_obs,gc_obs,'LineWidth',1.1)
xlim([min(dates_obs) max(dates_obs)]);
title('Consumption growth')
subplot(2,2,3)
plot(dates_obs,gi_obs,'LineWidth',1.1)
xlim([min(dates_obs) max(dates_obs)]);
title('Investment growth')
subplot(2,2,4)
plot(dates_obs,h_obs,'LineWidth',1.1)
xlim([min(dates_obs) max(dates_obs)]);
title('Hours worked')

figure('Color','w');
subplot(1,3,1)
plot(dates_obs,gc_obs,'LineWidth',1.1)
xlim([min(dates_obs) max(dates_obs)]);
title('Consumption growth')
subplot(1,3,2)
plot(dates_obs,pi_obs,'LineWidth',1.1)
xlim([min(dates_obs) max(dates_obs)]);
title('Inflation rate')
subplot(1,3,3)
plot(dates_obs,rr_obs,'LineWidth',1.1)
xlim([min(dates_obs) max(dates_obs)]);
title('Real rate')

set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperSize',[gcf().PaperPosition(3) gcf().PaperPosition(4)]);
print(gcf,fullfile('codes_slides3','data_US.pdf'),'-dpdf');
