% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016年11月22日 15:12:00
% @version 1.0
% 根据种子生成一个指定长度的固定的随机数组
% 网上扒的代码
function pn=getPNArray(col, seed)
    m = 4;
    seed2 = sqrt(seed);
    while seed2 < 1
        seed2 = seed2 * 10;
    end
    n = round(seed2/m);% 返回最接近seed2/m的整数
    x = (10^n)*seed2;
    pn=zeros(1,col);
    last = x - floor(x);
    if last<=0.5
        pn(1,1)=-1;
    else
        pn(1,1)=1;
    end
    for i = 2:col
        temp = sqrt(abs(last));
    	if temp==0
            temp=eps;
        end
        while temp < 1
            temp = temp * 10;
        end
        n = round(temp/m);
        x = (10^n)*temp;
        last= (x - floor(x));
        if last<=0.5
            pn(1,i)=-1;
        else
            pn(1,i)=1;
        end
    end

end