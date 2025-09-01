# Check https://hub.docker.com/_/python/ for python version and supported debian version info
FROM python:3.13.7-bookworm

COPY requirements.txt /requirements.txt
COPY entry.sh /bin/entry
RUN chmod +x /bin/entry

RUN apt-get update && apt-get upgrade -y && apt-get install ffmpeg -y && apt-get -y clean && rm -rf /var/lib/apt/lists/*
RUN pip install --root-user-action=ignore --upgrade pip
RUN pip install --root-user-action=ignore -r /requirements.txt
RUN rm /requirements.txt

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/bin/entry"]
