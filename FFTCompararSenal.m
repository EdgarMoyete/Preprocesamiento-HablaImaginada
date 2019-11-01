%Edgar Moises Hernandez Gonzalez
%10/06/19
%Comparacion de las señales normales y las filtradas
%Transformada Rapida de Fourier
%Se deben importar los datos originales y los filtrados
%(de preferencia solo importar el canal de la muestra que se desea
%analizar)
%para este ejemplo importare toda la muestra con los 6 canales

muestra = datosSuj01;
canal = muestra(16385:20480); %canal P3

muestraFiltrada = EEGFiltrados01;
canalFiltrado = muestraFiltrada(16385:20480); %canal P3 filtrado

Fs = 1024;
[f, tamanoSenal] = size(canal);
t = (1:tamanoSenal) / Fs;

plot(t, canal, t, canalFiltrado, 'linewidth', 1.5);
grid
title('Señal filtrada Sujeto 1 "Abajo" canal P3');
xlabel('Tiempo');
ylabel('Amplitud');
legend('Señal Original P3','Filtro pasa bajas a 32Hz');

[P1Original, fOriginal] = transformadaFourier(canal, Fs);
[P1Filtrada, fFiltrada] = transformadaFourier(canalFiltrado, Fs);
figure
subplot(2, 1, 1);
plot(fOriginal, P1Original);
title('FFT Sujeto 1 "Abajo" canal P3 Original');
xlabel('Frecuencia');
ylabel('Amplitud');
legend('FFT de Señal Original P3');
axis([0 50 0 5]);
grid;
subplot(2, 1, 2);
plot(fFiltrada, P1Filtrada);
title('FFT Sujeto 1 "Abajo" canal P3 Filtrada');
xlabel('Frecuencia');
ylabel('Amplitud');
legend('FFT de Señal P3 Filtrada');
axis([0 50 0 5]);
grid;

function [P1, f] = transformadaFourier(senal, fs)
    [f, tamanoSenal]=size(senal);
    Y = fft(senal);
    %Calcule el espectro bilateral P2. A continuación, calcule el espectro
    %unilateral P1 basado en P2 y la longitud de la señal de valor uniforme L
    P2 = abs(Y/tamanoSenal);
    P1 = P2(1:floor(tamanoSenal/2+1));
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:(tamanoSenal/2))/tamanoSenal;
end