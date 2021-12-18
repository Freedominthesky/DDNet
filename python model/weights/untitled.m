clear; clc; close all;
for ii = 0:19
    x = dlmread('input_',num2str(i),'.txt');
    qpath = quantizer('fixed','round','saturate',[16,14]);
    fix_x = quantize(qpath,x);
    dlmwrite(['input_',num2str(i),'_q14.txt'],fix_x, 'newline', 'pc','delimiter','\n');
end