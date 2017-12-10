[padding,] = makeCarrier(440,48000,.2);
[carrier,carrierComplex] = makeCarrier(440,48000,1);
noise = rand(1,length(carrier))*2-1;
testSound = carrier.*noise;

windowSize = 5000;
b = (1/windowSize)*ones(1,windowSize);
a = 1;

plot(filter(b,a,testSound));
tone = [padding testSound padding];
z    = zeros(1, length(tone));
totalTest = [z; tone];
size(totalTest);
sound(totalTest,48000);