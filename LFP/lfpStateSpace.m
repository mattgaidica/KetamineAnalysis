function lfpStateSpace(allPowerPiecesCell,channels,plotType,bispectrum)
% channels = [17:32];
% bandLimits is three LFP axes limits plus one LFP calibration limit
% [] high res saving http://www.mathworks.com/matlabcentral/newsreader/view_thread/287268

figure('position',[0 0 800 800]);
allBands = {};

timeSegments = 100;
endSession = 90; %minutes
timeStep = linspace(0,endSession,timeSegments+2); %minutes
    
    
for iP = 1:size(allPowerPiecesCell,2)
    allPowerPieces = allPowerPiecesCell{1,iP};
    f = allPowerPiecesCell{1,1}{1,2}{1,3};
    bandIdx{1} = f>=1 & f<4;
    bandIdx{2} = f>=13 & f<=30;
    bandIdx{3} = (f>=40 & f<=58) | (f>=62 & f<80); %does this matter?
    bandIdx{4} = f>=10 & f<100;

    [timeSeries,powerSeries] = makeTimeSeries(allPowerPiecesCell);
    bands = [];
    for iCh = 1:length(channels)
        for iSeg = 1:length(timeStep)-1
            startTime = timeStep(iSeg)*60;
            endTime = timeStep(iSeg+1)*60;
            %extract time segment
            timeWindowIdxs = timeSeries{channels(iCh)} > startTime & timeSeries{channels(iCh)} < endTime;
            %get all power from that time segment
            thisPowerSeries = powerSeries{channels(iCh)}(timeWindowIdxs,:);
            %filter power by bands
            for iBand=1:4 %all bands including calibration
                %going to need std deviation
                bands(iCh,iBand,iSeg) =  nanmean(nanmean(thisPowerSeries(:,bandIdx{iBand})));
            end
        end
    end
    maxEndTime = max([timeSeries{1,:}]);
    allBands{iP,1} = bands;
end

% be careful about using iCh
fdata = [];
medF = 1;
smF = 1;
for iCh=1:length(channels)
    if plotType == 1
        hold on;
        grid on;
        dataX = mean([smooth(medfilt1(squeeze(squeeze(allBands{1}(iCh,1,:)))./squeeze(squeeze(allBands{1}(iCh,4,:))),medF),smF),...
                smooth(medfilt1(squeeze(squeeze(allBands{2}(iCh,1,:)))./squeeze(squeeze(allBands{2}(iCh,4,:))),medF),smF)],2);
        dataY = mean([smooth(medfilt1(squeeze(squeeze(allBands{1}(iCh,2,:)))./squeeze(squeeze(allBands{1}(iCh,4,:))),medF),smF),...
                smooth(medfilt1(squeeze(squeeze(allBands{2}(iCh,2,:)))./squeeze(squeeze(allBands{2}(iCh,4,:))),medF),smF)],2);
        dataZ = mean([smooth(medfilt1(squeeze(squeeze(allBands{1}(iCh,3,:)))./squeeze(squeeze(allBands{1}(iCh,4,:))),medF),smF),...
                smooth(medfilt1(squeeze(squeeze(allBands{2}(iCh,3,:)))./squeeze(squeeze(allBands{2}(iCh,4,:))),medF),smF)],2);
            
        colormapscatter(normalize(dataX),normalize(dataY),normalize(dataZ),jet,300);
        xlabel('Delta (1-4 Hz)')
        ylabel('Beta (13-30 Hz)');
        zlabel('Gamma (40-80 Hz)');
        view(110,25);
        xlim([0 1]);
        ylim([0 1]);
        zlim([0 1]);
        colormap(jet);
    elseif plotType == 2 || plotType == 3
        % raw data lines
        for iBand=1:4
            hold on;
            subplot(4,1,iBand);
            if bispectrum == 1
                fdata(iCh,iBand,:) = nanmean([smooth(medfilt1(squeeze(squeeze(allBands{1}(iCh,iBand,:)))./squeeze(squeeze(allBands{1}(iCh,4,:))),medF),smF),...
                    smooth(medfilt1(squeeze(squeeze(allBands{2}(iCh,iBand,:)))./squeeze(squeeze(allBands{2}(iCh,4,:))),5),5)],2)';
            else
                fdata(iCh,iBand,:) = nanmean([smooth(medfilt1(squeeze(squeeze(allBands{1}(iCh,iBand,:))),medF),smF),...
                    smooth(medfilt1(squeeze(squeeze(allBands{2}(iCh,iBand,:))),5),5)],2)';
            end
            fdata(iCh,iBand,:) = fdata(iCh,iBand,:) - nanmean(fdata(iCh,iBand,:)); %zero mean
            %data = smooth(medfilt1(normalize(squeeze(squeeze(bands(iCh,iBand,:)))./squeeze(squeeze(bands(iCh,4,:)))),5),5);
            %data = smooth(normalize(medfilt1(squeeze(squeeze(bands(iCh,iBand,:))),5)),5);
            plot(squeeze(fdata(iCh,iBand,:)));
        end
    end
end

if plotType == 3
    figure('position',[0 0 800 800]);
    smF = 10;
    for iBand = 1:3
        bColor = [30/360,30/360,30/360];
        subplot(3,1,iBand);
        bandStd = smooth(std(squeeze(fdata(:,iBand,:))),smF)';
        y1 = smooth(squeeze(mean(fdata(:,iBand,:)))'+bandStd,smF)';
        y2 = smooth(squeeze(mean(fdata(:,iBand,:)))'-bandStd,smF)';
        t = linspace(0,endSession,timeSegments+1);
        plot(t,smooth(squeeze(mean(fdata(:,iBand,:))),smF),'lineWidth',3,'color',bColor);
        hold on;
        X = [t fliplr(t)];
        Y = [y1 fliplr(y2)];
        fill(X,Y,'r','EdgeColor','none','FaceAlpha',0.7,'FaceColor',bColor);
        plot(t,zeros(length(t),1),'LineStyle','--','color','k');
    end
end