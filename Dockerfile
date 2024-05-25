# 构建参数
ARG ARCH

# 使用官方Python运行时作为父镜像
FROM ${ARCH}/python:3.10

# 设置工作目录
WORKDIR /app

# 将当前目录内容复制到容器的/app中
ADD . /app

RUN pip install --upgrade pip
# 安装程序需要的包
RUN pip install --no-cache-dir -r requirements.txt

# 运行时监听的端口
EXPOSE 6008

# 运行app.py时的命令及其参数
CMD ["uvicorn", "localembedding:app", "--host", "0.0.0.0", "--port", "6008"]
