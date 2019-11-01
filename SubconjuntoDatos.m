%Edgar Moises Hernandez-Gonzalez
%05/06/19-09/07/19
%Subconjunto de datos de la base de datos de habla imaginada
%Se guardan los 6 canales y la etiqueta del comando
%Modalidad = Imaginada, Estimulos = Comandos(>5)
%y Artefactos = 1(no parpadeo)
%Se debe ejecutar este script para cada sujeto (son 15 sujetos)

clear
clc

[archivo,ruta] = uigetfile('*.mat','Seleccione un archivo'); %regresa 2 cadenas la de la ruta del archivo y el nombre del archivo
cadena=strcat(ruta,archivo); %concatenar las 2 cadenas
load(cadena); %carga el archivo seleccionado

datos=[];
[f,c]=size(EEG);
for i=1:f
    registro=EEG(i,:); %obtener la muestra con los 6 canales
    modalidad=registro(24577);
    estimulo=registro(24578);
    %artefactos=registro(24579);
    if(modalidad == 1 && estimulo > 5) % && artefactos == 1
        etiqueta = estimulo - 6; %para que las etiquetas queden de 0 a 5
        datos=[datos;[registro(1:24576) etiqueta]];
    end
end
%csvwrite('TodoSujxx.csv',datos);