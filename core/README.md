<h1 align="center">
  <img src="https://github.com/JAVClub/core/raw/master/docs/logo.png" alt="JAVClub" width="200">
  <br>JAVClub</br>
</h1>

## 安装流程

请确保本地有 Node.js 环境, 若没有请参考[这里](https://computingforgeeks.com/how-to-install-latest-nodejs-on-ubuntu-debian-linux/)安装

首先拉取本项目
```bash
git clone https://github.com/JAVClub/docker.git JAVClub_docker
cd JAVClub_docker/core
cp docker-compose.example.yaml docker-compose.yaml
cp .env.example .env
```

然后构建前端资源
```bash
cd wwwroot
git clone https://github.com/JAVClub/web.git JAVClub_web
cd JAVClub_web
cp src/config.example.js src/config.js
npm i && npm run build
cd ../../
```

接下来配置 Nginx
```bash
cp etc/nginx/conf.d/your.domain.conf etc/nginx/conf.d/你的域名.conf
vi etc/nginx/conf.d/你的域名.conf # 进入后将第二行改为你自己的域名
```

继续来配置 MySQL
```bash
vi .env # 配置数据库密码
sudo docker-compose up -d mysql phpmyadmin
```
执行成功后稍等片刻后访问 `localhost:8080` 并登录, 在账户处创建用户 `javclub` 并勾选 `创建与用户同名的数据库并授予所有权限。`
创建完成后在数据库中导入目录下的 `db.sql` 即可

最后来创建 core 的配置文件
```bash
curl https://raw.githubusercontent.com/JAVClub/core/master/config/dev.example.json > config/dev.json
vi config/dev.json
```
此处请按以下说明更改:
- system.corsDomain 更改为你的域名
- database.host 更改为 `mysql`
- database.password 更改为你设置的密码
- 暂时删除 importer.cron 下的所有东西
- proxy 内填写你自己的图片代理或仅留一个`""`

现在启动所有容器
```bash
sudo docker-compose up -d
```
然后访问 `http://your.domain`, 使用 `admin` 和 `123456` 登录, 理论来讲你就可以看见空荡荡的首页了

## 后续
这样肯定不是你想要的, 这里提供几个你仍需要做的事情
- [设置 fetcher (Docker)](https://github.com/JAVClub/docker/tree/master/fetcher)
- [配置 Driver](https://github.com/JAVClub/core#配置文件) 以及 [Driver Workers](https://github.com/JAVClub/workers)
- [配置 Core Importer](https://github.com/JAVClub/core#配置)

## 免责声明

本程序仅供学习了解, 请于下载后 24 小时内删除, 不得用作任何商业用途, 文字、数据及图片均有所属版权, 如转载须注明来源

使用本程序必循遵守部署服务器所在地、所在国家和用户所在国家的法律法规, 程序作者不对使用者任何不当行为负责
