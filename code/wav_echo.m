function out = wav_echo(v,delay)
% ªÿ“Ù

num = size(v,2);
v1 = [v;zeros(delay,num)];
v2 = [zeros(delay,num);v];
out = v1 + v2/2;

end