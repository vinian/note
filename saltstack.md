

### Centos 6.3 安装 2016.11 版本启动不了

原因: pyzmq 版本太老

```bash
salt-call -l debug test.ping
[DEBUG   ] Reading configuration from /etc/salt/minion
[DEBUG   ] Using cached minion ID from /etc/salt/minion_id: minion
[DEBUG   ] Configuration file path: /etc/salt/minion
[WARNING ] Insecure logging configuration detected! Sensitive data may be logged.
[DEBUG   ] Reading configuration from /etc/salt/minion
[DEBUG   ] Connecting to master. Attempt 1 of 1
[DEBUG   ] Initializing new AsyncAuth for ('/etc/salt/pki/minion', 'minion', 'tcp://master:4506')
[DEBUG   ] Generated random reconnect delay between '1000ms' and '11000ms' (8364)
[DEBUG   ] Setting zmq_reconnect_ivl to '8364ms'
[DEBUG   ] Setting zmq_reconnect_ivl_max to '11000ms'
[DEBUG   ] Initializing new AsyncZeroMQReqChannel for ('/etc/salt/pki/minion', 'minion', 'tcp://master:4506', 'clear')
*** stack smashing detected ***: /usr/bin/python2.6 terminated
======= Backtrace: =========
/lib64/libc.so.6(__fortify_fail+0x37)[0x318af012a7]
/lib64/libc.so.6(__fortify_fail+0x0)[0x318af01270]
/usr/lib64/python2.6/site-packages/zmq/backend/cython/socket.so(+0x117af)[0x7f449641b7af]
/usr/lib64/python2.6/site-packages/zmq/backend/cython/socket.so(+0x64bf)[0x7f44964104bf]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5f51)[0x7f44a38f46e1]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(+0x6ad9d)[0x7f44a3888d9d]
/usr/lib64/libpython2.6.so.1.0(PyObject_Call+0x53)[0x7f44a3861c63]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x3cd0)[0x7f44a38f2460]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(+0x6aca0)[0x7f44a3888ca0]
/usr/lib64/libpython2.6.so.1.0(PyObject_Call+0x53)[0x7f44a3861c63]
/usr/lib64/libpython2.6.so.1.0(+0x566af)[0x7f44a38746af]
/usr/lib64/libpython2.6.so.1.0(PyObject_Call+0x53)[0x7f44a3861c63]
/usr/lib64/libpython2.6.so.1.0(+0x9567e)[0x7f44a38b367e]
/usr/lib64/libpython2.6.so.1.0(+0x94288)[0x7f44a38b2288]
/usr/lib64/libpython2.6.so.1.0(PyObject_Call+0x53)[0x7f44a3861c63]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x47d4)[0x7f44a38f2f64]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(+0x6ad9d)[0x7f44a3888d9d]
/usr/lib64/libpython2.6.so.1.0(PyObject_Call+0x53)[0x7f44a3861c63]
/usr/lib64/libpython2.6.so.1.0(+0x566af)[0x7f44a38746af]
/usr/lib64/libpython2.6.so.1.0(PyObject_Call+0x53)[0x7f44a3861c63]
/usr/lib64/libpython2.6.so.1.0(+0x9567e)[0x7f44a38b367e]
/usr/lib64/libpython2.6.so.1.0(+0x94288)[0x7f44a38b2288]
/usr/lib64/libpython2.6.so.1.0(PyObject_Call+0x53)[0x7f44a3861c63]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x3cd0)[0x7f44a38f2460]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalFrameEx+0x5304)[0x7f44a38f3a94]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCodeEx+0x927)[0x7f44a38f5647]
/usr/lib64/libpython2.6.so.1.0(PyEval_EvalCode+0x32)[0x7f44a38f5722]
/usr/lib64/libpython2.6.so.1.0(+0xf1b9c)[0x7f44a390fb9c]
/usr/lib64/libpython2.6.so.1.0(PyRun_FileExFlags+0x90)[0x7f44a390fc70]
/usr/lib64/libpython2.6.so.1.0(PyRun_SimpleFileExFlags+0xdc)[0x7f44a391115c]
/usr/lib64/libpython2.6.so.1.0(Py_Main+0xb62)[0x7f44a391d892]
/lib64/libc.so.6(__libc_start_main+0xfd)[0x318ae1ecdd]
/usr/bin/python2.6[0x400649]
======= Memory map: ========
00400000-00401000 r-xp 00000000 08:02 2317406                            /usr/bin/python2.6
00600000-00601000 rw-p 00000000 08:02 2317406                            /usr/bin/python2.6
024a1000-03b1e000 rw-p 00000000 00:00 0                                  [heap]
3179800000-3179803000 r-xp 00000000 08:02 2197809                        /lib64/libcom_err.so.2.1
3179803000-3179a02000 ---p 00003000 08:02 2197809                        /lib64/libcom_err.so.2.1
3179a02000-3179a03000 r--p 00002000 08:02 2197809                        /lib64/libcom_err.so.2.1
3179a03000-3179a04000 rw-p 00003000 08:02 2197809                        /lib64/libcom_err.so.2.1
3179c00000-3179c3f000 r-xp 00000000 08:02 2197605                        /lib64/libgssapi_krb5.so.2.2
3179c3f000-3179e3f000 ---p 0003f000 08:02 2197605                        /lib64/libgssapi_krb5.so.2.2
3179e3f000-3179e40000 r--p 0003f000 08:02 2197605                        /lib64/libgssapi_krb5.so.2.2
3179e40000-3179e42000 rw-p 00040000 08:02 2197605                        /lib64/libgssapi_krb5.so.2.2
317a400000-317a4d4000 r-xp 00000000 08:02 2197606                        /lib64/libkrb5.so.3.3
317a4d4000-317a6d4000 ---p 000d4000 08:02 2197606                        /lib64/libkrb5.so.3.3
317a6d4000-317a6dd000 r--p 000d4000 08:02 2197606                        /lib64/libkrb5.so.3.3
317a6dd000-317a6df000 rw-p 000dd000 08:02 2197606                        /lib64/libkrb5.so.3.3
317ac00000-317ac07000 r-xp 00000000 08:02 2197768                        /lib64/libcrypt-2.12.so
317ac07000-317ae07000 ---p 00007000 08:02 2197768                        /lib64/libcrypt-2.12.so
317ae07000-317ae08000 r--p 00007000 08:02 2197768                        /lib64/libcrypt-2.12.so
317ae08000-317ae09000 rw-p 00008000 08:02 2197768                        /lib64/libcrypt-2.12.so
317ae09000-317ae37000 rw-p 00000000 00:00 0
317b400000-317b45d000 r-xp 00000000 08:02 2197772                        /lib64/libfreebl3.so
317b45d000-317b65c000 ---p 0005d000 08:02 2197772                        /lib64/libfreebl3.so
317b65c000-317b65d000 r--p 0005c000 08:02 2197772                        /lib64/libfreebl3.so
317b65d000-317b65e000 rw-p 0005d000 08:02 2197772                        /lib64/libfreebl3.so
317b65e000-317b662000 rw-p 00000000 00:00 0
318a600000-318a620000 r-xp 00000000 08:02 2197958                        /lib64/ld-2.12.so
318a81f000-318a820000 r--p 0001f000 08:02 2197958                        /lib64/ld-2.12.so
318a820000-318a821000 rw-p 00020000 08:02 2197958                        /lib64/ld-2.12.so
318a821000-318a822000 rw-p 00000000 00:00 0
318aa00000-318aa02000 r-xp 00000000 08:02 2197805                        /lib64/libdl-2.12.so
318aa02000-318ac02000 ---p 00002000 08:02 2197805                        /lib64/libdl-2.12.so
318ac02000-318ac03000 r--p 00002000 08:02 2197805                        /lib64/libdl-2.12.so
318ac03000-318ac04000 rw-p 00003000 08:02 2197805                        /lib64/libdl-2.12.soAborted
```

查看 salt-minion 版本信息
```bash
salt-minion --versions-report
Salt Version:
           Salt: 2016.11.7

Dependency Versions:
           cffi: Not Installed
       cherrypy: Not Installed
       dateutil: 1.4.1
      docker-py: Not Installed
          gitdb: Not Installed
      gitpython: Not Installed
          ioflo: Not Installed
         Jinja2: 2.8.1
        libgit2: Not Installed
        libnacl: Not Installed
       M2Crypto: Not Installed
           Mako: Not Installed
   msgpack-pure: Not Installed
 msgpack-python: 0.4.6
   mysql-python: Not Installed
      pycparser: Not Installed
       pycrypto: 2.6.1
   pycryptodome: Not Installed
         pygit2: Not Installed
         Python: 2.6.6 (r266:84292, Aug 18 2016, 15:13:37)
   python-gnupg: Not Installed
         PyYAML: 3.11
          PyZMQ: 14.5.0
           RAET: Not Installed
          smmap: Not Installed
        timelib: Not Installed
        Tornado: 4.2.1
            ZMQ: 4.1.0
```

升级 pyzmq 到 16.0.2

```bash
pip install pyzmq==16.0.2
```
```bash
salt-minion --versions-report
Salt Version:
           Salt: 2016.11.8

Dependency Versions:
           cffi: Not Installed
       cherrypy: Not Installed
       dateutil: 1.4.1
      docker-py: Not Installed
          gitdb: Not Installed
      gitpython: Not Installed
          ioflo: Not Installed
         Jinja2: 2.8.1
        libgit2: Not Installed
        libnacl: Not Installed
       M2Crypto: Not Installed
           Mako: Not Installed
   msgpack-pure: Not Installed
 msgpack-python: 0.4.6
   mysql-python: Not Installed
      pycparser: Not Installed
       pycrypto: 2.6.1
   pycryptodome: Not Installed
         pygit2: Not Installed
         Python: 2.6.6 (r266:84292, Aug 18 2016, 15:13:37)
   python-gnupg: Not Installed
         PyYAML: 3.11
          PyZMQ: 16.0.2
           RAET: Not Installed
          smmap: Not Installed
        timelib: Not Installed
        Tornado: 4.2.1
            ZMQ: 4.1.6

System Versions:
           dist: centos 6.3 Final
        machine: x86_64
        release: 2.6.32-431.el6.x86_64
         system: Linux
        version: CentOS 6.3 Final
```


### store pem file in pillar

pillar file

```yaml
# pillarfile
key: |
  -----BEGIN CERTIFICATE-----
  ...
  -----END CERTIFICATE-----

```

state file
```yaml
filetomanage:
  file.managed:
    contents_pillar: key
    ...
```


### difference pillar[var], pillar.get(var), salt.pillar.get(var)


### salt-api 

[install salt-api on debian](https://github.com/vinian/note/blob/master/saltstack-api.md)
