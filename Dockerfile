FROM python:3.8-slim

# Установка переменных окружения
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Устанавливаем рабочую директорию
WORKDIR /django-app

# Установка системных зависимостей
RUN apt update -y && \
    apt install -y python3-dev \
    gcc

# Добавляем requirements
COPY requirements.txt /django-app

# Обновляем pip и устанавливаем requirements
RUN pip install --upgrade pip && pip install -r requirements.txt

# Копируем исходный код
COPY . /django-app


