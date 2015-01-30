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


% for i=1:length(js)
%     betaOverLFP{js(i)} = [];
% end
% for i=1:length(js)
%     betaOverLFP_odd{js(i)} = [];
% end
% 
% for i=1:length(allPowerPieces_0916)
%     meanChSpectrums = [];
%     LFPpower = [];
%     %for j=[19,22,25,28,30,31] 19,25,28,30
%     for j=js
%         %disp([num2str(i),':',num2str(j)])
%         spectrumPieces = allPowerPieces_0916{i}{2}{j,2};
%         disp(num2str(size(spectrumPieces,1)));
%         f = allPowerPieces_0916{i}{2}{1,3};
%         fRange= f>=13 & f<=30;
%         LFPrange = f>=10 & f<=80;
%         for k=1:size(spectrumPieces,1)
%             t = mean(mean(spectrumPieces(k,fRange)))/mean(mean(spectrumPieces(k,LFPrange)));
%             betaOverLFP{j} = [betaOverLFP{j} t];
%             if(mod(i,2)==0)
%                 betaOverLFP_odd{j} = [betaOverLFP_odd{j} 0];
%             else
%                 betaOverLFP_odd{j} = [betaOverLFP_odd{j} t];
%             end
%         end
%     end
% end
% figure;
% for i=1:length(js)
%     hold on;
%     plot(betaOverLFP{js(i)});
%     disp(js(i));
%     %plot(betaOverLFP_odd{js(i)},'r');
% end
saveDir = 'C:\Users\Matt\Desktop\svn_repository\Students\MattGaidica\KetamineAnalysis\figures\fftCompare';
js = [81:96];
h1 = figure('position',[0 0 900 900]);
for el=1:length(js)
    
%     %stark
%     subplot(4,4,el);
%     allSpectrumPieces = [];
%     for i=1:length(allPowerPieces_stark)
%         spectrumPieces = allPowerPieces_stark{i}{2}{js(el),2};
%         allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
%     end
% 
%     legendMap = {};
%     steps = 10;
%     for i=1:steps
%         chunk = size(allSpectrumPieces,1)/steps;
%         hold on;
%         start = (chunk*(i-1))+1;
%         stop = chunk*i;
%         plot(f,smooth(mean(allSpectrumPieces(start:stop,:))),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',2);
%         legendMap{i} = num2str(i);
%     end
%     title(['stark Data - electrode',num2str(js(el))]);
%     xlim([40 70])
%     xlabel('freq')
%     ylabel('power')
%     legend(legendMap)

    
    %0916
%     subplot(4,4,el);
%     allSpectrumPieces = [];
%     for i=1:length(allPowerPieces_0916)
%         spectrumPieces = allPowerPieces_0916{i}{2}{js(el),2};
%         allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
%     end
% 
%     legendMap = {};
%     steps = 10;
%     for i=1:steps
%         chunk = size(allSpectrumPieces,1)/steps;
%         hold on;
%         start = (chunk*(i-1))+1;
%         stop = chunk*i;
%         plot(f,smooth(mean(allSpectrumPieces(start:stop,:))),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',2);
%         legendMap{i} = num2str(i);
%     end
%     title(['20140916 Data - electrode',num2str(js(el))]);
%     xlim([5 80])
%     xlabel('freq')
%     ylabel('power')
%     legend(legendMap)

    %1125
    subplot(4,4,el);
    allSpectrumPieces = [];
    for i=1:length(allPowerPieces_1125)
        spectrumPieces = allPowerPieces_1125{i}{2}{js(el),2};
        allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
    end

    legendMap = {};
    steps = 10;
    for i=1:steps
        chunk = size(allSpectrumPieces,1)/steps;
        hold on;
        start = (chunk*(i-1))+1;
        stop = chunk*i;
        plot(f,smooth(mean(allSpectrumPieces(start:stop,:))),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',2);
        legendMap{i} = num2str(i);
    end
    title(['20141125 Data - electrode',num2str(js(el))]);
    xlim([13 30])
    xlabel('freq')
    ylabel('power')
    legend(legendMap)

%     filename = ['fftCompare-electrode',num2str(js(el))];
%     saveas(h1,fullfile(saveDir,filename),'fig');
%     close(h1)
end
