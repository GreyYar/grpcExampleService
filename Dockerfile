FROM python:3.11.14-slim

RUN apt-get update && apt-get install make

WORKDIR /app
COPY . ./

RUN make deps
RUN make gen

WORKDIR /app/src
CMD ["python3", "GrpcExample.py"]

EXPOSE 50051:50051