t = linspace(0,90,steps);
apd = [allPlotData_S11125;allPlotData_S11209];

plotData = [];
fRange = f>=13 & f<=30;
lfpRange = f>=10 & f<100;
for i=1:size(apd,1)
    for j=1:size(apd,2)
        plotData(i,:) = mean(squeeze(apd(i,:,fRange)),2)./...
            mean(squeeze(apd(i,:,lfpRange)),2);
        plotData(i,:) = smooth(plotData(i,:),10);
    end
end
figure('position',[100 100 500 800]);
subplot(2,1,1)
hold on;
y1 = mean(plotData)+std(plotData)-mean(mean(plotData));
y2 = mean(plotData)-std(plotData)-mean(mean(plotData));
X = [t fliplr(t)];
Y = [y1,fliplr(y2)];
bColor = [50/360,121/360,238/360];
fill(X,Y,'r','EdgeColor','none','FaceAlpha',0.7,...
    'FaceColor',bColor)
line1=plot(t,mean(plotData)-mean(mean(plotData)),'color',bColor,...
    'LineWidth',3)
plot(t,zeros(length(t),1),'LineStyle','--','color','k')
xlabel('Time (m)')
ylabel('Power')


plotData = [];
fRange = (f>=40 & f<=58) | (f>=62 & f<=80);
for i=1:size(apd,1)
    for j=1:size(apd,2)
        plotData(i,:) = mean(squeeze(apd(i,:,fRange)),2)./...
            mean(squeeze(apd(i,:,lfpRange)),2);
        plotData(i,:) = smooth(plotData(i,:),10);
    end
end
subplot(2,1,2)
hold on
y1 = mean(plotData)+std(plotData)-mean(mean(plotData));
y2 = mean(plotData)-std(plotData)-mean(mean(plotData));
X = [t fliplr(t)];
Y = [y1,fliplr(y2)];
bColor = [61/360,166/360,59/360];
fill(X,Y,'r','EdgeColor','none','FaceAlpha',0.7,...
    'FaceColor',bColor)
line2=plot(t,mean(plotData)-mean(mean(plotData)),'color',bColor,...
    'LineWidth',3)
plot(t,zeros(length(t),1),'LineStyle','--','color','k')
xlabel('Time (m)')
ylabel('Power')

legend([line1,line2],{'Beta','Gamma'})
