# list of linux command
| command     | description                                                     | syntax                          | arguments (essentials)                  |
|-------------|-----------------------------------------------------------------|---------------------------------|-----------------------------------------|
| `echo`      | output any text provided                                        | `echo "text"`                   | `-n` no newline                         |
| `whoami`    | tell what user you're currently logged in as                    | `whoami`                        |                                         |
| `ls`        | list all files and directories in your current directory        | `ls [options] [path]`           | `-l` long ; `-a` all ; `-R` recursive   |
| `cat`       | output the content of a file in text                            | `cat file`                      | `-n` number lines                       |
| `cd`        | change directory                                                | `cd path`                       | `..` parent ; `-` previous dir          |
| `pwd`       | list current directory                                          | `pwd`                           |                                         |
| `find`      | search for a file/directory                                     | `find path -name "pattern"`     | `-name` by name ; `-type` file/dir      |
| `grep`      | search the contents of files for specific values                | `grep [options] "pattern" file` | `-i` ignore case ; `-r` recursive       |
| `wc`        | count entries in a file                                         | `wc [options] file`             | `-l` lines ; `-w` words ; `-c` bytes    |
| `touch`     | create a file                                                   | `touch file`                    |                                         |
| `mkdir`     | create a directory                                              | `mkdir [options] dir`           | `-p` parents                            |
| `cp`        | copy a file/directory to a directory (create it if not present) | `cp [options] source dest`      | `-r` recursive ; `-i` confirm overwrite |
| `mv`        | move/rename a file or directory                                 | `mv [options] source dest`      | `-i` confirm overwrite                  |
| `rm`        | delete a file/directory                                         | `rm [options] target`           | `-r` recursive ; `-f` force             |
| `file`      | determine the type of a file                                    | `file filename`                 |                                         |
| `su`        | switch user (by default, it will try to connect to root )       | `su [options] user`             | `-l` login shell                        |
| `ssh`       | create a remote connection (via a ssh session)                  | `ssh user@host`                 | `-p` port ; `-i` identity key           |
| `wget`      | download files from a webpage to the entire webpage             | `wget [options] url`            | `-c` continue ; `-O` output file        |
| `scp`       | tranfert files between two computers using ssh protocol         | `scp source user@host:dest`     | `-r` recursive ; `-P` port              |
| `ps`        | show running processes of our user                              | `ps [options]`                  | `aux` show all processes                |
| `top`       | similar to ps                                                   | `top`                           |                                         |
| `kill`      | stop a process by providing id PID                              | `kill PID`                      | `-9` force kill                         |
| `systemctl` | interact with the systemd process/daemon                        | `systemctl [action] service`    | `start` ; `stop` ; `status` ; `enable`  |
| `fg`        | return a background process to the foreground                   | `fg [%jobID]`                   |                                         |

---

# usefull linux operators
| Symbol / Operator | Description                                                           | syntax example           |
|-------------------|-----------------------------------------------------------------------|--------------------------|
| `&`               | run command in background                                             | `sleep 100 &`            |
| `CTRL+Z`          | suspend current process to background                                 | *(keypress only)*        |
| `&&`              | run multiple commands if previous was successful                      | `mkdir test && cd test`  |
| `>`               | redirect an output from a command elsewhere and replace the content   | `echo hello > file.txt`  |
| `>>`              | redirect an output from a command elsewhere and add it to the content | `echo world >> file.txt` |

---

# common directories
| directory | explanation                                                                                                |
|-----------|------------------------------------------------------------------------------------------------------------|
| `/etc`    | store system files used by OS (`passwd`,`shadow`,...)                                                      |
| `/var`    | store data that is frequently accessed or written by services or applications (`tmp`,`log`,databases, ...) |
| `/root`   | home directory of the root user                                                                            |
| `/tmp`    | store tempory files and once the computer is restarted, the contents of this folder are deleted            |

# schedulded command
To defined commands to be used at a certain time of the day, week, month, etc, you can use the `cron` process which is all running thanks to the `crontabs` (one of the process executed during boot to manage cron jobs).</br>

To defined a process to run at a certain time, you need to edit the `crontab` (special file with formating recognised by the cron process to execute each line one by one)</br>
*To edit the `crontab`, use `crontab -e`*


| Field | Description                          |
|-------|--------------------------------------|
| MIN   | What minute to execute at            |
| HOUR  | What hour to execute at              |
| DOM   | What day of the month to execute at  |
| MON   | What month of the year to execute at |
| DOW   | What day of the week to execute at   |

</br>

**Syntax for a scheduled process in a crontab :** 
```bash
MIN HOUR DOM MON DOW <command>
```
*If you don't want to give any value for a field, just use \**


# Package management
To add a repository if it is not on your OS default repository. We can use `add-apt-repository`.</br>

**To fully install a third party software manually :**
1. Download the GPG keys ==> keys that will ensure you have the right version by doing a safety check (they are given by developers)
2. Create a file in /etc/apt/sources.list.d/ 
3. Enter the repository information in this file by using a text editor
4. Update this added entry with `apt update` for apt to recognise this new entry
5. Intall the software using `apt install`

