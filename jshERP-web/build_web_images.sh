# 构建镜像
docker build -t jsh-erp-web:latest .

# 运行容器
docker run -d -p 80:80 jsh-erp-web:latest

