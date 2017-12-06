function y = demodulate(signal, carrierFreq, samplerate)
    signalLen = length(signal);
    signalTime = signalLen/samplerate;
    
    t = linspace(0,signalTime,signalLen);
    avWind = (100/carrierFreq)/(1/samplerate);
    phi = 0;
    for k = (avWind+1):length(signal)
        yt1 = cos(carrierFreq*t + phi).*signal';
        y1 = mean(yt1(k-avWind:k));
        yt2 = -sin(carrierFreq*t + phi).*signal';
        y2 = mean(yt2(k-avWind:k));
        phi = 4*y1*y2 + phi;
    end
    y = cos(carrierFreq*t+phi).*signal';

end