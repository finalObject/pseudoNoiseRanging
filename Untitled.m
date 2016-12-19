clear;
signalFreq=100;%这里的频率是码片变化的频率
sampleFreq=10000;
signalSize=5;%
pna=getPNArray(signalSize,122);
pn1=getPN(pna,signalFreq,sampleFreq,0);
pn11=getPN(pna,signalFreq,sampleFreq,-1/signalFreq/2);
pn12=getPN(pna,signalFreq,sampleFreq,1/signalFreq/2);
%subplot(3,1,1);plotPN(pn1,sampleFreq);

x=zeros(1,sampleFreq/signalFreq*signalSize);
y=zeros(1,500);
y2=zeros(1,500);
index=1;
for i=-0.1+1/sampleFreq:1/sampleFreq:0.1
    x(index)=i;
    pn2=getPN(pna,signalFreq,sampleFreq,i);
    y(index)=integrate(pn1,pn2,0);
    y2(index)=integrate(pn11,pn2,0)-integrate(pn12,pn2,0);
    index=index+1;
end
%subplot(3,1,2);
plot(x,y);
%subplot(3,1,3);
%plot(x,y2);
% 以上部分画出的所有延迟时间与积分结果的曲线

%以下计算一个码片延迟和积分的关系
Xpoly=0:1/sampleFreq:1/signalFreq;
Ypoly=zeros(1,length(Xpoly));
for i=1:length(Xpoly)
    pn2=getPN(pna,signalFreq,sampleFreq,Xpoly(i));
    Ypoly(i)=integrate(pn1,pn2,0);
end

figure ;
plot(Xpoly,Ypoly,'.');
%拟合出对应的线性关系
kb=polyfit(Xpoly,Ypoly,1);
Ynew=Xpoly.*kb(1)+kb(2);%输出后k=-1.035156250000001e+02;b=1
hold on;
plot(Xpoly,Ynew);