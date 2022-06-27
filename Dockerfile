FROM python:3.9-slim

RUN apt update && apt install -y python3-pip

COPY . /app
WORKDIR /app

RUN pip3 install -U pip

RUN --mount=type=cache,target=/root/.cache \
    pip3 install -r requirements.txt

CMD ["python3", "app.py"]
