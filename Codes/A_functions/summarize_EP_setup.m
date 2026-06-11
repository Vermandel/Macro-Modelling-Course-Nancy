function path_info = summarize_EP_setup(M_, options_, sim_ts)
%SUMMARIZE_EP_SETUP  Summarize Dynare extended-path / perfect foresight setup.
%
% path_info = summarize_EP_setup(M_, options_, sim_ts)
%
% M_          : Dynare model structure
% options_    : Dynare options structure
% sim_ts      : (optional) a dseries object containing the simulated path
%
% The function reports:
%   - Start date
%   - Forward-path horizon (T)
%   - Expectation window (S)
%   - Surprise vs expected shocks
%   - Terminal date of the simulation (options_.dates0 + T)
%   - If sim_ts provided: actual last date in dseries

    %-----------------------------
    % 1. Basic path information
    %-----------------------------
    if isfield(options_,'dates0')
        start_date = options_.dates0;
    else
        start_date = [];
    end

    if isfield(options_,'forward_path')
        T = options_.forward_path;
    else
        T = NaN;
    end

    if isfield(options_,'expectation_window')
        S = options_.expectation_window;
    else
        S = NaN;
    end

    % Terminal date (Dynare convention)
    if ~isempty(start_date) && ~isnan(T)
        terminal_date = start_date + T;
    else
        terminal_date = [];
    end

    % Store in struct
    path_info = struct();
    path_info.start_date         = start_date;
    path_info.forward_path       = T;
    path_info.expectation_window = S;
    path_info.terminal_date      = terminal_date;

    %-----------------------------
    % 2. Surprise vs expected shocks
    %-----------------------------
    all_shocks = cellstr(M_.exo_names);

    if isfield(options_,'surprise_shocks')
        surprise_flags = logical(options_.surprise_shocks(:));
    else
        surprise_flags = true(numel(all_shocks),1);
    end

    surprise_list = all_shocks(surprise_flags);
    expected_list = all_shocks(~surprise_flags);

    path_info.surprise_shocks = surprise_list;
    path_info.expected_shocks = expected_list;

    %-----------------------------
    % 3. Pretty print
    %-----------------------------
    fprintf('\n=== Extended-path ===\n');

    % Start date
    if ~isempty(start_date)
        fprintf('Start date              : %s\n', char(start_date));
    else
        fprintf('Start date              : (not set)\n');
    end

    fprintf('Forward path horizon T  : %d\n', T);
    fprintf('Expectation window S    : %d\n', S);

    % Terminal date
    if ~isempty(terminal_date)
        fprintf('Terminal date           : %s\n', char(terminal_date));
    else
        fprintf('Terminal date           : (not computable)\n');
    end

    % dseries last date if available
    if nargin >= 3 && isa(sim_ts,'dseries')
        try
            ds_last = sim_ts.lastdate;
            fprintf('dseries last date       : %s\n', char(ds_last));

            if ~isempty(terminal_date) && ds_last ~= terminal_date
                fprintf('WARNING: terminal_date and dseries last date differ.\n');
            end
        catch
            fprintf('dseries last date       : (could not read)\n');
        end
    end

    fprintf('\nSurprise shocks (unanticipated):\n');
    if isempty(surprise_list)
        fprintf('  - none\n');
    else
        for i=1:numel(surprise_list)
            fprintf('  - %s\n', strtrim(surprise_list{i}));
        end
    end

    fprintf('\nExpected shocks (anticipated):\n');
    if isempty(expected_list)
        fprintf('  - none\n');
    else
        for i=1:numel(expected_list)
            fprintf('  - %s\n', strtrim(expected_list{i}));
        end
    end

    fprintf('=============================================\n\n');
end
