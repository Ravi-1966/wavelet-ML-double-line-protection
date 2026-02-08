function [CD1_iax, CD1_ibx, CD1_icx] = Fault_Index_Impact(ia1, ib1, ic1, ia2, ib2, ic2)
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
[Cia2,Lia2] = wavedec(ia2,1,'bior1.5');
[Cib2,Lib2] = wavedec(ib2,1,'bior1.5');
[Cic2,Lic2] = wavedec(ic2,1,'bior1.5');

%% Detailed Coefficients
CD1_ia1 = detcoef(Cia1,Lia1,1);
CD1_ib1 = detcoef(Cib1,Lib1,1); 
CD1_ic1 = detcoef(Cic1,Lic1,1); 
CD1_ia2 = detcoef(Cia2,Lia2,1);
CD1_ib2 = detcoef(Cib2,Lib2,1);
CD1_ic2 = detcoef(Cic2,Lic2,1);


CD1_iax = abs(CD1_ia1-CD1_ia2);
CD1_ibx = abs(CD1_ib1-CD1_ib2);
CD1_icx = abs(CD1_ic1-CD1_ic2);
end
