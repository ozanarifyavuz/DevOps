import asyncio
from nats.aio.client import Client as NATS
from nats.aio.errors import ErrConnectionClosed, ErrTimeout

async def subscribe_message():
    # Creating NATS client
    nc = NATS()

    try:
        # Connecting to NATS server
        print("Connecting to NATS server...")
        await nc.connect("nats://192.168.33.10:4222")
        print("Connected to NATS server")

        async def message_handler(msg):
            print("Received message:")
            print(msg.data.decode())

        # Subscribing to the subject
        print("Subscribing to the subject 'my_subject'")
        await nc.subscribe("my_subject", cb = message_handler)

        # Keeping the script running
        while True:
            await asyncio.sleep(1)

    except (ErrConnectionClosed, ErrTimeout) as e:
        print("Error: Failed to subscribe to the subject. Connection closed or timeout.")
        print(str(e))

    finally:
        # Disconnecting from NATS server
        await nc.close()

asyncio.run(subscribe_message())