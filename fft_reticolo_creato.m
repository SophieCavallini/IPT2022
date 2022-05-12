clc
clear all
close all
sx = 180;
sy = 307;

%% subpixel
nx = 28;
ny = 7;
bx = 34;
by = 9;

F = zeros(sx, sy);
cella = ones(nx, ny);
for ii = 7:bx:(sx-nx)
    for jj = 2:by:(sy-ny)
        F(ii:ii+nx-1, jj:jj+ny-1) = cella;
    end
end

figure(1);
imagesc(F);
axis image;
grid on;

aF = fftshift(fft2(F));
figure(2);
imagesc(abs(aF));
title('Subpixel');
grid on;

%% pixel: R+G+B
Nx = nx;
Ny = 2*by + ny;
Bx = bx;
By = 3*by;

F = zeros(sx, sy);
cella = ones(Nx, Ny);
for ii = 7:Bx:(sx-Nx)
    for jj = 2:By:(sy-Ny)
        F(ii:ii+Nx-1, jj:jj+Ny-1) = cella;
    end
end

figure(3);
imagesc(F);
axis image;
grid on;

aF = fftshift(fft2(F));
figure(4);
imagesc(abs(aF));
title('Total Pixel (R+G+B)');
grid on;

%% pixel: only R
Nx = nx;
Ny = ny;
Bx = bx;
By = 3*by;

F = zeros(sx, sy);
cella = ones(Nx, Ny);
for ii = 7:Bx:(sx-Nx)
    for jj = 2:By:(sy-Ny)
        F(ii:ii+Nx-1, jj:jj+Ny-1) = cella;
    end
end

figure(5);
imagesc(F);
axis image;
grid on;

aF = fftshift(fft2(F));
figure(6);
imagesc(abs(aF));
title('Only R');
grid on;