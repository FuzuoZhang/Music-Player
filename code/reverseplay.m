function reverseRec=reverseplay(rec)
len=length(rec);
reverseRec=zeros(len,1);
for i=1:len
    reverseRec(i)=rec(len+1-i);
end
end
