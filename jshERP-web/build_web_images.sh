# 构建镜像
docker build -t jsh-erp-web:latest .

# 运行容器
docker run -d -p 80:80 jsh-erp-web:latest
docker run -d \
  --name glherp-front \
  -p 80:80 \
  -v /app/code/GLHERP/jshERP-web/erp-nginx.conf:/etc/nginx/conf.d/default.conf \
  -v /app/code/GLHERP/jshERP-web/dist:/usr/share/nginx/html \
  --platform=linux/amd64 nginx:alpine

