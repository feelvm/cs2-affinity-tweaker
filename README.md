## Before using make sure you:

- change CPU bitmask value that fits your CPU
- make a scheduled task so you don't have to run the batch file manually

### How to change CPU bitmask

Firstly, we have to determine how many cores/threads does your CPU have. For instance, my CPU is an 8-core/16 threads therefore, my default bitmask is `0x000000000000FFFF`.

Use an [affinity calculator] (https://bitsum.com/tools/cpu-affinity-calculator/) to calculate your your CPU bitmask. In the calculator we are going to select all cores that correspond to your CPU threads **without Core 0**.

The reason for it is that Core 0 bears the heaviest load. For example, it runs memory management, I/O or network stack. Disabling Core 0 allows CS2 get more CPU time as previously mentioned operations are run frequently. As a result CS2 gets interrupted a lot causing latency and inconsistent low1% FPS.
