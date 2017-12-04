function signal = modulate(symbols, symbolrate, carrierFreq, samplerate)
  samplesPerSymbol = round(samplerate/symbolrate);
  m = repmat(symbols,[samplesPerSymbol,1]);
  signalLen = samplesPerSymbol*length(symbols);
  symbolsResampled = reshape(m,[1, signalLen]);
  time = length(symbols)/symbolrate;
  t = linspace(0,time,signalLen);
  carrier = cos(carrierFreq*2*pi*t);
  signal = carrier.*symbolsResampled;
end