function [  ] = WriteInFile( funcNum, fileName, time, result, cost, instance )
% write result in file

% construct bitmap of function open status
funcbm = zeros(funcNum, 1);
[cusNum, ~] = size(result);
for i = 1: cusNum
    funcbm(result(i, 1), 1) = 1;
end
% open file
fid = fopen(fileName, 'a');     %不存在则创建，在文件尾写入
fprintf(fid, '%-4s%-150d%-10f\r\n', instance, cost, time);
% write function bitmap
fprintf(fid, '     ');
for i = 1: funcNum
    fprintf(fid, '%d ', funcbm(i, 1));
end
fprintf(fid, '\r\n');
% write customer arrange situation
fprintf(fid, '     ');
for i = 1: cusNum
    fprintf(fid, '%d ', result(i, 1));
end
fprintf(fid, '\r\n');
% close file
fclose(fid);

end

