function lfpStateSpace(allPowerPieces,channel)
% channels = [17:32];
% bandLimits is three LFP axes limits plus one LFP calibration limit
% [] calibration band



f = allPowerPieces{1,1}{1,2}{1,3};
bandIdx{1} = f>=1 & f<4;
bandIdx{2} = f>=13 & f<=30;
bandIdx{3} = (f>=40 & f<=58) | (f>=62 & f<=80);

bands = [];
pieceCount = 1;
% run through all the files
for iFile = 1:length(allPowerPieces)
    % run through all the pieces for channels of interest
    t = [];
    for ii=1:length(bandLimits)
        t(ii,:) =  mean(allPowerPieces{1,iFile}{1,2}{channel,2}(:,bandIdx{ii}),2);
    end
    bands = [bands t];
end

stateSpace = [];
for ii=1:3
    stateSpace(ii,:) = bands(ii,:)./bands(4,:);
end

hold on;
grid on;
colormapscatter(stateSpace(1,30:end-30),stateSpace(2,30:end-30),stateSpace(3,30:end-30),winter);
xlabel('delta')
ylabel('beta');
zlabel('gamma');
view(3);
colorbar;
colormap(winter);