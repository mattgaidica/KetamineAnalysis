t = linspace(0,90,steps);
% apd = [allPlotData_S11125;allPlotData_S11209];
% apd = [allPlotData_20150902_S1;allPlotData_20150915_S1;allPlotData_20141125_S1;allPlotData_20141209_S1];
% apd = [allPlotData_20150902_M1;allPlotData_20150915_M1;allPlotData_20141125_M1;allPlotData_20141209_M1];

% apd = [allPlotData_20150902_M1(ch0902M1,:,:);allPlotData_20150915_M1(ch0915M1,:,:);allPlotData_20141125_M1(ch1125M1,:,:);allPlotData_20141209_M1(ch1209M1,:,:)];
% apd = [allPlotData_20150902_S1(ch0902S1,:,:);allPlotData_20150915_S1(ch0915S1,:,:);allPlotData_20141125_S1(ch1125S1,:,:);allPlotData_20141209_S1(ch1209S1,:,:)];

apd = [allPlotData_20141125_M1(ch1125M1,:,:);allPlotData_20141209_M1(ch1209M1,:,:)];
apd = [allPlotData_20141125_S1(ch1125S1,:,:);allPlotData_20141209_S1(ch1209S1,:,:)];
% 
apd = [allPlotData_20150902_M1(ch0902M1,:,:);allPlotData_20150915_M1(ch0915M1,:,:)];
apd = [allPlotData_20150902_S1(ch0902S1,:,:);allPlotData_20150915_S1(ch0915S1,:,:)];

figure('position',[100 100 500 800]);
counti = 1;
for iFreq = 35:3:80;
    
plotData = [];
fRange = f>=iFreq & f<iFreq+3;
% fRange = f>=17 & f<=23;
% lfpRange = f>=10 & f<=100;
for i=1:size(apd,1)
    for j=1:size(apd,2)
        plotData(i,:) = mean(squeeze(apd(i,:,fRange)),2);%./...
%             mean(squeeze(apd(i,:,lfpRange)),2);
        plotData(i,:) = smooth(plotData(i,:),10);
    end
end
% subplot(2,1,1)
subplot(4,4,counti);
counti = counti+1;
hold on;
y1 = mean(plotData)+std(plotData)-mean(mean(plotData));
y2 = mean(plotData)-std(plotData)-mean(mean(plotData));
X = [t fliplr(t)];
Y = [y1,fliplr(y2)];
bColor = [50/360,121/360,238/360];
% bColor = [200/360,200/360,200/360];
fill(X,Y,'r','EdgeColor','none','FaceAlpha',0.7,...
    'FaceColor',bColor)
line1=plot(t,mean(plotData)-mean(mean(plotData)),'color',bColor,...
    'LineWidth',3)
plot(t,zeros(length(t),1),'LineStyle','--','color','k')
xlabel('Time (m)')
ylabel('Power')
xlim([0 90]);
ylim([-3 3]);
title([num2str(iFreq),' Hz']);

end

% plotDataBeta = plotData;
% plotData = [];
% fRange = (f>=40 & f<=58) | (f>=62 & f<=80);
% fRange = (f>=70 & f<=100);
% for i=1:size(apd,1)
%     for j=1:size(apd,2)
%         plotData(i,:) = mean(squeeze(apd(i,:,fRange)),2);%./...
% %             mean(squeeze(apd(i,:,lfpRange)),2);
%         plotData(i,:) = smooth(plotData(i,:),10);
%     end
% end
% subplot(2,1,2)
% hold on
% y1 = mean(plotData)+std(plotData)-mean(mean(plotData));
% y2 = mean(plotData)-std(plotData)-mean(mean(plotData));
% X = [t fliplr(t)];
% Y = [y1,fliplr(y2)];
% bColor = [61/360,166/360,59/360];
% % bColor = [200/360,200/360,200/360];
% fill(X,Y,'r','EdgeColor','none','FaceAlpha',0.7,...
%     'FaceColor',bColor)
% line2=plot(t,mean(plotData)-mean(mean(plotData)),'color',bColor,...
%     'LineWidth',3)
% plot(t,zeros(length(t),1),'LineStyle','--','color','k')
% xlabel('Time (m)')
% ylabel('Power')
% 
% legend([line1,line2],{'Beta','Gamma'})
% plotDataGamma = plotData;