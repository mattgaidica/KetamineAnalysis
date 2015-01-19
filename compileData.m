% nsxRgane = [1:16,65:80]; %for 11/25
% nsxRgane = [1:32]; %for 9/16

% I would rather not compile data, the sets get too large
function data=compileData(dataDir,nsxRange)
    files = dir(fullfile(dataDir,'*.ns5'));
    for i=1:length(files)
        NSx = openNSx(fullfile(dataDir,files(i).name),'read');
        data = horzcat(data,NSx.Data(nsxRange,:));
        clear('NSx');
    end
end