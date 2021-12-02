inputs = fopen('./reports/output.txt','r+');
outputA0 = fopen('./reports/outputA0.txt','w');
outputA1 = fopen('./reports/outputA1.txt','w');
outputA2 = fopen('./reports/outputA2.txt','w');
outputA3 = fopen('./reports/outputA3.txt','w');
outputA4 = fopen('./reports/outputA4.txt','w');
outputA5 = fopen('./reports/outputA5.txt','w');
outputA6 = fopen('./reports/outputA6.txt','w');
outputA7 = fopen('./reports/outputA7.txt','w');

FIFO = zeros(64,16);
a = fscanf(inputs,'%d');
w = zeros(1,16);
for i = 1:128
    w = str2double(num2cell(dec2bin(a(i),16)));
    for j = 63:-1:1
       for k = 1:16
           FIFO(j+1,k) = FIFO(j,k);
       end
    end
    for k = 1:16
        FIFO(1, k) = w(k);
    end
    for l = 16:-1:1
        A0 = bin2dec(num2str(flip(transpose(FIFO(1:8,l)))));
        fprintf(outputA0, '%d\n', A0);
        A1 = bin2dec(num2str(flip(transpose(FIFO(9:16,l)))));
        fprintf(outputA1, '%d\n', A1);
        A2 = bin2dec(num2str(flip(transpose(FIFO(17:24,l)))));
        fprintf(outputA2, '%d\n', A2);
        A3 = bin2dec(num2str(flip(transpose(FIFO(25:32,l)))));
        fprintf(outputA3, '%d\n', A3);
        A4 = bin2dec(num2str(flip(transpose(FIFO(33:40,l)))));
        fprintf(outputA4, '%d\n', A4);
        A5 = bin2dec(num2str(flip(transpose(FIFO(41:48,l)))));
        fprintf(outputA5, '%d\n', A5);
        A6 = bin2dec(num2str(flip(transpose(FIFO(49:56,l)))));
        fprintf(outputA6, '%d\n', A6);
        A7 = bin2dec(num2str(flip(transpose(FIFO(57:64,l)))));
        fprintf(outputA7, '%d\n', A7);
    end
end

