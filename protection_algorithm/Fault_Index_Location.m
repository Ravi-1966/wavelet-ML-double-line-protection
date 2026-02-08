function [CD1_iaxx, CD1_ibxx, CD1_icxx] = Fault_Index_Location(ia1, ib1, ic1)
%--------------------------------------------------------------------------
% Fault_Index_Location.m
%
% Wavelet energy based high-speed fault detection for transmission lines
%
% Inputs:
%   ia1, ib1, ic1 : Phase current signals (vectors) Terminal1
%   ia2, ib2, ic3 : Phase current signals (vectors) Terminal2
%
% Outputs:
%   CD1_iaxx  = Detailed Coefficients Phase-a
%   CD1_ibxx  = Detailed Coefficients Phase-b
%   CD1_icxx  = Detailed Coefficients Phase-c)
%
% Author:
%   Dr. Ravi Kumar Goli
%--------------------------------------------------------------------------

%% Wave decomposition
[Cia1,Lia1] = wavedec(ia1,1,'bior1.5');
[Cib1,Lib1] = wavedec(ib1,1,'bior1.5');
[Cic1,Lic1] = wavedec(ic1,1,'bior1.5');


%% Detailed Coefficients
CD1_ia1 = detcoef(Cia1,Lia1,1);
CD1_ib1 = detcoef(Cib1,Lib1,1); 
CD1_ic1 = detcoef(Cic1,Lic1,1); 

CD1_ia = (CD1_ia1);
CD1_ib = (CD1_ib1);
CD1_ic = (CD1_ic1); 

CD1_iaxx = abs(CD1_ia1);
CD1_ibxx = abs(CD1_ib1);
CD1_icxx = abs(CD1_ic1);
end
