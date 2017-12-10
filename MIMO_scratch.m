%%----Prep----%%
load noise.mat
load micTestDataNoise.mat
% lock speaker 1 with microphone 1 and use phase offsets for all the
%send a known pulse of white noise from speaker one and recieve it at speaker 2. 
% speaker mic combos
%known signal, noise
% cross correlate each line
freq = 440;
Fs = 48000; % sample rate in Hz
period = 1/ freq; % time
deltaT = .5; %time between signals
signalLen = 1; %time of the noise signal

%%%Step 1: Line 11 Correlation
fullMic1 = micTwo(:,2);
fullMic2 = micTwo(:,1);

findH(fullMic1,fullMic2,testSound,Fs,deltaT,freq)

% cutoff1 = 9e4;
% cutoff2 = 1.6e5;
% 
% %find 11 and 12
% [mic1Cor,mic1Lag]
% 
% 
% padding = zeros(1,length(line11)-length(testSound));
% knownSig = [testSound padding];
% 
% [h11acor,lag11] = xcorr(line11,knownSig,'coeff');
% [corrh11,I] = max(abs(h11acor));
% lagDiffh11 = lag11(I);
% timeDiffh11 = lagDiffh11/Fs;
% phaseShift11 = 2*pi*((mod(timeDiffh11, period))/period);
% h11 = corrh11;
% 
% %%%Step 2 : Line 12 Correlation
% [h12acor,lag12] = xcorr(line12, knownSig,'coeff');
% [corrh12,I] = max(abs(h12acor));
% lagDiffh12 = lag12(I);
% timeDiff12 = lagDiffh12/Fs-timeDiffh11;
% phaseShift12 = 2*pi*(mod(timeDiff12,period)/period);
% h12 = corrh12*exp(i*phaseShift12);
% 
% %%%Step 3: Line 21 Correlation
% [h21acor,lag21] = xcorr(line21, knownSig,'coeff');
% [corrh21,I] = max(abs(h21acor));
% lagDiffh21 = lag21(I);
% timeDiff21 = lagDiffh21/Fs - timeDiffh11 - deltaT;
% phaseShift21 = 2*pi*(mod(timeDiff21,period)/period);
% h21 = corrh21*exp(i*phaseShift21);
% 
% %%%Step 4: Line 22 Correlation
% [h22acor,lag22] = xcorr(line22, knownSig,'coeff');
% [corrh22,I] = max(abs(h22acor));
% lagDiffh22 = lag22(I);
% timeDiff22 = lagDiffh22/Fs - timeDiffh11 - deltaT;
% phaseShift22 = 2*pi*(mod(timeDiff22,period)/period);
% h22 = corrh22*exp(i*(phaseShift22-phaseShift11));
% 
% H = [h11 h12; h21 h22]