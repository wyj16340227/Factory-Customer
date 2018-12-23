function [  ] = LSA( fileName, instance )
% local search B file
tic
[ funcNum, cusNum, cap, openCost, cusCap, cusCost ] = GetData(fileName);
[ result ] = LocalSearchA( funcNum, cusNum, cap, openCost, cusCap, cusCost );
time = toc;
cost = estimate( result, openCost, cusCost );
WriteInFile( funcNum, 'LSA.txt', time, result, cost, instance );
end