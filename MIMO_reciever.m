carrierFreq = 440;
samplerate = 48000;
recObj = audiorecorder(samplerate,8,2);
disp('Start speaking.')
recordblocking(recObj, 15);
disp('End of Recording.');
raw = getaudiodata(recObj);

