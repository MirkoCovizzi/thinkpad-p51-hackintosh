Feature set source: http://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad%20P51/ThinkPad_P51_Platform_Specifications.pdf

HARDWARE:

| Category | Element | Compatibility | Notes |
| ------------- | ------------- | ------------- | ------------- | 
| CPU | i7-7700HQ | FULL | Native power management works correctly, as per: https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/
| GPU | HD630 | FULL | Same as above. Full hardware acceleration.					
| | NVIDIA M1200 | NO:DISABLED | Disabled as per: https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/ |
| MEMORY | 1x16GB | FULL | |
| DISPLAY | 4K | FULL | |
| STORAGE | Samsung NVMe 256GB | FULL | |
| ETHERNET | Intel I219-V | FULL | https://www.tonymacx86.com/threads/intel-i219-ethernet-drivers-for-skylake-100-series-motherboards-testing.180995/ |
| WLAN | Intel AC8265 | NO | To be replaced with BCM94352Z with FULL compatibility |
| BLUETOOTH | Intel AC8265 | NO | To be replaced with BCM94352Z with FULL compatibility |
| EXPRESS CARD | | NO:DISABLED | |
| SD READER | | NO:DISABLED | |
| PORTS | 4xUSB3.1 Gen 1 | YES | Need to be correctly setup through USBInjectAll.kext + custom SSDT |
| | 1xUSB C (Thunderbolt) | ? | Needs to be correctly tested and setup as above |
| CAMERA | | FULL | |
| AUDIO | ALC3268 (Speakers + Internal Mic + Headphone/Mic Combo) | FULL | AppleALC.kect + Layout #29 as per: https://www.reddit.com/r/hackintosh/comments/4e23w6/guide_native_audio_with_clover_applealckext/ |
| KEYBOARD | | YES | Some keys need to be fixed/setup with SSDT patches |
| ULTRANAV | Trackpoint | YES | Needs to be fixed: movement is not precise (blocky/jumpy) |
| | Touchpad | FULL | |
| FP READER | | YES | USB device: needs to be disabled through USBInjectAll.kext + custom SSDT since not used to preserve battery |
| COLOR CALIBRATOR | | YES | USB device: needs to be disabled through USBInjectAll.kext + custom SSDT since not used to preserve battery |

SOFTWARE:

| Feature | Compatibility | Notes |
| ------------- | ------------- | ------------- |
| Sleep + Wake | NO | Needs to be fixed |
| Battery Status | FULL | https://www.tonymacx86.com/threads/guide-how-to-patch-dsdt-for-working-battery-status.116102/ |
| Brightness Control | FULL | https://www.tonymacx86.com/threads/guide-laptop-backlight-control-using-applebacklightinjector-kext.218222/ |
| App Store | FULL | |
| iTunes | FULL | |
| iMessage | NO | Can't authenticate (probably needs payment method in account) |
| Siri | NO | Can't authenticate (probably needs payment method in account) |
| Facetime | NO | Can't authenticate (probably needs payment method in account) |
