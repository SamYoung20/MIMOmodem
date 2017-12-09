%symbols = encode('!');
symbols = [1 -1 1 -1 1 -1 1 -1 1];
symbolRate = 10;
sampleRate = 44000;
carrierFreq = 440;

samplesPerSymbol = sampleRate/symbolRate;

deltaT = length(symbols)/symbolRate;

output = modulate(symbols, symbolRate, carrierFreq, sampleRate,'rcos');
padding = modulate(1,1,200,44000,'square');
tone = [padding output];

pause(1)
soundsc(tone, sampleRate)

received = demodulate(output, carrierFreq, sampleRate);

nSamples = length(received);

t = linspace(0, deltaT, nSamples);

rectified = received./abs(received);