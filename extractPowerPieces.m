% Chestek Lab
% Matt Gaidica, mgaidica@med.umich.edu
% 20150118

% chList = [1:16 65:80];
function powerPieces=extractPowerPieces(file,chList,pieceLengthSeconds)
    data = openNSx(file,'read');

    thresh = 1e6;
    Fs = 3e4;
    T = 1/Fs; % Sample time
    pieceLength = Fs*pieceLengthSeconds;
    t = (0:L-1)*T; % Time vector
    NFFT = 2^nextpow2(pieceLength); % Next power of 2 from length of y
    f = Fs/2*linspace(0,1,NFFT/2+1);
    
    % extract all spans that are below thresh, aka. no motion
    % artifacts!
    pieces = [];
    for i=1:length(chList)
        pieces(i,:,:) = findCleanSpans(data(chList(i),thresh,pieceLength));
    end
    
    % from those spans, perform FFT and get spectrum
    % powerPieces = cell(channel, Nxf Spectrum (0-500Hz?) for each
    % piece, 1xN f (spectrum frequency linspace vector
    powerPieces = {};
    for i=1:length(chList)
        pieceSpectrums = [];
        for j=1:length(pieces) %!!! is length correct? or need size()?
            Y = fft(double(data(pieces(i,j,1):pieces(i,j,2))),NFFT)/L;
            A = 2*abs(Y(1:NFFT/2+1));
            pieceSpectrums(j,:) = A(f<=1000); % up to 1000 Hz
        end
        powerPieces(i,:) = {i,pieceSpectrums,f};
    end
end