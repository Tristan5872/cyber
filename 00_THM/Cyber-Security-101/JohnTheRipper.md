# John The Ripper

`John The Ripper` is an open-source tool for password cracking focused on hashes.

---

## Installation and syntax

**Ubuntu / Debian**
```bash
sudo apt-get install john
```

**Fedora**
```bash
sudo dnf install john
```

**Syntax**
```bash
john [options] [file path]
```
---

## Identify hash type

Online tool 
- https://hashes.com/en/tools/hash_identifier

Local tool
- https://gitlab.com/kalilinux/packages/hash-identifier/-/tree/kali/master

---

## Mode : Brute Force

This mode tries all possible combinations of characters until it finds the correct one.
**Note : it is the mode by default**

### Using a wordlist
```bash
john --wordlist=[path to wordlist] [path to file]
```

### Provide hash type manually
```bash
john --format=[hash type] --wordlist=[path to wordlist] [path to file]
```

*when using standard format, you can add raw-[format] to ensure it uses the raw hash*

### List of formats
```bash
john --list=formats
```

### Unshawdow

To crack password hashes from `/etc/shadow`, you need to extract them first.
For that, you can use `unshadow` command that comes with John The Ripper.

```bash
sudo unshadow /etc/passwd /etc/shadow > mypasswd.txt
```
- /etc/passwd contains user account information.
- /etc/shadow contains the hashed passwords.
- mypasswd.txt will contain the combined information.

Then, you can run John The Ripper on the generated file.

```bash
john --wordlist=[path to wordlist] mypasswd.txt
```

---

## Mode : Single Crack

This mode uses informations (user’s full name, office number, telephone number) from the system to generate possible passwords.

### Syntax
```bash
john --single [file path]
``` 

Important : this mode only works when the file contains user account information (like the one generated with unshadow).
So you need to change the file accordingly. 
#### Example
**Before**
```
1efee03cdcb96d90ad48ccc7b8666033
```
**After**
```
mike:1efee03cdcb96d90ad48ccc7b8666033
```

### Custom rules
You can create your own rules to customize the password generation.
[List of rules](https://www.openwall.com/john/doc/RULES.shtml)
1. Go into `john.conf` file (usually located in `/etc/john/` or `/opt/john/`).
2. Add your rules under `[List.Rules:Single]` section.
   - To create a rule you should add the line `[List.Rules:MyRules]` where `MyRules` is the name of your rule set.
   - Each rule should be on a new line
3. Use your custom rules when running John The Ripper
```bash
john --single --rules=MyRules [file path]
```

#### Example
**John.conf**
```bash
[List.Rules:MyRules]
cAz"123"   # Capitalize first caracter and add "123" to the end of the password
Az"[a-z]"  # add all lowercase letters to the end of the password
```
**Command**
```bash
john --single --rules=MyRules mypasswd.txt
```

---

## Zip2john
To crack password-protected zip files, you need to use `zip2john` to extract the hash from the zip file.

```bash
zip2john protected.zip > zip_hash.txt
```
Then, you can run John The Ripper on the generated file.

```bash
john --wordlist=[path to wordlist] zip_hash.txt
```

<br>

*You can use `unzip` to extract files from a zip archive if you want to access the contents directly.*
```bash
unzip protected.zip
```

---

## Rar2john
To crack password-protected rar files, you need to use `rar2john` to extract the hash from the rar file.

```bash
rar2john protected.rar > rar_hash.txt
```
Then, you can run John The Ripper on the generated file.

```bash
john --wordlist=[path to wordlist] rar_hash.txt
```
<br>

*You can use `unrar` to extract files from a rar archive if you want to access the contents directly.*
``` bash
unrar e -r protected.rar
```

---

## SSH2john
To crack password-protected SSH private keys, you need to use `ssh2john` to extract the hash from the SSH key file.

```bash
ssh2john id_rsa > ssh_hash.txt
```

Then, you can run John The Ripper on the generated file.

```bash
john --wordlist=[path to wordlist] ssh_hash.txt
```

---

# Sources

Website containing more details and documentation:
https://www.openwall.com/john/
