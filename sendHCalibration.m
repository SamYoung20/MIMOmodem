[padding,] = makeCarrier(440,48000,.2);
[carrier,carrierComplex] = makeCarrier(440,48000,1);
load noise.mat
tone = [testSound];
z    = zeros(1, length(tone));
delay = zeros(1,48000/2);
totalTest = [z delay tone; tone delay z];
sound(totalTest,48000);