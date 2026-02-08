function fault_distance = fault_location_GPR_from_XLS( ...
                        excelA, excelB, excelC, FIA_angle, ...
                        FA_test, FB_test, FC_test)
%--------------------------------------------------------------------------
% fault_location_GPR_from_XLS.m
%
% Generalized GPR-based fault location using Excel (.xls) data
%
% Inputs:
%   excelA, excelB, excelC : Excel file names for Phase-A/B/C
%   FIA_angle              : FIA angle (e.g., 60 for FIA-60)
%   FA_test, FB_test, FC_test : Test FIA values from simulation
%
% Output:
%   fault_distance         : Estimated fault distance (km)
%
% Author:
%   Dr. Ravi Kumar Goli
%--------------------------------------------------------------------------

%% ---------------- READ EXCEL FILES ----------------
TA = readtable(excelA);
TB = readtable(excelB);
TC = readtable(excelC);

% Distance vector (same for all)
Y = TA.Distance;

%% ---------------- SELECT FIA COLUMN ----------------
colName = ['FIA_' num2str(FIA_angle)];

FA = TA.(colName);
FB = TB.(colName);
FC = TC.(colName);

% Feature matrix
X = [FA FB FC];

%% ---------------- NORMALIZATION ----------------
[Xn, mu, sigma] = zscore(X);

%% ---------------- TRAIN GPR MODEL ----------------
gprModel = fitrgp(Xn, Y, ...
    'KernelFunction','ardsquaredexponential', ...
    'Standardize',false);

%% ---------------- TEST SAMPLE ----------------
testX = ([FA_test FB_test FC_test] - mu) ./ sigma;
fault_distance = predict(gprModel, testX);

end
