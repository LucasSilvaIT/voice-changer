clc;
clear;
close all;
pkg load signal


[m, fs] = audioread('original.mp3');

% Carregar o arquivo de áudio
%[sinal_audio, frequencia_amostragem] = audioread('audio_original.wav');

% Calcular o comprimento do sinal de áudio
%N = length(m);

% Calcular a Transformada de Fourier Discreta (DFT) do sinal de áudio
dft_sinal = fft(m);

% Calcular a frequência correspondente a cada ponto na DFT
frequencia = (0:(length(m))-1) * (fs / length(m));

impulso_dirac = zeros(size(dft_sinal));

frequencia_deslocar = 30000;

impulso_dirac(frequencia_deslocar) = 1;

%sinal1conv = reshape(dft_sinal, [], 1);
%sinal2conv = reshape(impulso_dirac, [], 1);

%dft_sinal_conv = dft_sinal .* impulso_dirac;
dft_sinal_conv = conv2(dft_sinal, impulso_dirac);
%dft_sinal_conv = conv(sinal1conv, sinal2conv);

filter = zeros(size(dft_sinal_conv));

filter(1:28000) = 1;

dft_sinal_conv_filtrado = dft_sinal_conv .* filter;


% Plotar o espectro de frequência
figure;plot(frequencia, abs(dft_sinal));
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Espectro de Frequência');
figure;plot(m);
figure;plot(abs(dft_sinal_conv_filtrado));


%{
figure;
subplot(1, 4, 1);
plot(t, m);
title('Sinal Senoidal de 5 Hz');

% Plotar o segundo subplot (1 linha, 4 colunas, segundo subplot)
subplot(1, 4, 2);
plot(t, sinal2);
title('Sinal Cossenoidal de 10 Hz');

% Plotar o terceiro subplot (1 linha, 4 colunas, terceiro subplot)
subplot(1, 4, 3);
plot(t, sinal3);
title('Sinal Quadrado de 15 Hz');

% Plotar o quarto subplot (1 linha, 4 colunas, quarto subplot)
subplot(1, 4, 4);
plot(t, sinal4);
title('Sinal Dente de Serra de 20 Hz');

%}


%sound(m, fs);


