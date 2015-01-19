% [ ] how to correct for power changes? Like in 9-26
%---

% gather all files
dataDirs = [
    '',...
    ''
    ];

fileList = [];
fileCount = 1;
for i=1:length(dataDirs)
    dirList = dirs(fullfile(dataDirs,'*.ns5'));
    for j=1:length(dirList)
        fileList(fileCount) = fullfile(dataDirs(i),dirList(j).name);
        fileCount = fileCount + 1;
    end
end

% get power pieces for each file
allPowerPieces = [];
chList = [1:16 65:80];
for i=1:fileCount
    %extract 5s peices
    powerPieces = extractPowerPieces(fileList(i),chList,5);
    allPowerPieces{i} = {fileList(i),powerPieces};
end