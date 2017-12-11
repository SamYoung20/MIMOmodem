function H = findH(mic1,mic2,noise,Fs,deltaT,w)
  padding = zeros(1,length(mic1)-length(noise));
  noiseLen = length(noise);
  noiseTime = noiseLen/Fs;
  noise = [noise,padding];
  period = 1/w;
  [mic1Cor,mic1Lag] = xcorr(mic1,noise,'coeff');
  [mic2Cor,mic2Lag] = xcorr(mic2,noise,'coeff');
  
  [mic1Cor1, mic1Index1] = max(mic1Cor);
  mic1Cor(mic1Index1-round(noiseLen/2):mic1Index1+round(noiseLen/2)) = 0;
  [mic1Cor2, mic1Index2] = max(mic1Cor);
  
  [mic2Cor1, mic2Index1] = max(mic2Cor);
  mic2Cor(mic2Index1-round(noiseLen/2):mic2Index1+round(noiseLen/2)) = 0;
  [mic2Cor2, mic2Index2] = max(mic2Cor);
  
  if(mic1Index2 < mic1Index1)
      [mic1Index1,mic1Index2] = deal(mic1Index2, mic1Index1);
      [mic1Cor1,  mic1Cor2]   = deal(mic1Cor2,   mic1Cor1);
  end
  
  if(mic2Index2 < mic2Index1)
      [mic2Index1,mic2Index2] = deal(mic2Index2, mic2Index1);
      [mic2Cor1,  mic2Cor2]   = deal(mic2Cor2,   mic2Cor1);
  end
  
  time11 = mic1Lag(mic1Index1)/Fs;
  time21 = mic1Lag(mic1Index2)/Fs;
  
  time12 = mic2Lag(mic2Index1)/Fs;
  time22 = mic2Lag(mic2Index2)/Fs;
  
  sound11 = mic1;
  sound11(1:mic1Lag(mic1Index1)) = 0;
  sound11(mic1Lag(mic1Index1)+noiseLen:end) = 0;
  sound21 = mic1;
  sound21(1:mic1Lag(mic1Index2)) = 0;
  sound21(mic1Lag(mic1Index2)+noiseLen:end) = 0;
  
  sound12 = mic2;
  sound12(1:mic1Lag(mic2Index1)) = 0;
  sound12(mic1Lag(mic2Index1)+noiseLen:end) = 0;
  sound22 = mic2;
  sound22(1:mic2Lag(mic2Index2)) = 0;
  sound22(mic2Lag(mic2Index2)+noiseLen:end) = 0;
  
  gain11 = max(xcorr(sound11,noise,'coeff'));
  gain21 = max(xcorr(sound21,noise,'coeff'));
  gain12 = max(xcorr(sound12,noise,'coeff'));
  gain22 = max(xcorr(sound22,noise,'coeff'));
  
  
  %gains = [mic1Cor1 mic1Cor2; mic2Cor1, mic2Cor2]
  gains = [gain11 gain21; gain12, gain22]
  timeOffsets = [0, time21-time11-deltaT-noiseTime; time12-time11, time22-time11-deltaT-noiseTime];
  phaseOffsets = mod(timeOffsets, period)/period*2*pi;
  H = gains.*exp(i*phaseOffsets);
end

