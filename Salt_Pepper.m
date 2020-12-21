function Y = Salt_Pepper (X,p);
% ��������� ���������� ��������� ������� X
% ����� ���� "���� � �����"
%  y  -  �������� ����������� ������
%  p  -  ���� ����������� ��������

[N1,N2] = size(X); N = N1 * N2; S1 = rand(N,1); Y = X;
for i1 =1:N 
    if (S1(i1)<p)
        if (X(i1)==0) Y(i1)=1;
            else      Y(i1)=0; end                             
    end
end  