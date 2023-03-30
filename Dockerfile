FROM python:bullseye

COPY entry.sh /bin/entry
RUN chmod +x /bin/entry

RUN apt-get update && apt-get upgrade -y && apt-get install ffmpeg -y && apt-get -y clean && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install yt-dlp

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/bin/entry"]
