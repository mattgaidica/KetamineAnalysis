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


js = [17:32];
for i=1:length(js)
    betaOverLFP{js(i)} = [];
end
for i=1:length(js)
    betaOverLFP_odd{js(i)} = [];
end

for i=1:length(allPowerPieces_1125)
    meanChSpectrums = [];
    LFPpower = [];
    %for j=[19,22,25,28,30,31] 19,25,28,30
    for j=js
        %disp([num2str(i),':',num2str(j)])
        spectrumPieces = allPowerPieces_1125{i}{2}{j,2};
        disp(num2str(size(spectrumPieces,1)));
        f = allPowerPieces_1125{i}{2}{1,3};
        fRange= f>=13 & f<=30;
        LFPrange = f>=10 & f<=80;
        for k=1:size(spectrumPieces,1)
            t = mean(mean(spectrumPieces(k,fRange)))/mean(mean(spectrumPieces(k,LFPrange)));
            betaOverLFP{j} = [betaOverLFP{j} t];
            if(mod(i,2)==0)
                betaOverLFP_odd{j} = [betaOverLFP_odd{j} 0];
            else
                betaOverLFP_odd{j} = [betaOverLFP_odd{j} t];
            end
        end
    end
    
%     hold on;
%     subplot(3,5,i);
%     plot(f(fRange),mean(meanChSpectrums));
%     xlim([13 30]);
%     ylim([0 20]);
%     title(num2str(i))
end
figure;
for i=1:length(js)
    hold on;
    plot(betaOverLFP{js(i)});
    disp(js(i));
    %plot(betaOverLFP_odd{js(i)},'r');
end