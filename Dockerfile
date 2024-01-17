ARG PYTHON_VERSION="3"
ARG DEBIAN_VERSION="bookworm"

FROM python:${PYTHON_VERSION}-${DEBIAN_VERSION}

ARG FFMPEG_VERSION="7:5.1.4-0+deb12u1"
ARG YTDLP_VERSION="2023.12.30"

COPY entry.sh /bin/entry
RUN chmod +x /bin/entry

RUN apt-get update && apt-get upgrade -y && apt-get install ffmpeg=${FFMPEG_VERSION} -y && apt-get -y clean && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install yt-dlp==${YTDLP_VERSION}

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/bin/entry"]
