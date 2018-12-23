function [  ] = LSB( fileName, instance )
% local search B file
tic
[ funcNum, cusNum, cap, openCost, cusCap, cusCost ] = GetData(fileName);
[ result ] = LocalSearchB( funcNum, cusNum, cap, openCost, cusCap, cusCost );
time = toc;
cost = estimate( result, openCost, cusCost );
WriteInFile( funcNum, 'LSB.txt', time, result, cost, instance );
end

