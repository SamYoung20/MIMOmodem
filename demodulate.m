function y = demodulate(signal, carrierFreq, samplerate)
    signalLen = length(signal);
    signalTime = signalLen/samplerate;
    
    t = linspace(0,signalTime,signalLen);
    carrier = cos(carrierFreq*2*pi*t);
    
    wc = .5*(carrierFreq * 2* pi)/samplerate;
    n = linspace(-1000,1000,2000);
    h = wc/pi * sinc(wc*n/pi);
    y = conv(signal.*carrier, h, 'same');
end