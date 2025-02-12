FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN apt-get update && apt-get install -y nginx

COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
