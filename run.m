% jsM1_0916 = [1:16];
% jsS1_0916 = [17:32];
% jsM1_1125 = [1:16];
% jsS1_1125 = [17:32];
% jsM1_1209 = [1:16];
% jsS1_1209 = [17:32];
% 
steps = 90;
% allPlotData_S10916=plotAllElectrodes(allPowerPieces_0916,f,jsM1_0916,steps,[13 30],'M1 0916');
% allPlotData_M10916=plotAllElectrodes(allPowerPieces_0916,f,jsS1_0916,steps,[13 30],'S1 0916');
% 
allPlotData_S11125=plotAllElectrodes(allPowerPieces_1125,f,jsS1_1125,steps,[10 100],'S1 1125');
% allPlotData_M11125=plotAllElectrodes(allPowerPieces_1125,f,jsM1_1125,steps,[13 30],'M1 1125');

allPlotData_S11209=plotAllElectrodes(allPowerPieces_1209,f,jsS1_1209,steps,[10 100],'S1 1209');
% allPlotData_M11209=plotAllElectrodes(allPowerPieces_1209,f,jsM1_1209,steps,[13 30],'M1 1209');


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