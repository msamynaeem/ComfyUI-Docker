FROM python:3.10-slim

WORKDIR /app

# تثبيت الأدوات الأساسية
RUN apt update && apt install -y git wget ffmpeg libgl1 unzip && rm -rf /var/lib/apt/lists/*

# تثبيت مكتبات بايثون المطلوبة لتشغيل ComfyUI
RUN pip install --upgrade pip && \
    pip install pyyaml torch torchvision pillow

# تحميل ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app

# فتح المنفذ
EXPOSE 8188

# أمر التشغيل
CMD ["python", "main.py"]
