#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: Copyright (c) 2026 cheekyb52
set -euo pipefail
[[ "${CREATE_FIRMWARE:-}" == 1 && $# == 1 ]] || { echo "Run through the firmware builder" >&2; exit 1; }
rootfs=$(realpath -- "$1")
[[ -d "$rootfs/home/lava/klipper/klippy" ]] || { echo "Missing Klipper tree" >&2; exit 1; }
cd -- "$rootfs"
sha256sum --check --strict <<'CALIBRATION_MODIFIED'
da375bfb97d065a1511829ae1f0d3d44531b18c4c39246439812a8989ceb5cae  home/lava/klipper/klippy/kinematics/extruder.py
21cb0c7037eb0c2ee195704e8e81dfd5fad307ff5cb16a0c3ed981b006d0f302  home/lava/klipper/klippy/extras/extruder_config_bak.py
05196461cea7160eb9ffee5907a2332d12d1740349d8e65b1f3d7671fca545c8  home/lava/klipper/klippy/extras/probe_inductance_coil.py
CALIBRATION_MODIFIED
python3 -B - "$rootfs" <<'CHECK_PYTHON'
from pathlib import Path
import sys
root=Path(sys.argv[1])/'home/lava/klipper'
for relative in ('klippy/kinematics/extruder.py','klippy/extras/extruder_config_bak.py','klippy/extras/probe_inductance_coil.py'):
    path=root/relative
    compile(path.read_bytes(),str(path),'exec')
print('Calibration Python syntax verified without imports or bytecode writes')
CHECK_PYTHON
