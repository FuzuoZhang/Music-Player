function strenrec=strength(rec,pos)%���Խ���ǿ 
len=length(rec);
strenrec=zeros(len-pos,1);
for i=1:len-pos
    strenrec(i)=rec(i+pos)*((len-pos+i)/(len-pos)-0.7);
end
end