<h1 align="center">
  <img src="https://github.com/JAVClub/core/raw/master/docs/logo.png" alt="JAVClub" width="200">
  <br>JAVClub</br>
</h1>

## 安装流程

首先拉取本项目
```bash
git clone https://github.com/JAVClub/docker JAVClub_docker
cd JAVClub_docker/fetcher
cp docker-compose.example.yaml docker-compose.yaml
```

然后启动 qBittorrent 并对其自行做出适当配置 (账号密码连接数等等)
```bash
sudo docker-compose up -d qbittorrent
# 此时 qBittorrent 已在端口 8585 上运行, 默认用户名/密码 admin/adminadmin
```
**注意1:** 这个版本的 fetcher 使用 qBittorrent 自带的种子管理器来判断是否已做完种, 所以请在选项 -> BitTorrent 中按照你的需求勾选做种限制中的任意一项(或两项一起)
**注意2:** 由于某些 PT 站点限制默认端口, 故将做种端口改为 `51118` 及 `51118/udp`, 请在配置 qBittorrent 自行更改

接下来配置 fetcher
```bash
curl https://raw.githubusercontent.com/JAVClub/fetcher/master/config/dev.example.json > config/fetcher/dev.json
vi config/fetcher/dev.json
```
其中你需要配置的项有(点击跳转相关文档):
- [remote](https://github.com/JAVClub/fetcher#%E9%85%8D%E7%BD%AE)
- [qbittorrent](https://github.com/JAVClub/fetcher#%E9%85%8D%E7%BD%AE)

现在启动所有容器
```bash
sudo docker-compose up -d
```
然后观察 fetcher 的日志查看是否有报错, 如果有出现请再次检查是否按照上述步骤操作, 若有不明白请开启 issue

如果没有出现问题并且第一个种子下载并处理完时 `./tmp/sync/` 目录下按按预期出现了 `xx/xx/xx.....xx/` 这种目录以及其中的 `info.json` 和 `video.mp4` 的话, 那说明已经成功运作起来了, 接下来就可以启动 rclone 了

关于 rclone 就不讲太多了, 只需要使用定时任务让 rclone 将 `./tmp/sync/` 下的文件移动至网盘即可, 这里给一个~~简单~~简陋的 bash 脚本来防止 crond 创建多个上传进程
```bash
#!/bin/bash

if ps aux | grep -e 'JAVGD:/$' >/dev/null; then
  exit 1
else
  rclone move -P /data/JAVClub_docker/fetcher/tmp/sync JAVGD:/
fi
```

然后在 crond 中添加如 `*/10 * * * * screen -d -m "/data/JAVClub_docker/fetcher/sync.sh"` 的语句即可

## 后续
只有一个 fetcher 肯定是不够的的, 你还需要 core 核心使其的数据有用武之地, 详情 [core Docker 部署文档](https://github.com/JAVClub/docker/tree/master/core)

## 免责声明

本程序仅供学习了解, 请于下载后 24 小时内删除, 不得用作任何商业用途, 文字、数据及图片均有所属版权, 如转载须注明来源

使用本程序必循遵守部署服务器所在地、所在国家和用户所在国家的法律法规, 程序作者不对使用者任何不当行为负责
