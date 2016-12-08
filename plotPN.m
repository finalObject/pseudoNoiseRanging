% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016��11��22�� 15:55:00
% @version 2.0
% ����������Ǹ�����
% ����ͼ��
% ����Ļ���n�����ȵ��źſ�����n��ʱ����,
function plotPN(pn,sampleFreq)  
    minTime=1/sampleFreq;
    signalSize=length(pn);
    totalTime=signalSize*minTime;
    resultX=minTime/2:minTime:totalTime-minTime/2;
    bar(resultX,pn,1);
    ylim([-1.5 1.5]);
    xlim([0 totalTime]);
end

