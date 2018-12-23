function [ result ] = adjust( source, cap, cusCap, cusCost )
% adjust wrong result to correct
[funcNum, ~] = size(cap);
[cusNum, ~] = size(cusCap);
result = source;
% customer cann't be arrange
wrong = zeros(0, 1);
tempCap = cap;
% find all customer who cann't be arrange
for i = 1: cusNum
    tempCap(source(i, 1), 1) = tempCap(source(i, 1), 1) - cusCap(i, 1);
    if tempCap(source(i, 1), 1) < 0
        wrong = [wrong; i];
    end
end

tempCus = cusCost;
% function cann;t accept customer whose capility is minus
for i = 1: funcNum
    if tempCap(i, 1) < 0
        tempCus(:, i) = 10000;
    end
end
% adjust wrong customer location
tempCus = cusCost;
[wrongNum, ~] = size(wrong);
for i = 1: wrongNum
    currentCus = wrong(i, 1);
    while 1
        % find the most adaptor function of this customer
        x = find(tempCus(currentCus, :) == min(tempCus(currentCus, :)));
        x = x(1, 1);
        % function has capiility, arrange; else, put this value to INF
        if tempCap(x, 1) - cusCap(currentCus, 1) > 0
            tempCap(x, 1) = tempCap(x, 1) - cusCap(currentCus, 1);
            result(currentCus, 1) = x;
            break
        else
            tempCus(currentCus, x) = 10000;
        end
    end
end
end

