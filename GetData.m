function [ funcNum, cusNum, cap, openCost, cusCap, cusCost ] = GetData( fileName )
% read the file and transform the data

% read file
data = textread(fileName);

% initial function number and customer number
funcNum = data(1,1);
cusNum = data(1,2);

% initial function capitial and open cost
cap = zeros(funcNum, 1);
openCost = zeros(funcNum, 1);
for i = 1: funcNum
    cap(i, 1) = data(i + 1, 1);
    openCost(i, 1) = data(i + 1, 2);
end

% initial customer capility and cost
rpc = cusNum / 10;
rpf = funcNum / 10;
% get customer capility
cusCap = data(funcNum + 2: funcNum + rpc + 1, :);
% transform and reshape
cusCap = reshape(cusCap', cusNum, 1);

% get customer cost
cusCost = zeros(cusNum, funcNum);
% get data
tempCost = data(funcNum + cusNum / 10 + 2 : funcNum + (cusNum + cusNum * funcNum) / 10 + 1, :);
%reshape
for i = 1: cusNum
    cusCost(i, :) = reshape(tempCost((i - 1) * rpf + 1: i * rpf, :)', funcNum, 1);
end

end

