clear;
signalFreq=100;%�����Ƶ������Ƭ�仯��Ƶ��
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
% ���ϲ��ֻ����������ӳ�ʱ������ֽ��������

%���¼���һ����Ƭ�ӳٺͻ��ֵĹ�ϵ
Xpoly=0:1/sampleFreq:1/signalFreq;
Ypoly=zeros(1,length(Xpoly));
for i=1:length(Xpoly)
    pn2=getPN(pna,signalFreq,sampleFreq,Xpoly(i));
    Ypoly(i)=integrate(pn1,pn2,0);
end

figure ;
plot(Xpoly,Ypoly,'.');
%��ϳ���Ӧ�����Թ�ϵ
kb=polyfit(Xpoly,Ypoly,1);
Ynew=Xpoly.*kb(1)+kb(2);%�����k=-1.035156250000001e+02;b=1
hold on;
plot(Xpoly,Ynew);