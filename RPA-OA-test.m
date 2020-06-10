filename='G:\study\bishe\shiyan2\answer.csv';
a=csvread(filename,1,0);
len=length(a);
t=0:0.032:0.032*(len-1);
% plot(t,a);

filename1='G:\study\bishe\shiyan2\yin.csv';
a1=csvread(filename1,0,0);
b1=a1(:,1);
for i=1:length(b1)
    b4(i,1)=b1(i,1)-0.05;
end
b2=a1(:,2);
b3=b2/440;
c1=69+12*log2(b3);
% len1=length(a1);
% st=0.017415;
% t1=st:0.005805:(st+0.005805*(len1-1));
plot(t,a);
hold on;
%  plot(b4,c1);

ans=zeros(1,936);
% ans(1,1)=interp1(b1,b2,0.032,'nearest');
for j=1:936
    for i=1:3929
        if((b4(i,1)-t(1,j)<0)&&((b4(i+1,1)-t(1,j))>0))
            break;
        end
    end
    ans(1,j)=b2(i,1);
        if(a(j,1)==0)
            ans(1,j)=0;
        end
end

ans1=ans/440;
c2=69+12*log2(ans1);
plot(t,c2);

sh=0;
sco=0;
for p=1:936
%     if(abs(c2(1,j)-a(j,1))<0.5)
%         sco=sco+1;
%     end
    if(a(p,1)~=0)
        sh=sh+1;
    end
end

for p=1:936
%     if(abs(c2(1,j)-a(j,1))<0.5)
%         sco=sco+1;
%     end
    if(a(p,1)~=0)
         if(abs(c2(1,p)-a(p,1))<0.5)
           sco=sco+1;
         end
    end
end
rpascore=sco*100/sh;
oa=sco*100/936;