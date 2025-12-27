# 多阶段构建：第一阶段 - 构建前端应用
FROM node:16-alpine AS builder

# 设置工作目录
WORKDIR /app

# 复制package.json并安装依赖
COPY package.json yarn.lock* ./
RUN #yarn install --frozen-lockfile --network-timeout 100000

# 复制源码并构建
COPY . .
RUN npm run build

# 第二阶段 - 部署到Nginx
FROM nginx:alpine

# 清理默认的nginx配置
RUN rm -rf /etc/nginx/conf.d/*

# 复制自定义nginx配置
COPY nginx.conf /etc/nginx/nginx.conf

# 复制构建好的前端文件
COPY --from=builder /app/dist /etc/nginx/html

# 暴露端口
EXPOSE 80

# 启动服务
CMD ["nginx", "-g", "daemon off;"]