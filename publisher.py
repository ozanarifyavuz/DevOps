import asyncio
from nats.aio.client import Client as NATS
from nats.aio.errors import ErrConnectionClosed, ErrTimeout

async def publish_message():
    # Create NATS client
    nc = NATS()

    try:
        # Connect to NATS server
        await nc.connect("nats://192.168.33.10:4222")

        while True:
            # Read input from stdin
            message = input("Enter a message to publish (or 'exit' to quit): ")

            if message.lower() == "exit":
                break

            try:
                # Publish message to a subject
                await nc.publish("my_subject", message.encode())
                await nc.flush()

            except (ErrConnectionClosed, ErrTimeout):
                print("Error: Failed to publish the message. Connection closed or timeout.")

    finally:
        # Disconnect from NATS server
        await nc.close()

asyncio.run(publish_message())