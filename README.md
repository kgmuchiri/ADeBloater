# Android DBloater

A shell script to debloat your Android Device

Sometimes android devices come with some bloat. While some applications can be hidden, I think it's better to have the option of uninstaling the OEM applications, but by default the most you can do is disable or hide them.

This is where DBloater comes in.

Using ADB, this script takes a list of all the packages in the packages.sh file and removes them from your device.

## How To Use

### Pre-requisite

1. A computer runing Linux or MacOS
2. Android Debug Bridge (ADB) is configured.
    - ADB installation guide [here](https://www.xda-developers.com/install-adb-windows-macos-linux/)
    - ADB package website [here](https://developer.android.com/tools/releases/platform-tools)


Once ADB is up and running do the following:

### Running The Debloating Script
To add your packages, go to package.sh and add to the arrays already there or create your own array with the following namescheme:
    
    PKG_YOURARRAYNAME

The script will not recognise the array name if you do not follow it.

Once that's complete all you need to do is make sure that the run.sh file can execute with the following command:

    chmod +x ./run.sh

To execute just enter this command:

    ./run.sh

### Finding package names for applications

In the bloat-registry directory you will find a list of applications and their package names. Right now it is limited to Samsung as that is the device that this was tested out on.

### Checking the installed applications on your device

If you want to retrieve a list of all the packages on your device, run use the get-packages script. This is a script that simplifies the querying. 

Make sure the script is executable:

    chmod +x get-packages.sh

To get all the packages run:

    ./get-packages.sh

To get packages with a specific word e.g. "google", run:

    ./get-packages.sh google

The files will show up in the device-packages-list directory and print in the terminal. 


