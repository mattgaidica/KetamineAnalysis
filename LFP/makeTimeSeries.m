function [timeSeries,powerSeries] = makeTimeSeries(allPowerPieces)

timeSeries = {};
powerSeries = {};
for iCh=1:size(allPowerPieces{1,1}{1,2},1)
    for iFile=1:length(allPowerPieces)
        if iFile==1
            powerSeries{iCh,1} = allPowerPieces{1,iFile}{1,2}{iCh,2};
            timeSeries{iCh,1} = allPowerPieces{1,iFile}{1,2}{iCh,4};
        else
            powerSeries{iCh,1} = [powerSeries{iCh};allPowerPieces{1,iFile}{1,2}{iCh,2}];
            timeSeries{iCh,1} = [timeSeries{iCh};allPowerPieces{1,iFile}{1,2}{iCh,4}];
        end
    end
end