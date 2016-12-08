% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016年12月6日 17:31:22
% @version 1.0
% 算积分，算相关程度
function result=integrate(source,sample,shift)
    lengthSrc=length(source);
    result=0;
    for i=1:lengthSrc
        loc=mod((i+shift),lengthSrc);
        if loc==0
            loc=lengthSrc;
        end
        result=result+source(i)*sample(loc);
    end
    result=result/lengthSrc;
end