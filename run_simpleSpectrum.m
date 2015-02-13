
%first:
%allPlotData_S11125=plotAllElectrodes(allPowerPieces_1125,f,jsS1_1125,3,[10 100],'S1 1125');
figure;
hold on;
sm=10;
plot(f,smooth(squeeze(allPlotData_S11125(16,1,:)),sm),'color',[129/360,8/360,8/360],'LineWidth',4)
plot(f,smooth(squeeze(allPlotData_S11125(16,2,:)),sm),'--','color',[222/360,40/360,40/360],'LineWidth',4)
plot(f,smooth(squeeze(allPlotData_S11125(16,3,:)),sm),':','color',[240/360,116/360,116/360],'LineWidth',4)
xlim([10 80]);

legend('Before','After','Recovery')
