.PHONY: deps gen start all

deps:
	pip3 install --upgrade pip
	pip3 install grpcio-tools
	pip3 install grpcio-reflection

gen:
	python3 -m grpc_tools.protoc -I ./proto --python_out=./src/ --grpc_python_out=./src/ ./proto/GrpcExampleService.proto

start:
	cd src && python3 GrpcExample.py

all:
	make deps
	make gen
	make start

clean-db:
	rm database/mydatabase.db

docker-build:
	docker build -t 'grpc-example' .

docker-start:
	docker run -p 50051:50051 --detach 'grpc-example'

docker-stop:
	docker stop 'grpc-example'
