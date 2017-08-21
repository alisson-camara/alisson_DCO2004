close all;clc;clear all;                                          % Limpa vari�veis e fecha todos os gr�ficos
soundFile = ['sound_01.wav'];                                     % Especifica do local e nome do arquivo de �udio
[vtSom, dFa] = audioread(soundFile);                              % Abre arquivo de �udio de um arquivo
% vtSom: amplitude das amostras de som
vtSom = 4*vtSom;
% dFa: frequ�ncia de amostrasgem do som (amostragem no tempo)
sInfo = audioinfo(soundFile);
dta = 1/dFa;                                                      % Tempo entre amostras
dTFinal = (length(vtSom)-1)*dta;                                  % Tempo da �ltima amostra do sinal de �udio
vtTSom = 0:dta:dTFinal;                                           % Eixo temporal do arquivo de �udio
plot(vtTSom,vtSom);                                               % Plota gr�fico do �udio
set(gcf,'color',[1 1 1]);                                         % Configura �rea da figura
set(gca,'FontWeight','bold','FontSize',12);                       % Configura �rea do gr�fico
title(['Sinal de �udio']);                                        % Configura t�tulo do gr�fico
ylabel('Amplitude');                                              % Configura eixo X do gr�fico
xlabel('Tempo (s)');                                              % Configura eixo Y do gr�fico
p = audioplayer(vtSom, 1*dFa);                                    % Reproduzir arquivo de �udio
play(p);                                                          % Reproduzir arquivo de �udio
% Mostra informa��es gerais sobre o arquivo
disp(['Amostragem:']);
disp([' Taxa de amostragem = ' num2str(dFa) ' Hz']);
disp([' Tempo entre amostras = ' num2str(dta) ' Segundos']);
disp(' ');
disp(['Quantiza��o e Codifica��o:']);
disp([' N�mero de bits por amostra = ' num2str(sInfo.BitsPerSample) ' bits']);
disp(' ');
disp(['Informa��es gerais do arquivo de �udio:']);
disp([' Nome do Arquivo = ' sInfo.Filename]);
disp([' N�mero de canais = ' num2str(sInfo.NumChannels)]);
disp([' N�mero de amostras = ' num2str(sInfo.TotalSamples) ' amostras']);
disp([' Dura��o = ' num2str(sInfo.Duration) ' segundos']);