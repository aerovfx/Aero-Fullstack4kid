# BBC micro:bit v2 MicroPython Smart Greenhouse Baseline
# Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks

from microbit import *
import radio

radio.on()
radio.config(group=15, power=7)

DRY_SOIL_THRESHOLD = 800

def get_soil_moisture():
    return pin0.read_analog()

pin1.write_digital(0) # Pump Relay OFF

while True:
    temp = temperature()
    light = display.read_light_level()
    soil = get_soil_moisture()

    if soil > DRY_SOIL_THRESHOLD:
        display.show(Image.SAD)
        pin1.write_digital(1) # Pump ON
        sleep(3000)
        pin1.write_digital(0) # Pump OFF
    else:
        display.show(Image.HAPPY)

    # Telemetry
    msg = "T:{},L:{},S:{}".format(temp, light, soil)
    radio.send(msg)
    sleep(2000)
