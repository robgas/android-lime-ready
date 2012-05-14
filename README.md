Intro
==================
Android Lime Ready is an Android emulator image modified to run the Linux Memory Extractor (LiME) announced at ShmooCon 2012 by Joe Sylve, Digital Forensics Solutions (the presentation is available [here](http://digitalforensicssolutions.com/Android_Mind_Reading.pdf) ).

LiME source code and documentation is freely available for download from the Google Code page: http://code.google.com/p/lime-forensics/ .

Emulator Image
==================
The image is based on the AOSP android-2.3.7\_r1 (with busybox) and the standard kernel 2.3.29 (goldfish) modified to load Linux Kernel Modules.

The version of LiME is the last version available.

The emulator image is composed of:
* zImage ( kernel recompiled with LKM support )
* ramdisk.img
* userdata.img
* system.img
* skin folder WVGA800

The file start-emulator.sh helps to start an already installed emulator, SDK or AOSP compiled, with the files above. ( The script has been tested on Linux and Mac OS X)

Tutorial
==================
First, check if the EMULATOR variable in start-emulator.sh is correct. (emulator in $PATH or manually set)

From a Terminal, run the emulator with ./start-emulator.sh (Only for the first time, if the sdcard image is not available, a new one will be created)

Once Android boot is complete, open a shell directly from the terminal used to start the emulator (press any key to start) or with 
```adb shell```

LiME supports acquiring memory either to the file system of the device or over the network:

Acquisition of Memory to Disk (SD-CARD)
------------------------------

To start the acquisition:

```android-linux-ready.sh path=/sdcard```

Once the acquisition is completed, a file with extension .pdump will be stored in /sdcard:
```
/mnt/sdcard $ ls
LOST.DIR
1337032096_0_fffffff.pdump
```

and the file can be transfered with:
```adb pull /sdcard/1337032096_0_fffffff.pdump```
 
