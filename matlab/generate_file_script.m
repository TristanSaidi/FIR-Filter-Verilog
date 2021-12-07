coefficients = fopen('../qsim_rtl/fir_filter/reports/coefficients.rpt','r');
inputs = fopen('../qsim_rtl/fir_filter/reports/inputs.rpt','r');
outputs = fopen('../qsim_rtl/fir_filter/reports/outputs.rpt','r');


b = fscanf(coefficients,'%d');
x = fscanf(inputs,'%d');
tb_out = fscanf(outputs,'%d');

%convolved signal
y = filter_function(x,b);


tb_bin_out = dec2bin(tb_out); %truncated binary from tb
out = dec2bin(y);
y_bin_out = out(:,26:41); %truncated binary from matlab


out = binary2decimal(y_bin_out);


exact_expected_value = y/(2^33); %exact value
truncated_expected_value = out/(2^10); %expected decimal w/ truncation
tb_out_value = tb_out/(2^10);  %observed decimal w/ truncation

error_count = 0;
for i=1:length(tb_out)-2
    if(outdec(i) ~= tb_out(i+2))
        error_count = error_count+1;
    end
end
disp("Error count: "+error_count);