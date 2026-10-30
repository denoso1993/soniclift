# SoundBlast

**Más volumen en cualquier dispositivo — sin controlador virtual.**

[English](README.md) · [Português](README.pt-BR.md) · **Español**

![Plataforma](https://img.shields.io/badge/platform-Windows%2010%2F11%20x64-0078D6?style=flat-square)
![Versión](https://img.shields.io/badge/version-1.2.0-2ea44f?style=flat-square)
![Licencia](https://img.shields.io/badge/license-Proprietary-red?style=flat-square)

<p align="center">
  <img src="screenshot.png" width="520" alt="SoundBlast">
</p>

SoundBlast es un **APO nativo de Windows** (Audio Processing Object) que aplica
ganancia y limitador **dentro** del dispositivo de salida. **No crea una tarjeta
de sonido virtual, no agrega un dispositivo extra y no pone un controlador en
medio.** Windows sigue cambiando entre auriculares, altavoz Bluetooth, USB y
HDMI — y el efecto acompaña al dispositivo.

## ¿Por qué otro booster de volumen?

- Los altavoces de portátil y Bluetooth suelen ser **demasiado bajos**.
- Los controladores virtuales agregan una capa y un “dispositivo” más.
- Las herramientas APO potentes existen, pero son **complejas** para la mayoría.
- Las herramientas fáciles suelen usar un dispositivo virtual, que puede
  interferir con el cambio de dispositivo que ya funciona.

SoundBlast hace lo contrario: **un interruptor, hasta +30 dB con limitador, en el
dispositivo que Windows ya está usando**.

## Destacados

- **Ganancia hasta +30 dB** con limitador siempre activo.
- **Ecualizador de 10 bandas** con presets (Flat, Music, Gaming, Bass, Voice, Movie).
- **Graves, Surround y Claridad** para un ajuste rápido y amigable.
- **Headroom automático** para que el EQ no recorte.
- **Importar/exportar perfiles de EQ** para guardar y compartir ajustes.
- Se aplica a **todos los dispositivos reales activos** por defecto (USB,
  Bluetooth, HDMI, S/PDIF).
- **Aislar por dispositivo** con lista sin duplicados.
- **Sigue el cambio de dispositivo de Windows** — sin dispositivo virtual.
- **Ganancia en vivo**: el slider aplica al instante.
- **Iniciar con Windows**, bandeja, instancia única, aviso al minimizar.
- **Inglés (por defecto), portugués y español**.
- **Sin red, sin telemetría, sin recolección de datos.**

## SoundBlast vs. alternativas

| | **SoundBlast** | **FxSound** | **Equalizer APO** | **Boom 3D** | **SteelSeries Sonar** |
|---|---|---|---|---|---|
| APO nativo (sin dispositivo virtual) | ✅ Sí | ❌ Dispositivo virtual | ✅ Sí | ❌ Dispositivo virtual | ❌ Dispositivo virtual |
| Aumento de volumen | ✅ hasta +30 dB | ✅ | ✅ preamp | ✅ | ✅ |
| Limitador | ✅ siempre activo | ✅ | ➖ manual | ✅ | ✅ |
| Ecualizador | ✅ 10 bandas | ✅ 9 bandas | ✅ avanzado / VST | ✅ 31 bandas | ✅ 10 bandas |
| Presets | ✅ 6 incluidos | ✅ | ➖ manual | ✅ | ✅ |
| Graves / Surround / Claridad | ✅ | Solo graves / limitado | ⚙️ filtros | ✅ | ✅ |
| Control por app | ➖ por dispositivo | ➖ limitado | ⚙️ vía config | ✅ | ✅ |
| Idiomas | ✅ EN / PT / ES | EN | EN | EN (+ varía) | EN |
| Red / telemetría | ✅ ninguna | open-source | open-source | varía | cuenta / varía |
| Precio | **Gratis (personal)** | Gratis | Gratis | Pago | Gratis (hardware) |

> **Nota honesta:** SoundBlast ahora incluye **EQ de 10 bandas, presets, Graves,
> Surround y Claridad**, con headroom automático para no recortar. No es una
> herramienta de 31 bandas/VST — el foco es la experiencia simple y nativa en el
> dispositivo, con un limitador real.

## Funciona con todas las apps

SoundBlast procesa **audio en modo compartido en dispositivos reales** — juegos,
navegadores, música, sonidos del sistema, apps de comunicación y varias apps a
la vez.

Límites técnicos:

- Apps en **WASAPI exclusive / ASIO** ignoran cualquier APO.
- **DRM / audio protegido** puede rechazar el audio por
  `DisableProtectedAudioDG=1`.
- Apps **ruteadas a un dispositivo virtual** (FxSound, Voicemeeter, VB-Audio)
  quedan fuera. Mantenlas en *Default* / dispositivo real.
- El **Mezclador de volumen** de Windows solo lista apps con sesión activa; que
  no aparezca no es un bug.

## Instalación

1. Descarga el instalador en [Releases](https://github.com/denoso1993/soundblast/releases).
2. Ejecuta `SoundBlastSetup-*.exe` como **Administrador**.
3. Abre SoundBlast, deja **On**, ajusta la ganancia y, si quieres, marca
   *Iniciar con Windows*.

Requisitos: Windows 10/11 **x64**. El APO **no está firmado**.

## Seguridad y transparencia

- Consulta [SECURITY.md](SECURITY.md): claves de registro, archivos y tarea que
  cambia el app, y cómo desinstalar.
- **Sin red, sin telemetría, sin recolección de datos.**
- Hashes: [SHA256SUMS.txt](SHA256SUMS.txt).
- Contenido con DRM puede rechazar el audio; apps en modo exclusivo ignoran el
  APO.

## Donación

¿Te gustó la app? Dona a esta dirección **crypto**:

```
0xcBf21D49f65ca55228310344bE91F607d8d09309
```

## Autor

Desarrollado por **Denis de Oliveira Ramos** — https://github.com/denoso1993

## Licencia

Propietaria (All Rights Reserved). Prohibida la copia, redistribución,
modificación o ingeniería inversa sin autorización. Ver [LICENSE](LICENSE).
“SoundBlast” es un nombre de proyecto; sin afiliación con Creative Technology.
