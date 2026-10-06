# Hydra

Tool used for brute force attacks on login.

## Syntax

```bash
hydra -l <username> -P <password_list> <target> <protocol>
```

## SSH Example

```bash
hydra -l root -P /usr/share/wordlists/rockyou.txt 192.168.1.1 ssh
```

## HTTP Example

```bash
hydra -l admin -P /usr/share/wordlists/rockyou.txt 192.168.1.1 http-post-form "/login.php:username=^USER^&password=^PASS^:F=incorrect"
```

## Useful Options

- `-l`: Specify a single username.
- `-L`: Specify a file containing a list of usernames.
- `-P`: Specify a file containing a list of passwords.
- `-t`: Set the number of parallel connections.
- `-f`: Exit after the first valid password is found.
- `-V`: Enable verbose mode to see detailed output.
- `-o`: Specify an output file to save the results.
- `-s`: Specify a custom port if the service is running on a non-standard port.
- `-w`: Set a timeout for each connection attempt.