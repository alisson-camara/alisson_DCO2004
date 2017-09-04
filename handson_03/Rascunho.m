close all;clc;clear all;                                          % Limpa variáveis e fecha todos os gráficos
soundFile = ['./Flauta.wav'];             % Especifica do local e nome do arquivo de áudio
[vtSom, dFa] = audioread(soundFile);                              % Abre arquivo de áudio de um arquivo
% vtSom: amplitude das amostras de som
% dFa: frequência de amostrasgem do som (amostragem no tempo)
dta = 1/dFa;                                                      % Tempo entre amostras
dTFinal = (length(vtSom)-1)*dta;                                  % Tempo da última amostra do sinal de áudio
vtTSom = 0:dta:dTFinal;                                            % Eixo temporal do arquivo de áudio
subplot(2,1,1)
plot(vtTSom,vtSom);                                               % Plota gráfico do áudio
set(gcf,'color',[1 1 1]);                                         % Configura área da figura
set(gca,'FontWeight','bold','FontSize',12);                       % Configura área do gráfico
title(['Sinal de Áudio']);                                        % Configura título do gráfico
ylabel('Amplitude');                                              % Configura eixo X do gráfico
xlabel('Tempo (s)');                                        % Configura eixo Y do gráfico
axis([ 0 0.022 -0.5 0.5]);
%p = audioplayer(vtSom, 1*dFa);                                    % Reproduzir arquivo de áudio
%play(p);
%---------------------------------------------------------------------------
%% Geração do sinal cosenoidal
fsampling = dFa;                                               % Taxa de amostragem
tf = dta;                                                     % Tempo entre amostras
t = 0 : (1/fsampling) : tf;                                   % Eixo do tempo
%fm = 0.04;                                                    % Frequência da senoide
%Am = 2;                                                       % Amplitude da senoide
%m = Am*cos(2*pi*fm*t);                                        % Sinal senoidal
%t1=tic;                                                       % Contador de tempo

%% Visualizando a amplitude do espectro com um tamanho arbitrário para a fft
lfft = 2^nextpow2(length(vtSom));                                       % Tamanho da FFT  
% Construção do single-sided amplitude spectrum.
yfft = fft(vtSom,lfft)/lfft;                                      % Cálculo da FFT via função do Matlab
freq1 = [0 : fsampling/lfft : fsampling/2 - fsampling/lfft];  % Definição do eixo das frequências unilateral
yfftuni = yfft(1:lfft/2);
% Coleta da FFT unilateral
 
subplot(2,1,2)
plot(freq1,abs(yfftuni));                                     % Plotagem do espectro unilateral M(f)
%tempo_FFT=toc(t1);                                            % Conta tempo de execução até esse ponto do código
%disp(['Tempo da FFT = ' num2str(tempo_FFT)]);                 % Mostra de tempo de execução
title('Amplitude unilateral do Espectro de m(t)');            % Configuração do título do gráfico 
xlabel('Frequencia (kHz)');                                   % Configuração do eixo x do gráfico 
ylabel('|M(f)|');                                             % Configuração do eixo y do gráfico  
grid on;                                                      % Adiona o grid 
axis([ 1200 1400 0 0.06]); 