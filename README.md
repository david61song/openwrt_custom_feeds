# How to add custom feeds

## Reference
```text
https://openwrt.org/docs/guide-developer/helloworld/chapter4
```

## Howto
1. Make feeds.conf or feeds.conf.default in your openwrt source code
```bash
mkdir custom_feeds
touch feeds.conf
```
2. Modify feeds.conf (example)
```text
src-git packages https://git.openwrt.org/feed/packages.git
src-git luci https://git.openwrt.org/project/luci.git
src-git routing https://git.openwrt.org/feed/routing.git
src-git telephony https://git.openwrt.org/feed/telephony.git
#src-git video https://github.com/openwrt/video.git
#src-git targets https://github.com/openwrt/targets.git
#src-git oldpackages http://git.openwrt.org/packages.git
src-link custom </path/to/your/openwrt/source/dir (absoulute path)>/custom_feeds
```

3. Do following commands
```text
./scripts/feeds update ultari
./scripts/feeds install -a -p ultari
```

4. Check in your menuconfig and build 


```text
Network -> Captive Portals -> ultari
```

*You need to modify some Makefile code






