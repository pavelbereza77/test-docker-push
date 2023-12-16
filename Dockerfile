## Separate "build" image
#FROM python:3.11-slim-bullseye as compile-image
#WORKDIR /app
#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONUNBUFFERED 1
#COPY requirements.txt .
#RUN pip wheel --no-cache-dir --wheel-dir /opt/pip_wheels -r /app/requirements.txt
#
## "Run" image
#FROM compile-image as run-image
#WORKDIR /app
#COPY --from=compile-image /opt/pip_wheels /opt/pip_wheels
#RUN pip install --no-cache /opt/pip_wheels/*
#COPY bot /app/bot
#
#CMD ["python", "-m", "bot"]


# Separate "build" image
FROM python:3.11-slim-bullseye
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache -r /app/requirements.txt
COPY bot /app/bot
CMD ["python", "-m", "bot"]
