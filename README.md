# SoundBlast

**More volume on every device — no virtual driver.**

[English](README.md) · [Português](README.pt-BR.md) · [Español](README.es.md)

![Platform](https://img.shields.io/badge/platform-Windows%2010%2F11%20x64-0078D6?style=flat-square)
![Version](https://img.shields.io/badge/version-1.1.1-2ea44f?style=flat-square)
![License](https://img.shields.io/badge/license-Proprietary-red?style=flat-square)

<p align="center">
  <img src="screenshot.png" width="520" alt="SoundBlast">
</p>

SoundBlast is a **native Windows APO** (Audio Processing Object) that boosts
volume, shapes the tone and tames peaks *inside* the output device. There is **no
virtual sound card, no extra device to select, and no driver layer in the
middle**. Windows keeps switching between headset, Bluetooth speaker, USB and
HDMI — and the sound follows the device.

## Why another volume booster?

- Laptop speakers and Bluetooth boxes are often just **too quiet**.
- Virtual audio drivers add a middle layer and an extra “device” to manage.
- Powerful APO tools exist, but are **complex** for most people.
- Easy tools often use a virtual device, which can get in the way of the device
  switching you already trust.

SoundBlast is the opposite trade-off: **one toggle, +30 dB with a limiter, on
the device Windows is already using**.

## Highlights

- **Volume boost up to +30 dB** with an always-on limiter.
- **10-band equalizer** with presets (Flat, Music, Gaming, Bass, Voice, Movie).
- **Bass, Surround and Clarity** sliders for quick, beginner-friendly tuning.
- **Automatic headroom** so EQ boosts stay clean instead of clipping.
- **Applies to all active real devices** by default (USB, Bluetooth, HDMI,
  S/PDIF).
- **Isolate by device** mode with a de-duplicated list (groups Bluetooth
  profiles of the same headset/speaker).
- **Follows Windows device switching** — no virtual device to select.
- **Live gain**: the slider applies immediately.
- **Start with Windows**, tray icon, single instance, balloon notice.
- **English (default), Portuguese and Spanish**.
- **No network access, no telemetry, no data collection.**
- Ignores virtual devices (e.g. FxSound) on purpose.

## SoundBlast vs. the alternatives

| | **SoundBlast** | **FxSound** | **Equalizer APO** | **Boom 3D** | **SteelSeries Sonar** |
|---|---|---|---|---|---|
| Native APO (no virtual device) | ✅ Yes | ❌ Virtual device | ✅ Yes | ❌ Virtual device | ❌ Virtual device |
| Volume boost | ✅ up to +30 dB | ✅ | ✅ preamp | ✅ | ✅ |
| Limiter | ✅ always on | ✅ | ➖ manual | ✅ | ✅ |
| Equalizer | ✅ 10-band | ✅ 9-band | ✅ advanced / VST | ✅ 31-band | ✅ 10-band |
| Presets | ✅ 6 built-in | ✅ | ➖ manual | ✅ | ✅ |
| Bass / Surround / Clarity | ✅ | Bass only / limited | ⚙️ filters | ✅ | ✅ |
| Per-app control | ➖ device-wide | ➖ limited | ⚙️ via config | ✅ | ✅ |
| Languages | ✅ EN / PT / ES | EN | EN | EN (+ varies) | EN |
| Network / telemetry | ✅ none | open-source | open-source | varies | account / varies |
| Price | **Free (personal)** | Free | Free | Paid | Free (hardware) |

> **Honest note:** SoundBlast now includes a **10-band EQ, presets, Bass,
> Surround and Clarity**, plus automatic headroom to keep boosts clean. It is not
> a 31-band/VST power tool — the focus is a simple, device-native experience with
> a real limiter. Feature sets vary by version/platform — check each vendor.

## What makes it different

1. **Device-native.** The APO is attached to the Windows endpoint, so it
   processes every app playing on that device.
2. **No virtual driver.** Windows' own device switching stays exactly as it is.
3. **Simple when you want, deep when you need.** One switch and one slider; presets and a 10-band EQ behind one button.
4. **Transparent.** No network, no telemetry; security notes and hashes are
   published.
5. **Practical.** Isolate mode, auto-start, three languages, graceful tray
   behavior.

## How it works

1. `SoundBlastAPO.dll` is registered as an APO and bound to the output endpoint
   through `FxProperties`.
2. `audiodg.exe` loads it inside the device pipeline.
3. The UI publishes gain/limiter settings through shared memory (and a config
   file, so the last state survives the UI being closed).

## Works with all apps

SoundBlast processes **shared-mode audio on real output devices** — games,
browsers, music, system sounds, communication apps, and several apps at once.

Technical limits worth knowing:

- **WASAPI exclusive / ASIO** apps bypass any APO (not only SoundBlast).
- **DRM / protected audio** may refuse audio because the installer sets
  `DisableProtectedAudioDG=1` (required for an unsigned APO).
- If an app is **manually routed to a virtual device** (FxSound, Voicemeeter,
  VB-Audio), it bypasses the APO. Keep apps on *Default* / a real device. A
  helper script to reset per-app routing is included in the project.
- The Windows **Volume Mixer** only lists apps with an active audio session;
  absence is not a bug.

## Install

1. Download the latest **installer** from
   [Releases](https://github.com/denoso1993/soundblast/releases).
2. Run `SoundBlastSetup-*.exe` as **Administrator**.
3. Open SoundBlast, keep **On**, choose a gain, and (optionally) enable
   *Start with Windows*.

Requirements: Windows 10/11 **x64**. The APO is **unsigned** (code signing is on
the roadmap).

## Security and transparency

- See [SECURITY.md](SECURITY.md) for every registry key, file and task the app
  changes, plus uninstall details.
- **No network access. No telemetry. No personal data collection.**
- Hashes: [SHA256SUMS.txt](SHA256SUMS.txt).
- The unsigned APO requires `DisableProtectedAudioDG=1`; DRM content may refuse
  audio. Exclusive-mode apps ignore the APO.

## Roadmap

- Per-device presets and custom presets.
- Import/export of EQ profiles.
- Code signing (Authenticode / Trusted Signing).
- Microsoft Store / winget package.
- ARM64 build.

## FAQ

**Is it safe?** The code is proprietary, but it is transparent about what it
changes: see `SECURITY.md`. There is no network or telemetry. Verify the
installer hash before running.

**Why does SmartScreen warn?** The binary is not code-signed yet. Signing is on
the roadmap.

**Does it work with every app?** Shared-mode audio on real devices, yes.
Exclusive/ASIO apps and apps routed to virtual devices are the exceptions
explained above.

**Does it have an equalizer?** Yes — a 10-band EQ with six presets plus Bass,
Surround and Clarity. Open “Equalizer…” on the main window.

**Can I use it together with FxSound?** Technically yes, but avoid routing apps
to FxSound's virtual device. Since SoundBlast replaces that role, uninstalling
FxSound is recommended.

**Does it survive Windows updates?** Updates/driver installs can reset
`FxProperties`. Use “Reinstall APO” and reapply if audio stops being processed.

**Is it free?** Free for **personal use**, with an optional donation.
Commercial use requires a separate license.

## Support the project

If you liked the app, donate to this **crypto** address:

**EN** — If you liked the app, donate to this crypto address:
**PT** — Gostou do app? Doe para este endereço crypto:
**ES** — ¿Te gustó la app? Dona a esta dirección crypto:

```
0xcBf21D49f65ca55228310344bE91F607d8d09309
```

## Author

Developed by **Denis de Oliveira Ramos** — https://github.com/denoso1993

## License

Proprietary (All Rights Reserved). Copying, redistribution, modification or
reverse engineering without permission is prohibited. See [LICENSE](LICENSE).
“SoundBlast” is a project name; this project is not affiliated with Creative
Technology.
