#!/usr/bin/env python3

# Copyright John Allsup 2015
# Released under the GNU General Public License v3
# See file LICENSE

#
# Plot a raw PCM file (where data is a raw array of float32's)

import matplotlib.pyplot as plt
import numpy as np
import wave
import sys

# Plot PCM

args = sys.argv[1:]
if len(args) == 0:
    print("No files!")
    sys.exit(1)

for x in args:
    signal = np.fromfile(x,dtype=np.float32)
    mn = 1.0
    mx = -1.0
    r = signal.shape[0]
    for i in range(r):
        if mn > signal[i]:
            mn = signal[i]
        if mx < signal[i]:
            mx = signal[i]
    print("Min,max = {} {}".format(mn,mx))
    if mx < 1.0:
        mx = 1.0
    if mn > -1.0:
        mn = -1.0
    plt.figure(1)
    plt.title('Waveform {}'.format(x))
    plt.plot(signal)
    if mx > 1.0:
        plt.plot([0,signal.shape[0]],[1.0,1.0],color='red',linestyle='-',
                linewidth=1)
    if mn < 1.0:
        plt.plot([0,signal.shape[0]],[-1.0,-1.0],color='red',linestyle='-',
                linewidth=1)
    plt.ylim([mn,mx])
    plt.show()
