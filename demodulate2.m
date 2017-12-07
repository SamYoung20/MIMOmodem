function y = demodulate2(signal, carrierFreq, samplerate)
    signalLen = length(signal);
    signalTime = signalLen/samplerate;
    
    t = linspace(0,signalTime,signalLen);
    avWind = (100/carrierFreq)/(1/samplerate);
    phi = 0;
    y1 = 0;
    avWind
    for k = (avWind+1):avWind:length(signal)
        disp('hi')
        yt1 = cos(carrierFreq*t + phi).*signal';
        y1 = mean(yt1(k-avWind:k));
        yt2 = -sin(carrierFreq*t + phi).*signal';
        y2 = mean(yt2(k-avWind:k));
        phi = 4*y1*y2 + phi;
    end
    y_raw = signal.*cos(carrierFreq*t + phi)';
    wc = .5*(carrierFreq * 2* pi)/samplerate;
    n = linspace(-1000,1000,2000);
    h = wc/pi * sinc(wc*n/pi);
    y = conv(y_raw', h, 'same');

end