function out = wav_exchange(v)
% ±ä»»ÉùµÀ

len = size(v,1);

w = v;
for i = 1:len
    w(i,1) = v(i,2);
    w(i,2) = v(i,1);
end
out=w;
end
