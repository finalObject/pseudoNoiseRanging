clear;clc;
%这是通过main2拟合出来的直线参数
k=-1.035156250000001e+02;b=1;
signalFreq=100;%这里的频率是码片变化的频率
sampleFreq=1000;
signalSize=1024;%整个信号长度是10.24s
pna=getPNArray(signalSize,124124);
pn1=getPN(pna,signalFreq,sampleFreq,0);
pn2=getPN(pna,signalFreq,sampleFreq,0.0001);
pn3=getPN(pna,signalFreq,sampleFreq,-0.011);
getDelay(pn1,pn2,signalFreq,sampleFreq,k,b)
getDelay(pn1,pn3,signalFreq,sampleFreq,k,b)
