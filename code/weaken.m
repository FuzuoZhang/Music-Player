function weakrec=weaken(rec,pos)%���Խ���(��֪�������ٶȣ���������Ƶ��ͣһ���)
len=length(rec);
weakrec=zeros(len-pos,1);
for i=1:len-pos
    weakrec(i)=rec(i+pos)*(len-pos-i)/(len-pos);
end
end
    