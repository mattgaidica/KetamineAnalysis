% dataDirs = {
%     'C:\Users\Matt\Desktop\svn_repository\Students\MattGaidica\Data\Raw\Spider Man\2014-11-25\Morning',
%     'C:\Users\Matt\Desktop\svn_repository\Students\MattGaidica\Data\Raw\Spider Man\2014-11-25\Afternoon'
%     };
% chList = [1:16 65:80];
% %chList = [1:32];
% allPowerPieces = makeAllPowerPieces(dataDirs,chList);
% %-> Each File
% %--> Filename, Spectrum Data
% %---> Channel, Spectrum for each Piece, fVector
betaOverLFP = [];
crapChannels = [];
% figure('position',[0 0 900 900]);
for i=1:length(allPowerPieces_0916)
    meanChSpectrums = [];
    LFPpower = [];
    %for j=[19,22,25,28,30,31] 19,25,28,30
    for j=17:32
        disp([num2str(i),':',num2str(j)])
        spectrumPieces = allPowerPieces_0916{i}{2}{j,2};
        disp(num2str(size(spectrumPieces,1)));
        f = allPowerPieces_0916{i}{2}{1,3};
        fRange= f>=13 & f<=30;
        LFPrange = f>=10 & f<=80;
        if(~isempty(spectrumPieces))
            %betaOverLFP = [betaOverLFP (spectrumPieces(:,fRange)/spectrumPieces(:,LFPrange))];
            meanChSpectrums(j,:) = mean(spectrumPieces(:,fRange));
            LFPpower(j,:) = mean(spectrumPieces(:,LFPrange));
        else
            crapChannels = unique([crapChannels j]);
        end
    end
    betaOverLFP(i) = mean(meanChSpectrums(:))/mean(LFPpower(:));
%     hold on;
%     subplot(3,5,i);
%     plot(f(fRange),mean(meanChSpectrums));
%     xlim([13 30]);
%     ylim([0 20]);
%     title(num2str(i))
end
% figure;
hold on
subplot(2,1,2);
bar(betaOverLFP);
ylim([min(betaOverLFP)-.2 max(betaOverLFP)+.2])
title('0916 Data');

% allChBeta = [];
% figure;
% for j=17:32
%     chPowerPieces = [];
%     for i=1:length(allPowerPieces) %all files
%         chPowerPieces = [chPowerPieces;allPowerPieces{i}{2}{j,2}];
%     end
% 
%     fRange= f>=13 & f<=30;
%     allBeta = [];
%     for i=1:size(chPowerPieces,1)
%         allBeta = [allBeta mean(chPowerPieces(i,fRange))];
%     end
%     %allChBeta = [allChBeta;allBeta];
%     plot(smooth(allBeta));
%     hold on;
% end
% figure;
% plot(mean(allChBeta));