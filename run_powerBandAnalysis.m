% [ ] how to correct for power changes? Like in 9-26
%---

% gather all files
dataDirs = {
    'C:\Users\Matt\Desktop\svn_repository\Students\MattGaidica\Data\Raw\Spider Man\2014-09-16\20140916-144027-FMA_ketamine'
    };

fileList = {};
fileCount = 1;
for i=1:length(dataDirs)
    dirCellList = dir(fullfile(dataDirs{i},'*.ns5'));
    for j=1:length(dirCellList)
        fileList{fileCount} = fullfile(dataDirs{i},dirCellList(j).name);
        fileCount = fileCount + 1;
    end
end

% get power pieces for each file
allPowerPieces = [];
chList = [1:16 65:80];
chList = [1:32];
for i=3%1:fileCount
    %extract 5s peices
    powerPieces = extractPowerPieces(fileList{i},chList,5);
    allPowerPieces{i} = {fileList{i},powerPieces};
end