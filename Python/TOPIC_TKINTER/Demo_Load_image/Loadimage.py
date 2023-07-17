from tkinter import Tk, Label, Button, filedialog, Toplevel
from PIL import Image, ImageTk

#Install module pillow
#pip install pillow

class ImageViewer:
    def __init__(self, master):
        self.master = master
        self.master.title("Image Viewer")
        
        # Create a button to open the image file
        self.button =Button(self.master, text="Open", command=self.open_image)
        self.button.pack()
        
    def open_image(self):
        # Open a file dialog to select the image file
        file_path = filedialog.askopenfilename(initialdir='/', title='Select Image File', 
                                                filetypes=(("JPEG files", "*.jpg"), ("PNG files", "*.png"), ("ALL file", "*.*")))
        
        # load the image file using PIL
        image = Image.open(file_path)
        
        # Create a new window to dispaly the image
        image_window = Toplevel(self.master)
        image_window.title("Image Viewer - " + file_path)
        
        # Resize the image to fit the window if necessary
        if image.width > 800 or image.height > 600:
            image.thumbnail((800, 600))
            
        # Covert the iamge to a PhotoImage object for display in the window
        photo_image = ImageTk.PhotoImage(image)
        
        # Create a label to display the image
        label = Label(image_window, image=photo_image)
        label.pack()
        
        # Giữ một tham chiếu đến dối tượng PhotoImage để ngăn không cho nó bị thu gom rác
        label.image = photo_image
        
if __name__ == '__main__':
    # tạo một lớp thể hiện mới của lớp ImageViewer
    root = Tk()
    app = ImageViewer(root)
    root.mainloop()