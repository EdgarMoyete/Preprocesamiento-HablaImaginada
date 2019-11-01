%Edgar Moises Hernandez-Gonzalez
%07/06/19-10/07/19
%Filtrado de las señales EEG (filtro FIR pasa bajas de 32Hz)
%Se debe ejecutar este script para cada sujeto (son 15 sujetos)
%Se deben cargar antes los datos de habla imaginada

datos = TodoSuj15;

[f, c] = size(datos);
datosFiltrados = []; %aqui guardaremos las señales filtradas
for i=1:f
    muestra = datos(i,:); %selecciona la fila i (muestra num i)
    muestraFiltrada = [];
    indiceInicio = 1;
	indiceFin = 4096;
    for j=1:6 %numero de canales
        canal=muestra(indiceInicio:indiceFin);
        filtro=filtrar(1024, 32, canal);
        muestraFiltrada = [muestraFiltrada filtro];
        indiceInicio = indiceInicio + 4096;
        indiceFin = indiceFin + 4096;
    end
    datosFiltrados = [datosFiltrados; [muestraFiltrada muestra(24577)]]; %se van concatenando las muestras filtradas y la etiqueta
    if mod(i,100)==0 %imprimir el contador cada 100 iteraciones para observar el avance
        disp(i);
    end
end
%csvwrite('EEGFiltradosxx.csv',datosFiltrados);

function senalFiltrada = filtrar(fs, fCorte, senal)
    Fnorm=fCorte/(fs/2);
    %t=(0:tamanoSenal-1)/Fs;
    
    %FIR (window) fase 0
    dfFIR = designfilt('lowpassfir','FilterOrder',70,'CutoffFrequency',Fnorm);
    senalFiltrada = filtfilt(dfFIR,senal);
end