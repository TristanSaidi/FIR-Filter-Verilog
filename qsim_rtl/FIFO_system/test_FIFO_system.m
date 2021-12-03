inputs = fopen('./reports/output.txt','r+');
outputA0 = fopen('./reports/outputA0.txt','r');
outputA1 = fopen('./reports/outputA1.txt','r');
outputA2 = fopen('./reports/outputA2.txt','r');
outputA3 = fopen('./reports/outputA3.txt','r');
outputA4 = fopen('./reports/outputA4.txt','r');
outputA5 = fopen('./reports/outputA5.txt','r');
outputA6 = fopen('./reports/outputA6.txt','r');
outputA7 = fopen('./reports/outputA7.txt','r');
matlab0 = fopen('./reports/matlab0.txt','w');
matlab1 = fopen('./reports/matlab1.txt','w');
matlab2 = fopen('./reports/matlab2.txt','w');
matlab3 = fopen('./reports/matlab3.txt','w');
matlab4 = fopen('./reports/matlab4.txt','w');
matlab5 = fopen('./reports/matlab5.txt','w');
matlab6 = fopen('./reports/matlab6.txt','w');
matlab7 = fopen('./reports/matlab7.txt','w'); 

FIFO = zeros(64,16);
a = fscanf(inputs,'%d');
a0 = fscanf(outputA0,'%d');
a1 = fscanf(outputA1,'%d');
a2 = fscanf(outputA2,'%d');
a3 = fscanf(outputA3,'%d');
a4 = fscanf(outputA4,'%d');
a5 = fscanf(outputA5,'%d');
a6 = fscanf(outputA6,'%d');
a7 = fscanf(outputA7,'%d');
w = zeros(1,16);
error_count = 0;
for i = 1:127
    w = str2double(num2cell(dec2bin(a(i),16)));
    for j = 63:-1:1
       for k = 1:16
           FIFO(j+1,k) = FIFO(j,k);
       end
    end
    for k = 1:16
        FIFO(1, k) = w(k);
    end
    for l = 0:15
        index = i*(16)+l-15;
        A0 = bin2dec(num2str(flip(transpose(FIFO(1:8,16-l)))));
        fprintf(matlab0, '%d\n', A0);
        if(index > 0)
            if (A0 ~= a0(index))
                error_count = error_count+1;
            end
            A1 = bin2dec(num2str(flip(transpose(FIFO(9:16,16-l)))));
            fprintf(matlab1, '%d\n', A1);
            if (A1 ~= a1(index))
                error_count = error_count+1;
            end
            A2 = bin2dec(num2str(flip(transpose(FIFO(17:24,16-l)))));
            fprintf(matlab2, '%d\n', A2);
            if (A2 ~= a2(index))
                error_count = error_count+1;
            end
            A3 = bin2dec(num2str(flip(transpose(FIFO(25:32,16-l)))));
            fprintf(matlab3, '%d\n', A3);
            if (A3 ~= a3(index))
                error_count = error_count+1;
            end
            A4 = bin2dec(num2str(flip(transpose(FIFO(33:40,16-l)))));
            fprintf(matlab4, '%d\n', A4);
            if (A4 ~= a4(index))
                error_count = error_count+1;
            end
            A5 = bin2dec(num2str(flip(transpose(FIFO(41:48,16-l)))));
            fprintf(matlab5, '%d\n', A5);
            if (A5 ~= a5(index))
                error_count = error_count+1;
            end
            A6 = bin2dec(num2str(flip(transpose(FIFO(49:56,16-l)))));
            fprintf(matlab6, '%d\n', A6);
            if (A6 ~= a6(index))
                error_count = error_count+1;
            end
            A7 = bin2dec(num2str(flip(transpose(FIFO(57:64,16-l)))));
            fprintf(matlab7, '%d\n', A7);
            if (A7 ~= a7(index))
                error_count = error_count+1;
            end
        end
    end
end
disp("Errors: "+error_count);

