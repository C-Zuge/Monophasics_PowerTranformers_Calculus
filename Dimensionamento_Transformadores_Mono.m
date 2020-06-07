clear; clc; close all;

% Projeto de transformadores 

W1 = 600; % Potencia do transformador (VA)
Vb = 127; % Tensão do lado de Baixa (V)
Va = 600; % Tensão do lado de Alta (V)
Freq  = 60;  % Frequencia a ser utilizada (Hz)
Bm = 11300; %  Indução máxima no ferro em Gauss

W2 = W1*1.1; % Potência a ser utilizada, conta +10% para perdas totais (VA)
Dens_corrente = 2.5; % Densidade de corrente (A/mm2)

Ib=W2/Vb; % Corrente de Baixa (A)
Ia=W2/Va; % Corrente de Alta (A)

Sb = 1.1*Ib/Dens_corrente; % Seção do condutor secundário (mm2)
Sa = Ia/Dens_corrente; % Seção do condutor primário (mm2)
Sm = 7.5*sqrt(W2/Freq); % Seção magnética (cm2)
Sg = 1.1*Sm; % Seção Geométrica da perna central do transformador (cm2)

% Nb = Vb*33.5/Sm; % Numero de espiras do enrolamento de Baixa (Espiras)
% Na = 1.1*Va*33.5/Sm; % Numero de espiras do enrolamento de Alta (Espiras)
Nb = (Vb*10^8)/(4.44*Freq*Sm*Bm);
Na = 1.1*(Va*10^8)/(4.44*Freq*Sm*Bm);

%----------------------------------------------------------------------------------------------------------------------------------------------------------
% Dimensões físicas do transformador

a = sqrt(Sg); % Dimensão linear que resulta na Seção Geométrica, supomos que seja um quadrado (cm)
Sj = 0.75*100*a^2; % Área da Janela em (mm2)
Pc = a; % Tamanho da Perna central (cm)
Altura_LaminaE = 2*a;
Altura_LaminaI = 0.5*a;
Comprimento = 3*a;

sprintf('Take the values and compare with an existing laminated core!!')
