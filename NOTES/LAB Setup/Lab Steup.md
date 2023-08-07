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

![Ad Environemnt drawio](https://user-images.githubusercontent.com/58165365/258508952-77188c53-8e35-4b88-be28-31e77fcdfc21.png)

In the above diagram, we have 2 networks. The:

1. External - 192.168.1.0/24
2. Internal - 192.168.100.0/24

All workstations are are supposed to be on the Internal Network via LAN. However, in our scenario, we are going to assume that one user using a laptop, is both connected to the LAN and WI-FI. An attacker (you 😅) happens visits an organization, and because they have open Wi-Fi, he decids to snoop around. You discover an outdated Windows 7 workstation and decide to enumerate it further, trying to get identify potential vulnerabilities you can exploit ... _to be continued_

Now that we have a network diagram, lets create a network.

Head over to VMWare > Edit tab and click on Virtual Network Editor

![image](https://user-images.githubusercontent.com/58165365/258512916-e13a4c50-bee5-4cb2-8c08-f54d051d096f.png)

Click on Change Settings (_You need admin priviledges_)

![image](https://user-images.githubusercontent.com/58165365/258513138-c4874f22-b66d-44b0-bf38-00464a80bceb.png)

Click on Add Network

![image](https://user-images.githubusercontent.com/58165365/258513782-7d650f22-d553-403a-8be7-c1b17ac0b329.png)

![image](https://user-images.githubusercontent.com/58165365/258514189-cae57cfb-6f08-4c81-a9bd-5f0da574bbfc.png)


![image](https://user-images.githubusercontent.com/58165365/258514635-5fa2d0c0-438c-4940-8786-7bf3264066c3.png)


![image](https://user-images.githubusercontent.com/58165365/258515737-42b8f7ce-49b0-4f0e-9137-9a8a376d9d35.png) 

![image](https://user-images.githubusercontent.com/58165365/258517261-f3e6297c-6857-4934-838a-68613f2ac98a.png)


![image](https://user-images.githubusercontent.com/58165365/258518668-a101d3ad-cbc7-447b-bfa5-4285b2ac25f2.png)