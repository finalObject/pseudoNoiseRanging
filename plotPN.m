% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016年11月22日 15:55:00
% @version 2.0
% 输入参数就是个数组
% 画出图像
% 这里的话吧n个长度的信号看作是n个时间间隔,
function plotPN(pn,sampleFreq)  
    minTime=1/sampleFreq;
    signalSize=length(pn);
    totalTime=signalSize*minTime;
    resultX=minTime/2:minTime:totalTime-minTime/2;
    bar(resultX,pn,1);
    ylim([-1.5 1.5]);
    xlim([0 totalTime]);
end

