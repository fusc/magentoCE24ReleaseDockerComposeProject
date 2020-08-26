##

# Magento ce 2.4 使用 DOCKER 一键部署开发环境 

### 建议：
#### 1. 使用中国镜像加速
```
 "https://registry.docker-cn.com",
 "https://xxxxxxxxxxxxxxxx.mirror.aliyuncs.com"
```

#### 2. 在开始执行 `shell` 之前，在 `cmd` or `Windows PowerShell` 里执行 `fetch.bat` 预下载所有所需要的 `Images`，以提升 `start` 的速度 。

```
fetch.bat //只能在 `cmd` or `Windows PowerShell`  执行
sh ./fetch //在 bash 里执行
```

### 3. 复制 Magento 2.4 CE 的所有代码 `./src-magento` 目录下
- 请在这里下载： https://github.com/magento/magento2/tree/2.4

### 4. 开始
`sh start`

### 5. 删除
`sh stop`



### 6. magento shell

#### 进入到 cron 的 容器,然后转到 www-data用户下
```
docker exec -it xxxxx sh
su www-data
```
### 安装 magento ce 2.4
```
/usr/local/bin/php bin/magento setup:install --base-url=http://docker.loc/ --db-host=mysql --db-name=domain --db-user=root --db-password=mysql --admin-firstname=Magento --admin-lastname=User --admin-email=robinfu@d1m.cn --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=elasticsearch --elasticsearch-port=9200  --use-sample-data
```

```shell
cd /data/www
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f --theme=Magento/blank zh_Hans_CN
php bin/magento setup:static-content:deploy -f --theme=Magento/Luma zh_Hans_CN
php bin/magento setup:static-content:deploy -f --theme=Magento/blank en_US
```


### copy files to container
```
    docker cp es_admin:/usr/src/app/Gruntfile.js ./
    //cp magento file to container
    docker cp ./src-magento efc060b8781b:/data/www
```

### update the code right
```
chown -R www-data:www-data src-magento
```
