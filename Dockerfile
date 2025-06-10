# Base Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt update && apt install -y git wget ffmpeg libgl1 unzip && rm -rf /var/lib/apt/lists/*

# Clone ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app

# Expose port
EXPOSE 8188

# Run ComfyUI
CMD ["python", "main.py"]
