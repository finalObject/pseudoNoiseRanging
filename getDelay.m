% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016年12月6日 17:08:22
% @version 2.0
% 核心函数
% 获取延迟时间，首先是判断延迟时间是否在一个码的，不再的话先移位
% 确定在一个码内后，通过实现标定的数据，吧积分结果对应成相应的一个码内的延迟时间
% 然后加上移位的时间，就是总的时间
% 判断是否在一个码内的原则：假设在一个码内，计算出延迟时间，完全修正延迟时间后看积分结果是否为1
% 这个判断方法不涉及阈值
function result=getDelay(source,sample,signalFreq,sampleFreq,k,b)
    th = 0.99;%判断是否等于1的阈值
    lengthSrc=length(source);
    lengthSample=length(sample);
    if lengthSrc~=lengthSample
        fprintf('source and result have different size');
        return;
    end
    signalLength=(1/signalFreq)*sampleFreq;
    shiftBit=0;
    shift=shiftBit*signalLength;%算法中sample均往左移动，如果超过半个周期再行换算

    %假设在码内，计算时间
    detail=integrate(source,sample,shift);
    result=(detail-b)/k;
    %fprintf('detail-%f-time-%f',detail,result);
    %左右修正延迟，判断是否位于-1码到1码中
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
    %如果不在，左移一码，计算时间，往左修正到零。判断。
    %循环上一不，直到判断成功
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
