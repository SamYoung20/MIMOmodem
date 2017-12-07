%load sensorData
Fs = 44000
t1 = (0:length(sig3_1)-1)/Fs;
t2 = (0:length(sig4_1)-1)/Fs;
s1=sig3_1
s2=sig4_1

Fs = 44000;                    % sample rate in Hz
N = 500;                     % number of signal samples
rng default;
t = (0:N-1)/Fs;              % time vector

% Design a 70th order lowpass FIR filter with cutoff frequency of 75 Hz.

Fnorm = 200/(Fs/2);           % Normalized frequency
df = designfilt('highpassfir','FilterOrder',600,'CutoffFrequency',Fnorm);
s1=filter(df,s1)
s2=filter(df,s2)


subplot(2,1,1)
plot(t1,s1)
title('s_1')

subplot(2,1,2)
plot(t2,s2)
title('s_2')
xlabel('Time (s)')
[acor,lag] = xcorr(s1,s2);
[~,I] = max(abs(acor));
lagDiff = lag(I)
timeDiff = lagDiff/Fs
figure
plot(lag,acor)
a3 = gca;
a3.XTick = sort([-3000:1000:3000 lagDiff]);
s2al = s2(lagDiff+1:end);
t2al = (0:length(s2al)-1)/Fs;

subplot(2,1,1)
plot(s1)
title('s_1, aligned')
% % 
subplot(2,1,2)
plot(s2al)
title('s_2')
xlabel('samples')
