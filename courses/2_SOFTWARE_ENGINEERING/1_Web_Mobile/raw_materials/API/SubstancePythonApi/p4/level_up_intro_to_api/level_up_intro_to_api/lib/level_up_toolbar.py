import os
from PySide2 import QtWidgets, QtGui


class LevelUpToolBar(QtWidgets.QToolBar):
    def __init__(self, api):
        super(LevelUpToolBar, self).__init__(parent=api.main_window)

        self.setObjectName('level.up.toolbar')
        self.API = api

        action = self.addAction(QtGui.QIcon(os.path.join(self.API.toolbar_resources_dir, 'cycle_tiling_mode.png')), '')
        action.setToolTip('Cycle through the tiling mode on the selected nodes.')
        action.setShortcut(QtGui.QKeySequence('T'))
        action.triggered.connect(self.on_clicked_action)

    def on_clicked_action(self):
        print('Cycle tiling mode was pressed.')