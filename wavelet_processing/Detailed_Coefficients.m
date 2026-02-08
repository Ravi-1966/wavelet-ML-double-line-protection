function [CD1_ia, CD1_ib, CD1_ic] = Detailed_Coefficients(ia1, ib1, ic1)
%--------------------------------------------------------------------------
% Fault_Index_Impact.m
%
% Wavelet energy based high-speed fault detection for transmission lines
%
% Inputs:
%   ia1, ib1, ic1 : Phase current signals (vectors) Terminal1
%   ia2, ib2, ic3 : Phase current signals (vectors) Terminal2
%
% Outputs:
%   CD1_iax  = Detailed Coefficients Phase-a
%   CD1_ibx  = Detailed Coefficients Phase-b
%   CD1_icx  = Detailed Coefficients Phase-c)
%
% Author:
%   Dr. Ravi Kumar Goli
%--------------------------------------------------------------------------

%% Wave decomposition
[Cia1,Lia1] = wavedec(ia1,1,'bior1.5');
[Cib1,Lib1] = wavedec(ib1,1,'bior1.5');
[Cic1,Lic1] = wavedec(ic1,1,'bior1.5');

%% Detailed Coefficients
CD1_ia = detcoef(Cia1,Lia1,1);
CD1_ib = detcoef(Cib1,Lib1,1); 
CD1_ic = detcoef(Cic1,Lic1,1); 

