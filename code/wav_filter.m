function out = wav_filter(v)
% ÂË²¨

Fs = 22050;
[b,a] = ellip(8,0.05,80,[150 4000]*2/Fs);
out = filter(b,a,v);

end

