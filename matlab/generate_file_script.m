coefficients = fopen('../qsim_rtl/fir_filter/reports/coefficients.rpt','r');
inputs = fopen('../qsim_rtl/fir_filter/reports/inputs.rpt','r');
outputs = fopen('../qsim_rtl/fir_filter/reports/outputs.rpt','r');


b = fscanf(coefficients,'%d');
x = fscanf(inputs,'%d');
tb_out = fscanf(outputs,'%d');

%convolved signal
y = filter_function(x,b);

figure
hold on
plot(y)
plot(x)
plot(b)

error_count = 0;
for i=1:length(tb_out)-1
    if(y(i) ~= tb_out(i+1))
        error_count = error_count+1;
    end
end
disp("Error count: "+error_count);