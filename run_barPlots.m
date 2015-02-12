figure('position',[100 100 600 900]);
for pos=1:3
    MAP_M1_mean = squeeze(mean(MAP_M1,1));
    MAP_S1_mean = squeeze(mean(MAP_S1,1));
    MAP_M1_mean = squeeze(mean(MAP_M1(pos,:,:),1));
    MAP_S1_mean = squeeze(mean(MAP_S1(pos,:,:),1));
    
%     ftype='alpha';
%     fRange= f>=8 & f<=12;
%     LFPrange = f>=10 & f<=100;

    ftype = 'beta';
    fRange= f>=15 & f<=25;
    LFPrange = f>=5 & f<80;
%     
%     ftype = 'gamma';
%     fRange = (f>=40 & f<=57) | (f>=63 & f<=80);
%     LFPrange = f>=10 & f<=80;

    barData = [];
    % figure;
    for i=1:steps
    %     plot(tS1(i,fRange),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',5);
    %     hold on;
        barData(i,1) = mean(MAP_S1_mean(i,fRange))/mean(MAP_S1_mean(i,LFPrange));
        barData(i,2) = mean(MAP_M1_mean(i,fRange))/mean(MAP_M1_mean(i,LFPrange));
    end
    subplot(3,1,pos);
    diffbarData(:,1) = diff(barData(:,1));
    diffbarData(:,2) = diff(barData(:,2));
    plot(linspace(1,90,steps),barData(:,2),'-o');
    hold on;
    plot(linspace(1,90,steps),barData(:,1),'-o','color','r');
    % hold on;
    % area(barData(:,2));
    %ylim([min(barData(:)) max(barData(:))]);
    xlim([0 steps])
    legend('S1','M1');

    title([num2str(pos),ftype])
end
% [acor,lag] = xcorr(barData(:,1),barData(:,2));
% [~,I] = max(abs(acor));
% lagDiff = lag(I)
% 
% figure
% plot(lag,acor)