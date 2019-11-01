%Edgar Moises Hernandez Gonzalez
%09/06/19-10/07/19
%Submuestreo de 8
%Se debe ejecutar este script para cada sujeto (son 15 sujetos)
%Se deben importar los datos antes de ejecutar

datos = TodoFiltra15;

[f, c] = size(datos);
datosSubmuestreados = []; %aqui guardaremos las señales submuestreadas
for i=1:f
    muestra = datos(i,:); %selecciona la fila i (muestra num i)
    muestraSubmuestreo = [];
    indiceInicio = 1;
	indiceFin = 4096;
    for j=1:6 %numero de canales
        canal=muestra(indiceInicio:indiceFin);
        submuestreo=downsample(canal,8);
        muestraSubmuestreo = [muestraSubmuestreo submuestreo];
        indiceInicio = indiceInicio + 4096;
        indiceFin = indiceFin + 4096;
    end
    datosSubmuestreados = [datosSubmuestreados; [muestraSubmuestreo muestra(24577)]]; %se van concatenando las muestras filtradas y la etiqueta
end
%csvwrite('Submuestreoxx.csv',datosSubmuestreados);