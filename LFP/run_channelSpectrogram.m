dataDirs = {
'/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Lex/2015-09-15/Morning',...
'/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Lex/2015-09-15/Afternoon'
};

avgS1s = [];
for ii=1:5%length(ch0915S1)
    [ts,f,S1s]=makeChannelSpectrogram(dataDirs,ch0915S1(ii)+64);
    if ii==1
        avgS1s = S1s;
    else
        avgS1s = (avgS1s+S1s)/2;
    end
end

figure('position',[100 100 800 500]);
imagesc(ts,f,avgS1s');
caxis auto
axis xy;
colormap(jet);
colorbar;
title('power');

figure('position',[100 100 800 500]);
imagesc(ts,f,log(avgS1s'));
caxis auto
axis xy;
colormap(jet);
colorbar;
title('log power');