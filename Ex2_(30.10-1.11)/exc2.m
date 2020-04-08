%% first task
% Familiarization with MATLAB’s Quantization Functions
clear all, close all;
I = imread('peppers.png');
A=(0:1:255);

step128 = 256/4; % creating a step = 256/4
QA1 = quant(A, step128); % elements of A rounded to nearest multiple of step = 256/4 = 64
% QA1 = 1x255 double: 5 different values OF STEPS (Nearest values)

partition = step128:step128:256-step128;
% a partition vector [64,128,192]; (N-1) elements
codebook = step128/2:step128:256-step128/2;
% codebook prescribes a value for each partition in the quantization [32,96,160,224]
[indx,QA2] = quantiz(A, partition, codebook);
% returns the quantization levels in the real vector signal A
% QA2 = 1x255 double: 4 different values  OF CODEBOOK (Nearest values)

disp('QA1 values '),disp(unique(QA1)), disp('QA2 values '), disp(unique(QA2))
%% second task
% Quantization
clear all, close all;
I = imread('lena_face.png');
figure(1)
imshow(I);
A=(0:1:255);
Q1=zeros(256,256);


     step=2
   levels = step:step:256-step;
values = step/2:step:256-step/2;
  [Q1, idx] = imquantize(I, levels, values);
    subplot(3,2,1)
  imshow(Q1/255); 
  title '128-level uniform quantizer'
  
     step=4
   levels = step:step:256-step;
values = step/2:step:256-step/2;
  [Q1, idx] = imquantize(I, levels, values);
    subplot(3,2,2)
  imshow(Q1/255); 
  title '64-level uniform quantizer'
  
     step=8
   levels = step:step:256-step;
values = step/2:step:256-step/2;
  [Q1, idx] = imquantize(I, levels, values);
    subplot(3,2,3)
  imshow(Q1/255);
  title '32-level uniform quantizer'
  
     step=16
   levels = step:step:256-step;
values = step/2:step:256-step/2;
  [Q1, idx] = imquantize(I, levels, values);
    subplot(3,2,4)
  imshow(Q1/255);
  title '16-level uniform quantizer'
  
step=32
levels = step:step:256-step;
values = step/2:step:256-step/2;
 [Q1, idx] = imquantize(I, levels, values);
  Q2 = imquantize(I, values);
  subplot(3,2,5)
    imshow(Q1/255);
  title '8-level uniform quantizer'
   
   step=64
levels = step:step:256-step;
values = step/2:step:256-step/2;
 [Q1, idx] = imquantize(I, levels, values);
  Q2 = imquantize(I, values);
  subplot(3,2,6)
   imshow(Q1/255);
   title '4-level uniform quantizer'
   
   pause (3)
     NOISE = 16*uint8(round(randn(256)));
 Inoisy=I+NOISE;
     step=16;
   levels = step:step:256-step;
values = step/2:step:256-step/2;
  [Q1, idx] = imquantize(I, levels, values);
   [Qnoisy, idx] = imquantize(Inoisy, levels, values);

    subplot(1,2,1)
  imshow(Q1/255);
  title '16-level uniform quantizer without noise'
    subplot(1,2,2)
  imshow(Qnoisy/255);
  title '16-level uniform quantizer with noise X'
  %% third task
% Simultaneous contrast

Ileft = 63*ones(400); Ileft (120:280,120:280)=127;
Iright=223*ones(400);

Iright(120:280,120:280)=127;
subplot(3,2,1); imshow(Ileft/255); subplot(3,2,2); imshow(Iright/255);

Iright(120:280,120:280)=100;
subplot(3,2,3); imshow(Ileft/255); subplot(3,2,4); imshow(Iright/255);

Iright(120:280,120:280)=160;
subplot(3,2,5); imshow(Ileft/255); subplot(3,2,6); imshow(Iright/255);