function [  ] = SimulatedAnnealing( fileName, instance )
% simulated annealing file

[ funcNum, cusNum, cap, openCost, cusCap, cusCost ] = GetData(fileName);
% create a random solution
solution = randi(funcNum, cusNum, 1);
solution = adjust( solution, cap, cusCap, cusCost );
% caculate time and run SA algorithm
[ result ] = LocalSearchA( funcNum, cusNum, cap, openCost, cusCap, cusCost );
tic
[ iterateNum, solution, cost ] = SA ( cap, openCost, cusCap, cusCost, result, 0.999 );
% [ iterateNum, solution, cost ] = SA ( cap, openCost, cusCap, cusCost, solution, 0.999 );
time = toc;
WriteInFile( funcNum, 'SA-LS.txt', time, solution, cost, instance );
end

