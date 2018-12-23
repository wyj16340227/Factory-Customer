function [ flag ] = charge( result, cap, cusCap )
% charge the result is valid or not
flag = true;
% get size
[m, ~] = size(result);
tempCap = cap;
% decrease capility one by one
for i = 1: m
    tempCap(result(i, 1), 1) = tempCap(result(i, 1), 1) - cusCap(i, 1);
    % if capility < 0, the solution is invalid
    if tempCap(result(i, 1), 1) < 0
        flag = false;
        break;
    end
end
end

