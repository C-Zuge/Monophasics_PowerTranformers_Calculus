clear; clc; close all;

% Projeto de transformadores 

W1 = 600; % Potencia do transformador (VA)
Vb = 127; % Tensão do lado de Baixa (V)
Va = 600; % Tensão do lado de Alta (V)
Freq  = 60;  % Frequencia a ser utilizada (Hz)
Bm = 11300; %  Indução máxima no ferro em Gauss

W2 = W1*1.1; % Potência a ser utilizada, conta +10% para perdas totais (VA)
Dens_corrente = 3; % Densidade de corrente (A/mm2)

Ib=W2/Vb; % Corrente de Baixa (A)
Ia=W2/Va; % Corrente de Alta (A)

Sb = 1.1*Ib/Dens_corrente; % Seção do condutor secundário (mm2)
Fiob = 'Cobre esmaltado AWG-21 (0.407mm2)'
Dfb = 0.719;
Sa = Ia/Dens_corrente; % Seção do condutor primário (mm2)
Fioa = 'Cobre esmaltado AWG-14 (2.09mm2)'
Dfa = 1.631;
Sm = 7.5*sqrt(W2/Freq); % Seção magnética (cm2)
Sg = 1.1*Sm; % Seção Geométrica da perna central do transformador (cm2)

% Nb = Vb*33.5/Sm; % Numero de espiras do enrolamento de Baixa (Espiras)
% Na = 1.1*Va*33.5/Sm; % Numero de espiras do enrolamento de Alta (Espiras)
Nb = (Vb*10^8)/(4.44*Freq*Sm*Bm);
Na = (Va*10^8)/(4.44*Freq*Sm*Bm);

Sfios=(Sb*Nb)+(Sa*Na);% Área ocupada pelos fios (cm2)

%----------------------------------------------------------------------------------------------------------------------------------------------------------
% Dimensões físicas do transformador

a = sqrt(Sg); % Dimensão linear que resulta na Seção Geométrica, supomos que seja um quadrado (cm)
Sj = 0.75*100*a^2; % Área da Janela em (mm2)
Area_Livre = 0.5*a^2;
Altura_LaminaE = 2*a;
Altura_LaminaI = 0.5*a;
Comprimento = 3*a;

Viabilidade=Sj/Sfios;
message='';

if (Viabilidade>2.8)
    if (3.2>=Viabilidade&&Viabilidade>=3)
        message=' Congrats, You project can be executed!';
    else
        if(3.4>=Viabilidade&&Viabilidade>3.2)
            message=' There are some free space but can be executed! You should review the Current Density, Line section or Voltage';
        else
            if (Viabilidade>3.4)
                message=' There are a lot of free space!! You should review the Current Density, Line section or Voltage';
            else
                message=' There is a possibility of not enaugh space to wind the wires into core';
            end
        end
    end
else
    message='There is no way to execute this at all ';
end

sprintf(strcat('Reminder: Take the values and compare with an existing laminated core!!', '\nStatus:',message))
