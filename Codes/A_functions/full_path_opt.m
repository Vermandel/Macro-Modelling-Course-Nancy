function [loss,filtered_shock_ts] = full_path_opt(x,filtered_shock_ts,update_path_dates,endo_nz0,oo_nz0,M_nz0,options_,idshock,idobj,jump_time)
%WELF_OPT Summary of this function goes here
%   Detailed explanation goes here

    %persistent guessy lossy;

    %if isempty(lossy)
    %    lossy = inf;
    %end
    %if ~isempty(guessy)
    %    endo_nz0 = guessy;
    %end
    
    %theshock = filtered_shock_ts(update_path_dates).data(:,idshock);
	
	% vector of time
	tn = find(filtered_shock_ts.dates==update_path_dates(1)):find(filtered_shock_ts.dates==update_path_dates(end));
	
	% 
    theshock = x;
    if jump_time > 1
		theshock = spline(tn(1:jump_time:end),theshock,tn);
	end
	xunpacked=filtered_shock_ts.data;
    xunpacked(tn,idshock)=theshock;
    filtered_shock_ts = dseries(xunpacked,filtered_shock_ts.dates(1),filtered_shock_ts.name);


    [det_nz0] 	= EP_deterministic_path(endo_nz0,filtered_shock_ts,oo_nz0,M_nz0,options_,(update_path_dates(1)-1):(update_path_dates(end)+1000));
    loss        = - (det_nz0(update_path_dates(1)).data(:,idobj));

    %if loss<lossy
    %    guessy = det_nz0;
    %    lossy=loss;
    %end


end

