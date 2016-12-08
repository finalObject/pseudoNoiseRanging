% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016年12月5日 19:44:21
% @version 1.0
% 这里的频率是采样频率，不是信号频率
% shift是一个可调节参数，1~ratio的一个整数，表示的是取样的起始点
% 没有进行很多测试，目前能用
function pnNew=changeFreq(pnOld,freqOld,freqNew)
    shift=1;
    if freqNew>freqOld
        fprintf('New frequency should be smalller than old on\n');
        return;
    end
    ratio = freqOld/freqNew;% 频率比，大于1，表示坐标的缩放关系
    sizeOld = length(pnOld);
    sizeNew = floor(sizeOld/ratio); % 新数组的尺寸，可能出来的结果会少一个两个的，不影响结果
    pnNew = zeros(1,sizeNew);
    fprintf('%f\n',ratio);
    for i=1:sizeNew
        loc = floor(ratio*(i-1))+shift;% 通过计算获得对应的坐标
        pnNew(i)=pnOld(loc);
        fprintf('%d->%d\n',loc,i);
    end
end