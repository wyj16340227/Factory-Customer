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
minT = 1 / T;               %��ֹ�¶�
wrongRes = 0;               %��¼�����������
iterateNum = 0;             %��¼��������
solution = start;           %��ʼ����ʼ��
generateNum = cusNum * funcNum ^ 2;

%��ѭ��
%���¶��㹻�߲��Ҳ��������������ⲻ����ͼ�������
while T > minT && wrongRes < generateNum
    %��ѭ��
    for i = 1 : cusNum * funcNum
        %�����½�
        newSolu = newSolution( solution, cap, cusCap, cusCost );
        deltaE = estimate( solution, openCost, cusCost ) - estimate( newSolu, openCost, cusCost );
        %�½�ܺã�����ʹ�ã�����һ����������
        if deltaE > 0
            solution = newSolu;
            wrongRes = 0;
        else 
            %������ڽ��ܸ��ʣ���Ҫ������������ʧ�ܽ���������������
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
    %���²���¼��������
    T = T * dropSpeed;
    iterateNum = iterateNum + 1;
%     fprintf('iterateNum: %d, solution: %f\n', iterateNum, estimate( solution, openCost, cusCost ));
end
cost = estimate( solution, openCost, cusCost );
end

