function sex = identify_sex(v)
% 辨别男女声

%基音频率提取
fs = 22050;
[~,index] = max(v);
timewin = floor(0.015*fs);
xwin = v(index-timewin:index+timewin);
[y,~] = xcov(xwin);

ylen = length(y);
halflen = (ylen+1)/2 +30;
yy = y(halflen: ylen);
[~,maxindex] = max(yy);
fmax = fs/(maxindex+30);

%辨别
if fmax < 250
    sex = 0;   %男
else
    sex = 1;   %女
end

end