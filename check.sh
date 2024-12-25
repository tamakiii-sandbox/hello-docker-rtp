#!/bin/bash
set -eu

type -p ffmpeg >/dev/null || (echo "[Error] ffmpeg not found" && exit 1)
