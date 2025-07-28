
FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade uv

COPY ./requirements.txt .
COPY ./uv.lock .
COPY ./pyproject.toml .

RUN uv sync

RUN uv add -r requirements.txt

COPY . .