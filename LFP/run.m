chList = [1:16 65:80]; %1209
% chList = [1:128]; %0515

% dataDirs = {
% '/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Green Goblin/2015-05-15/Morning Neural',...
% '/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Green Goblin/2015-05-15/Afternoon Neural'
% };

dataDirs = {
'/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-12-09/Morning',...
'/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-12-09/Afternoon'
};
allPowerPieces_20141209=makeAllPowerPieces(dataDirs,chList);

% dataDirs = {
% '/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-12-09/Morning',...
% '/Users/mattgaidica/Documents/Data/ChestekLab/Data/Raw/Spider Man/2014-12-09/Afternoon'
% };
% allPowerPieces_1209=makeAllPowerPieces(dataDirs,chList);