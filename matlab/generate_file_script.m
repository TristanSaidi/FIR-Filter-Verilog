coefficients = fopen('../qsim_rtl/fir_filter/reports/coefficients.rpt','r');
inputs = fopen('../qsim_rtl/fir_filter/reports/inputs.rpt','r');

b = fscanf(coefficients,'%d');
x = fscanf(inputs,'%d');

%convolved signal
y = filter_function(x,b);

figure
hold on
plot(y)
plot(x)
plot(b)