import sounddevice
import json

devices = sounddevice.query_devices()
print(json.dumps(devices, indent=4))
