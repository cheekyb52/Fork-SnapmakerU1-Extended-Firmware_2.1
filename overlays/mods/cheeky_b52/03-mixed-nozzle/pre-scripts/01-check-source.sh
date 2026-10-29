#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: Copyright (c) 2026 cheekyb52
set -euo pipefail
[[ "${CREATE_FIRMWARE:-}" == 1 && $# == 1 ]] || { echo "Run through the firmware builder" >&2; exit 1; }
rootfs=$(realpath -- "$1")
[[ -d "$rootfs/home/lava/klipper/klippy" ]] || { echo "Missing Klipper tree" >&2; exit 1; }
cd -- "$rootfs"
sha256sum --check --strict <<'MIXED_NOZZLE_BASELINE'
7136fa5a4c5a09533f9f2b765c3c17bcfbb9d63fe43eb108679fc1eb4f088004  home/lava/klipper/klippy/extras/print_task_config.py
MIXED_NOZZLE_BASELINE
