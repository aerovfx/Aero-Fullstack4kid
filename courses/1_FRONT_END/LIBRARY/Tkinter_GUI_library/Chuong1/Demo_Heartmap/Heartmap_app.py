import tkinter as tk
import folium
from folium.plugins import HeatMap

class MapApp:
    def __init__(self, master):
        self.master = master
        master.title("Map App")

        # Initialize variables
        self.locations = [(37.7749,-122.4194), (37.7749,-122.4194), (37.7749,-122.4194),
                          (37.7749,-122.4194), (37.7749,-122.4194), (37.7749,-122.4194)]

        self.heatmap_enabled = False

        # Create map
        self.map = folium.Map(location=[37.7749,-122.4194], zoom_start=13)

        # Create heatmap layer
        self.heatmap = HeatMap(self.locations)

        # Create switch button
        self.switch_button = tk.Button(master, text="Enable Heatmap", command=self.toggle_heatmap)
        self.switch_button.pack()

        # Render map
        self.map.add_to(master)

    def toggle_heatmap(self):
        if self.heatmap_enabled:
            self.map.remove_layer(self.heatmap)
            self.switch_button.config(text="Enable Heatmap")
        else:
            self.heatmap.add_to(self.map)
            self.switch_button.config(text="Disable Heatmap")

        self.heatmap_enabled = not self.heatmap_enabled


root = tk.Tk()
app = MapApp(root)
root.mainloop()
