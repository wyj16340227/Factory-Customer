fid = fopen('SA.txt', 'a');
fprintf(fid, '     %-150s%-10s\r\n', 'Results', 'Time(s)');
fclose(fid);
for i = 1: 71
    if i == 67
        continue;
    end
    SimulatedAnnealing( ['C:\Users\wjy\Desktop\À„∑®…Ëº∆\Instances\p', int2str(i)], ['p', int2str(i)] );
end