import aioactioncable
import asyncio
import json
import ssl

def process(msg, identifier):
  msg_json = json.loads(msg)
  print(f'Processing {msg_json}')

async def ac_recv(uri, identifier):
  async with aioactioncable.connect(uri) as acconnect:
    subscription = await acconnect.subscribe(identifier)
    async for msg in subscription:
      if json.loads(msg)['location'] == 'pi':
        await subscription.send({**json.loads(msg), 'location': 'controls'})

asyncio.run(ac_recv('ws://127.0.0.1:3000/cable', {'channel': 'ExperimentChannel', 'experiment': '4', "location": 'pi'}))