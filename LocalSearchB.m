function [ result ] = LocalSearchB( funcNum, cusNum, cap, openCost, cusCap, cusCost )
% seaarch the best result through local search
% find the current best sollution (the least cost of customer)

% initial result
result = zeros(cusNum, 1);

% initial the customer
tempCap = cap;
tempCus = cusCost;
currentFunc = 1;
currentCus = 0;
while 1
    % if all of customer has been arranged
    if currentCus == cusNum
        break;
    end
    % find the most adaptor customer
    x = find(tempCus(:, currentFunc) == min(tempCus(:, currentFunc)));
    x = x(1, 1);
    % if function has capility, arrange customer
    if tempCap(currentFunc, 1) - cusCap(x, 1) > 0
        tempCap(currentFunc, 1) = tempCap(currentFunc, 1) - cusCap(x, 1);
        result(x, 1) = currentFunc;
        tempCus(x, :) = 10000;
        currentCus = currentCus + 1;
        continue;
    end
    % if current function conn't aaccept customer, open a new function
    tempCus(:, currentFunc) = 10000;
    currentFunc = currentFunc + 1;
end

end

