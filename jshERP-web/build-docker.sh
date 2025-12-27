#!/bin/bash

# jshERP前端Docker构建脚本

echo "开始构建jshERP前端Docker镜像..."

# 检查是否已安装Docker
if ! [ -x "$(command -v docker)" ]; then
  echo "错误: Docker未安装，请先安装Docker"
  exit 1
fi

# 检查是否已安装docker-compose
if ! [ -x "$(command -v docker-compose)" ]; then
  echo "警告: docker-compose未安装，将使用纯Docker命令"
  USE_COMPOSE=false
else
  USE_COMPOSE=true
fi

# 构建Docker镜像
echo "正在构建Docker镜像..."
if [ "$USE_COMPOSE" = true ]; then
  docker-compose build
else
  docker build -t jsh-erp-web:latest .
fi

# 检查构建是否成功
if [ $? -eq 0 ]; then
  echo "Docker镜像构建成功！"
  
  if [ "$USE_COMPOSE" = true ]; then
    echo "启动容器..."
    docker-compose up -d
    echo "jshERP前端已启动，访问地址: http://localhost:8080"
  else
    echo "运行容器命令: docker run -d -p 8080:80 jsh-erp-web:latest"
  fi
else
  echo "Docker镜像构建失败！"
  exit 1
fi

echo "构建和部署完成！"