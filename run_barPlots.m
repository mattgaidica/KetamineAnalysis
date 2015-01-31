fRange= f>=15 & f<=25;
LFPrange = f>=10 & f<=80;
barData = [];
% figure;
for i=1:8
%     plot(tS1(i,fRange),'color',[i/steps 1-(i/steps) 1-(i/steps)],'linewidth',5);
%     hold on;
    barData(i,1) = mean(mean(plotDataS1(:,i,fRange),1));
    barData(i,2) = mean(mean(plotDataM1(:,i,fRange),1));
end
figure;
bar(barData);
legend('S1','M1');