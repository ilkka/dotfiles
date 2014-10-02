#!/usr/bin/env python
# coding=UTF-8

import math, subprocess, sys

def readAppleProp(output, propname):
  line = [l for l in output.splitlines() if propname in l][0]
  return line.rpartition('=')[-1].strip()

if sys.platform == 'linux' or sys.platform == 'linux2':
  try:
    b_max = float(file('/sys/class/power_supply/BAT0/energy_full').read().strip())
    b_cur = float(file('/sys/class/power_supply/BAT0/energy_now').read().strip())
    b_show = True # always display
  except IOError:
    sys.exit(0)
elif sys.platform == 'darwin':
  p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
  output = p.communicate()[0]

  b_max = float(readAppleProp(output, 'MaxCapacity'))
  b_cur = float(readAppleProp(output, 'CurrentCapacity'))
  b_charge = True if readAppleProp(output, 'IsCharging') == 'Yes' else False
  b_show = b_charge or (b_cur / b_max) < 0.5
else:
  sys.exit(0)

if not b_show:
  sys.exit(0)
  
charge = b_cur / b_max
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
