function allPowerPieces=makeAllPowerPieces(dataDirs,chList)
    fileList = {};
    fileCount = 0;
    for i=1:length(dataDirs)
        dirCellList = dir(fullfile(dataDirs{i},'*.ns5'));
        for j=1:length(dirCellList)
            fileCount = fileCount + 1;
            fileList{fileCount} = fullfile(dataDirs{i},dirCellList(j).name);
        end
    end

    % get power pieces for each file
    allPowerPieces = {};
    for i=1:fileCount
        %extract 5s peices
        powerPieces = extractPowerPieces(fileList{i},chList,5);
        allPowerPieces{i} = {fileList{i},powerPieces};
    end
end