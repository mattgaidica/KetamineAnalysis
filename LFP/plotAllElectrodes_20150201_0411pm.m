function allPlotData=plotAllElectrodes(allPowerPieces,f,js,steps,fRange,titleString)
    h1 = figure('position',[0 0 900 900]);
    allPlotData = [];
    for el=1:length(js)
        subplot(ceil(length(js)/4),4,el);
        allSpectrumPieces = [];
        for i=1:9%length(allPowerPieces)
            spectrumPieces = allPowerPieces{i}{2}{js(el),2};
            allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
        end

        legendMap = {};
        for i=1:steps
            chunk = floor(size(allSpectrumPieces,1)/steps);
            start = (chunk*(i-1))+1;
            stop = chunk*i;
            plotData = mean(allSpectrumPieces(start:stop,:));
            allPlotData(el,i,:) = plotData;
            plot(f,plotData,'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',2);
            hold on;
            legendMap{i} = num2str(i);
        end
        title([titleString,' Data - electrode',num2str(js(el))]);
        xlim(fRange)
        xlabel('freq')
        ylabel('power')
    end
    
    h2 = figure('position',[0 0 600 300]);
    meanAllPlotData = squeeze(mean(allPlotData,1));
    for i=1:size(meanAllPlotData,1)
        hold on;
        plot(f,meanAllPlotData(i,:),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',7);
    end
    title([titleString,' Data - all electrodes']);
    xlim(fRange)
    xlabel('freq')
    ylabel('power')
end