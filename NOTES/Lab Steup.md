# Lab Setup

In my case, i'm using my PC. Specs:

- 16 Gigs of RAM
- 12 Cores of CPU
- Virtualization Software of choice: _VMWare Pro 17_ 

**ENVIRONMENT**

My steup:

|MACHINE|RAM|CPU|SPACE|
|----|----|----|----|
|KALI LINUX|3GB|2|70GB|
|WINDOWS SERVER 2016 (DC-01)|1GB|1|27GB|
|WINDOWS 10|1GB|1|25GB|
|WINDOWS 8|1GB|1|25GB|
|WINDOWS 7|512MB|1|25GB|

Thats roughley 6.5Gigs of RAM.

What do i do and i dont have that much resources? 😢. I got you 😎

|MACHINE|RAM|CPU|SPACE|
|----|----|----|----|
|KALI LINUX|2GB|2|70GB|
|WINDOWS SERVER 2016 (DC-01)|768MB|1|27GB|
|WINDOWS 10|1GB|1|25GB|
|WINDOWS 8|768MB|1|25GB|


Thats roughley 4.5 Gigs of ram (Incase you have an 8GB Laptop/Desktop). Feel free to modify the specs to your liking.

Next we need to Download ISO images to use in the environment.

For:

1. Kali - [Download here](https://www.kali.org/get-kali/#kali-virtual-machines)
2. Windows Server 2016 - [Download here](https://go.microsoft.com/fwlink/p/?LinkID=2195174&clcid=0x409&culture=en-us&country=US)
3. Windows 10 - [Download here](https://www.microsoft.com/en-us/software-download/windows10)
4. Windows 8 - [Download here](https://www.microsoft.com/en-us/software-download/windows8ISO)
5. Windows 7 - [Download here](https://windows-7.en.softonic.com/download)


You also need a hypervisor. For:

1. Virtual Box - [Download here](https://www.virtualbox.org/wiki/Downloads)
2. Virtual Box Extention Pack - [Download here](https://www.virtualbox.org/wiki/Downloads)
3. VMware Workstation Player (_Free_) - [Download here](https://www.vmware.com/go/getplayer-win)
4. VMware Workstation 17 Pro (_Paid_) - [Download here](https://www.vmware.com/go/getworkstation-win)

_The rest of this walkthroughs, i'm gonna be using VMWare 17 Pro. I'll try to add section where you can setup your lab in Virtual box environemnt or VMWare Workstation Player_

With that said, lets create a network where our devices will be located. 

