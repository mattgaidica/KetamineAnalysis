chList = [1:16 65:80];

dataDirs = {
'/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-11-25/Morning',...
'/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-11-25/Afternoon'
};
allPowerPieces_1125=makeAllPowerPieces(dataDirs,chList);

dataDirs = {
'/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-12-09/Morning',...
'/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-12-09/Afternoon'
};
allPowerPieces_1209=makeAllPowerPieces(dataDirs,chList);