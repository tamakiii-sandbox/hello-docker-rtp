FROM python:3.11

RUN apt update -y && \
    apt install -y \
        ffmpeg \
        jq \
        libavformat-dev \
        libavcodec-dev \
        libavdevice-dev \
        portaudio19-dev

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
RUN rm /app/requirements.txt
