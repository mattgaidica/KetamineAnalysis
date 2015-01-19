% Chestek Lab
% Matt Gaidica, mgaidica@med.umich.edu
% 20150118

% chList = [1:16 65:80];
function powerPieces=extractPowerPieces(file,chList,pieceLengthSeconds)
    NSx = openNSx(file,'read');

    thresh = 1e4; %this seems appropriate for all files
    Fs = 3e4;
    T = 1/Fs; % Sample time
    pieceLength = Fs*pieceLengthSeconds;
    t = (0:pieceLength-1)*T; % Time vector
    NFFT = 2^nextpow2(pieceLength); % Next power of 2 from length of y
    f = Fs/2*linspace(0,1,NFFT/2+1);
    
    % extract all spans that are below thresh, aka. no motion
    % artifacts!
    pieces = {};
    for i=1:length(chList)
        pieces{i} = findCleanSpans(NSx.Data(chList(i),:),thresh,pieceLength);
        disp(i)
    end
    
    % from those spans, perform FFT and get spectrum
    % powerPieces = cell(channel, Nxf Spectrum (0-500Hz?) for each
    % piece, 1xN f (spectrum frequency linspace vector
    powerPieces = {};
    for i=1:length(chList)
        pieceSpectrums = [];
        for j=1:length(pieces) %!!! is length correct? or need size()?
            curPiece = pieces{i};
            Y = fft(double(NSx.Data(curPiece(j,1):curPiece(j,2))),NFFT)/pieceLength;
            A = 2*abs(Y(1:NFFT/2+1));
            pieceSpectrums(j,:) = A(f<=1000); % up to 1000 Hz
        end
        powerPieces(i,:) = {i,pieceSpectrums,f};
    end
end