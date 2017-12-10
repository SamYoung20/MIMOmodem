carrierFreq = 440;
samplerate = 48000;
recObj = audiorecorder(44000,8,2);
disp('Start speaking.')
recordblocking(recObj, 4);
disp('End of Recording.');
raw = getaudiodata(recObj);
signal = U'*raw;
y1 = demodulate2(signal(:,1), carrierFreq, samplerate);
y2 = demodulate2(signal(:,2), carrierFreq, samplerate);
