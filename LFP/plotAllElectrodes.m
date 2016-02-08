function allPlotData=plotAllElectrodes(allPowerPieces,js,steps,fRange,titleString)
    %h1 = figure('position',[0 0 900 900]);
    f = allPowerPieces{1,1}{1,2}{1,3};
    allPlotData = [];
    for el=1:length(js)
        %subplot(ceil(length(js)/4),4,el);
        allSpectrumPieces = [];
        for ii=1:8%!!!!length(allPowerPieces)
            spectrumPieces = allPowerPieces{ii}{2}{js(el),2};
            allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
        end
% debug figures
        legendMap = {};
        h = figure;
        for ii=1:steps
            chunk = floor(size(allSpectrumPieces,1)/steps);
            start = (chunk*(ii-1))+1;
            stop = chunk*ii;
            plotData = smooth(mean(allSpectrumPieces(start:stop,:)),7);
            allPlotData(el,ii,:) = plotData;
            cmap = jet;
            colorIdxs = round(linspace(1,58,steps)); %stop at bright red
            plot(f,plotData,'color',cmap(colorIdxs(ii),:),'linewidth',5);
            hold on;
            legendMap{ii} = num2str(ii);
        end
        title([titleString,' Data - electrode',num2str(js(el))]);
        xlim(fRange)
        xlabel('freq')
        ylabel('power')
        set(gca,'xgrid','on')
        
        % comment for debug mode
        close(h);
    end
    
    h2 = figure('position',[0 0 600 300]);
    meanAllPlotData = squeeze(mean(allPlotData,1));
    for ii=1:size(meanAllPlotData,1)
        hold on;
        plot(f,meanAllPlotData(ii,:),'color',cmap(colorIdxs(ii),:),'linewidth',2);
    end
    title([titleString,' Data - all electrodes']);
    xlim(fRange)
    xlabel('freq')
    ylabel('power')
end