% ��������� ��������� �������� ��������
p = 0.1; % ���� ����������� ��������
N = 280; % ����� �������� ����������� ������
Y  = 1*reshape(imread('b1.tif'),[N 1]); % ���������� ��������� ������
YS = Salt_Pepper(Y,p);                   % ���������� "���� � �����"
figure(1)
imshow(reshape(Y, [20,14]));            % �������� ���������� ������
figure(2)
imshow(reshape(YS,[20,14]));            % �������� ������������ ������