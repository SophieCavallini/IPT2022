%% Amoled
clc
clear all
close all
F = double(imread('amoledoriented.jpeg')); %upload image
figure(1);
subplot(1,3,1), imshow(F), grid on;
Fblack = F(:,:,1)+F(:,:,2)+F(:,:,3); %%sum of matrices of the three colours (RGB)
subplot(1,3,2), imagesc(Fblack), grid on, axis normal;
t = 250; %threshold beyond which we have decided that the PP is on (it's there)
Fblack(Fblack > t) = 255; %activate DP (the ones beyond the threshold)
Fblack(Fblack <= t) = 0; %deactivate DP (the ones befor the threshold)
subplot(1,3,3), imshow(Fblack);
figure(3);
%the next 3 lines are needed to remove the central peak
Fblack = -Fblack; %negative image
mFblack = mean(mean(Fblack)); %mean value
Fblack = Fblack - mFblack; %remove the mean value
ifftshift(Fblack);
aF = fft2(Fblack); % Fourier transform with fft2
aF = fftshift(aF); 
%next 3 rows = band-pass filter
alpha = 5*10^6; %partial low-pass filter, it attenuats the high frequencies dividing or lowering to alpha
beta = 0.5*10^3; %high-pass filter, it set to zero the low frequencies
aF = soft_T(aF, alpha, beta);
alpha = 2*10^6; 
beta = 0.5*10^3;
aF = soft_T(aF, alpha, beta);
aF = abs(aF);
mesh(aF);
figure(4);
imshow(aF);
figure(6);
imagesc(aF);
axis off;
figure(5);
aFsparse = zeros(size(aF));
aFsparse(aF > 0.5*10^6) = 1;
%aFsparse(aF > 0.9*10^5) = 0;
spy(aFsparse);
grid on;
%% spatial frequencies
pp_dp = 124.5;
pp_m = 80e-6;
conv = pp_dp/pp_m;
lambda = 532e-9;
L = 4.167;
sx = 869;
sy = 471;
fx_pd = 7;
fy_pd = 4;
fx_m = fx_pd/sx * conv;
fy_m = fy_pd/sy * conv;
x = lambda*L*fx_m
y = lambda*L*fy_m
u_lambda = 10e-9;
u_L = 0.6e-2;
u_fx_pd = 1/sqrt(12);
u_pp_dp = 1.5;
u_pp_m = 2.94e-6;
u_x = sqrt((L*fx_pd/sx*conv)^2*u_lambda^2+...
    (lambda*fx_pd/sx*conv)^2*u_L^2+...
    (lambda*L/sx*conv)^2*u_fx_pd^2+...
    (lambda*L*fx_pd/sx*1/pp_m)^2*u_pp_dp^2+...
    (-lambda*L*fx_pd/sx*pp_dp/pp_m^2)^2*u_pp_m^2)
u_y = sqrt((L*fy_pd/sy*conv)^2*u_lambda^2+...
    (lambda*fy_pd/sy*conv)^2*u_L^2+...
    (lambda*L/sy*conv)^2*u_fx_pd^2+...
    (lambda*L*fy_pd/sy*1/pp_m)^2*u_pp_dp^2+...
    (-lambda*L*fy_pd/sy*pp_dp/pp_m^2)^2*u_pp_m^2)

%%
clc
clear all
close all
F = double(imread('schermo1.jpeg'));
figure(1);
subplot(1,3,1), imshow(F), axis image;
FR = F(:,:,1);
FG = F(:,:,2);
FB = F(:,:,3);
% stessa cosa che per schermo1 ma qui si accendiamo o spegniamo guardando i
% colori singolarmente
t = 75;
FR(FR > t) = 255;
FG(FG > t) = 255;
FB(FB > t) = 255;
FR(FR <= t) = 0;
FG(FG <= t) = 0;
FB(FB <= t) = 0;
Fblack = FR + FG + FB;
subplot(1,3,2), imagesc(Fblack), axis image;
subplot(1,3,3), imagesc(Fblack), axis image;
grid on;
Fblack = -Fblack;
mFblack = mean(mean(Fblack));
Fblack = Fblack - mFblack;
ifftshift(Fblack);
aF = fft2(Fblack);
aF = fftshift(aF);
alpha = 70*10^4;
beta = 10^3;
aF = soft_T(aF, alpha, beta);
figure(6);
imagesc(abs(log2(aF)));
aF = abs(aF);
aF(aF > max(max(aF))/2) = aF(aF > max(max(aF))/2)/10;
figure(3);
mesh(aF);
figure(4);
imagesc(aF);
figure(6);
imshow(aF);
grid on;
figure(5);
aFsparse = zeros(size(aF));
aFsparse(aF > 1*10^5) = 1;
spy(aFsparse);
%%
pp_dp = 33;
pp_m = 245e-6;
conv = pp_dp/pp_m;
lambda = 532e-9;
L = 4.192;
sx = 307;
sy = 180;
fx_pd = 26;
fy_pd = 5;
fx_m = fx_pd/sx * conv;
fy_m = fy_pd/sy * conv;
x = lambda*L*fx_m
y = lambda*L*fy_m
u_lambda = 10e-9;
u_L = 0.6e-2;
u_fx_pd = 1/sqrt(12);
u_pp_dp = 2;
u_pp_m = 14e-6;
u_x = sqrt((L*fx_pd/sx*conv)^2*u_lambda^2+...
    (lambda*fx_pd/sx*conv)^2*u_L^2+...
    (lambda*L/sx*conv)^2*u_fx_pd^2+...
    (lambda*L*fx_pd/sx*1/pp_m)^2*u_pp_dp^2+...
    (-lambda*L*fx_pd/sx*pp_dp/pp_m^2)^2*u_pp_m^2)
u_y = sqrt((L*fy_pd/sy*conv)^2*u_lambda^2+...
    (lambda*fy_pd/sy*conv)^2*u_L^2+...
    (lambda*L/sy*conv)^2*u_fx_pd^2+...
    (lambda*L*fy_pd/sy*1/pp_m)^2*u_pp_dp^2+...
    (-lambda*L*fy_pd/sy*pp_dp/pp_m^2)^2*u_pp_m^2)

%% compatibility
xd = 2.6083e-2;
u_xd = 2.4e-4;
yd = 0.875e-2;
u_yd = 1.8e-4;
Kx = abs(x-xd)/sqrt(u_xd^2+u_x^2)
Ky = abs(y-yd)/sqrt(u_yd^2+u_y^2)