function [ cost ] = estimate( result, openCost, cusCost )
% estimate the value of solution, return the cost of solution
cost = 0;
% get size
[m, ~] = size(result);
% get cost of customer
for i = 1: m
    cost = cost + cusCost(i, result(i, 1));
end

func = unique(result);
% get open function number
[openFuncNum, ~] = size(func);
% get cost of function
for i = 1: openFuncNum
    cost = cost + openCost(func(i, 1), 1);
end
end

