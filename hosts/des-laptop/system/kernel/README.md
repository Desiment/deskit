# Desiment's kernel configuration (self)-guide

This is little guide how configure kernel for HUAWEI laptop, that I wrote and maintain to
- Keep track of what options were turned and why
- Share with others, of course

Philosophy is the following: everything that can be built into the kernel, should be built into the kernel.

We start with default config:
```
defconfig | Kernel 6.14.0 | 
```

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel#Alternative:_Manual_configuration
https://wiki.gentoo.org/wiki/ALSA
https://wiki.gentoo.org/wiki/PipeWire
https://wiki.gentoo.org/wiki/Wi-Fi
https://wiki.gentoo.org/wiki/Bluetooth
https://wiki.gentoo.org/wiki/EFI_stub
https://wiki.gentoo.org/wiki/UEFI_Dual_boot_with_Windows_7/8#Kernel_configuration
https://wiki.gentoo.org/wiki/NTFS

## Step 1. The basics:

Let's start with enabling support of our init system, OpenRC and other gentoo-specific options

```kernel
Gentoo Linux --->
    [*] Gentoo Linux support
    [*]   Linux dynamic and persistent device naming (userspace devfs) support
    [*]   Select options required by Portage features
        Support for init systems, system and service managers  --->
          [*] OpenRC, runit and other script based systems and managers
```
Source: https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel#Alternative:_Manual_configuration

### Typical system components
Enable support of devtmpfs file system, so that critical device files are already available early in the boot process

```kernel
Device Drivers --->
  Generic Driver Options --->
    [*] Maintain a devtmpfs filesystem to mount at /dev
    [*]   Automount devtmpfs at /dev, after the kernel mounted the rootfs
```
Source: https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel#Alternative:_Manual_configuration

SCSI, SATA, PATA support:
```kernel
Device Drivers --->
  SCSI device support  ---> 
    <*> SCSI device support
    <*> SCSI disk support
  <*> Serial ATA and Parallel ATA drivers (libata)  --->
    [*] ATA ACPI Support
    [*] SATA Port Multiplier support
    <*> AHCI SATA support (ahci)
    [*] ATA BMDMA support
    [*] ATA SFF support (for legacy IDE and PATA)
    <*> Intel ESB, ICH, PIIX3, PIIX4 PATA/SATA support (ata_piix)
```
Source: https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel#Alternative:_Manual_configuration


Enable NVME support with advanced features, as we have NVME-device:
```kernel
Device Drivers --->
  NVME Support --->
    <*> NVM Express block device
    [*] NVMe multipath support
    [*] NVMe hardware monitoring
    <M> NVM Express over Fabrics FC host driver
    <M> NVM Express over Fabrics TCP host driver
    <M> NVMe Target support
      [*]   NVMe Target Passthrough support
      <M>   NVMe loopback device support
      <M>   NVMe over Fabrics FC target driver
      < >     NVMe over Fabrics FC Transport Loopback Test driver (NEW)
      <M>   NVMe over Fabrics TCP target support

```
Source: https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel#Alternative:_Manual_configuration


### Filesystems

Enable basic filesystems support
```kernel
File systems --->
  <*> Second extended fs support
  <*> The Extended 3 (ext3) filesystem
  <*> The Extended 4 (ext4) filesystem
  <*> Btrfs filesystem support
  <*> XFS filesystem support
  DOS/FAT/NT Filesystems  --->
    <*> MSDOS fs support
    <*> VFAT (Windows-95) fs support
  Pseudo Filesystems --->
    [*] /proc file system support
    [*] Tmpfs virtual memory file system support (former shm fs)
```
Source: https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel#Alternative:_Manual_configuration


#### section::dual-boot
As our goal is also have dual-boot with windows (possibly with common space), it would be very nice to have support of NTFS
```kernel
File systems  --->
    DOS/FAT/NT Filesystems  --->
        <*> NTFS Read-Write file system support 
        <*> activate support of external compressions lzx/xpress
```
Source: https://wiki.gentoo.org/wiki/NTFS

#### section::cyrrilic
Now, it is important to have



### Processor

Basic processor options
```kernel
Processor type and features  --->
  [*] Symmetric multi-processing support
    [*] SMT (Hyperthreading) aware nice priority and policy support
    [*] Multi-core scheduler support
```
Source: https://wiki.gentoo.org/wiki/Kernel/Gentoo_Kernel_Configuration_Guide


### Boot
CONFIG_BOOT_VESA_SUPPORT=y


### Firmware and vendor-specifis stuff





## Step 2. Power managment ACPI
Now, let's enable minimal setup for proper power management
```
Power management and ACPI options --->
  -*- Device power management core functionality
  [*] ACPI (Advanced Configuration and Power Interface) Support --->
    <*> AC Adapter
    <*> Battery
    -*- Button
    -*- Video
    <*> Fan
    <*> Processor
    <*> Thermal Zone
  [*] CPU Frequency scaling --->
        Default CPUFreq governor (ondemand)  --->
    -*- 'performance' governor
    <*> 'powersave' governor
    <*> 'userspace' governor for userspace frequency scaling
    -*- 'ondemand' cpufreq policy governor
    <*> 'conservative' cpufreq governor
    <*> ACPI Processor P-States driver
```
Source: https://wiki.gentoo.org/wiki/Power_management/Guide


```kernel
Device Drivers --->
  -*- Thermal drivers --->
    (0)   Emergency poweroff delay in milli-seconds                                                                              
    [*]   Expose thermal sensors as hwmon device                                                                                
    -*-   Enable writable trip points                                                                                          
          Default Thermal governor (step_wise)  --->                                                                           
    [*]   Fair-share thermal governor                                                                                           
    -*-   Step_wise thermal governor                                                                                            
    -*-   Bang Bang thermal governor                                                                                            
    -*-   User_space thermal governor                                                                                           
    [ ]   Thermal emulation mode support
    [*]   Power allocator thermal governor   
    Intel Thermal drivers --->
        <M>   Intel PowerClamp idle injection driver
        <M>   X86 package temperature thermal driver
        < >   Intel SoCs DTS thermal driver
        <M>   Intel PCH Thermal Reporting Driver
        ACPI INT340X thermal drivers  --->                                                                                     
            <M> ACPI INT340X thermal drivers
```
Source: https://wiki.gentoo.org/wiki/Power_management/Guide


```kernel
Device Drivers --->
  [*] Generic powercap sysfs driver --->
    <M>   Intel RAPL Support
```
Source: https://wiki.gentoo.org/wiki/Power_management/Guide



```
Power management and ACPI options --->
    [*] Suspend to RAM and standby
    [*] Hibernation (aka 'suspend to disk')
```
Source: https://wiki.gentoo.org/wiki/Suspend_and_hibernate


```kernel
CONFIG_X86_EXTENDED_PLATFORM=n
CONFIG_X86_INTEL_LPSS=y
```


```kernel
CONFIG_X86_MCE_AMD=n
```

https://wiki.gentoo.org/wiki/Power_management/Processor#Specific_CPU_scaling_drivers_settings



## Step 3. Networking and bluetooth

## Step 4. USB/HID devices

First, we need to enable I2C Bus (needed for Touchpad, Camera, and probably other stuff)
```kernel
Device Drivers  --->
  <*> I2C Support  ---> 
     <*>   I2C device interface 
     I2C Hardware Bus Support  --->
        <*> Intel 82801 (ICH/PCH) 
        <*> Synopsys Designware Platform
```
Source: https://wiki.gentoo.org/wiki/Framework_Laptop_13


For touchpad, enable the following:
```kernel
Device Drivers  --->
  Input device support  --->
  HID support  ---> 
     <*> Generic HID driver 
     Special HID driver  --->
        <*> HID Multitouch panels 
        <*> HID Sensors framework support 
     <*> I2C HID support ---> 
       <*> HID over I2C transport layer ACPI driver 
     Intel ISH HID support  --->
        <*> Intel Integrated Sensor Hub
```
Source: https://wiki.gentoo.org/wiki/Framework_Laptop_13


For the webcam, enable: 
```kernel
Device Drivers  --->
    <M> Multimedia support  --->
        [*]   Cameras/video grabbers support
        [*]   Media USB Adapters  --->
            <M>   USB Video Class (UVC)                                         
            [*]   UVC input events device support                             
            <M>   GSPCA based webcams  --->
                <M>   SUNPLUS USB Camera Driver
```
Source: https://wiki.gentoo.org/wiki/Dell_Latitude_5495


TODO: fingerprint

## Step 4. Graphics configuration
https://wiki.gentoo.org/wiki/Intel

## Step 5. Audio 

Our goal is to have pipewire + alsa setup on modern laptop (with sod things), so we need enable specific options;

```kernel
Device Drivers --->
    <*> Sound card support
        <*> Advanced Linux Sound Architecture --->
            [*] PCI sound devices  --->
                <Select the driver for your audio controller...>
            HD-Audio  --->
               <Select a codec or enable all and let the generic parse choose the right one...>
               [*] ...
            [*] USB sound devices  --->
                Must have as some cards are presented as USB devices.
                [*] USB Audio/MIDI driver
            -*-  Sound Proc FS Support # needed for pipewire
            [*]    Verbose procfs contents # needed for pipewire
General setup --->
    [*] System V IPC
```


### VPN:
Device Drivers  --->
    [*] Network device support  --->
        [*] Network core driver support
        <*>   Universal TUN/TAP device driver support


### Efi frmabefuer need to select fbdevice
