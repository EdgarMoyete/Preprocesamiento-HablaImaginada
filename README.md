# Preprocesamiento de los proyectos EEG-DWT-NeuralNetwork-PSO y HablaImaginada-DeepLearning
--------------------------------------------------
## Codigo
--------------------------------------------------
### SubconjuntoDatos.m
Datos con modalidad=imaginada, estimulo=comandos y sin parpadeo

### GraficarEEG.m
Graficar dos muestras arriba(muestra 8) y abajo(muestra 10)

### Filtro32Hz.m
Filtro FIR pasa bajas de 32Hz

### FFTCompararSenal.m
Comparar señales normales y filtradas y comparar su espectro con FFT

### Submuestreo.m
Submuestreo de 8

### GraficarSubmuestreo.m
Comparar la señal filtrada con la submuestreada

### DWTEstadistica.m
Media, desviacion estandar y varianza de delta, theta y alfa con DWT

--------------------------------------------------
## Datos
--------------------------------------------------
datosSujxx = 15 subconjuntos de cada sujeto

EEGFiltradosxx = 15 EEGs filtrados de cada subconjunto

Submuestreoxx = 15 submuestreos de cada EEGs filtrados

SubmuestreoUnion = Union de los 15 submuestreos

CaracteristicasSubxx = Caracteristicas de cada sujeto

CaracteristicasHI = Union de las archivos caracteristicas

TodoSujxx = Datos de cada sujeto

TodoFiltraxx = Datos filtrados de cada sujeto

TodoSubmuesxx = Datos con submuestreo de 8 de cada sujeto

Nota: Los archivos que empiezan con el prefijo todo son sin eliminar parpadeo