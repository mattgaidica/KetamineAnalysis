% Chestek Lab
% Matt Gaidica, mgaidica@med.umich.edu
% 20150118

% chList = [1:16 65:80];
function [powerPieces,startOffsetSeconds]=extractPowerPieces(filename,...
    chList,pieceLengthSeconds,startOffsetSeconds)
NSx = openNSx(filename,'read');

decimateFactor = 10;
artifacThresh = 5e3; %this seems appropriate for all files
Fs = 3e4/decimateFactor;
T = 1/Fs; % Sample time
L = Fs*pieceLengthSeconds;
t = (0:L-1)*T; % Time vector
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
f = Fs/2*linspace(0,1,NFFT/2+1);

% extract all spans that are below thresh, aka. no motion
% artifacts!
pieces = {};
for i=1:length(chList)
    pieces{i} = findCleanSpans(decimate(double(NSx.Data(chList(i),:)),decimateFactor),artifacThresh,L);
    disp(i)
end

% from those spans, perform FFT and get spectrum
% powerPieces = cell(channel, Nxf Spectrum (0-500Hz?) for each
% piece, 1xN f (spectrum frequency linspace vector
powerPieces = {};
extractCutoff = 100; %Hz
for i=1:length(chList)
    pieceSpectrums = [];
    chData = decimate(double(NSx.Data(chList(i),:)),decimateFactor);
    for j=1:length(pieces{i})
        disp([num2str(i),':',num2str(j)]);
        Y = fft(double(chData(pieces{i}(j,1):pieces{i}(j,2))),NFFT)/L;
        A = 2*abs(Y(1:NFFT/2+1));
        pieceSpectrums(j,:) = A(f<=extractCutoff);
    end
    powerPieces(i,:) = {chList(i),pieceSpectrums,f(f<=extractCutoff),...
        (pieces{i}(:,1)./NSx.MetaTags.SamplingFreq)*decimateFactor+startOffsetSeconds};
end
startOffsetSeconds = startOffsetSeconds + NSx.MetaTags.DataDurationSec;
clear('chData');
clear('NSx');
