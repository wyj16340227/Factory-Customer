function [ result ] = LocalSearchA( funcNum, cusNum, cap, openCost, cusCap, cusCost )
% seaarch the best result through local search
% find the current best sollution (the least cost of customer)

% initial result
result = zeros(cusNum, 1);

% initial the customer
tempCap = cap;
tempCus = cusCost;
% arrange every customer
for i = 1: cusNum
    while 1
        % find the most adaptor function of this customer
        x = find(tempCus(i, :) == min(tempCus(i, :)));
        x = x(1, 1);
        % function has capiility, arrange; else, put this value to INF
        if tempCap(x, 1) - cusCap(i, 1) > 0
            tempCap(x, 1) = tempCap(x, 1) - cusCap(i, 1);
            result(i, 1) = x;
            break
        else
            tempCus(i, x) = 10000;
        end
    end
end

end

