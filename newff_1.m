% Программа распознавания символов с помощью сети NEWFF
% N x M - размер исходного образа
N = 280;% размер изображения символа
p = 0.1;    % доля "загрязняющих" пикселей.      Рекоменд. p=0.1
M = 100;    % число зашумленных обучающих образов Рекоменд. M=100
X0 = reshape(imread('b1.tif'),[N 1]); X0 = 1 * X0;
X1 = reshape(imread('b2.tif'),[N 1]); X1 = 1 * X1;
X2 = reshape(imread('b3.tif'),[N 1]); X2 = 1 * X2;
X3 = reshape(imread('b4.tif'),[N 1]); X3 = 1 * X3;
X4 = reshape(imread('b5.tif'),[N 1]); X4 = 1 * X4;
X5 = reshape(imread('b6.tif'),[N 1]); X5 = 1 * X5;
X6 = reshape(imread('b7.tif'),[N 1]); X6 = 1 * X6;
X7 = reshape(imread('b8.tif'),[N 1]); X7 = 1 * X7;
X8 = reshape(imread('b9.tif'),[N 1]); X8 = 1 * X8;
X9 = reshape(imread('b10.tif'),[N 1]); X9 = 1 * X9;
 
XR=[X0 X1 X2 X3 X4 X5 X6 X7 X8 X9]; % массив незашум. обучающих образов
YR=[ 1  2  3  4  5  6  7  8  9  10]; % массив желаемых откликов
%XR=[X0 X1 X2 X3 X4]; % массив незашум. обучающих образов
%YR=[ 0  1  2  3  4]; % массив желаемых откликов
for i1 = 1:M
    X = Salt_Pepper(X0,p); XR=[XR X]; YR=[YR 1];
    X = Salt_Pepper(X1,p); XR=[XR X]; YR=[YR 2];
    X = Salt_Pepper(X2,p); XR=[XR X]; YR=[YR 3];
    X = Salt_Pepper(X3,p); XR=[XR X]; YR=[YR 4];
    X = Salt_Pepper(X4,p); XR=[XR X]; YR=[YR 5];
    X = Salt_Pepper(X5,p); XR=[XR X]; YR=[YR 6];
    X = Salt_Pepper(X6,p); XR=[XR X]; YR=[YR 7];
    X = Salt_Pepper(X7,p); XR=[XR X]; YR=[YR 8];
    X = Salt_Pepper(X8,p); XR=[XR X]; YR=[YR 9];
    X = Salt_Pepper(X9,p); XR=[XR X]; YR=[YR 10];
end
% диапазон значений признаков
R1=[0 1]; R=R1;
for i1=1:N-1
    R=[R; R1];
end
% создание сети
net = newff(R,[20 1],{'tansig','purelin'},'traingda');
% Рекоменд.(R,[20 1],{'tansig','purelin'},'trainbfg')
net.performFcn='msereg';
net.performParam.ratio=0.1; % Рекоменд. 0.1
net.trainParam.show=5;      % Рекоменд. 5
net.trainParam.epochs=200000; % Рекоменд. 500
net.trainParam.goal=0.001;   % Рекоменд. 0.02
% обучение сети
net = train(net,XR,YR);
% работа сети на множестве обучающих образов
Y2 = round (sim(net,XR));