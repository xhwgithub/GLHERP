docker run -d \
  --name mariadb-10.6 \
  -e MYSQL_ROOT_PASSWORD=glhxhq.314956 \
  -e MYSQL_DATABASE=jsh_erp \  # 可选：自动创建数据库
  -p 3306:3306 \                          # 宿主机端口:容器端口
  -v /path/to/host/mysql/data:/var/lib/mysql \  # 数据目录持久化（最重要）
  -v /path/to/host/mysql/conf:/etc/mysql/conf.d \  # 可选：自定义配置文件目录
  -v /path/to/host/mysql/logs:/var/log/mysql \     # 可选：日志目录
  --restart unless-stopped \
  mariadb:10.6

## docker 启动命令
docker run -d --name mariadb-10.6 -e MYSQL_ROOT_PASSWORD=glhxhq.314956 -e MYSQL_DATABASE=jsh_erp -p 3306:3306 -v /path/to/host/mysql/data:/var/lib/mysql -v /path/to/host/mysql/conf:/etc/mysql/conf.d -v /path/to/host/mysql/logs:/var/log/mysql --restart unless-stopped mariadb:10.6


docker run -d \
  --name redis-alpine \
  -p 6379:6379 \
  -v ~/redis/data:/data \
  -v ~/redis/conf:/usr/local/etc/redis \
  --restart unless-stopped \
  redis:alpine \
  redis-server --appendonly yes --requirepass your_strong_password


docker run -d --name redis-alpine -p 6379:6379 -v ~/redis/data:/data -v ~/redis/conf:/usr/local/etc/redis --restart unless-stopped redis:alpine redis-server --appendonly yes --requirepass 1234abcd