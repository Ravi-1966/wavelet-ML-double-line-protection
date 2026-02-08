function plot_save_DL_fault_impact(Indx_ax, Indx_bx, Indx_cx)

%PLOT_SAVE_DL_FAULT_IMPACT Plot Fault Index vs Distance and save figure
%
%   This function:
%       1. Creates maximized figure
%       2. Plots 3x3 subplots for FIA = 0 to 160
%       3. Compares Phase A, B, C fault indices
%       4. Adds threshold line
%       5. Saves the figure as JPG
%
%   Inputs:
%       Indx_ax, Indx_bx, Indx_cx -> Fault index matrices (23 x 9)
%
%   Output file:
%       DL-Faulty2/Impact_Analysis_AG1.jpg
%
%   Author: <Your Name>
%   Date: <Date>

% -------- Ensure folder exists --------
folder = 'DL-Faulty2';
if ~exist(folder,'dir')
    mkdir(folder);
end

% -------- Create maximized figure --------
fig1 = figure('Name','DL-Faulty-Impact','NumberTitle','off');
fig1.WindowState = 'maximized';
set(gcf,'Color','w');

% -------- Data --------
th = 1000 * ones(1,23);
x  = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200 210 220 230];
FIA_vals = [0 20 40 60 80 100 120 140 160];

% -------- Plot --------
for k = 1:9
    subplot(3,3,k);
    plot(x,Indx_ax(:,k),'-*k', ...
         x,Indx_bx(:,k),'-ok', ...
         x,Indx_cx(:,k),'-^k', ...
         x,th,'--r','LineWidth',1.2);

    xlabel('Distance in Km');
    ylabel('Fault Index');
    title(['FIA ' num2str(FIA_vals(k))]);
    grid on;
end

% -------- Save figure --------
saveas(gcf, fullfile(folder,'Impact_Analysis_ABG1.jpg'));

disp('? DL Fault Impact figure saved successfully.');

end
