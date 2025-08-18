-include .env

TARGET := only-office-service-api
IMAGE := $(TARGET):latest

build:
	env GOOS=linux GOARCH=arm go build -o $(TARGET) .

run up:
	go run .

down ps:
	echo Not available

image:
	docker build -t $(IMAGE) .

image-run:
	docker run $(IMAGE)

clean:
	rm -f $(TARGET)
