% Diff.m - Problem 5.39 - p 285 Blandford and Parr
% This m-file generates a simulated mixed horizontal and
% vertical synchronization signal similar to that used in TV.
i = 0;
while i < 2000 % This loop generates horizontal synch
  if (mod(i, 50) == 0) % pulses
    x(i+1) = 1;
    x(i+2) = 1;
    i = i + 2;
  else
    x(i+1) = 0;
    i = i + 1;
  end
end
i = 0;
while (i < 2000) % This loop inverts selected
  if(mod(i, 500) == 0) % horizontal pulses to simulate
    for j = i:i+200 % vertical synch pulses,
      if(x(j+1) == 0)
        x (j+1) = 1;
      else
        x(j+1) = 0;
      end
    end
    i = i + 200;
  end
  i = i + 1;
end
% Plot the signal
figure();
plot(x);
title('Original signal');