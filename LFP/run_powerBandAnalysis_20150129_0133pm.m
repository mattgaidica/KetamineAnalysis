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

allSpectrumPieces = [];
for i=1:length(allPowerPieces_0916)
    spectrumPieces = allPowerPieces_0916{i}{2}{17,2};
    allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
end

%figure;
subplot(2,1,2);

legendMap = {};
steps = 10;
for i=1:steps
    chunk = size(allSpectrumPieces,1)/steps;
    hold on;
    start = (chunk*(i-1))+1;
    stop = chunk*i;
    plot(f,smooth(mean(allSpectrumPieces(start:stop,:))),'color',[i/10 1-(i/10) 0],'linewidth',3);
    legendMap{i} = num2str(i);
end
title('0916 Data');
xlim([5 80])
xlabel('freq')
ylabel('power')
legend(legendMap)

