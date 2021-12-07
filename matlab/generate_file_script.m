coefficients = fopen('../qsim_rtl/fir_filter/reports/coefficients.rpt','r');
inputs = fopen('../qsim_rtl/fir_filter/reports/inputs.rpt','r');
outputs = fopen('../qsim_rtl/fir_filter/reports/outputs.rpt','r');


b = int64(fscanf(coefficients,'%i'));
x = int64(fscanf(inputs,'%i'));
tb_out = fscanf(outputs,'%i');

%convolved signal
y = int64(filter_function(x,b));

x_conv = x/(2^16);
b_conv = b/(2^16);
y_conv = filter_function(x_conv,b_conv);

tb_bin_out = dec2bin(tb_out); %truncated binary from tb
out = dec2bin(y);
y_bin_out = out(:,26:41); %truncated binary from matlab


out = binary2decimal(y_bin_out);


exact_expected_value = y/(2^32); %exact value
truncated_expected_value = out/(2^9); %expected decimal w/ truncation
tb_out_value = tb_out/(2^9);  %observed decimal w/ truncation

sum = 0;
error_count = 0;
for i=1:length(tb_out_value)-2
    sum = sum + (tb_out_value(i) - exact_expected_value(i))^2;
    if(truncated_expected_value(i) ~= tb_out_value(i+2))
        error_count = error_count+1;
    end
end

% RMSE = sqrt(sum/(length(tb_out_value)-2));
% NRMSE = RMSE/(max(tb_out_value)-min(tb_out_value));
disp("Error count: "+error_count);