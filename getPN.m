% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016��11��26�� 21:38:45
% @version 2.0
% ����ʵ��ǰ���ӳ٣��Զ����룬��ֱ����
function pn=getPN(pnArray,signalFreq,sampleFreq,delayTime)
    % pnArray ���ɵ�α�������
    % signalFreq ��Ƭ�仯��Ƶ��
    % sampleFreq �����źŵ�����
    % delayTime �ӳ�ʱ����
    
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
        loc=mod((i+delayNumber),totalLength);%̫�����ˣ�
        if loc==0
            loc=totalLength;
        end
        pn(loc)=pnArray(ceil(i/signalLength));
    end
end
