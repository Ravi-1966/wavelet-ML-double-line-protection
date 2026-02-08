clc
clear all
% km1=input('Enter the value of km:')
open('trline_loc.slx');
ctr1=1;ia1=[];ib1=[];ic1=[];ia2=[];ib2=[];ic2=[];
R1=15
for km1=10:10:230
    km2=240-km1;
       %tt=input('Enter the value of tt:')
       ctr2=1;
 for tt=0.01753:0.00093:0.025
sim('trline_loc.slx');
set_param('trline_loc','PreloadFcn','gr')
[CD1_iax, CD1_ibx, CD1_icx] = Fault_Index_Impact(ia1, ib1, ic1, ia2, ib2, ic2)
[CD1_iaxx, CD1_ibxx, CD1_icxx] = Fault_Index_Location(ia1, ib1, ic1, ia2, ib2, ic2)
[CD1_ia, CD1_ib, CD1_ic] = Detailed_Coefficients(ia1, ib1, ic1)

for i= 5:65
    
    Sum_Iax(i) = CD1_iax(i)+CD1_iax(i+1)+CD1_iax(i+2)+CD1_iax(i+3)+CD1_iax(i+4)+CD1_iax(i+5)+CD1_iax(i+6)+CD1_iax(i+7);
    Sum_Ibx(i) = CD1_ibx(i)+CD1_ibx(i+1)+CD1_ibx(i+2)+CD1_ibx(i+3)+CD1_ibx(i+4)+CD1_ibx(i+5)+CD1_ibx(i+6)+CD1_ibx(i+7);
    Sum_Icx(i) = CD1_icx(i)+CD1_icx(i+1)+CD1_icx(i+2)+CD1_icx(i+3)+CD1_icx(i+4)+CD1_icx(i+5)+CD1_icx(i+6)+CD1_icx(i+7);
    
    Sum_Iaxx(i) = CD1_iaxx(i)+CD1_iaxx(i+1)+CD1_iaxx(i+2)+CD1_iaxx(i+3)+CD1_iaxx(i+4)+CD1_iaxx(i+5)+CD1_iaxx(i+6)+CD1_iaxx(i+7);
    Sum_Ibxx(i) = CD1_ibxx(i)+CD1_ibxx(i+1)+CD1_ibxx(i+2)+CD1_ibxx(i+3)+CD1_ibxx(i+4)+CD1_ibxx(i+5)+CD1_ibxx(i+6)+CD1_ibxx(i+7);
    Sum_Icxx(i) = CD1_icxx(i)+CD1_icxx(i+1)+CD1_icxx(i+2)+CD1_icxx(i+3)+CD1_icxx(i+4)+CD1_icxx(i+5)+CD1_icxx(i+6)+CD1_icxx(i+7);

end
x=1:65;
y=2000;

ter1= [ia1 ib1 ic1]
ter2= [ia2 ib2 ic2]
Sum_I1 = [Sum_Iax ; Sum_Ibx ;Sum_Icx]
subplot(3,3,1);plot(ter1,'LineWidth',1.25),xlabel('Time in msec'),ylabel('Amperes')
subplot(3,3,2);plot(ter2,'LineWidth',1.25),xlabel('Time in msec'),ylabel('Amperes')
subplot(3,3,3); plot(x,Sum_I1,'LineWidth',1.25),xlabel('Time in msec'),ylabel('Fault-Index');
subplot(3,3,4); plot (CD1_iax,'LineWidth',1.25,'Color', 'r'); title('CD1-iax')
subplot(3,3,5); plot (CD1_ibx,'LineWidth',1.25,'Color', '[0.85 0.65 0.13]'); title('CD1-ibx')
subplot(3,3,6); plot (CD1_icx,'LineWidth',1.25,'Color', 'b'); title('CD1-icx')
subplot(3,3,7); plot (CD1_ia,'LineWidth',1.25,'Color', 'r'),xlabel('Time in msec'),ylabel('D1-coefficients of Ia'); 
subplot(3,3,8); plot (CD1_ib,'LineWidth',1.25,'Color', '[0.85 0.65 0.13]'),xlabel('Time in msec'),ylabel('D1-coefficients of Ib');
subplot(3,3,9); plot (CD1_ic,'LineWidth',1.25,'Color', 'b'),xlabel('Time in msec'),ylabel('D1-coefficients of Ic');

 end
 for j=37:2:53
Index_Ia=Sum_Iax(j);
Index_ax(ctr1,ctr2)=Index_Ia;
Index_Ib=Sum_Ibx(j);
Index_bx(ctr1,ctr2)=Index_Ib;
Index_Ic=Sum_Icx(j);
Index_cx(ctr1,ctr2)=Index_Ic;

Index_Iax=Sum_Iaxx(j);
Index_axx(ctr1,ctr2)=Index_Iax;
Index_Ibx=Sum_Ibxx(j);
Index_bxx(ctr1,ctr2)=Index_Ibx;
Index_Icx=Sum_Icx(j);
Index_cxx(ctr1,ctr2)=Index_Icx;
ctr2=ctr2+1;
 end
ctr1=ctr1+1
end
Indx_ax=Index_ax;
Indx_bx=Index_bx;
Indx_cx=Index_cx;

Indx_axx=Index_axx;
Indx_bxx=Index_bxx;
Indx_cxx=Index_cxx;

plot_save_DL_fault_impact(Indx_ax, Indx_bx, Indx_cx)

plot_save_DL_fault_location(Indx_axx, Indx_bxx, Indx_cxx);

plot_save_DL_fault_FIA_location(Indx_ax, Indx_bx, Indx_cx);

plot_save_DL_AG_wavelet_loc(ia1, ib1, ic1, ia2, ib2, ic2, ...
                                     Sum_Iax, Sum_Ibx, Sum_Icx, ...
                                     CD1_iax, CD1_ibx, CD1_icx, ...
                                     CD1_ia, CD1_ib, CD1_ic)


export_DL_fault_data_excel(ter1, ter2, ...
                           Indx_axx, Indx_bxx, Indx_cxx, ...
                           Indx_ax, Indx_bx, Indx_cx);


