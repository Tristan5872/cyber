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
