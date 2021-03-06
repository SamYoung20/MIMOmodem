%%----Prep----%%
load noise.mat
load micTestDataNoise.mat
freq = 440;
Fs = 48000; % sample rate in Hz
period = 1/ freq; % time
deltaT = .5; %time between signals
signalLen = 1; %time of the noise signal

%%%Step 1: Line 11 Correlation
fullMic1 = micTwo(:,2);
fullMic2 = micTwo(:,1);

load hMatrix2.mat
%findH(fullMic1,fullMic2,testSound,Fs,deltaT,freq)

signals = [encode('hello'); encode('world')];

z = zeros(1, length(testSound));
xcorHook = [z;testSound];

%sound = MIMO_transmit(signals,8,h,freq,Fs);
totalTone = [xcorHook*20 sound];
soundsc(totalTone, Fs);