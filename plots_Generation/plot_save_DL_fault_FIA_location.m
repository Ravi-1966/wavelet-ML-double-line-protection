function plot_save_DL_fault_FIA_location(Indx_ax, Indx_bx, Indx_cx)

%PLOT_SAVE_DL_FAULT_FIA_LOCATION Plot Fault Index vs FIA for different distances
%and save the figure automatically.
%
%   This function:
%       1. Creates maximized figure
%       2. Plots 3x3 subplots for distances = 20 km to 180 km
%       3. Compares Phase A, B, C fault indices
%       4. Adds threshold line
%       5. Saves the figure as JPG
%
%   Inputs:
%       Indx_ax, Indx_bx, Indx_cx -> Fault index matrices (9 x 9)
%
%   Output file:
%       DL-Faulty2/Fault_FIA_AG2.jpg
%
%   Author: <Your Name>
%   Date: <Date>

% -------- Ensure folder exists --------
folder = 'DL-Faulty2';
if ~exist(folder,'dir')
    mkdir(folder);
end

% -------- Create maximized figure --------
fig3 = figure('Name','DL-Faulty_loc','NumberTitle','off');
fig3.WindowState = 'maximized';
set(gcf,'Color','w');

% -------- Data --------
x1  = [20 40 60 80 100 120 140 160 180];
th1 = 2000 * ones(size(x1));
distances = [20 40 60 80 100 120 140 160 180];

% -------- Plot --------
for k = 1:9
    subplot(3,3,k);
    plot(x1,Indx_ax(k,:),'-*k', ...
         x1,Indx_bx(k,:),'-ok', ...
         x1,Indx_cx(k,:),'-^k', ...
         x1,th1,'--r','LineWidth',1.2);

    xlabel('FIA');
    ylabel('Fault Index');
    title(['Distance ' num2str(distances(k)) ' km']);
    grid on;
end

% -------- Save figure --------
saveas(gcf, fullfile(folder,'Fault_FIA_ABG2.jpg'));

disp('? DL Fault FIA vs Location figure saved successfully.');

end
