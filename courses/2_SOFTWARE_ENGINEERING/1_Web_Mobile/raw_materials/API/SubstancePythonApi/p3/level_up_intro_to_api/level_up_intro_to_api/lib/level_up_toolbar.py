from PySide2 import QtWidgets


class LevelUpToolBar(QtWidgets.QToolBar):
    def __init__(self, api):
        super(LevelUpToolBar, self).__init__(parent=api.main_window)

        self.setObjectName('level.up.toolbar')
        self.API = api
