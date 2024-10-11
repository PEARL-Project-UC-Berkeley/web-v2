import aioactioncable
import asyncio
import json
import ssl
import time
import serial

state = {
	"dial_6": 0,
	"dial_7": 0,
	"toggle_6": 0
}

stepperPositions = {
	"dial_6": 0,
	"dial_7": 0,
	"toggle_6": 0
}

experiment_id = '6'

steppers = ["dial_6", "dial_7"]

power = 0

ser = serial.Serial('/dev/ttyUSB0',9600, timeout=1)
# ser.flush()
ser.reset_input_buffer()

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
			ser.write(inputString.encode('utf-8'))
			time.sleep(1)
	if power != state["toggle_6"]:
		if state["toggle_6"] == 1:
			GPIO.output(power, GPIO.HIGH)
			power = state["toggle_6"]
		else:
			time.sleep(5)
			GPIO.output(power, GPIO.LOW)
			power = state["toggle_6"]
		print("status:", state["toggle_6"])

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
asyncio.run(ac_recv('ws://127.0.0.1:3000/cable', {'channel': 'ExperimentChannel', 'experiment': experiment_id, "location": 'pi'}))
