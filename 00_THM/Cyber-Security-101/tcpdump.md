# Basics of tcpdump

| Command                                              | Explanation                                                           |
|------------------------------------------------------|-----------------------------------------------------------------------|
| `tcpdump host IP` or `tcpdump host HOSTNAME`         | Filters packets by IP address or hostname                             |
| `tcpdump src host IP` or `tcpdump src host HOSTNAME` | Filters packets by a specific source host                             |
| `tcpdump dst host IP` or `tcpdump dst host HOSTNAME` | Filters packets by a specific destination host                        |
| `tcpdump port PORT_NUMBER`                           | Filters packets by port number                                        |
| `tcpdump src port PORT_NUMBER`                       | Filters packets by the specified source port number                   |
| `tcpdump dst port PORT_NUMBER`                       | Filters packets by the specified destination port number              |
| `tcpdump PROTOCOL`                                   | Filters packets by protocol; examples include `ip`, `ip6`, and `icmp` |

**Operators for tcpdump :** 
- `and` : Combines multiple filters, requiring all conditions to be met
- `or` : Combines multiple filters, requiring at least one condition to be met
- `not` : Negates a filter condition

**Useful arguments for tcpdump :**
- `-i INTERFACE` : Specifies the network interface to listen on (e.g., `eth0`, `wlan0`)
- `-n` : Prevents DNS resolution, displaying IP addresses instead of hostnames
- `-t` : Omits the timestamp from the output
- `-v`, `-vv`, `-vvv` : Increases the verbosity of the output, providing more detailed information
- `-c COUNT` : Captures a specified number of packets before stopping
- `-w FILE` : Writes the captured packets to a file for later analysis
- `-r FILE` : Reads packets from a file instead of capturing live traffic
- `-q` : Provides a quieter output, showing less information per packet
  

# Advanced filtering
All the following can be seen in the pcap-filter page of the tcpdump : `man pcap-filter`


- `greater LENGTH` : Filters packets with a length greater than the specified value
- `less LENGTH` : Filters packets with a length less than the specified value

## filtering by specific byte values
syntax : `proto[OFFSET:SIZE]` : Filters packets based on specific byte values at a given offset within the protocol header.



*in the pcap-filter page:*<br>
*The  following  TCP  flags field values are available: tcp-fin,
tcp-syn, tcp-rst, tcp-push, tcp-ack, tcp-urg, tcp-ece, tcp-cwr.*


| example                               | description                                           |
|---------------------------------------|-------------------------------------------------------|
| tcpdump "tcp[tcpflags] == tcp-syn"    | Captures TCP SYN packets (contain only the SYN flag). |
| tcpdump "tcp[tcpflags] & tcp-syn != 0 | Capture TCP packets with at least the SYN flag set.   |
| tcpdump "tcp[tcpflags] & (tcp-ack|tcp-push) != 0 | Capture TCP packets with at least the ACK or PUSH flag set.   |

# Output formatting options

- `q`: Quick output; print brief packet information
- `e`: Print the link-level header
- `A`: Show packet data in ASCII
- `xx`: Show packet data in hexadecimal format, referred to as hex
- `X`: Show packet headers and data in hex and ASCII