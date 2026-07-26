from tkinter import Tk, Label, Button, filedialog, Toplevel
from PIL import Image, ImageTk

#install module pillow
#pip install pillow

class ImageViewer:
    def __init__(self, master):
        self.master = master
        self.master.title("Image Viewer")
        
        #create a button to open the image file
        self.button = Button(self.master, text="Open", command=self.open_image)
        self.button.pack()
        
    def open_image(self):
        #open a file dialog to select the image file
        file_path = filedialog.askopenfilename(initialdir='/', title='Select Image File',
                                                filetypes=(("JPEG files", "*.jpg"), ("PNG files", "*.png"), ("All files", "*.*")))
        
        #load the image file using PIL
        image = Image.open(file_path)
        
        #create a new window to display the image
        image_window = Toplevel(self.master)
        image_window.title("Image Viewer - " + file_path)
        
        #resize the image to fit the window if necessary
        if image.width > 800 or image.height > 600:
            image.thumbnail((800, 600))
            
            #convert the image to a photoimage object for display in the window
            photo_image = ImageTk.PhotoImage(image)
            
            #create a label to display the image
            label = Label(image_window, image=photo_image)
            label.pack()
            
            #keep a reference to the PhotoImage object to prevent it from being garbage collected
            label.image = photo_image
            
if __name__ == '__main__':
    #create a new instance of the ImageViewer class
    root = Tk()
    app = ImageViewer(root)
    root.mainloop()