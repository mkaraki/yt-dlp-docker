# Check https://hub.docker.com/_/python/ for python version and supported debian version info
FROM python:3.12.3-bookworm

# Check: https://packages.debian.org/ffmpeg for check version info
ARG FFMPEG_VERSION="7:5.1.4-0+deb12u1"

COPY requirements.txt /requirements.txt
COPY entry.sh /bin/entry
RUN chmod +x /bin/entry

RUN apt-get update && apt-get upgrade -y && apt-get install ffmpeg=${FFMPEG_VERSION} -y && apt-get -y clean && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt
RUN rm /requirements.txt

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/bin/entry"]
