function plot_save_DL_fault_location(Indx_axx, Indx_bxx, Indx_cxx)

%PLOT_SAVE_DL_FAULT_LOCATION Plot Fault Index vs Distance (Location) and save figure
%
%   This function:
%       1. Creates maximized figure
%       2. Plots 3x3 subplots for FIA = 0 to 160
%       3. Compares Phase A, B, C fault indices (location based)
%       4. Adds threshold line
%       5. Saves the figure as JPG
%
%   Inputs:
%       Indx_axx, Indx_bxx, Indx_cxx -> Fault index matrices (23 x 9)
%
%   Output file:
%       DL-Faulty2/Fault_AG1_loc.jpg
%
%   Author: <Your Name>
%   Date: <Date>

% -------- Ensure folder exists --------
folder = 'DL-Faulty2';
if ~exist(folder,'dir')
    mkdir(folder);
end

% -------- Create maximized figure --------
fig2 = figure('Name','DL-Faulty-loc','NumberTitle','off');
fig2.WindowState = 'maximized';
set(gcf,'Color','w');

% -------- Data --------
th = 1000 * ones(1,23);
x  = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200 210 220 230];
FIA_vals = [0 20 40 60 80 100 120 140 160];

% -------- Plot --------
for k = 1:9
    subplot(3,3,k);
    plot(x,Indx_axx(:,k),'-*k', ...
         x,Indx_bxx(:,k),'-ok', ...
         x,Indx_cxx(:,k),'-^k', ...
         x,th,'--r','LineWidth',1.2);

    xlabel('Distance in Km');
    ylabel('Fault Index');
    title(['FIA ' num2str(FIA_vals(k))]);
    grid on;
end

% -------- Save figure --------
saveas(gcf, fullfile(folder,'Fault_ABG1_loc.jpg'));

disp('? DL Fault Location figure saved successfully.');

end
