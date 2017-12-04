function signal = modulate(symbols, symbolrate, carrierFreq, samplerate)
  time = length(symbols)/symbolrate;
  signalLen = time*samplerate;
  t = linspace(0,time,signalLen);
  carrier = cos(carrierFreq*2*pi*t);
  samplesPerSymbol = round(samplerate/symbolrate);
  m = repmat(symbols,[samplesPerSymbol,1]);
  symbolsResampled = reshape(m,[1, signalLen]);
  signal = carrier.*symbolsResampled;
end