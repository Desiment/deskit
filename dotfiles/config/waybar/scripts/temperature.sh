#!/usr/bin/env bash

pretty_name() {
  case "$1" in
    acpitz) echo "ACPI zone" ;;
    "INT3400 Thermal") echo "Intel thermal controller" ;;
    x86_pkg_temp) echo "CPU package" ;;
    TCPU) echo "CPU" ;;
    TCPU_PCI) echo "CPU PCI" ;;
    iwlwifi*) echo "Wi-Fi card" ;;

    SEN0) echo "CPU / hotspot" ;;
    SEN1) echo "CPU sensor 1" ;;
    SEN2) echo "Motherboard / VRM" ;;
    SEN3) echo "Board sensor 3" ;;
    SEN4) echo "Board sensor 4" ;;
    SEN5) echo "Board sensor 5" ;;
    SEN6) echo "Board sensor 6" ;;
    SEN8) echo "Board sensor 8 / hotspot" ;;
    SEND) echo "Board sensor D" ;;
    SENE) echo "Board sensor E" ;;
    SENF) echo "Board sensor F" ;;
    SENG) echo "Board sensor G" ;;
    SENI) echo "Board sensor I" ;;
    SENJ) echo "Board sensor J" ;;
    SENN) echo "Board sensor N" ;;
    SENO) echo "Board sensor O" ;;
    SENP) echo "Board sensor P" ;;
    SENQ) echo "Board sensor Q" ;;

    *) echo "$1" ;;
  esac
}

rows=$(
  for z in /sys/class/thermal/thermal_zone*; do
    [ -r "$z/type" ] && [ -r "$z/temp" ] || continue

    raw_name=$(cat "$z/type")
    raw_temp=$(cat "$z/temp")

    temp_c=$(awk "BEGIN { printf \"%.1f\", $raw_temp / 1000 }")
    name=$(pretty_name "$raw_name")

    printf "%06.1f\t%s\t%s\n" "$temp_c" "$name" "$raw_name"
  done | sort -nr
)

max_temp=$(echo "$rows" | head -n1 | cut -f1 | sed 's/^0*//')
max_name=$(echo "$rows" | head -n1 | cut -f2)

tooltip=$(
  echo "$rows" | awk -F'\t' '
    {
      temp=$1
      sub(/^0+/, "", temp)
      printf "%-26s %6s°C  [%s]\n", $2, temp, $3
    }
  '
)

class="normal"

awk "BEGIN { exit !($max_temp >= 80) }" && class="critical"
awk "BEGIN { exit !($max_temp >= 65 && $max_temp < 80) }" && class="warning"

export TEXT=" ${max_temp}°C"
export ALT="$(printf "%s\nHottest: %s" "$tooltip" "$max_name")"
export CLASS="$class"

python3 -c '
import json
import os

print(json.dumps({
    "text": os.environ["TEXT"],
    "alt": os.environ["ALT"],
    "class": os.environ["CLASS"],
}))
'
