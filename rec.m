[cor,lag] = xcorr(raw(:,1),testSound);
[Cor1, Index1] = max(cor);
Fs = 44000
lagNum = lag(Index1) +Fs; 
trim =raw(lagNum:384000, :)
H = h;
[U, S, V] =svd(H);
signal = U'*trim';
y1 = demodulate2(signal(1,:).', carrierFreq, samplerate);
y2 = demodulate2(signal(2,:).', carrierFreq, samplerate);