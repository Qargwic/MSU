classdef Given < handle

    properties(GetAccess = public, SetAccess = public)
        p = [];
    end
    properties
        W = 60;     %���������� ������
        i_n = 50;   %����������� ��� 
        Ph = 0.01;  %�����
        w_n = 100;  %����������� ���. ��.
        Mc_n = 470; %������
        Uc_n = 220; %���������� ����
        R_ya = 0.3; %������������� �����
        R_v = 0.14; %������������� ������� �����. ����.
        Ce = 290;   %�������������� ����������� 
        Cm = 230;   %�������������� �����������
        J = 0.1;    %������ ������� ��������� 
    end
    
    methods (Static)
        function dp = dpol(p, x)
            dp = polyval(polyder(p), x);
        end
    end
    
end

