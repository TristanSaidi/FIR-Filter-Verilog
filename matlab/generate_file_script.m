inputsA = fopen('xvalues.txt','w');
inputsB = fopen('bvalues.txt','w');
output = fopen('output.results','w');

%random values between zero and 8
x = 16*rand(10240,1)-8;
b = 16*rand(10240,1)-8';

fprintf(inputsA, '%d ', x);
fprintf(inputsB, '%d ', b);

%convolved signal
y = filter_function(x,b);

fprintf(output, '%d ',y);

figure
hold on
plot(y)
plot(x)
plot(b)