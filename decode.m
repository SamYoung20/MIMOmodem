function res = decode(symbols)
  symbols = uint8((symbols+1)/2);
  res = zeros(1,length(symbols)/8);
  for i = 1:length(res)
    for j=1:8
      res(i) = bitor(res(i),bitshift(symbols(8*(i-1)+j),(j-1)));
    end
  end
  res = char(res);
end

