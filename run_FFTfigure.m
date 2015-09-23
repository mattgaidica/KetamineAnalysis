% run run_powerBandAnalysis to get allPlotData

channel = 1;
figure;

cm = jet(128);
cmMap = round(linspace(1,128,size(allPlotData,2)));
for ii=1:size(allPlotData,2)
    hold on;
    plot(linspace(0,200,1093),smooth(squeeze(allPlotData(channel,ii,:)),10),'color',cm(cmMap(ii),:),'lineWidth',5);
end
xlim([15 30]);