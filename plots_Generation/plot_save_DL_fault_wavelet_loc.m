function plot_save_DL_fault_wavelet_loc(ia1, ib1, ic1, ia2, ib2, ic2, ...
                                     Sum_Iax, Sum_Ibx, Sum_Icx, ...
                                     CD1_iax, CD1_ibx, CD1_icx, ...
                                     CD1_ia, CD1_ib, CD1_ic)

%PLOT_SAVE_DL_AG_WAVELET_LOC Plot terminal currents, fault index and wavelet
%coefficients for AG fault (location analysis) and save the figure.
%
%   This function:
%       1. Creates maximized figure
%       2. Generates Terminal-1 and Terminal-2 currents
%       3. Computes combined Fault Index
%       4. Plots CD1 wavelet coefficients
%       5. Plots D1 detail coefficients
%       6. Saves figure automatically
%
%   Inputs:
%       ia1, ib1, ic1  -> Terminal-1 phase currents
%       ia2, ib2, ic2  -> Terminal-2 phase currents
%       Sum_Iax, Sum_Ibx, Sum_Icx -> Fault index components
%       CD1_iax, CD1_ibx, CD1_icx -> CD1 coefficients
%       CD1_ia, CD1_ib, CD1_ic    -> D1 detail coefficients
%
%   Output file:
%       DL-Faulty2/AG_Analysis_loc.jpg
%
%   Author: <Your Name>
%   Date: <Date>

% -------- Ensure folder exists --------
folder = 'DL-Faulty2';
if ~exist(folder,'dir')
    mkdir(folder);
end

% -------- Create maximized figure --------
fig4 = figure('Name','DL-Faulty_loc','NumberTitle','off');
fig4.WindowState = 'maximized';
set(gcf,'Color','w');

% -------- Create signals --------
ter1 = [ia1 ib1 ic1];
ter2 = [ia2 ib2 ic2];
Sum_I1 = [Sum_Iax ; Sum_Ibx ; Sum_Icx];
x = 1:length(Sum_I1);

% -------- Plot --------
subplot(3,3,1);
plot(ter1,'LineWidth',1.25);
xlabel('Time in msec'); ylabel('Amperes');
title('Terminal-1 Currents');

subplot(3,3,2);
plot(ter2,'LineWidth',1.25);
xlabel('Time in msec'); ylabel('Amperes');
title('Terminal-2 Currents');

subplot(3,3,3);
plot(x,Sum_I1,'LineWidth',1.25);
xlabel('Time in msec'); ylabel('Fault Index');
title('Combined Fault Index');

subplot(3,3,4);
plot(CD1_iax,'LineWidth',1.25,'Color','r');
title('CD1-iax');

subplot(3,3,5);
plot(CD1_ibx,'LineWidth',1.25,'Color',[0.85 0.65 0.13]);
title('CD1-ibx');

subplot(3,3,6);
plot(CD1_icx,'LineWidth',1.25,'Color','b');
title('CD1-icx');

subplot(3,3,7);
plot(CD1_ia,'LineWidth',1.25,'Color','r');
xlabel('Time in msec'); ylabel('D1-coefficients of Ia');

subplot(3,3,8);
plot(CD1_ib,'LineWidth',1.25,'Color',[0.85 0.65 0.13]);
xlabel('Time in msec'); ylabel('D1-coefficients of Ib');

subplot(3,3,9);
plot(CD1_ic,'LineWidth',1.25,'Color','b');
xlabel('Time in msec'); ylabel('D1-coefficients of Ic');

% -------- Save figure --------
saveas(gcf, fullfile(folder,'ABG_Analysis_loc.jpg'));

disp('? AG Wavelet Location Analysis figure saved successfully.');

end
