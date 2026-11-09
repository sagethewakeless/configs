#!/usr/bin/env bash
# Prints one JSON line per second with disk busy % and read/write speed.

src=$(findmnt -no SOURCE /)
disk=$(lsblk -rnso NAME,TYPE "$src" | awk '$2=="disk" {print $1; exit}')

read_stats() { awk -v d="$disk" '$3==d {print $6, $10, $13}' /proc/diskstats; }

read -r pr pw pt < <(read_stats)
while sleep 1; do
    read -r cr cw ct < <(read_stats)
    rd=$(( (cr - pr) * 512 ))      # sectors are always 512 bytes here
    wr=$(( (cw - pw) * 512 ))
    util=$(( (ct - pt) / 10 ))     # ms busy per 1000 ms -> percent
    (( util > 100 )) && util=100
    pr=$cr; pw=$cw; pt=$ct
    printf '{"text":"%d%%   <span font_size=\\"large\\">\\udb80\\udeca</span>","tooltip":"%s: %s\\nRead: %s\\nWrite: %s"}\n' \
        "$util" "$disk" "$(lsblk -dno SIZE "/dev/$disk")" \
        "$(numfmt --to=iec-i --suffix=B/s "$rd")" \
        "$(numfmt --to=iec-i --suffix=B/s "$wr")"
done
