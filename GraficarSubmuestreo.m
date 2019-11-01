%Edgar Moises Hernandez Gonzalez
%10/06/19
%Comparacion de la señal filtrada y la submuestreada 8 veces
%Se deben importar los datos de las señales filtradas y las del submuestreo
%(de preferencia solo importar el canal de la muestra que se desea
%analizar)
%para este ejemplo importare toda la muestra con los 6 canales

muestraFiltrada = EEGFiltrados01;
canalFiltrado = muestraFiltrada(16385:20480); %canal P3

muestraSubmuestreo = Submuestreo01;
canalSubmuestreo = muestraSubmuestreo(2049:2560); %canal P3 submuestreo

fsFiltrada = 1024;
[f, tamanoSenalFiltrada] = size(canalFiltrado);
tFiltrada = (1:tamanoSenalFiltrada) / fsFiltrada;

fsSubmuestreo = 128;
[f2, tamanoSenalSubmuestreo] = size(canalSubmuestreo);
tSubmuestreo = (1:tamanoSenalSubmuestreo) / fsSubmuestreo;

plot(tFiltrada, canalFiltrado, tSubmuestreo, canalSubmuestreo, 'linewidth', 1.5);
grid
title('Submuestreo de 8 Sujeto 1 "Abajo" canal P3');
xlabel('Tiempo');
ylabel('Amplitud');
legend('Señal P3 Filtrada','Submuestreo de 8');