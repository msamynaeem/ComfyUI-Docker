FROM python:3.10-slim

WORKDIR /app

# تثبيت الأدوات المطلوبة
RUN apt update && apt install -y git wget curl ffmpeg libgl1 unzip && rm -rf /var/lib/apt/lists/*

# تثبيت مكتبات Python الضرورية لتشغيل ComfyUI
RUN pip install --no-cache-dir torch torchvision torchaudio \
    safetensors einops pillow psutil

# نسخ الكود أو سحبه من Git
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app

# تعيين البورت
EXPOSE 8188

# Healthcheck لتجنب Coolify Unhealthy loop
HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
    CMD curl --fail http://localhost:8188 || exit 1

CMD ["python", "main.py"]
