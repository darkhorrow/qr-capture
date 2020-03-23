# <center>CIU - Práctica 6</center>

## Contenidos

* [Autoría](#autoría)
* [Introducción](#introducción)
* [Controles](#controles)
* [Implementación](#implementación)
* [Animación del programa](#animación-del-programa)
* [Códigos QR usables](#códigos-qr-usables)
* [Referencias](#referencias)

## Autoría

Esta obra es un trabajo realizado por Benearo Semidan Páez para la asignatura de Creación de Interfaces de Usuario cursada en la ULPGC.

## Introducción

El objetivo de esta práctica consiste en implementar en Processing una combinación de entrada/salida que use la captura de vídeo como método de interacción.

En este caso, se ha implementado un lector de QR que puede mostrar un GIF animado de Pokemon, hasta un total de dos (con fin de simular un combate).

Los códigos QR usables se muestran más [aquí](#códigos-qr-usables).

## Controles

Basta con mostrar los 2 QR que se quieran usar de entre los disponibles para que se muestre ambos Pokemon animados.

## Implementación

La implementación usa las librerías disponibles desde Processing de video, audio y qr code. Debido a que la webcam disponble para desarollar es bastante mala, no se pudo optar por realizar la idea inicial, que consistía en realizar una pequeña demo de realidad aumentada.

Los QR almacenan el nombre de un Pokemon (charmander, squirtle o bulbasaur), el cual se usa para crear una clase usando determinadas imágenes para la animación.

El código para la animación se encuentra en utils.pde.

El primer Pokemon escaneado mirará a la derecha, mientras que el segundo lo hará a la derecha. Esto se logra con:

```java
scale(-1.0, 1.0);
```
De esta manera, no necesitamos dos sets de imágenes.

## Animación del programa

![GIF](assets/animation.gif)

## Códigos QR usables

| Código QR | Pokemon |
| -- | -- |
| ![charmander](assets/cqr.png) | ![charmander](https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png) |
| ![bulbasaur](assets/bqr.png) | ![bulbasaur](https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png) |
| ![squirtle](assets/sqr.png) | ![squirtle](https://vignette.wikia.nocookie.net/es.pokemon/images/e/e3/Squirtle.png/revision/latest?cb=20160309230820) |




## Referencias

<b>[[Animación]](https://processing.org/examples/animatedsprite.html)</b>

<b>[[Referencia de Processing]](https://processing.org/reference/)</b>
