FROM ultralytics/ultralytics:8.3.32

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 python3-pip wget && \
    apt-get clean

RUN apt-get update && apt-get install -y ffmpeg

# Cài đặt uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép toàn bộ mã nguồn
COPY . .

# Cài đặt các phụ thuộc
RUN uv sync --frozen --no-cache

# Expose cần thiết (ví dụ: API hoặc giao diện)
EXPOSE 5003

# Lệnh chạy ứng dụng
CMD ["uv", "run", "python", "vixtts_demo.py"]

