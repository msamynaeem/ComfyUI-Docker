FROM python:3.10-slim

WORKDIR /app

RUN apt update && apt install -y git wget ffmpeg libgl1 unzip && rm -rf /var/lib/apt/lists/*

# تثبيت مكتبات Python المطلوبة
RUN pip install pyyaml
RUN pip install pyyaml torch torchvision pillow
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app



EXPOSE 8188

CMD ["python", "main.py"]
