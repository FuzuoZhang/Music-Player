function weakrec=weaken(rec,pos)%线性渐弱(不知道计算速度，建议让音频暂停一会儿)
len=length(rec);
weakrec=zeros(len-pos,1);
for i=1:len-pos
    weakrec(i)=rec(i+pos)*(len-pos-i)/(len-pos);
end
end
    