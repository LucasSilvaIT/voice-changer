clc;
clear;
close all;
pkg load signal

freq_dirac = 1000;


[m, fs] = audioread('original.mp3');

dft_sinal = fft(m);

impulso_dirac = zeros(size(dft_sinal));

impulso_dirac(freq_dirac) = 1;

sinal_conv = conv2(dft_sinal, impulso_dirac);

figure;plot(abs(dft_sinal));
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Espectro de Frequência');
figure;plot(abs(sinal_conv));
