FROM docker.1ms.run/library/python:3.13-slim
ENV TZ=Asia/Shanghai
ENV PYTHONUNBUFFERED=1
WORKDIR /app
RUN sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources 2>/dev/null || true
RUN apt-get update && apt-get install -y --no-install-recommends git ffmpeg && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple uv
ENV UV_INDEX_URL=https://mirrors.aliyun.com/pypi/simple
ENV UV_TIMEOUT=60
ENV UV_RETRIES=5
RUN git clone https://github.com/Clare113/polylens-mcp.git . && uv sync
