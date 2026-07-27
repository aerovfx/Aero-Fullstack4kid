# Raspberry Pi Pico W Smart Greenhouse MicroPython Baseline
# Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks

from machine import Pin, ADC
import time

SOIL_ADC = ADC(26)
RELAY_PIN = Pin(15, Pin.OUT, value=0)

while True:
    raw = SOIL_ADC.read_u16()
    moisture = int((65535 - raw) * 100 / 65535)

    if moisture < 30:
        RELAY_PIN.value(1) # Pump ON
        time.sleep(3)
        RELAY_PIN.value(0) # Pump OFF
        time.sleep(5)
    else:
        RELAY_PIN.value(0)

    time.sleep(2)
