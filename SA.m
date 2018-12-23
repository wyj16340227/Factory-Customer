function [ iterateNum, solution, cost ] = SA ( cap, openCost, cusCap, cusCost, start, dropSpeed )
% use simulated annealing algorithm compute the solution of Func-Cus problem

[cusNum, funcNum] = size(cusCost);
T = 0;
sampleNum = floor(cusNum / 10) + 1;
for i = 1: sampleNum
    tempSolu = randi(funcNum, cusNum, 1);
    tempSolu = adjust( tempSolu, cap, cusCap, cusCost );
    T = T + estimate( tempSolu, openCost, cusCost );
end
T = T / sampleNum;
T = T ^ 2;
minT = 1 / T;               %终止温度
wrongRes = 0;               %记录废弃解的数量
iterateNum = 0;             %记录迭代次数
solution = start;           %初始化初始解
generateNum = cusNum * funcNum ^ 2;

%外循环
%当温度足够高并且产生的连续废弃解不够多就继续迭代
while T > minT && wrongRes < generateNum
    %内循环
    for i = 1 : cusNum * funcNum
        %生成新解
        newSolu = newSolution( solution, cap, cusCap, cusCost );
        deltaE = estimate( solution, openCost, cusCost ) - estimate( newSolu, openCost, cusCost );
        %新解很好，可以使用，否则一定概率抛弃
        if deltaE > 0
            solution = newSolu;
            wrongRes = 0;
        else 
            %如果低于接受概率，需要抛弃，并增加失败解的数量；否则接受
            randomRate = unifrnd (0,1,1);
            acceptRate = exp(-deltaE / T);
            if randomRate > acceptRate
               solution = newSolu;
               wrongRes = 0;
            else
               wrongRes = wrongRes + 1;
            end
        end
    end
    %降温并记录迭代次数
    T = T * dropSpeed;
    iterateNum = iterateNum + 1;
%     fprintf('iterateNum: %d, solution: %f\n', iterateNum, estimate( solution, openCost, cusCost ));
end
cost = estimate( solution, openCost, cusCost );
end

