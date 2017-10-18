## ping DUP!

```bash
ping 10.189.16.6

PING 10.189.16.6 (10.189.16.6) 56(84) bytes of data.
64 bytes from 10.189.16.6: icmp_seq=1 ttl=63 time=0.255 ms
64 bytes from 10.189.16.6: icmp_seq=1 ttl=63 time=0.395 ms (DUP!)
64 bytes from 10.189.16.6: icmp_seq=2 ttl=63 time=0.245 ms
64 bytes from 10.189.16.6: icmp_seq=2 ttl=63 time=0.384 ms (DUP!)
64 bytes from 10.189.16.6: icmp_seq=3 ttl=63 time=0.220 ms
```

tcpdump show the dup packet from the same mac address
```bash
tcpdump -i any -es 0 -nn host 10.189.16.6

02:30:28.871997 Out e8:61:1f:15:34:93 ethertype IPv4 (0x0800), length 100: 10.189.8.4 > 10.189.16.6: ICMP echo request, id 39323, seq 1, length 64
02:30:28.872223  In 48:7a:da:8c:bf:3b ethertype IPv4 (0x0800), length 100: 10.189.16.6 > 10.189.8.4: ICMP echo reply, id 39323, seq 1, length 64
02:30:28.872363  In 48:7a:da:8c:bf:3b ethertype IPv4 (0x0800), length 100: 10.189.16.6 > 10.189.8.4: ICMP echo reply, id 39323, seq 1, length 64
02:30:29.871197 Out e8:61:1f:15:34:93 ethertype IPv4 (0x0800), length 100: 10.189.8.4 > 10.189.16.6: ICMP echo request, id 39323, seq 2, length 64
02:30:29.871418  In 48:7a:da:8c:bf:3b ethertype IPv4 (0x0800), length 100: 10.189.16.6 > 10.189.8.4: ICMP echo reply, id 39323, seq 2, length 64
02:30:29.871557  In 48:7a:da:8c:bf:3b ethertype IPv4 (0x0800), length 100: 10.189.16.6 > 10.189.8.4: ICMP echo reply, id 39323, seq 2, length 64
```

