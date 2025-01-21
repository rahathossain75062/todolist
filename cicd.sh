#!/bin/bash

docker build -t todolist .
if [ $? -ne 0 ]; then
    echo "Docker build failed!"
    exit 1
fi

docker run -d -p 8090:8090 todolist
if [ $? -ne 0 ]; then
    echo "Docker run failed!"
    exit 1
fi

echo "Todolist container is running on port 8090."

