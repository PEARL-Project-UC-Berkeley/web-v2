import aioactioncable
import asyncio
import json
import ssl
import time
import serial
import concurrent.futures
import threading
import RPi.GPIO as GPIO

# 5615-2607-f140-400-7-91a-c23c-2631-d75e.ngrok-free.app

state = {
		"dial_6": 0,
		"dial_7": 0,
		"checkbox_6": 0
}

stepperPositions = {
		"dial_6": 0,
		"dial_7": 0,
		"checkbox_6": 0
}

experiment_id = '6'

steppers = ["dial_6", "dial_7"]

power = threading.Event()
GPIO.setmode(GPIO.BOARD)
power_pin = 40
GPIO.setup(power_pin, GPIO.OUT)
def worker(power):
		while True:
				if power.is_set():
						GPIO.output(power_pin, GPIO.HIGH)
				else:
						time.sleep(5)
						GPIO.output(power_pin, GPIO.LOW)

ser = serial.Serial('/dev/ttyUSB0',9600, timeout=1)
# ser.flush()
ser.reset_input_buffer()



t1 = threading.Thread(target = worker, args=(power,))
t1.start()  

def fetcher(power):
		def update():
				global power
				for stepper in steppers:
						newmotorPos = state[stepper]
						if newmotorPos != stepperPositions[stepper]:
								print("stepperID: {}, stepperPos: {}".format(stepper, newmotorPos))
								stepperPositions[stepper] = newmotorPos
								if stepper == "dial_6":
										stepper_id = 1
								else:
										stepper_id = 2
								inputString = "M{0}:{1}\n".format(stepper_id, newmotorPos)
								print(inputString)
								# ser.write(inputString.encode('utf-8'))
								time.sleep(1)
				print(state)
				if not power.is_set() and state["checkbox_6"] == True:
						power.set()
				elif state["checkbox_6"] == False and power.is_set():
						power.clear()

		def process(msg):
				msg_json = json.loads(msg)
				print(f'Processing {msg_json}')
				print(msg_json['value'])
				state[msg_json['control']] = msg_json['value']
				update()

		async def ac_recv(uri, identifier):
				async with aioactioncable.connect(uri) as acconnect:
						subscription = await acconnect.subscribe(identifier)
						async for msg in subscription:
								if json.loads(msg)['location'] == 'pi':
										print(msg)
										process(msg)
										await subscription.send({**json.loads(msg), 'location': 'controls'})
		update()
		asyncio.run(ac_recv('ws://2.tcp.ngrok.io:11502/cable', {'channel': 'ExperimentChannel', 'experiment': experiment_id, "location": 'pi'}))
t2 = threading.Thread(target = fetcher, args=(power,))
t2.start()
