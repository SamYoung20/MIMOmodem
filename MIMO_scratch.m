%%----Prep----%%

% lock speaker 1 with microphone 1 and use phase offsets for all the
%send a known pulse of white noise from speaker one and recieve it at speaker 2. 
% speaker mic combos
%known signal, noise
% cross correlate each line
freq = 440;
Fs = 48000; % sample rate in Hz
period = 1/ freq; % time
%%%Step 1: Line 11 Correlation
line11 = micOne(:,1);
knownSig = testSound;
[h11acor,lag11] = xcorr(line11,knownSig);
[~,I] = max(abs(h11acor));
lagDiffh11 = lag11(I);
timeDiffh11 = lagDiffh11/Fs;
phaseShift11 = 2*pi* ((mod(timeDiffh11, period))/period);
plot(lag11,h11acor)
corrh11 = max(abs(h11acor))/(48000^2)
h11 = corrh11+i*phaseShift11;

%%%Step 2 : Line 12 Correlation
[h12acor,lag12] = xcorr(line12, line11);
[~,I] = max(abs(h12acor));
lagDiffh12 = lag12(I);
timeDiff12 = lagDiffh12/Fs;
phaseShift12 = 2*pi*(mod(timeDiff12,period)/period);
corrh12 = max(abs(h12acor));
h12 = corh12+i*phaseShift12;

%%%Step 3: Line 21 Correlation
[h21acor,lag21] = xcorr(line21, line11);
[~,I] = max(abs(h21acor));
lagDiffh21 = lag21(I);
timeDiff21 = lagDiffh21/Fs;
phaseShift21 = 2*pi*(mod(timeDiff21,period)/period);
corrh21 = max(abs(h21acor));
h21 = corh21+i*phaseShift21;

%%%Step 4: Line 22 Correlation
[h22acor,lag22] = xcorr(line22, line11);
[~,I] = max(abs(h22acor));
lagDiffh22 = lag22(I)
timeDiff22 = lagDiffh22/Fs
phaseShift22 = 2*pi*(mod(timeDiff22,period)/period);
corrh22 = max(abs(h22acor))
h22 = corh22+i*phaseShift22;

H = [h11 h12; h21 h22];