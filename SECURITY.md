# SonicLift — Segurança e Transparência

**Autor:** Denis de Oliveira Ramos — https://github.com/denoso1993

## O que o app/instalador altera (PT)

- Copia `SonicLiftAPO.dll` para `C:\Windows\System32` (APO carregado pelo `audiodg.exe`).
- Registra o CLSID `{B7E3C1A0-5F2D-4A9B-9C11-8F0F2E6D4A10}` e
  `HKCR\AudioEngine\AudioProcessingObjects\{...}`.
- Vincula o APO aos dispositivos de saída via
  `FxProperties\{d04e05a6-594b-4fb6-a80d-01af5eed7d1d},5`; o valor anterior é
  salvo em `%ProgramData%\SonicLift\backup` e restaurado ao remover.
- Define `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Audio\DisableProtectedAudioDG = 1`
  (necessário para APO não assinado).
- Cria a tarefa agendada `SonicLift` (ONLOGON, privilégios altos) quando
  "Iniciar com o Windows" está marcado.
- Grava configurações em `%ProgramData%\SonicLift` (`ui.json`, `config.bin`).
- Reinicia o serviço de áudio (`Audiosrv`) ao aplicar/remover vínculos e ao
  iniciar, para o APO carregar.
- **Não faz acesso à rede. Não tem telemetria. Não coleta dados pessoais.**

## What it changes (EN)

- Installs `SonicLiftAPO.dll` into `C:\Windows\System32` (loaded by `audiodg.exe`).
- Registers the CLSID above and `HKCR\AudioEngine\AudioProcessingObjects\{...}`.
- Binds the APO to output endpoints via
  `FxProperties\{d04e05a6-...},5`; the previous value is backed up in
  `%ProgramData%\SonicLift\backup` and restored on removal.
- Sets `DisableProtectedAudioDG = 1` (required for an unsigned APO).
- Creates the `SonicLift` scheduled task (ONLOGON, highest privileges) when
  "Start with Windows" is enabled.
- Stores settings in `%ProgramData%\SonicLift`.
- Restarts the audio service (`Audiosrv`) when applying/removing bindings and
  at startup, so the APO loads.
- **No network access. No telemetry. No personal data collection.**

## Lo que cambia (ES)

- Copia `SonicLiftAPO.dll` a `C:\Windows\System32` (cargado por `audiodg.exe`).
- Registra el CLSID anterior y `HKCR\AudioEngine\AudioProcessingObjects\{...}`.
- Vincula el APO a los dispositivos de salida vía `FxProperties\{d04e05a6-...},5`;
  el valor anterior se guarda en `%ProgramData%\SonicLift\backup` y se restaura
  al quitar.
- Define `DisableProtectedAudioDG = 1` (necesario para un APO sin firma).
- Crea la tarea `SonicLift` (ONLOGON, privilegios altos) si "Iniciar con
  Windows" está activo.
- Guarda ajustes en `%ProgramData%\SonicLift`.
- Reinicia el servicio de audio (`Audiosrv`) al aplicar/quitar vínculos y al
  iniciar.
- **Sin acceso a la red. Sin telemetría. Sin recopilación de datos personales.**

## Desinstalação / Uninstall / Desinstalación

Use o instalador (`Configurações > Aplicativos > SonicLift`) ou execute
`SonicLift.exe --uninstall` como Administrador. Isso remove vínculos do APO,
a tarefa agendada, o registro, a DLL do System32 e os dados em
`%ProgramData%\SonicLift`.

## Assinatura e riscos

- **O binário não é assinado** (code signing pendente). Verifique o SHA-256
  publicado em `SHA256SUMS.txt` e, se quiser, envie o instalador ao VirusTotal.
- O APO não assinado exige `DisableProtectedAudioDG=1`; conteúdo com DRM pode
  recusar o áudio. Use por sua conta e risco.
- Apps em modo exclusivo (WASAPI exclusive/ASIO) ignoram o APO.

## Contato

GitHub: https://github.com/denoso1993
