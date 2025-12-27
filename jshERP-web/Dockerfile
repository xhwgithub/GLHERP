# 多阶段构建：第一阶段 - 构建前端应用
FROM node:16-alpine AS builder

# 设置工作目录
WORKDIR /app

# 复制package.json并安装依赖
COPY package.json yarn.lock* ./

# 复制源码
COPY . .

# 替换外部翻译服务API为本地服务或禁用

# 替换API基础URL，将/jshERP-boot替换为/jshERP-boot（通过nginx反向代理）
# 注意：在Docker环境下，前端请求会通过nginx代理到后端服务

# 构建项目
RUN npm run build

# 第二阶段 - 部署到Nginx
FROM nginx:alpine

# 清理默认的nginx配置
RUN rm -rf /etc/nginx/conf.d/*

# 复制自定义nginx配置
COPY erp-nginx.conf /etc/nginx/conf.d/default.conf

# 复制构建好的前端文件
COPY --from=builder /app/dist /usr/share/nginx/html

# 暴露端口
EXPOSE 80

# 启动服务
CMD ["nginx", "-g", "daemon off;"]