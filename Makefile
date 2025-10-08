.PHONY: deps gen start

deps:
	pip3 install --upgrade pip
	pip3 install grpcio-tools
	pip3 install grpcio-reflection

gen:
	python3 -m grpc_tools.protoc -I ./proto --python_out=./src/ --grpc_python_out=./src/ ./proto/GrpcExampleService.proto

start:
	cd src && python3 GrpcExample.py
