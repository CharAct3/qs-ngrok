# qs-ngrok
Quick start using self-hosted ngrok on your own server.

一条命令快速开始使用自建 ngrok.

## Dependencies
1. `ansible`, install by `pip install ansible`.
2. `docker` on server side, install by `apt-get install docker-ce`.

## Basic Usage
Edit `hosts` file, enter your server data: host(ip), ngrok ports and domain.
```
[servers]
1.2.3.4 http_port=80 https_port=443 tunnel_port=4443 domain=your-domain.com goos=darwin goarch=amd64

# goos indicates which OS you run ngrok client on. 
#   Windows:   windows
#   macOS:     darwin
#   Andriod:   andriod
#   Linux:     linus
# goarch indicates which architecture of your machine you run ngrok client on.
#   x86:       386
#   x86-64bit: amd64
#   arm:       arm
#   arm64:     arm64
```

Then run:
```
$ ./run.sh
```

After this, you will get ngrok client binary file `ngrok` and basic config file `ngrok.cfg`:
```
$ ./ngrok -subdomain=1 -config=ngrok.cfg 8000
```

Now you can access `1.your-domain.com`.
