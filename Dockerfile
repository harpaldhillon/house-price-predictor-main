FROM docker.io/python:3.13

WORKDIR /app

COPY models/trained/*.pkl models/trained/
COPY src/api/ .

RUN pip install -r requirements.txt

EXPOSE 80

ENTRYPOINT [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port",  "8000", "--workers", "4" ]
