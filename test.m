symbols = [1 -1 1 -1 1 1 -1 -1 -1 -1 -1 1 1 -1 1];
symbolRate = 10;
sampleRate = 44000;
carrierFreq = 440;

samplesPerSymbol = sampleRate/symbolRate;

deltaT = length(symbols)/symbolRate;

output = modulate(symbols, symbolRate, carrierFreq, sampleRate);

%pause(0.3);
%sound(output, sampleRate)

received = demodulate(output, carrierFreq, sampleRate);

nSamples = length(received);

t = linspace(0, deltaT, nSamples);

rectified = received./abs(received);

%plot(received)

stem(t, rectified)
samplingTimes = (0:length(symbols)-1)/symbolRate+1/(2*symbolRate);
samplingSamples = floor(samplingTimes*sampleRate);
xticks(samplingTimes)
figure
stem(received(samplingSamples))
