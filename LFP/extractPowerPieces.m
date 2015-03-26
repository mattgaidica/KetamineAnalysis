% Chestek Lab
% Matt Gaidica, mgaidica@med.umich.edu
% 20150118

% chList = [1:16 65:80];
function powerPieces=extractPowerPieces(file,chList,pieceLengthSeconds)
NSx = openNSx(file,'read');

decimateFactor = 10;
thresh = 5e3; %this seems appropriate for all files
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
    pieces{i} = findCleanSpans(decimate(double(NSx.Data(chList(i),:)),decimateFactor),thresh,L);
    disp(i)
end

% from those spans, perform FFT and get spectrum
% powerPieces = cell(channel, Nxf Spectrum (0-500Hz?) for each
% piece, 1xN f (spectrum frequency linspace vector
powerPieces = {};
fLpCutoff = 100;
for i=1:length(chList)
    pieceSpectrums = [];
    chData = decimate(double(NSx.Data(chList(i),:)),decimateFactor);
    for j=1:length(pieces{i})
        disp([num2str(i),':',num2str(j)]);
        curPiece = pieces{i};
        Y = fft(double(chData(curPiece(j,1):curPiece(j,2))),NFFT)/L;
        A = 2*abs(Y(1:NFFT/2+1));
        pieceSpectrums(j,:) = A(f<=fLpCutoff); % up to 1000 Hz
    end
    powerPieces(i,:) = {chList(i),pieceSpectrums,f(f<=fLpCutoff)};
end
clear('chData');
clear('NSx');
