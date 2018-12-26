function sex = identify_sex(v)
% �����Ů��

%����Ƶ����ȡ
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

%���
if fmax < 250
    sex = 0;   %��
else
    sex = 1;   %Ů
end

end