recObj = audiorecorder(44000,8,1)
disp('Start speaking.')
recordblocking(recObj, 4);
disp('End of Recording.');
play(recObj);
y = getaudiodata(recObj);
plot(y);