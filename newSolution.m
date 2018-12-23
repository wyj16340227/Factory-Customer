function [ result ] = newSolution( source, cap, cusCap, cusCost )
% create a new solution

[funcNum, ~] = size(cap);
[cusNum, ~] = size(cusCap);
result = source;
% create a random interger to decide the new way
way = randperm(3, 1);
% first way: change a customer(random) function
if way == 1
	changeCus = randperm(cusNum, 1);
	changeFunc = randperm(funcNum, 1);
	result(changeCus, 1) = changeFunc;
% second way: change random customers(random) function
else if way == 2
	changeNum = randperm(cusNum, 1);
	for i = 1: changeNum
		changeCus = randperm(cusNum, 1);
		changeFunc = randperm(funcNum, 1);
		result(changeCus, 1) = changeFunc;
	end
% three way: sort a random sequance
else
	i = randperm(cusNum, 2);
    i = sort(i);
    tempList = result(i(1) : i(2), 1);
    if i(1) == 1
        result = [sort(tempList); result(i(2) + 1: cusNum)];
    else
        result = [result(1: i(1) - 1); sort(tempList); result(i(2) + 1 : cusNum)];
    end
end
% if result is invalid, adjust it to valid
if charge( result, cap, cusCap ) == 0
	result = adjust( result, cap, cusCap, cusCost );
end
end