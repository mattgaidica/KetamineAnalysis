%after run_barPlots_20150213.m we have plotDataBeta/Gamma, these are raw,
%unnormalized or meaned values

%normalize each mean to a 0-1 value, flip gamma so we can multiply
plotDataBetaNorm = mean(plotDataBeta)-mean(mean(plotDataBeta));
plotDataGammaNorm = mean(plotDataGamma)-min(mean(plotDataGamma));

figure
hold on
plot(t,plotDataBetaNorm)
plot(t,plotDataGammaNorm,'r')
figure
plot(t,plotDataBetaNorm.*plotDataGammaNorm,'m')