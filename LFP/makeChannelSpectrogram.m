function [ts,f,S1s]=makeChannelSpectrogram(dataDirs,ch)
decimateFactor = 10;
movingwin=[0.5 0.05];
params.fpass = [0 80];
params.tapers = [5 9];
params.Fs = 30000/decimateFactor;
hicutoff = 500;

fileList = {};
fileCount = 0;
for ii=1:length(dataDirs)
    dirCellList = dir(fullfile(dataDirs{ii},'*.ns5'));
    for j=1:length(dirCellList)
        fileCount = fileCount + 1;
        fileList{fileCount} = fullfile(dataDirs{ii},dirCellList(j).name);
    end
end

S1s = [];
ts = [];
for ii=1:fileCount
    disp(fileList{ii});
    NSx = openNSx(fileList{ii},'read');
    NSx = NSx.Data(ch,:);
    NSx = decimate(double(NSx),decimateFactor);
    NSx = eegfilt(NSx,params.Fs,[],hicutoff);
    [S1,t,f] = mtspecgramc(NSx,movingwin,params);
    if ii==1
        S1s = S1;
        ts = t;
    else
        S1s = [S1s;S1];
        ts = [ts,t+max(ts)];
    end
end

% figure('position',[100 100 800 500]);
% imagesc(ts,f,S1s);
% caxis auto
% axis xy;
% colormap(jet);
% colorbar;
% title('power');
% 
% figure('position',[100 100 800 500]);
% imagesc(ts,f,log(S1s));
% caxis auto
% axis xy;
% colormap(jet);
% colorbar;
% title('log power');