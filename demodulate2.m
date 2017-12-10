function y = demodulate2(signal, carrierFreq, samplerate)
    signalLen = length(signal);
    signalTime = signalLen/samplerate;
    
    t = linspace(0,signalTime,signalLen);
    y1 = [];
    y2 = [];
    omc = (carrierFreq*2*pi./samplerate)*.7;
    n = linspace(-2000,2000,3000);
    h = omc/pi*sinc(omc*n/pi);
    y1 = signal.*cos(carrierFreq.*t.');
    y2 = signal.*sin(carrierFreq*t.');
    yc = 3.3333*conv(y1, h,'same');
    ys = 3.3333*conv(y2, h, 'same');
    z = yc+i*ys;
    a = fftshift(fft(z.^2));
    fs  = linspace(-pi, pi*(length(a)-1)/length(a), length(a));
    clf
    [~, ii] = max(abs(a));
    wdelta = fs(ii);        %drift in phase
    theta = angle(a(ii))/2; %constant phase
    
    %%------%%%%% everything above this is also for mimo
    remod = cos(2*pi*carrierFreq.*t.'-wdelta.*t.'-theta).*signal;

    y = 3.33*conv(remod,h, 'same');

end