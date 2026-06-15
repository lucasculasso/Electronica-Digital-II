# Proyecto: Seguidor de Luz
> **Asignatura:** Electrónica Digital II - Universidad Nacional de Córdoba
## **Integrantes del grupo:**
1) CASTELLANI, Luciano
2) CULASSO, Lucas José
3) RODRIGUEZ MUÑOZ, María Azul
>**Profesor: Marcos Blasco**

## 1. Descripción y propósito del proytecto:
El mismo es un seguidor de luz, compuesto por 4 sensores LDR, 2 servomotores SG90 de 180°, dos displays de 7 segmentos cátodo común y un pulsador.
El objetivo es adquirir las señales de luz captadas por los sensores y dirigir los servomotores hacia la fuente emisora de luz, buscando un balance,
al mismo tiempo que se envía la posición de los mismos a los displays. Por otra parte, si es presionado el pulsador, se transmite hacia una PC esa misma posición. 
Este proyecto puede ser extrapolable a la instalación de un panel solar que rastree el movimiento del sol.
### Alcances del proyecto:
* **El sistema puede:**
  1) Rastrear una fuente de luz.
  2) Transmitir la posicion de los servomotores a displays.
  3) Transmitir la posicion de los servomotores a PC.
* **El sistema no puede:**
  1) Rastrear luz 360°, en ambos ejes.
  2) Funcionar solamente con la alimentacion vía USB.
### Posibles Etapas Siguientes:
* Armar el circuito en una PCB.
* En caso de llevarse a paneles solares, usar modo de reposo durante la noche.
* Previo al modo reposo del caso previo, cargar baterías.
* Implementar una App Web para seguir el consumo, posición, avisos del sistema.
* Transmitir datos mediante Bluetooth o Wi-Fi.
## 2. Arquitectura del sistema:
### Hardware:
### Software:
## 3. Especificaciones:
* **Tensión de alimentación:**
  1) 3.3V para el PIC 16F887.
  2) 5V para los servomotores.
* **Método de alimentación:**
  1) Vía USB para el PIC.
  2) Fuente externa de alimentacion de DC.
###Entorno:
* **Entorno de desarrollo:** MPLAB X IDE v.5.35, compilador XC8.
*  **Hardware de programación:** Conexion directa de TX y RX al PIC, no se utilizó ningún PICKit.
*  **Configuración de Bits:**
  1) *Oscilador:* XT (Cristal Externo de 4MHz)
  2) *Watchdog Timer (WDT):* OFF
  3) *Master Clear (MCLRE):* ON
  4)  ----REVISAR


