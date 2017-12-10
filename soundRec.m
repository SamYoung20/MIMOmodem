recObj = audiorecorder(48000,8,2)
disp('Start speaking.')
recordblocking(recObj, 6);
disp('End of Recording.');
play(recObj);
y = getaudiodata(recObj);
plot(y(:,1));
hold on
plot(y(:,2));