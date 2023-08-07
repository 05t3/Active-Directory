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
2. Internal - 192.168.50.0/24

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


## Setting up the Domain Controller

Assuming you already installed your hypervisor, navigate to _File > New Virtual Machine_ and select the _Typical Configuration_.

![image](https://user-images.githubusercontent.com/58165365/258768618-861e295b-ce8b-44e7-b3f5-e7999bb78442.png)

Select your ISO Image and click next.

![image](https://user-images.githubusercontent.com/58165365/258769186-37110964-a33e-465f-9d99-d76bee929225.png)

Since this is a lab environemnt, we dont really need a Product key, so just ignore it. Choose a version to install and autologon credentials (_Optional_).

![image](https://user-images.githubusercontent.com/58165365/258769554-dea67205-7eed-48d9-abf5-af68fa2c0edf.png)

Name your VM and location to Install.

![image](https://user-images.githubusercontent.com/58165365/258769847-094fc183-cd59-422b-aa39-6b88dffde7ad.png)

Assign your DC Disk capacity of your liking.

![image](https://user-images.githubusercontent.com/58165365/258770030-674e17bd-73a5-428e-85ce-c45475b786b9.png)

If you are satisfied with the changes, hit finish. However, if you wish to modifying the number of CPUs and memory, click _Customize Hardware._
![image](https://user-images.githubusercontent.com/58165365/258770183-6e29e82a-a288-46dd-b027-0eeb33a74d64.png)

The Server installation is fairly easy as it will do all the work for you, including installing VMWare tools then reboot. 

![image](https://user-images.githubusercontent.com/58165365/258773651-607054af-a459-4d0c-a7a9-c06e6d55ef72.png)

Once the server reboots, we need to do a couple of things:

1. Change Server's timezone information.
2. Change Server name.
3. Setup Static IP.
4. Disable Windows defender.

I made your work easier by writing a simple Powershell script that automates the process. 

You can get the script [here](NOTES/LAB Setup/initial-setup.ps1).

NB: **Be sure to execute the script with Admin Privileges**

< Screenshot >

After a reboot, we get the "Windows Server Configuration" window. On the first tab, hit **Next**

![image](https://user-images.githubusercontent.com/58165365/258783658-41838acd-eac8-427d-b5d9-034f0f974482.png)

If you are contented with the Timezone Setting we set earlier, hit **Next**

![image](https://user-images.githubusercontent.com/58165365/258783818-7ca3f9a3-f180-432f-ad12-d2e932e054e2.png)

On the next window, we need to set the **Company name**, **Internal domain name** to a name of your liking. In my case, I choose to base my lab around the American sitcom - [The Office](https://www.imdb.com/title/tt0386676/).

![image](https://user-images.githubusercontent.com/58165365/258784226-e34826f4-6eee-4c41-84b0-b5525f71a709.png)

Once this is done, we can set an Admin User account & password as shown below, then hit **Next**.

![image](https://user-images.githubusercontent.com/58165365/258785774-95bb5479-a2b7-4ef3-b21d-5d988d22472d.png)

As we dont really need to update the DC, you can just choose to **Do this later** and select **Configure**

![image](https://user-images.githubusercontent.com/58165365/258786206-36d3f084-a550-421a-a809-81f27da2612c.png)

The next step takes a couple of minutes (or more) to fully setup.

![image](https://user-images.githubusercontent.com/58165365/258786628-a674fac4-2830-4e03-ad0e-52a3ef570a9d.png)

Once everything is configured, hit close then restart the server.

![image](https://user-images.githubusercontent.com/58165365/258788429-c93fca8d-af38-4527-9752-149fd4826f68.png)

You will now be prompted to login using the new Admin Credentials:

![image](https://user-images.githubusercontent.com/58165365/258789079-24a638d6-f6ad-43f0-a7b5-881f82c8ebf9.png)

After loging in, we can confirm changes took place by looking at the basic computer information.

![image](https://user-images.githubusercontent.com/58165365/258793819-81ccd04b-e55f-4ea7-8470-31283dd749f2.png)

You can also do the same by going to _Settings > About your PC_

![image](https://user-images.githubusercontent.com/58165365/258794890-892c7f55-50cc-4b09-a399-fc2c599cc98d.png).

For the static IP, it's also correctly setup.

![image](https://user-images.githubusercontent.com/58165365/258795535-e3f19669-c28c-4bea-8739-084982fd990b.png)