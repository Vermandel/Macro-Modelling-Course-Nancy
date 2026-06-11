function [scc_ts] = solve_optimal_policy(shockname,var_to_optimize,update_path_dates,exo_init_ts,y_nz0,oo_nz0,M_nz0,options_)
%SOLVE_OPTIMAL_POLICY Summary of this function goes here
%   Detailed explanation goes here
    %% Caculating the social cost of carbon
    idshock 			= strmatch(shockname,M_nz0.exo_names,'exact');
    idobj 			    = strmatch(var_to_optimize,M_nz0.endo_names,'exact');
    xnom0 		        = exo_init_ts(update_path_dates).data(:,idshock);
    optim_options	 	= optimset('Algorithm','sqp','display','iter', 'LargeScale','off', 'MaxFunEvals',15000, 'TolFun',1e-3, 'TolX',1e-3,'TolFun',1e-3,'DiffMinChange',1e-3,'UseParallel',true);
    options_.noprint 	= 1;
    
	jump_time = 8; % 1 means no jump
	xnom0 = xnom0(1:jump_time:end);
	
    [SCC,f1] = fmincon(@(x) full_path_opt(x,exo_init_ts,update_path_dates,y_nz0,oo_nz0,M_nz0,options_,idshock,idobj,jump_time),xnom0,[],[],[],[],zeros(size(xnom0)),ones(size(xnom0))+1e-10,[],optim_options);
    

    if jump_time > 1
		tn = 1:length(exo_init_ts(update_path_dates).data(:,idshock));
		SCC = spline(tn(1:jump_time:end),SCC,tn);
	end

    %theshock 			= exo_init_ts(update_path_dates).data(:,idshock);
    theshock 			= SCC;
    xunpacked			= exo_init_ts.data;
    xunpacked(find(exo_init_ts.dates==update_path_dates(1)):find(exo_init_ts.dates==update_path_dates(end)),idshock)=theshock;
    scc_ts 	            = dseries(xunpacked,exo_init_ts.dates(1),exo_init_ts.name);

end

