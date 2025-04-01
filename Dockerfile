FROM python:3.11-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY app.py .

ENV FLASK_APP=app

EXPOSE 5000
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]


# Użyj oficjalnego obrazu Pythona jako bazowego
FROM python:3.11

# Ustaw katalog roboczy
WORKDIR /app

# Skopiuj pliki do kontenera
COPY app/ /app/

# Instalacja zależności
RUN pip install --no-cache-dir -r requirements.txt

# Ustawienie portu dla aplikacji Flask
EXPOSE 5000

# Komenda uruchamiająca aplikację
CMD ["python", "main.py"]
