FROM python:3.9-slim

RUN apt update && apt install -y python3-pip

COPY . /app
WORKDIR /app

RUN pip3 install -U pip

RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "app:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]
