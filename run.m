% jsM1_0916 = [1:16];
% jsS1_0916 = [17:32];
% jsM1_1125 = [1:16];
% jsS1_1125 = [17:32];
% jsM1_1209 = [1:16];
% jsS1_1209 = [17:32];
% 
% steps = 90;
% % allPlotData_S10916=plotAllElectrodes(allPowerPieces_0916,f,jsM1_0916,steps,[13 30],'M1 0916');
% % allPlotData_M10916=plotAllElectrodes(allPowerPieces_0916,f,jsS1_0916,steps,[13 30],'S1 0916');
% % 
% allPlotData_S11125=plotAllElectrodes(allPowerPieces_1125,f,jsS1_1125,steps,[10 100],'S1 1125');
% % allPlotData_M11125=plotAllElectrodes(allPowerPieces_1125,f,jsM1_1125,steps,[13 30],'M1 1125');
% 
% allPlotData_S11209=plotAllElectrodes(allPowerPieces_1209,f,jsS1_1209,steps,[10 100],'S1 1209');
% % allPlotData_M11209=plotAllElectrodes(allPowerPieces_1209,f,jsM1_1209,steps,[13 30],'M1 1209');


fRange = (f>=40 & f<=55) | (f>=65 & f<=85);
% fRange = f>=13 & f<=30;
lfpRange = f>=10 & f<100;
apd = [allPlotData_S11125;allPlotData_S11209];

figure('position',[0 0 900 900]);
hold on
plotData=[];
for i=1:32
    subplot(4,8,i);
    for j=1:90
        plotData(i,j) = mean(squeeze(mean(apd(i,j,fRange),2)))./...
            mean(squeeze(mean(apd(i,j,lfpRange),2)));
    end
    plot(plotData(i,:));
    title(['S1 - ',num2str(i)]);
%     ylim([0 100])
    hold on;
    xlim([0 90])
end
% t=mean(plotData,2);
% bar(t-mean(t))
% % title(['M11209']);


% MAP_M1=[];
% MAP_S1=[];
% MAP_M1(1,:,:) = meanAllPlotData_M10916;
% MAP_M1(2,:,:) = meanAllPlotData_M11125;
% MAP_M1(3,:,:) = meanAllPlotData_M11209;
% MAP_S1(1,:,:) = meanAllPlotData_S10916;
% MAP_S1(2,:,:) = meanAllPlotData_S11125;
% MAP_S1(3,:,:) = meanAllPlotData_S11209;
% MAP_M1_mean = squeeze(mean(MAP_M1,1));
% MAP_S1_mean = squeeze(mean(MAP_S1,1));
% close all
% 
% el=10;
% figure;plot(f,mean(squeeze(allPlotData_M11125(el,1:4,:)),1))
% xlim([5 80])
% hold on;plot(f,mean(squeeze(allPlotData_M11125(el,5:15,:)),1),'r')
% hold on;plot(f,mean(squeeze(allPlotData_M11125(el,16:end,:)),1),'m')
% legendMap=plotAllElectrodes(allPowerPieces_0916,f,[1:16],30,[13 30],'M1 0916',1)
% plotAllElectrodes(allPowerPieces_0916,f,[17:32],30,[13 30],'S1 0916',2)
% 
% plotAllElectrodes(allPowerPieces_1125,f,[1:16],30,[13 30],'M1 1125',3)
% plotAllElectrodes(allPowerPieces_1125,f,[17:32],30,[13 30],'S1 1125',4)
% 
% plotAllElectrodes(allPowerPieces_1209,f,[1:16],30,[13 30],'M1 1209',5)
% plotAllElectrodes(allPowerPieces_1209,f,[17:32],30,[13 30],'S1 1209',6)