# Thinpad P51 Catalina Opencore
Updated to use OpenCore and use ACPI patch methods, rather than replacing the full DSDT / SSDTs.




# Thinkpad P51 High Sierra

Feature set source: http://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad%20P51/ThinkPad_P51_Platform_Specifications.pdf

## Hardware:

| Category | Element | Compatibility | Notes |
| ------------- | ------------- | ------------- | ------------- | 
| CPU | i7-7700HQ | FULL | Native power management works correctly, as per: https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/
| GPU | HD630 | FULL | Same as above. Full hardware acceleration.					
| | NVIDIA M1200 | NO:DISABLED | Disabled as per: https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/ UPDATE: it seems it's possible to have both HD630 and Nvidia GPU running on macOS https://www.tonymacx86.com/threads/several-issues-getting-high-sierra-working-laptop.253386/#post-1759621 because of the particular configuration of this device, since it's possible form bios to run discrete graphics only and also because external monitors run through the Nvidia GPU and never through intel integrated GPU. It's rare for laptops but my guess is that it's possible on this device and technically would be like having a desktop with a dedicated GPU. |
| MEMORY | 1x16GB | FULL | |
| DISPLAY | 4K | FULL | |
| STORAGE | Samsung NVMe 256GB | FULL | |
| ETHERNET | Intel I219-V | FULL | https://www.tonymacx86.com/threads/intel-i219-ethernet-drivers-for-skylake-100-series-motherboards-testing.180995/ |
| WLAN | BCM94352Z | FULL | |
| BLUETOOTH | BCM94352Z | FULL | Small issue with Bluetooth after wake (needs more investigation) |
| EXPRESS CARD | | NO | Needs to be disabled for power consumption reasons through ACPI SSDT patches |
| SD READER | Realtek RTS525A | NO | Driver in the works https://www.insanelymac.com/forum/topic/321080-sineteks-driver-for-realtek-rtsx-sdhc-card-readers/, until the driver is 100% complete and bugfree this component will be disabled for power consumption reasons |
| PORTS | 4xUSB3.1 Gen 1 (3.0) | FULL | Correctly setup through USBInjectAll.kext + custom SSDT + power injection |
| | Dock | FULL | Correctly setup through USBInjectAll.kext + custom SSDT + power injection |
| | 1xUSB C (Thunderbolt) | YES | Needs to be correctly tested and setup as above. Thunderbolt could work but I don't have a device to test (https://www.tonymacx86.com/threads/guide-dell-xps-15-9560-4k-touch-1tb-ssd-32gb-ram-100-adobergb.224486/). Sadly, VGA/HDMI through type C will never work since that too is connected to Nvidia. |
| | HDMI 1.4b | NO:DISABLED | Since Nvidia is disabled, this port connected to it can't work |
| | Mini Displayport 1.2a | NO:DISABLED | Since Nvidia is disabled, this port connected to it can't work |
| CAMERA | | FULL | |
| AUDIO | ALC3268 (Speakers + Internal Mic + Headphone/Mic Combo) | FULL | AppleALC.kect + Layout #29 as per: https://www.reddit.com/r/hackintosh/comments/4e23w6/guide_native_audio_with_clover_applealckext/ |
| KEYBOARD | Non backlit keyboard | YES | Some keys need to be fixed/setup with SSDT patches, especially leds |
| ULTRANAV | Trackpoint | YES | Needs to be fixed: movement is not smooth (it's blocky/jumpy). Also, center trackpoint button should be fixed since it's imprecise. |
| | Touchpad | YES | See if it is possible to add more gestures |
| FP READER | | NO:DISABLED | Disabled through USBInjectAll.kext + custom SSDT since not used, to preserve battery |
| COLOR CALIBRATOR | | NO:DISABLED | Disabled through USBInjectAll.kext + custom SSDT since not used, to preserve battery |

## Software:

| Feature | Compatibility | Notes |
| ------------- | ------------- | ------------- |
| Sleep + Wake | YES | Bluetooth not working after wake |
| Battery Status | FULL | https://www.tonymacx86.com/threads/guide-how-to-patch-dsdt-for-working-battery-status.116102/ (battery charge remaining reported correctly, but system percentage is wrong; need to see if it's possible to solve, maybe it needs a simple calibration)|
| Brightness Control | FULL | https://www.tonymacx86.com/threads/guide-laptop-backlight-control-using-applebacklightinjector-kext.218222/ |
| App Store | FULL | |
| iTunes | FULL | |
| iMessage | YES | Requires new serial number. https://www.tonymacx86.com/threads/an-idiots-guide-to-imessage.196827/|
| Siri | YES | Requires new serial number. See link above.|
| Facetime | YES | Requires new serial number. See link above.|

## Guide:
1) MOST IMPORTANT: https://www.tonymacx86.com/threads/guide-booting-the-os-x-installer-on-laptops-with-clover.148093/
2) Rest of the guide is under construction. Also waiting to reach complete compatibility.

## Benchmarks & Optimizations:

I've run some benchmarks and the results are slightly better than on Windows, since OSX has less rogue processes eating CPU computational power:
### CPU:
- Cinebench: 730
- Geekbench 4: SC: 4611, MC: 13317 (I have single channel ram which means lower memory bandwidth and lower multicore score in this particular benchmark) https://browser.geekbench.com/v4/cpu/8700946

### Battery:
Following the Notebookcheck battery test (example: https://www.notebookcheck.net/Apple-MacBook-Pro-15-2017-2-8-GHz-555-Laptop-Review.230096.0.html) my P51 got 9 hours of usage on the Big Buck Bunny h.264 1080p test at 150 nits (50% of the P51 4K brightness) in airplane mode. This score is slightly better than the Macbook Pro 15 2017 since the P51 has a bigger battery, but also has a display with 50% more pixels, so the advantage over the Macbook Pro is pretty much canceled. Battery should improve significantly once USB injection is correctly adapted to our system. Until now USB ports work, but not optimally. Some components, like the X-Rite calibrator, the FP scanner, the SD card reader, the Express Card slot are always on and consume power, so they will be disabled. Objective is to increase battery time of the test above from 9+ hours to about 10+ hours if possible.
Custom battery thresholds work through SSDT patching!

### Optimizations:
With the use of VoltageShift (https://github.com/sicreative/VoltageShift) I was able to undervolt the i7-7700HQ and lower max temperatures by 10°C and package power by about 10W. Since the temperature is overall lower, the fans spin less and there is less noise. Another tool similar to VoltageShift is Volta (http://volta.garymathews.com/) but it's a paid program.
Another optimization, which currently works, is complete fan control.
Finally, it is also possible to set custom battery thresholds!

