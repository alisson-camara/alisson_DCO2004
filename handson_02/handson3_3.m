close all;clc;clear all;                                          % Limpa vari�veis e fecha todos os gr�ficos
soundFile = ['sound_02.wav'];             % Especifica do local e nome do arquivo de �udio
[vtSom, dFa] = audioread(soundFile);                              % Abre arquivo
tf = 10;                                                          % Tempo que deseja tocar o arquivo
amostrasTf = ceil(tf*dFa);                                        % N�mero de amostras para o tempo especificado
vtSom = vtSom(1:amostrasTf,:);                                    % Considera somente as amostras para o tempo especificado
dta = 1/dFa;                                                      % Tempo entre amostras
dTFinal = (length(vtSom)-1)*dta;                                  % Tempo da �ltima amostra do sinal de �udio
vtTSom = 0:dta:dTFinal;                                           % Eixo temporal do arquivo de �udio
subplot(3,1,1);                                                   % Primeiro gr�fico do subplot
plot(vtTSom,vtSom);                                               % Plota gr�fico do �udio
set(gcf,'color',[1 1 1]);                                         % Configura �rea da figura
set(gca,'FontWeight','bold','FontSize',12);                       % Configura �rea do gr�fico
title(['Sinal de �udio']);                                        % Configura t�tulo do gr�fico
ylabel('Amplitude');                                              % Configura eixo X do gr�fico
xlabel('Tempo (s)');                                              % Configura eixo Y do gr�fico
p = audioplayer(vtSom, 1*dFa);                                    % Reproduzir arquivo de �udio
play(p);
pause(tf);
%% Modifica o arquivo incluindo eco (uma r�plica atrasada do sinal oirginal)
n = 300;                                                          % Atraso da r�plica do sinal                                                          
vtSomEco = vtSom + [zeros(n,2); vtSom(1:end-n,:)];                % Gera��o da r�plica e soma com sinal original
subplot(3,1,2);                                                   % Segundo gr�fico do subplot
plot(vtTSom,vtSomEco);                                            % Plota gr�fico do �udio
set(gcf,'color',[1 1 1]);                                         % Configura �rea da figura
set(gca,'FontWeight','bold','FontSize',12);                       % Configura �rea do gr�fico
title(['Sinal de �udio + R�plica']);                              % Configura t�tulo do gr�fico
ylabel('Amplitude');                                              % Configura eixo X do gr�fico
xlabel('Tempo (s)');                                              % Configura eixo Y do gr�fico
p = audioplayer(vtSomEco, 1*dFa);                                 % Reproduzir arquivo de �udio
play(p);
subplot(3,1,3);                                                   % Terceiro gr�fico do subplot
plot(vtTSom,vtSom-vtSomEco);                                      % Plota gr�fico do �udio
set(gcf,'color',[1 1 1]);                                         % Configura �rea da figura
set(gca,'FontWeight','bold','FontSize',12);                       % Configura �rea do gr�fico
title(['Sinal R�plica']);                                         % Configura t�tulo do gr�fico
ylabel('Amplitude');                                              % Configura eixo X do gr�fico
xlabel('Tempo (s)');       