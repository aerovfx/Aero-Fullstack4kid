import tkinter as tk
import datetime as dt
import time
import os

class AlarmClock:
    def __init__(self, master):
        self.master = master
        master.title("Đồng hồ báo thức-Alarm Clock")
        
        # Create labels
        self.label_time = tk.Label(master, text="")
        self.label_time.pack()
        self.label_alarm = tk.Label(master, text="Set Alarm:")
        self.label_alarm.pack()
        
        # Create spinboxes for hour, minute, and second
        self.spin_hour = tk.Spinbox(master, from_=0, to=23, width=2)
        self.spin_minute = tk.Spinbox(master, from_=0, to=59, width=2)
        self.spin_second = tk.Spinbox(master, from_=0, to=59, width=2)
        self.spin_hour.pack(side=tk.LEFT)
        tk.Label(master, text=":").pack(side=tk.LEFT)
        self.spin_minute.pack(side=tk.LEFT)
        tk.Label(master, text=":").pack(side=tk.LEFT)
        self.spin_second.pack(side=tk.LEFT)
        
        # Create button to set the alarm
        self.button_set_alarm = tk.Button(master, text="Set", command=self.set_alarm)
        self.button_set_alarm.pack()
        
        # Create button to stop the alarm
        self.button_stop_alarm = tk.Button(master, text="Stop", command=self.stop_alarm, state=tk.DISABLED)
        self.button_stop_alarm.pack()
        
        self.alarm_time = None
        self.alarm_active = False
        self.update_time()
        
    def update_time(self):
        # Update the time label every second
        now = dt.datetime.now()
        current_time = now.strftime("%H:%M:%S")
        self.label_time.configure(text=current_time)
        self.master.after(1000, self.update_time)
        
        # Check if the alarm should go off
        if self.alarm_active and now >= self.alarm_time:
            self.play_alarm()
           
            
    def set_alarm(self):
        # Set the alarm time based on user input
        self.alarm_time = dt.datetime.combine(dt.date.today(), dt.time(int(self.spin_hour.get()), int(self.spin_minute.get()), int(self.spin_second.get())))
        self.button_set_alarm.configure(state=tk.DISABLED)
        self.button_stop_alarm.configure(state=tk.NORMAL)
        self.alarm_active = True
        
    def stop_alarm(self):
        # Stop the alarm and reset the interface
        self.alarm_active = False
        self.button_set_alarm.configure(state=tk.NORMAL)
        self.button_stop_alarm.configure(state=tk.DISABLED)
        
  
    def play_alarm(self):
        # Play the alarm sound and flash the window
        for i in range(3):
            self.master.after(50, self.flash)
            time.sleep(0.5)
        os.system('afplay ' + "D:\MINH CHAU\Fullstack4kid\TOPIC_PYTHON\TOPIC_TKINTER\Demo_Clock_alarm\alarm.mp3")
        self.alarm_active = False

        
    def flash(self):
        # Flash the window
        if self.master.attributes('-alpha') == 1.0:
            self.master.attributes('-alpha', 0.5)
        else:
            self.master.attributes('-alpha', 1.0)
        
root = tk.Tk()
app = AlarmClock(root)
root.mainloop()