% @author finalObject
%         http://www.finalobject.cn
%         i@finalobject.cn
%         https://github.com/finalObject
% @date 2016��12��5�� 19:44:21
% @version 1.0
% �����Ƶ���ǲ���Ƶ�ʣ������ź�Ƶ��
% shift��һ���ɵ��ڲ�����1~ratio��һ����������ʾ����ȡ������ʼ��
% û�н��кܶ���ԣ�Ŀǰ����
function pnNew=changeFreq(pnOld,freqOld,freqNew)
    shift=1;
    if freqNew>freqOld
        fprintf('New frequency should be smalller than old on\n');
        return;
    end
    ratio = freqOld/freqNew;% Ƶ�ʱȣ�����1����ʾ��������Ź�ϵ
    sizeOld = length(pnOld);
    sizeNew = floor(sizeOld/ratio); % ������ĳߴ磬���ܳ����Ľ������һ�������ģ���Ӱ����
    pnNew = zeros(1,sizeNew);
    fprintf('%f\n',ratio);
    for i=1:sizeNew
        loc = floor(ratio*(i-1))+shift;% ͨ�������ö�Ӧ������
        pnNew(i)=pnOld(loc);
        fprintf('%d->%d\n',loc,i);
    end
end