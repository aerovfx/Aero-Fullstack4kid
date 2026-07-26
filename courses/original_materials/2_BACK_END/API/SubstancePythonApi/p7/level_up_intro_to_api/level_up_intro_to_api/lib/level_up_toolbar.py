import os
import importlib
from PySide2 import QtWidgets, QtGui
from lib import property_cycler, cycle_behavior, property_value
from sd.api.sdproperty import SDPropertyCategory, SDPropertyInheritanceMethod
from sd.api.sdvalueenum import SDValueEnum


importlib.reload(property_cycler)
importlib.reload(cycle_behavior)
importlib.reload(property_value)


class LevelUpToolBar(QtWidgets.QToolBar):
    def __init__(self, api):
        super(LevelUpToolBar, self).__init__(parent=api.main_window)

        self.setObjectName('level.up.toolbar')
        self.API = api

        action = self.addAction(QtGui.QIcon(os.path.join(self.API.toolbar_resources_dir, 'cycle_tiling_mode.png')), '')
        action.setToolTip('Cycle through the tiling mode on the selected nodes.')
        action.setShortcut(QtGui.QKeySequence('T'))
        action.triggered.connect(self.on_clicked_action)

        self.input_tiling_values = [
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueEnum.sFromValue('sbs::compositing::tiling', 0)
            ),
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueEnum.sFromValue('sbs::compositing::tiling', 1)
            ),
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueEnum.sFromValue('sbs::compositing::tiling', 2)
            ),
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueEnum.sFromValue('sbs::compositing::tiling', 3)
            ),
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.RelativeToInput,
                value=SDValueEnum.sFromValue('sbs::compositing::tiling', 3)
            )
        ]

    def on_clicked_action(self):
        graph = self.API.ui_mgr.getCurrentGraph()
        for node in self.API.ui_mgr.getCurrentGraphSelection():
            cycler = property_cycler.PropertyCycler(
                node=node,
                property=graph.getPropertyFromId('$tiling', SDPropertyCategory.Input),
                cycle_behavior=cycle_behavior.CycleBehavior(self.input_tiling_values)
            )
            cycler.set_next_value()
