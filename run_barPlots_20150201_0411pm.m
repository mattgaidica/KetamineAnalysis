fRange= f>=13 & f<=30;
LFPrange = f>=10 & f<=80;
barData = [];
% figure;
for i=1:steps
%     plot(tS1(i,fRange),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',5);
%     hold on;
    barData(i,1) = mean(MAP_S1_mean(i,fRange))/mean(MAP_S1_mean(i,LFPrange));
    barData(i,2) = mean(MAP_M1_mean(i,fRange))/mean(MAP_M1_mean(i,LFPrange));
end
figure;
bar(linspace(1,90,steps),barData);
% hold on;
% area(barData(:,2));
ylim([min(barData(:)) max(barData(:))]);
xlim([0 steps])
legend('S1','M1');

% [acor,lag] = xcorr(barData(:,1),barData(:,2));
% [~,I] = max(abs(acor));
% lagDiff = lag(I)
% 
% figure
% plot(lag,acor)