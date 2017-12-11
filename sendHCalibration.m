[padding,] = makeCarrier(440,48000,.2);
[carrier,carrierComplex] = makeCarrier(440,48000,1);
load noise.mat
tone = testSound;
z    = zeros(1, length(tone));
delay = zeros(1,48000/2);
totalTest = [tone delay z; z delay tone];
soundsc(totalTest,48000);
%plot(real(fftshift(fft(tone))))