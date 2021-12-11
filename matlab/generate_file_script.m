coefficients = fopen('../qsim_rtl/fir_filter/reports/coefficients.rpt','r');
inputs = fopen('../qsim_rtl/fir_filter/reports/inputs.rpt','r');
outputs = fopen('../qsim_rtl/fir_filter/reports/outputs.rpt','r');


b = fscanf(coefficients,'%d');
x = fscanf(inputs,'%d');
tb_out = fscanf(outputs,'%d');

%convolved signal
y = filter_function(x,b);

x_conv = x/(2^15);
b_conv = b/(2^15);
y_conv = filter_function(x_conv,b_conv);

tb_bin_out = dec2bin(tb_out); %truncated binary from tb
out = dec2bin(y);
y_bin_out = out(:,27:42); %truncated binary from matlab


out = binary2decimal(y_bin_out);


exact_expected_value = y/(2^31); %exact value
truncated_expected_value = out/(2^8); %expected decimal w/ truncation
tb_out_value = tb_out/(2^8);  %observed decimal w/ truncation

sum = 0;
error_count = 0;
for i=1:length(tb_out_value)-2
    sum = sum + (tb_out_value(i) - exact_expected_value(i))^2;
    if(truncated_expected_value(i) ~= tb_out_value(i+2))
        error_count = error_count+1;
    end
end

RMSE = sqrt(sum/(length(tb_out_value)-2));
NRMSE = RMSE/(max(tb_out_value)-min(tb_out_value));
disp("Iterations: " + (length(tb_out_value)));
disp("RMSE: "+RMSE);
disp("NRMSE: "+NRMSE);