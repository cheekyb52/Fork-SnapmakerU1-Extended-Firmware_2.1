# Snapmaker U1 calibration firmware — 2.1

**Project: 0.3.0-dev1 | Firmware base: 2.1.0.157 | Updated: 2026-10-29**

This separate experimental repository carries cheekyb52's independent tool
calibration usermod and mixed-nozzle print-start workaround on Paxx's initial
2.1 firmware. The [2.0 build](https://github.com/cheekyb52/SnapmakerU1-Extended-Firmware/releases)
is maintained separately.

- T1/T2/T3 buttons calibrate one secondary tool while preserving the other tools.
- T0 displays a prompt directing the operator to stock four-tool calibration.
- Clean/validate checks all six tool pairs without saving.
- The separately guarded nozzle workaround removes the faulty first-nozzle diameter comparison.

These are web UI macro buttons. In Mainsail, group the seven primary buttons under
**Tool Calibration** (Interface Settings → Macros → Management: Expert → Add Group;
enable Standby visibility).

Read the [usermod instructions and compatibility record](overlays/mods/cheeky_b52/README.md)
and the [full calibration documentation](https://github.com/cheekyb52/Snapmaker-U1-Single-Tool-Calibration)
before use. Downloads and checksums are on [this repository's Releases page](https://github.com/cheekyb52/Fork-SnapmakerU1-Extended-Firmware_2.1/releases).
The macro CFG alone cannot install the native Python changes.

This port follows upstream commit `36fbd40c63ad83818ef3a7b2f8facef48814dd58`.
Earlier live tests cover a prior 2.0 source/image set on one U1. This initial 2.1
port requires its own printer acceptance. Match the exact source guards, obtain
verified configuration/native backups before flashing or saving, and use normal
firmware operation without debug or factory mode.

## Source and attribution

Built from [Paxx's Snapmaker U1 Extended Firmware](https://github.com/paxx12-snapmaker-u1/SnapmakerU1-Extended-Firmware).
The upstream build system, source history, licenses and notices are retained.
See [the preserved upstream README](README.upstream.md), [GPL-3.0 license](LICENSE),
and [modification notice](overlays/mods/cheeky_b52/NOTICE.md).

This is independently maintained by cheekyb52; no upstream endorsement is implied.
The separate repository is an independently imported copy with upstream history,
rather than a second GitHub fork-network entry. Upstream submission remains deferred.
