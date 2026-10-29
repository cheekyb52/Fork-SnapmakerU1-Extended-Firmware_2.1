#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: Copyright (c) 2026 cheekyb52
set -euo pipefail
[[ "${CREATE_FIRMWARE:-}" == 1 && $# == 1 ]] || { echo "Run through the firmware builder" >&2; exit 1; }
rootfs=$(realpath -- "$1")
[[ -d "$rootfs/home/lava/klipper/klippy" ]] || { echo "Missing Klipper tree" >&2; exit 1; }
cd -- "$rootfs"
# Refuse an unreviewed source set before applying any calibration patch.
sha256sum --check --strict <<'CALIBRATION_BASELINE'
2085de67fb9a7d6c799a958c2a2ece639cc8f136f9dec792fa68eb2c359ce8f5  home/lava/klipper/klippy/kinematics/extruder.py
56be84ec9b7f30cfa496e86591fe5e767ce79d716fd93fdf112dabc25001e5da  home/lava/klipper/klippy/extras/extruder_config_bak.py
5beaa343012a48c29953f4aece0d12967b85169f05a60973d0df897105ea185b  home/lava/klipper/klippy/extras/probe_inductance_coil.py
fce61a3256e376b566b8676c8b95f9c3082846881995af8cb0369af581938157  home/lava/klipper/klippy/queuefile.py
CALIBRATION_BASELINE
