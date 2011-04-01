#!/usr/bin/env python
# coding=UTF-8

import math, subprocess, os, glob

def get_charge_linux():
    b_max = 0
    b_cur = 0
    for b in glob.glob("/sys/class/power_supply/BAT*"):
        b_max += int(open(os.path.join(b, "charge_full"), 'r').read().strip())
        b_cur += int(open(os.path.join(b, "charge_now"), 'r').read().strip())
    return b_cur / b_max

def get_charge_mac():
    p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
    output = p.communicate()[0]

    o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
    o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

    b_max = float(o_max.rpartition('=')[-1].strip())
    b_cur = float(o_cur.rpartition('=')[-1].strip())

    return b_cur / b_max

if os.sys.platform.count('linux') > 0:
    charge = get_charge_linux()
else:
    charge = get_charge_mac()

charge_threshold = int(math.ceil(10 * charge))

# Output

total_slots, slots = 10, []
filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'▸'
empty = (total_slots - len(filled)) * u'▹'

out = (filled + empty).encode('utf-8')
import sys

color_green = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
color_out = (
    color_green if len(filled) > 6
    else color_yellow if len(filled) > 4
    else color_red
)

out = color_out + out + color_reset
sys.stdout.write(out)
