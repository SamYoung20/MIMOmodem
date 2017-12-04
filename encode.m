function symb = encode(str)
  str = uint8(str);
  symb = zeros(1,8*length(str));
  for i = 1:length(str)
    c = str(i);
    for j = 1:8
        symb(8*(i-1)+j) = bitget(c,j,'uint8');
    end
  end
  symb = symb*2-1;
end

