% 这串脚本用来获取延迟时间的对应积分的关系
clear;
signalFreq=100;%这里的频率是码片变化的频率
sampleFreq=12000;
signalSize=1024;
seed = 124124;
pna=getPNArray(signalSize,seed);
pn1=getPN(pna,signalFreq,sampleFreq,0);

% 绘出波形图像
% subplot(3,1,1);plotPN(pn1,sampleFreq);

% pn11=getPN(pna,signalFreq,sampleFreq,-1/signalFreq/2);
% pn12=getPN(pna,signalFreq,sampleFreq,1/signalFreq/2);
% x=zeros(1,2000)
% y=zeros(1,2000);
% y2=zeros(1,2000);
% index=1;
% for i=-0.1+1/sampleFreq:1/sampleFreq:0.1
%     x(index)=i;
%     pn2=getPN(pna,signalFreq,sampleFreq,i);
%     y(index)=integrate(pn1,pn2,0);
%     y2(index)=integrate(pn11,pn2,0)-integrate(pn12,pn2,0);
%     index=index+1;
% end
% subplot(3,1,2);
% plot(x,y);
% subplot(3,1,3);
% plot(x,y2);
% 以上部分是画出普通相关度图像和，以偏移前后半个码片的基准相剪得出的相关度图像

%以下计算一个码片延迟和相关度的关系，拟合数据
Xpoly=0:1/sampleFreq:1/signalFreq;
Ypoly=zeros(1,length(Xpoly));
for i=1:length(Xpoly)
    pn2=getPN(pna,signalFreq,sampleFreq,Xpoly(i));
    Ypoly(i)=integrate(pn1,pn2,0);
end

figure ;
plot(Xpoly,Ypoly,'.');
kb=polyfit(Xpoly,Ypoly,1);
kb(1)
kb(2)
Ynew=Xpoly.*kb(1)+kb(2);%输出后k=-1.035156250000001e+02;b=1
hold on;
plot(Xpoly,Ynew);