# list of linux command
| command | description                                                     | arguments (most importants)     |
|---------|-----------------------------------------------------------------|---------------------------------|
| echo    | output any text provided                                        |                                 |
| whoami  | tell what user you're currently logged in as                    |                                 |
| ls      | list all files and directories in your current directory        | -l long ; -a all ; -R recursive |
| cat     | output the content of a file in text                            |                                 |
| cd      | change directory                                                |                                 |
| pwd     | list current directory                                          |                                 |
| find    | search for a file/directory                                     | -name                           |
| grep    | search the contents of files for specific values                | < start of word ; > end word ;  |
| wc      | count entries in a file                                         |                                 |
| touch   | create a file                                                   |                                 |
| mkdir   | create a directory                                              |                                 |
| cp      | copy a file/directory to a directory (create it if not present) | -r recursive                    |
| mv      | move a file/directory to another directory                      | -r recursive                    |
| rm      | delete a file/directory                                         | -r recursive                    |
| file    | determine the type of a file                                    |                                 |
| su      | switch user (by default, it will try to connect to root )       | -l login                        |
| ssh     | create a remote connection (via a ssh session)                  |                                 |


# usefull linux operators
| Symbol / Operator | Description                                                           |
|-------------------|-----------------------------------------------------------------------|
| &                 | run command in background                                             |
| &&                | run multiple commands one by one and if the previous was successfull  |
| >                 | redirect an output from a command elsewhere and replace the content   |
| >>                | redirect an output from a command elsewhere and add it to the content |


# common directories
| directory | explanation                                                                                                |
|-----------|------------------------------------------------------------------------------------------------------------|
| /etc      | store system files used by OS (`passwd`,`shadow`,...)                                                      |
| /var      | store data that is frequently accessed or written by services or applications (`tmp`,`log`,databases, ...) |
| /root     | home directory of the root user                                                                            |
| /tmp      | store tempory files and once the computer is restarted, the contents of this folder are deleted            |

