function lfpStateSpace(allPowerPieces,channels)
% channels = [17:32];
% bandLimits is three LFP axes limits plus one LFP calibration limit
% [] high res saving http://www.mathworks.com/matlabcentral/newsreader/view_thread/287268


plotType = 2;

f = allPowerPieces{1,1}{1,2}{1,3};
bandIdx{1} = f>=1 & f<4;
bandIdx{2} = f>=13 & f<=30;
bandIdx{3} = (f>=40 & f<=58) | (f>=62 & f<=80); %does this matter?
bandIdx{4} = f>=10 & f<=100;

[timeSeries,powerSeries] = makeTimeSeries(allPowerPieces);
timeSegments = 50;
timeStep = linspace(0,100,timeSegments+1); %minutes
timeStep = timeStep(2:end); %throw out first mark
bands = [];
for iCh = 1:length(channels)
    for iSeg = 1:length(timeStep)
        if iSeg == 1
            startTime = 0;
        else
            startTime = timeStep(iSeg-1);
        end
        endTime = timeStep(iSeg);
        %extract time segment
        timeWindowIdxs = timeSeries{channels(iCh)} > startTime*60 & timeSeries{channels(iCh)} < endTime*60;
        %get all power from that time segment
        thisPowerSeries = powerSeries{channels(iCh)}(timeWindowIdxs,:);
        %filter power by bands
        for iBand=1:4 %all bands including calibration
            %going to need std deviation
            bands(iCh,iBand,iSeg) =  mean(mean(thisPowerSeries(:,bandIdx{iBand})));
        end
    end
end

% be careful about using iCh

figure('position',[0 0 1000 1000]);
for iCh=1:length(channels)
    if plotType == 1
        hold on;
        grid on;
        colormapscatter(normalize(squeeze(squeeze(bands(iCh,1,:))))-normalize(squeeze(squeeze(mean(bands(:,4,:))))),...
            normalize(squeeze(squeeze(bands(iCh,2,:))))-normalize(squeeze(squeeze(bands(iCh,4,:)))),...
            normalize(squeeze(squeeze(bands(iCh,3,:))))-normalize(squeeze(squeeze(bands(iCh,4,:)))),...
            jet,100);
        xlabel('Delta (1-4 Hz)')
        ylabel('Beta (13-30 Hz)');
        zlabel('Gamma (40-80 Hz)');
        view(160,45);
        xlim([0 1]);
        ylim([0 1]);
        zlim([0 1])
        colormap(jet);
    else
        for ii=1:3
            hold on;
            subplot(3,1,ii);
            data = normalize(squeeze(squeeze(bands(iCh,ii,:))))-normalize(squeeze(squeeze(bands(iCh,4,:))));
            plot(data);
        end
    end
end
disp('end')