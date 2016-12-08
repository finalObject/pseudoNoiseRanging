% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016年11月26日 21:38:45
% @version 2.0
% 可以实现前后延迟，自动补齐，简直完美
function pn=getPN(pnArray,signalFreq,sampleFreq,delayTime)
    % pnArray 生成的伪随机数组
    % frequency 信号频率
    % minTime 最小时间间隔,采样频率的倒数
    % delayTime 延迟时间呗
    
%     if 2*signalFreq>sampleFreq
%         fprintf('sample frequency should be bigger than twice of signal frequency\n');
%         return;
%     end
    minTime=1/sampleFreq;
    delayNumber=round(delayTime/minTime);
    signalNumber=length(pnArray);
    signalLength=(1/signalFreq)/minTime;
    totalLength = signalLength*signalNumber;
    pn=zeros(1,totalLength);
    
    
    for i=1:totalLength
        loc=mod((i+delayNumber),totalLength);%太巧妙了！
        if loc==0
            loc=totalLength;
        end
        pn(loc)=pnArray(ceil(i/signalLength));
    end
end
