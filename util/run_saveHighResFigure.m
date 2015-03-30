rez=300; %resolution (dpi) of final graphic
h=gcf; %f is the handle of the figure you want to export
figpos=getpixelposition(h); %dont need to change anything here
resolution=get(0,'ScreenPixelsPerInch'); %dont need to change anything here
set(h,'paperunits','inches','papersize',figpos(3:4)/resolution,'paperposition',[0 0 figpos(3:4)/resolution]); 

print(h,fullfile('/Users/mattgaidica/Dropbox/School/ChestekLab/KetaminePaper','plot_power_M1_90min'),'-dpng',['-r',num2str(rez)],'-opengl') %save file 