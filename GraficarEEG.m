%Edgar Moises Hernandez-Gonzalez
%10/06/19-18/10/19
%Graficar dos muestras (arriba[8] y abajo[10]) del sujeto 1

%para graficar una muestra en este caso se toman los primeros ejemplos encontrados
%(con el sujeto 1 (8=arriba[etiqueta=0] y 10=abajo[etiqueta=1])
%se deben importar antes los datos (importar solo la muestra (fila) de interes)

muestra = datosSuj01;
f3 = muestra(1:4096);
f4 = muestra(4097:8192);
c3 = muestra(8193:12288);
c4 = muestra(12289:16384);
p3 = muestra(16385:20480);
p4 = muestra(20481:24576);

Fs = 1024;
[f, tamanoSenal] = size(f3);
t = (1:tamanoSenal) / Fs;

plot(t, f3);
grid on
hold on
plot(t, f4);
plot(t, c3);
plot(t, c4);
plot(t, p3);
plot(t, p4);
legend('f3', 'f4', 'c3', 'c4', 'p3', 'p4');
title('Subject 1 imagining Above"'); %arriba
%title('Sujeto 1 imaginando "Abajo"'); %abajo
xlabel('time');
ylabel('amplitude');
hold off