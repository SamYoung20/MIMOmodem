function [real,complex] = makeCarrier(w, fs, time)
  time = linspace(0,time,round(fs*time));
  real = cos(w*time*2*pi);
  complex = exp(1i*w*2*pi*time);
end