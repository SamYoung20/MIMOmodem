recObj = audiorecorder(44000,8,2)
disp('Start speaking.')
recordblocking(recObj, 4);
disp('End of Recording.');
play(recObj);
y = getaudiodata(recObj);
plot(y(:,1));
hold on
plot(y(:,2));