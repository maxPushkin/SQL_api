FROM python:3.8-slim-bullseye

WORKDIR /app

ADD . /app

RUN pip install --no-cache-dir -r requirements.txt

# Run app.py with gunicorn WSGI when the container launches
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]

