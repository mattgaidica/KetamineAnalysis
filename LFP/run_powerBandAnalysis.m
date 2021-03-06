% dataDirs = {
%     '/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-12-09/Morning',...
%     '/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-12-09/Afternoon'
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
% js = [65:128];
js = [17:32];
h1 = figure('position',[0 0 900 900]);
allPlotData = [];
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
%     steps = 20;
%     for i=1:steps
%         chunk = size(allSpectrumPieces,1)/steps;
%         hold on;
%         start = (chunk*(i-1))+1;
%         stop = chunk*i;
%         plotData = mean(allSpectrumPieces(start:stop,:));
%         allPlotData(el,i,:) = plotData;
%         plot(f,plotData,'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',3);
%         legendMap{i} = num2str(i);
%     end
%     title(['20140916 Data - electrode',num2str(js(el))]);
%     xlim([13 30])
%     xlabel('freq')
%     ylabel('power')
%     legend(legendMap)

    %1209
    subplot(4,4,el);
    allSpectrumPieces = [];
    for ii=1:length(allPowerPieces_20141209)
        spectrumPieces = allPowerPieces_20141209{ii}{2}{js(el),2};
        allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
        f = allPowerPieces_20141209{ii}{2}{1,3};
    end

    legendMap = {};
    steps = 90;
    for ii=1:steps
        chunk = size(allSpectrumPieces,1)/steps;
        hold on;
        start = (chunk*(ii-1))+1;
        stop = chunk*ii;
        plotData = mean(allSpectrumPieces(start:stop,:));
        allPlotData(el,ii,:) = plotData;
        plot(f,plotData,'color',[ii/steps 1-(ii/steps) 1-(ii/steps)],'linewidth',7);
        legendMap{ii} = num2str(ii);
    end
    title(['20141209 Data - electrode',num2str(js(el))]);
    xlim([13 30])
    xlabel('freq')
    ylabel('power')
    
    %1125
% %     subplot(8,8,el);
% %     allSpectrumPieces = [];
% %     for ii=1:length(allPowerPieces_20150915)
% %         spectrumPieces = allPowerPieces_20150915{ii}{2}{js(el),2};
% %         f = allPowerPieces_20150915{ii}{2}{1,3};
% %         allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
% %     end
% % 
% %     legendMap = {};
% %     steps = 90;
% %     for ii=1:steps
% %         chunk = size(allSpectrumPieces,1)/steps;
% %         hold on;
% %         start = (chunk*(ii-1))+1;
% %         stop = chunk*ii;
% %         plotData = mean(allSpectrumPieces(start:stop,:));
% %         allPlotData(el,ii,:) = plotData;
% %         plot(f,plotData,'color',[ii/steps 1-(ii/steps) 1-(ii/steps)],'linewidth',5);
% %         legendMap{ii} = num2str(ii);
% %     end
% %     title(['20141125 Data - electrode',num2str(js(el))]);
% %     xlim([1 4])
% %     xlabel('freq')
% %     ylabel('power')

%     %0515
%     subplot(4,4,el);
%     allSpectrumPieces = [];
%     for ii=1:length(allPowerPieces_0515)
%         spectrumPieces = allPowerPieces_0515{ii}{2}{js(el),2};
%         allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
%     end
% 
%     legendMap = {};
%     steps = 7;
%     for ii=1:steps
%         chunk = size(allSpectrumPieces,1)/steps;
%         hold on;
%         start = (chunk*(ii-1))+1;
%         stop = chunk*ii;
%         plotData = mean(allSpectrumPieces(start:stop,:));
%         allPlotData(el,ii,:) = plotData;
%         plot(f,plotData,'color',[ii/steps 1-(ii/steps) 1-(ii/steps)],'linewidth',7);
%         legendMap{ii} = num2str(ii);
%     end
%     title(['20150515 Data - electrode',num2str(js(el))]);
%     xlim([1 4])
%     xlabel('freq')
%     ylabel('power')


%     %20150902
%     subplot(4,4,el);
%     allSpectrumPieces = [];
%     for ii=1:length(allPowerPieces_20150902)
%         spectrumPieces = allPowerPieces_20150902{ii}{2}{js(el),2};
%         allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
%     end
% 
%     legendMap = {};
%     steps = 90;
%     for ii=1:steps
%         chunk = size(allSpectrumPieces,1)/steps;
%         hold on;
%         start = (chunk*(ii-1))+1;
%         stop = chunk*ii;
%         plotData = mean(allSpectrumPieces(start:stop,:));
%         allPlotData(el,ii,:) = plotData;
%         plot(f,plotData,'color',[ii/steps 1-(ii/steps) 1-(ii/steps)],'linewidth',7);
%         legendMap{ii} = num2str(ii);
%     end
%     title(['20150902 Data - electrode',num2str(js(el))]);
%     xlim([13 30])
% %     ylim([5 20])
%     xlabel('freq')
%     ylabel('power')
    
    %20150915
% %     subplot(4,4,el);
% %     allSpectrumPieces = [];
% %     for ii=1:length(allPowerPieces_20150915)
% %         spectrumPieces = allPowerPieces_20150915{ii}{2}{js(el),2};
% %         allSpectrumPieces = [allSpectrumPieces;spectrumPieces];
% %         f = allPowerPieces_20150915{ii}{2}{1,3};
% %     end
% % 
% %     legendMap = {};
% %     steps = 90;
% %     for ii=1:steps
% %         chunk = size(allSpectrumPieces,1)/steps;
% %         hold on;
% %         start = (chunk*(ii-1))+1;
% %         stop = chunk*ii;
% %         plotData = mean(allSpectrumPieces(start:stop,:));
% %         allPlotData(el,ii,:) = plotData;
% %         plot(f,plotData,'color',[ii/steps 1-(ii/steps) 1-(ii/steps)],'linewidth',7);
% %         legendMap{ii} = num2str(ii);
% %     end
% %     title(['20150915 Data - electrode',num2str(js(el))]);
% %     xlim([13 30])
% % % %    ylim([5 20])
% %     xlabel('freq')
% %     ylabel('power')
    

%     %legend(legendMap)

%     filename = ['fftCompare-electrode',num2str(js(el))];
%     saveas(h1,fullfile(saveDir,filename),'fig');
%     close(h1)
end

% h2 = figure('position',[0 0 900 400]);
meanAllPlotData = squeeze(mean(allPlotData,1));
% for i=1:size(meanAllPlotData,1)
%     hold on;
%     plot(f,meanAllPlotData(i,:),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',7);
% end
% title(['M1-0916']);
% xlim([13 30])
% xlabel('freq')
% ylabel('power')

% t=[];
% t(1,:,:)=plotData_0916;
% t(2,:,:)=plotData_1125;
% t(3,:,:)=plotData_1209;
% tm=squeeze(mean(t));
% h2 = figure('position',[0 0 900 400]);
% for i=1:size(MAP_M1_mean,1)
%     hold on;
%     plot(f,MAP_M1_mean(i,:),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',5);
% end
% title(['20141125 Data - 0916,1125,1209, all electrodes']);
% xlim([13 30])
% xlabel('freq')
% ylabel('power')


