# Introduction
Windows 11 has two version : **Home** and **pro**.</br>
In the **pro** version (not on the **home** version), it can activate the BitLocker encryption 

# File system

- **versions of the Windows's file system :** `NTFS`, `FAT16`, `FAT32`, `HPFS`
- **Current version :** `NTFS` (New Technology File System)

### NTFS properties

- **Journaling file system** :</br>
can automatically repair the folders, files on the disk by using the information stored in a log file 

- Support files larger than 4GB

- Can set specific permissions on folders and files
![(ressources/ntfs-permissions.png)](ressources/ntfs-permissions.png)

- Can compress folder and files

- **EFS (Encryption File System):**</br>
   Can encrypt the content on the disk

    ---
### To check permission for a file or a folder
- Right-click the file or folder
- select Properties .
- click on the Security tab.
- In the Group or user names list, select the user, computer, or group whose permissions you want to view.
---
### To check the file system on a drive
- Right-click on the drive
- Go to properties
- It is written in `General`
---

### ADS (Alternate Data Streams – NTFS only)
- Default stream = `$DATA` (main file content)
- ADS = hidden extra streams (not visible in Explorer)
- Used by malware to hide data; browsers tag downloads with ADS

#### Commands (PowerShell)
```powershell
Get-Item file.txt -Stream *             # list streams
Set-Content file.txt -Stream hidden -Value "secret"   # add ADS
notepad file.txt:hidden                 # open ADS
Remove-Item file.txt -Stream hidden     # delete ADS
```
---

# System 32
- system32 contain most important files
- environment variable (for Windows directory) : %windir%

# User accounts, Profiles and Permissions
## User account
- Two types :
  - Administrator have all privileges
  - Standard user can change their file/folders
- User/group manager : `lusrmgr.msc`
- users can be assigned to multiple groups