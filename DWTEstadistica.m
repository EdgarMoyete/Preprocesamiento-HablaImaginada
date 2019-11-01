%Edgar Moises Hernandez-Gonzalez
%10/06/19-17/06/19
%Extraccion de caracteristicas con la Transformada Discreta Wavelet (DWT)
%media, desviacion estandar y varianza de delta, theta y alfa

clear
clc

datos = csvread('Submuestreo15.csv');

[f, c] = size(datos);
caracteristicasHI = []; %aqui guardaremos las señales filtradas
for i=1:f
    muestra = datos(i,:); %selecciona la fila i (muestra num i)
    vectorCaracteristicas = [];
    indiceInicio = 1;
	indiceFin = 512;
    for j=1:6 %numero de canales
        canal=muestra(indiceInicio:indiceFin);
        statDWT=statTransformadaWavelet(canal);
        vectorCaracteristicas = [vectorCaracteristicas statDWT];
        indiceInicio = indiceInicio + 512;
        indiceFin = indiceFin + 512;
    end
    caracteristicasHI = [caracteristicasHI; [vectorCaracteristicas muestra(3073)]]; %se van concatenando las muestras filtradas y la etiqueta
end
%csvwrite('CaracteristicasSujxx.csv',caracteristicasHI);

function vectorCaracteristi = statTransformadaWavelet(senal)
    %Descomposicion Wavelet multinivel 1-D (DWT) en 3 niveles con Daubechies 4
    [c,l] = wavedec(senal,3,'db4');
    delta=appcoef(c,l,'db4',3); %Coeficiente de aproximacion 3 0Hz-4Hz
    theta=detcoef(c,l,3); %Coeficiente de detalle 3 4Hz-8Hz
    %Coeficiente de detalle 2 (8Hz-16Hz), de aqui sacar alfa (8Hz-12Hz)
    cD2=detcoef(c,l,2);
    % Transformada Wavelet (DWT) de un nivel a cD2 para obtener alfa (8Hz-12Hz)
    [alfa,cD]=dwt(cD2,'db4'); %Descomposicion 1-D (cA=alfa)
    vectorCaracteristi = [mean(delta) std(delta) var(delta) mean(theta) std(theta) var(theta) mean(alfa) std(alfa) var(alfa)];
end