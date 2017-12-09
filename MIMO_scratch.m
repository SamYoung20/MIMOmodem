% lock speaker 1 with microphone 1 and use phase offsets for all the
% speaker mic combos
% cross correlate each line
H = [h11 h12; h21 h22];
[U,S,V] = svd(H);
dk = [d1(k);d2(k)];
xk = V*dk;
transmission = xk*cos(w*t+wdelta*t+theta);

%-------------------Reciever----------------------------------------------%
yk = recieved*cos(w*t+wdelta*t+theta);  %matrix of recieved values with 2 columns or rows or whatever of the two mics
wk = U'*yk; %scaled dk