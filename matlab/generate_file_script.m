coefficients = fopen('../qsim_rtl/fir_filter/reports/coefficients.rpt','r');
inputs = fopen('../qsim_rtl/fir_filter/reports/inputs.rpt','r');
outputs = fopen('../qsim_rtl/fir_filter/reports/outputs.rpt','r');


b = fscanf(coefficients,'%d');
x = fscanf(inputs,'%d');
tb_out = fscanf(outputs,'%d');

%convolved signal
y = filter_function(x,b);
out = dec2bin(y);
out = out(:,26:41);
tb_out = dec2bin(tb_out);


error_count = 0;
for i=1:length(tb_out)-2
    if(out(i) ~= tb_out(i+2))
        error_count = error_count+1;
    end
end
disp("Error count: "+error_count);