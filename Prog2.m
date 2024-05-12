clc;
clear;
close all;
pkg load signal

freq_dirac = 1000;


[m, fs] = audioread('original.mp3');
NumAmostras = length(m);
dft_sinal = abs(fft(m)/NumAmostras);
f = fs*(0:(NumAmostras/2-1))/NumAmostras;
plot(f, dft_sinal(1:(NumAmostras/2)));



%{

impulso_dirac = zeros(size(dft_sinal));

impulso_dirac(freq_dirac) = 1;

sinal_conv = conv2(dft_sinal, impulso_dirac);

figure;plot(abs(dft_sinal));
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Espectro de Frequência');
figure;plot(abs(sinal_conv));

sinal = ifft(sinal_conv);
figure;plot(m);
sound(m, fs);

%}
