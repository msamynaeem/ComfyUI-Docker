FROM python:3.10-slim

WORKDIR /app

# Install system dependencies
RUN apt update && apt install -y git wget curl ffmpeg libgl1 unzip && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install torch torchvision pyyaml safetensors

# Clone ComfyUI (or skip if you're using your own codebase)
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app

EXPOSE 8188

CMD ["python", "main.py"]
