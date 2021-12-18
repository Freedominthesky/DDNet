clear; clc; close all;
for ii = 0:19
    x = dlmread(['output_',num2str(ii),'.txt']);
    qpath = quantizer('fixed','round','saturate',[16,14]);
    fix_x = quantize(qpath,x);
    dlmwrite(['output_',num2str(ii),'_q14.txt'],fix_x, 'newline', 'pc','delimiter','\n');
end