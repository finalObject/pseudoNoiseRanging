% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016��12��6�� 17:08:22
% @version 2.0
% ���ĺ���
% ��ȡ�ӳ�ʱ�䣬�������ж��ӳ�ʱ���Ƿ���һ����ģ����ٵĻ�����λ
% ȷ����һ�����ں�ͨ��ʵ�ֱ궨�����ݣ��ɻ��ֽ����Ӧ����Ӧ��һ�����ڵ��ӳ�ʱ��
% Ȼ�������λ��ʱ�䣬�����ܵ�ʱ��
% �ж��Ƿ���һ�����ڵ�ԭ�򣺼�����һ�����ڣ�������ӳ�ʱ�䣬��ȫ�����ӳ�ʱ��󿴻��ֽ���Ƿ�Ϊ1
% ����жϷ������漰��ֵ
function result=getDelay(source,sample,signalFreq,sampleFreq,k,b)
    th = 0.99;%�ж��Ƿ����1����ֵ
    lengthSrc=length(source);
    lengthSample=length(sample);
    if lengthSrc~=lengthSample
        fprintf('source and result have different size');
        return;
    end
    signalLength=(1/signalFreq)*sampleFreq;
    shiftBit=0;
    shift=shiftBit*signalLength;%�㷨��sample�������ƶ��������������������л���

    %���������ڣ�����ʱ��
    detail=integrate(source,sample,shift);
    result=(detail-b)/k;
    %fprintf('detail-%f-time-%f',detail,result);
    %���������ӳ٣��ж��Ƿ�λ��-1�뵽1����
    %(0,1)
    shiftTime=result/(1/sampleFreq);
    detailShift=integrate(source,sample,round(shift+shiftTime));   
    if detailShift>=th
        fprintf('\n');
        return ;
    end
    %(-1,0)
    detailShift=integrate(source,sample,round(shift-shiftTime));   
    if detailShift>=th
        result=-result;
        fprintf('\n');
        return ;
    end
    %������ڣ�����һ�룬����ʱ�䣬�����������㡣�жϡ�
    %ѭ����һ����ֱ���жϳɹ�
    while detailShift<th
        shiftBit=shiftBit+1;
        shift=shiftBit*signalLength;
        detail=integrate(source,sample,shift);
        result=(detail-b)/k;
        shiftTime=result/(1/sampleFreq);
        detailShift=integrate(source,sample,round(shift+shiftTime));   
    end
    fprintf('In getDelay shiftBit:%d,timeInBit%f\n',shiftBit,result);
    result=result+shiftBit/signalFreq;
    

%     while detail<0.5
%         shiftBit=shiftBit+1;
%         shift=shiftBit*signalLength;
%         detail=integrate(source,sample,shift);
%     end
    
%     result=shiftBit+detail;
end
