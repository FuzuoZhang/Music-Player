function out = wav_merge(v1,v2)
% »ìÒô

len1 = size(v1,1);
len2 = size(v2,1);

if(len1>len2)
    out = v1(1:len2,:)/2 + v2(1:len2,:)/2;
else
    out = v1(1:len1,:)/2 + v2(1:len1,:)/2;
end

end