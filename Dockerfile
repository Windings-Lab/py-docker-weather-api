FROM python:3.13-slim AS init-stage
WORKDIR /app
COPY requirements.txt .

RUN pip install -r requirements.txt

FROM python:3.13-slim AS entry-stage
WORKDIR /app
COPY --from=init-stage /usr/local /usr/local
COPY /app .

ENV PYTHONUNBUFFERED=1 API_KEY=""

ENTRYPOINT ["python", "main.py"]
