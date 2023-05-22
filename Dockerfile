FROM alpine

# Installing necessary dependencies
RUN apk add --no-cache python3 py3-pip

# Copying the subscriber script to the container
COPY subscriber.py /app/subscriber.py

# Setting the working directory
WORKDIR /app

# Installing the required Python library for NATS
RUN pip3 install asyncio-nats-client

# Specifying the command to run the subscriber script
# -u option helps me observe the output of the subscriber.py script by using "docker logs <containerID>"
CMD ["python3", "-u", "subscriber.py"]