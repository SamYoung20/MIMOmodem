function out = MIMO_transmit(signals, symbolRate, H, w, Fs);
    [U,S,V] = svd(H);
    signal1 = modulate(signals(1,:), symbolRate, w, Fs);
    signal2 = modulate(signals(2,:), symbolRate, w, Fs);
    d = [signal1;signal2];
    x = V*d;
    soundsc(real(x),Fs);
    out = real(x);
end

