
# 遇到问题

## 本地运行 kube via minikube, 但是 vm ip 却连不上

```bash
vbox:~# minikube start
Starting local Kubernetes v1.7.5 cluster...
Starting VM...
Getting VM IP address...
Moving files into cluster...
Setting up certs...
Connecting to cluster...
Setting up kubeconfig...
Starting cluster components...
Kubectl is now configured to use the cluster.
```

执行如上命令，显示 minikube 已经启动
```bash
vbox:~# minikube status
minikube: Running
cluster: Running
kubectl: Correctly Configured: pointing to minikube-vm at 192.168.99.100
```

但是，ping `192.168.99.100` 却不通
```bash
vbox:~# ping 192.168.99.100 -c 10 -q
PING 192.168.99.100 (192.168.99.100) 56(84) bytes of data.

--- 192.168.99.100 ping statistics ---
10 packets transmitted, 0 received, 100% packet loss, time 9205ms
```

通过 VBoxManage 查看虚拟机状态，机器是启动的

```bash
vbox:~# VBoxManage list vms
"minikube" {1d22781f-f7ee-40fb-af64-5b3459d3f66f}
vbox:~# VBoxManage showvminfo minikube
Name:            minikube
Groups:          /
Guest OS:        Linux 2.6 / 3.x / 4.x (64-bit)
UUID:            1d22781f-f7ee-40fb-af64-5b3459d3f66f
Config file:     /root/.minikube/machines/minikube/minikube/minikube.vbox
Snapshot folder: /root/.minikube/machines/minikube/minikube/Snapshots
Log folder:      /root/.minikube/machines/minikube/minikube/Logs
Hardware UUID:   1d22781f-f7ee-40fb-af64-5b3459d3f66f
Memory size:     2048MB
Page Fusion:     off
VRAM size:       8MB
CPU exec cap:    100%
HPET:            on
Chipset:         piix3
Firmware:        BIOS
Number of CPUs:  2
PAE:             on
Long Mode:       on
Triple Fault Reset: off
APIC:            on
X2APIC:          off
CPUID Portability Level: 0
CPUID overrides: None
Boot menu mode:  disabled
Boot Device (1): DVD
Boot Device (2): DVD
Boot Device (3): HardDisk
Boot Device (4): Not Assigned
ACPI:            on
IOAPIC:          on
BIOS APIC mode:  APIC
Time offset:     0ms
RTC:             UTC
Hardw. virt.ext: on
Nested Paging:   on
Large Pages:     on
VT-x VPID:       on
VT-x unr. exec.: on
Paravirt. Provider: Default
Effective Paravirt. Provider: KVM
State:           running (since 2017-10-18T14:55:42.288000000)
Monitor count:   1
3D Acceleration: off
2D Video Acceleration: off
Teleporter Enabled: off
Teleporter Port: 0
Teleporter Address:
Teleporter Password:
Tracing Enabled: off
Allow Tracing to Access VM: off
Tracing Configuration:
Autostart Enabled: off
Autostart Delay: 0
Default Frontend:
Storage Controller Name (0):            SATA
Storage Controller Type (0):            IntelAhci
Storage Controller Instance Number (0): 0
Storage Controller Max Port Count (0):  30
Storage Controller Port Count (0):      30
Storage Controller Bootable (0):        on
SATA (0, 0): /root/.minikube/machines/minikube/boot2docker.iso (UUID: 10d356c8-4a84-4282-9d30-35264aaf1254)
SATA (1, 0): /root/.minikube/machines/minikube/disk.vmdk (UUID: 9014349e-a264-4fb4-af96-4f0df538dae8)
NIC 1:           MAC: 080027E9A5F8, Attachment: NAT, Cable connected: on, Trace: off (file: none), Type: 82540EM, Reported speed: 0 Mbps, Boot priority: 0, Promisc Policy: deny, Bandwidth group: none
NIC 1 Settings:  MTU: 0, Socket (send: 64, receive: 64), TCP Window (send:64, receive: 64)
NIC 1 Rule(0):   name = ssh, protocol = tcp, host ip = 127.0.0.1, host port = 41363, guest ip = , guest port = 22
NIC 2:           MAC: 080027CCB8E2, Attachment: Host-only Interface 'vboxnet0', Cable connected: on, Trace: off (file: none), Type: 82540EM, Reported speed: 0 Mbps, Boot priority: 0, Promisc Policy: deny, Bandwidth group: none
NIC 3:           disabled
NIC 4:           disabled
NIC 5:           disabled
NIC 6:           disabled
NIC 7:           disabled
NIC 8:           disabled
Pointing Device: PS/2 Mouse
Keyboard Device: PS/2 Keyboard
UART 1:          disabled
UART 2:          disabled
UART 3:          disabled
UART 4:          disabled
LPT 1:           disabled
LPT 2:           disabled
Audio:           enabled (Driver: PulseAudio, Controller: AC97, Codec: STAC9700)
Clipboard Mode:  disabled
Drag and drop Mode: disabled
Session name:    headless
Video mode:      720x400x0 at 0,0 enabled
VRDE:            disabled
USB:             disabled
EHCI:            disabled
XHCI:            disabled

USB Device Filters:

<none>

Available remote USB devices:

<none>

Currently Attached USB Devices:

<none>

Bandwidth groups:  <none>

Shared folders:

Name: 'hosthome', Host path: '/home' (machine mapping), writable

VRDE Connection:    not active
Clients so far:     0

Video capturing:    not active
Capture screens:    0
Capture file:       /root/.minikube/machines/minikube/minikube/minikube.webm
Capture dimensions: 1024x768
Capture rate:       512 kbps
Capture FPS:        25

Guest:

Configured memory balloon size:      0 MB
OS type:                             Linux26_64
Additions run level:                 2
Additions version:                   5.1.18 r114002


Guest Facilities:

Facility "VirtualBox Base Driver": active/running (last update: 2017/10/18 14:56:05 UTC)
Facility "VirtualBox System Service": active/running (last update: 2017/10/18 14:56:05 UTC)
Facility "Seamless Mode": not active (last update: 2017/10/18 14:56:05 UTC)
Facility "Graphics Mode": not active (last update: 2017/10/18 14:56:05 UTC)

```

从中发现，minikube vm 占用系统的 41363 端口
```bash
NIC 1 Rule(0):   name = ssh, protocol = tcp, host ip = 127.0.0.1, host port = 41363, guest ip = , guest port = 22
```

尝试连接本机 41363 端口, 不过登录不上
```bash
vbox:~# ssh root@127.0.0.1 -p 41363
The authenticity of host '[127.0.0.1]:41363 ([127.0.0.1]:41363)' can't be established.
ECDSA key fingerprint is SHA256:K/uCAVIaMPM4moCw2vwcO6BejpcIJkkQULuPtqFjIHI.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[127.0.0.1]:41363' (ECDSA) to the list of known hosts.
root@127.0.0.1's password:
Permission denied, please try again.
root@127.0.0.1's password:
Permission denied, please try again.
root@127.0.0.1's password:
Permission denied (publickey,password,keyboard-interactive).
```

由于 vm 是启动的，但是 192.168.99.100 不通，猜测是不是该 IP 没有配置上
继续排查，发现 minikube 的配置文件里写了 vm 的相关心思
```bash
~/.minikube/machines/minikube/config.json

```

```bash
vbox:~/.minikube/machines/minikube# head config.json
{
    "ConfigVersion": 3,
    "Driver": {
        "IPAddress": "192.168.99.100",
        "MachineName": "minikube",
        "SSHUser": "docker",
        "SSHPort": 41363,
        "SSHKeyPath": "/root/.minikube/machines/minikube/id_rsa",
        "StorePath": "/root/.minikube",
```

尝试使用 docker 及相应的密钥登录
```bash
vbox:~/.minikube/machines/minikube# ssh -i /root/.minikube/machines/minikube/id_rsa docker@127.0.0.1 -p 41363
                         _             _
            _         _ ( )           ( )
  ___ ___  (_)  ___  (_)| |/')  _   _ | |_      __
/' _ ` _ `\| |/' _ `\| || , <  ( ) ( )| '_`\  /'__`\
| ( ) ( ) || || ( ) || || |\`\ | (_) || |_) )(  ___/
(_) (_) (_)(_)(_) (_)(_)(_) (_)`\___/'(_,__/'`\____)

$

```

登录成功, 查看 ip 配置
```bash
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:e9:a5:f8 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 85760sec preferred_lft 85760sec
    inet6 fe80::a00:27ff:fee9:a5f8/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:cc:b8:e2 brd ff:ff:ff:ff:ff:ff
    inet 192.168.99.100/24 brd 192.168.99.255 scope global dynamic eth1
       valid_lft 560sec preferred_lft 560sec
    inet6 fe80::a00:27ff:fecc:b8e2/64 scope link
       valid_lft forever preferred_lft forever
4: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1
    link/sit 0.0.0.0 brd 0.0.0.0
5: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:c7:77:d6:48 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
```

ip 是配置的， 但是到网关不通
```bash
$ ping 192.168.99.1
PING 192.168.99.1 (192.168.99.1): 56 data bytes
^C
--- 192.168.99.1 ping statistics ---
4 packets transmitted, 0 packets received, 100% packet loss
```

查看路由 
```bash
$ ip r get 192.168.99.1
192.168.99.1 dev eth1 src 192.168.99.100
    cache
```

查看宿主机的路由
```bash
vinian@vbox:~$ ip r get 192.168.99.100
192.168.99.100 via 192.168.1.1 dev eth0 src 192.168.1.10
    cache
```

路由是错的，到 `192.168.99.100` 的网关应该是 `192.168.99.1`
宿主机 ip 信息
```bash
vinian@vbox:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq state UP group default qlen 1000
    link/ether f0:1f:af:36:4f:cf brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.10/24 brd 192.168.1.255 scope global dynamic eth0
       valid_lft 82526sec preferred_lft 82526sec
    inet6 fe80::f21f:afff:fe36:4fcf/64 scope link
       valid_lft forever preferred_lft forever
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 84:a6:c8:22:e7:fa brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.8/24 brd 192.168.1.255 scope global dynamic wlan0
       valid_lft 82520sec preferred_lft 82520sec
    inet6 fe80::e1a:d59e:aada:7d92/64 scope link
       valid_lft forever preferred_lft forever
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:0a:24:aa:73 brd ff:ff:ff:ff:ff:ff
    inet 192.168.16.1/20 scope global docker0
       valid_lft forever preferred_lft forever
9: vboxnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq state UP group default qlen 1000
    link/ether 0a:00:27:00:00:00 brd ff:ff:ff:ff:ff:ff
    inet 192.168.99.1/24 brd 192.168.99.255 scope global vboxnet0
       valid_lft forever preferred_lft forever
    inet6 fe80::800:27ff:fe00:0/64 scope link
       valid_lft forever preferred_lft forever
10: vboxnet1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 0a:00:27:00:00:01 brd ff:ff:ff:ff:ff:ff
```


添加路由, 但是不成功
```bash
vinian@vbox:~$ sudo ip r add 192.168.99.0/24 via 192.168.99.1
vinian@vbox:~$ ip r get 192.168.99.100
192.168.99.100 via 192.168.1.1 dev eth0 src 192.168.1.10
    cache
```

关掉 cisco anyconnect 后，尝试添加路由，发现能添加上
重启机器，启动 minikube，路由自动添加，然后启动 cisco anyconnect 没有任何影响
重启机器，开启 cisco anyconnect，然后启动 minikube，192.168.99.0/24 这一条路由就没有

后续继续排查
