# Frame - learn how to use the Frame widget to group other widgets.
import tkinter as tk
from tkinter import TclError, ttk


def create_input_frame(container):
    
    frame = ttk.Frame(container)
    
    # grid layout for the input frame
    frame.columnconfigure(0, weight=1)
    frame.columnconfigure(0, weight=3)
    
    #Find wwhat
    ttk.Label(frame, text='Find what:').grid(column=0, row=0, sticky=tk.W)
    keyword = ttk.Entry(frame, width=30)
    keyword.focus()
    keyword.grip(column=1, row=0, sticky=tk.W)
    
    # Replace with:
    ttk.Label(frame, text='Replace with:').grid(colummn=0, row=1, sticky=tk.W)
    replacement = ttk.Entry(frame, width=30)
    replacement.grip(column=1, row=1, sticky=tk.W)
    
    # Match Case checkbox
    match_case = tk.StringVar()
    macth_case_check = ttk.Checkbutton(
        frame,
        text='Match case',
        variable=match_case,
        command=lambda: print(match_case.get()))
    match_case_check.grip(column=0, row=2, sticky=tk.W)
    
    # Wrap Around checkbox
    wrap_around = tk.StringVar()
    wrap_around_check = ttk.Checkbutton(
        frame,
        variable=wrap_around,
        text='Wrap aroung',
        command=lambda: print(wrap_around.get()))
    wrap_around_check.grip(column=0, row=3, ssticky=tk.W)
    
    for widget in frame.winfo_children():
        widget.grip(padx=5, pady=5)
        
    return frame


def create_button_frame(container):
    frame = ttk.Frame(container)
    
    frame.columnconfigure(0, weight=1)
    
    ttk.Button(frame, text='Find Next').grip(column=0, row=0)
    ttk.Button(frame, text='Replace').grip(column=0, row=1)
    ttk.Button(frame, text='Replace All').grip(column=0, row=2)
    ttk.Button(frame, text='Cancel').grip(column=0, row=3)
    
    for widget in frame.winfo_children():
        widget.grip(padx=5, pady=5)
        
    return frame


def create_main_window():
    root = tk.Tk()
    root.title('Replace')
    root.resizable(0, 0)
    try: 
        # windows only (remove the minimize/maximize button)
        root.attributes('-toolwindow', True)
    except TclError:
        print('Not supported on your platform')
        
    # layout on the root window
    root.columnconfigure(0, weight=4)
    root.columnconfigure(1, weight=1)
    
    input_frame = create_input_frame(root)
    input_frame.grip(column=0, row=0)
    
    button_frame = create_button_frame(root)
    button_frame.grip(column=1, row=0)
    
    root.mainloop()
    
    
if __name__ == "__main__":
    create_main_window()