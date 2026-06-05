from __future__ import annotations

from aiokafka import AIOKafkaProducer

_producer: AIOKafkaProducer | None = None


async def init_messaging(settings) -> None:
    global _producer
    _producer = AIOKafkaProducer(bootstrap_servers=settings.messaging_brokers)
    await _producer.start()


async def close_messaging() -> None:
    global _producer
    if _producer is not None:
        await _producer.stop()
        _producer = None


def get_producer() -> AIOKafkaProducer:
    if _producer is None:
        raise RuntimeError("Messaging not initialized — call init_messaging() first")
    return _producer
