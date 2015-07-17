#!/system/bin/sh

# Tweak VM and Swap
echo "100"	> /proc/sys/vm/swappiness
echo "100"	> /sys/fs/cgroup/memory/sw/memory.swappiness
echo "25"	> /proc/sys/vm/vfs_cache_pressure
echo "300"	> /proc/sys/vm/dirty_writeback_centisecs
echo "300"	> /proc/sys/vm/dirty_expire_centisecs
echo "15"	> /sys/module/zswap/parameters/max_pool_percent

# Set bigger swap
# swapoff /dev/block/vnswap0
# echo "1932735283" > /sys/block/vnswap0/disksize
# mkswap /dev/block/vnswap0
# swapon /dev/block/vnswap0

#  Start SuperSU daemon
#  Wait for 5 seconds from boot before starting the SuperSU daemon
sleep 5
/system/xbin/daemonsu --auto-daemon &

#  Set interactive governor tuning
#  Wait for 15 seconds from boot so we can ovverride TouchWiz's overrides
sleep 10

#set apollo interactive governor
echo "15000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo "0" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
echo "30000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
echo "1" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/enforced_mode
echo "97" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo "1000000"	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo "1" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
echo "15000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo "20000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/multi_enter_time
echo "30000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/multi_exit_time
echo "20000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/single_enter_time
echo "30000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/single_exit_time
echo "93" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo "45000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo "15000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack

#set atlas interactive governor
echo "15000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo "0" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost
echo "30000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo "1" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/enforced_mode
echo "97" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo "1300000"	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo "1" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
echo "15000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo "20000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/multi_enter_time
echo "30000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/multi_exit_time
echo "20000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/single_enter_time
echo "30000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/single_exit_time
echo "93" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo "45000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo "15000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack

