# -*- coding: utf-8 -*-
"""
Created on Sun Aug 27 03:01:54 2017

@author: alisson
"""

import numpy as np           #importando as bibliotecas necessárias:
import matplotlib.pyplot as plt 
import scipy.io.wavfile as wv 
import os

                             # Parâmetros da onda:
tf = 1                       # Tempo de duração da nota
fc = 512                     # Frequência da nota Dó
fs = 100*fc                  # Frequencia de amostragem da nota. 
t =np.arange(0,tf+1/fs,1/fs) # Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1     

yDo=A*np.cos(2*np.pi*fc*t)                   # Amplitude do sinal
yRe=A*np.cos(2*(9/8)*np.pi*fc*t)     # Sinal senoidal
yMi=A*np.cos(2*(5/4)*np.pi*fc*t)
yFa=A*np.cos(2*(4/3)*np.pi*fc*t)
ySol=A*np.cos(2*(3/2)*np.pi*fc*t)
yLa=A*np.cos(2*(5/3)*np.pi*fc*t)
ySi=A*np.cos(2*(15/8)*np.pi*fc*t)

plt.figure(1,figsize=[10,7]) # cria instância da figura para poder alterar seu tamanho
plt.plot(t,yDo)
plt.plot(t,yRe)
plt.plot(t,yMi)
plt.plot(t,yFa)
plt.plot(t,ySol)
plt.plot(t,yLa)
plt.plot(t,ySi)       
plt.legend(['Do','Re','Mi','Fa','Sol','La','Si'])         # Visualizar o sinal gerado  
plt.axis([0,0.0016,-2,2])      # Zoom para melhor visualização  
plt.show() 

#importando e armazenando o arquivo de áudio numa variável
som = wv.read('./sound_01.wav',True)

#salvando o tom gerado em um arquivo de extensão .wav :
wv.write('./tom_gerado2.wav',fs,yDo)
#reproduzindo o arquivo

os.system('cvlc --play-and-exit ./tom_gerado2.wav') 
#vlc chama o programa VLC Audio Player
#'c' serve para que nenhuma interface seja aberta