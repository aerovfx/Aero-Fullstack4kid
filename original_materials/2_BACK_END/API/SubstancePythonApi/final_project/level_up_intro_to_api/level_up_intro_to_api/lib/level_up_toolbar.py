import os
import importlib
from functools import partial
from PySide2 import QtWidgets, QtGui
from lib import property_cycler, cycle_behavior, property_value
from sd.api.sdproperty import SDPropertyCategory, SDPropertyInheritanceMethod
from sd.api.sdvalueenum import SDValueEnum
from sd.api.sdvalueint2 import SDValueInt2
from sd.api.sdbasetypes import int2
from sd.api.sdhistoryutils import SDHistoryUtils

importlib.reload(property_cycler)
importlib.reload(cycle_behavior)
importlib.reload(property_value)


class LevelUpToolBar(QtWidgets.QToolBar):
    def __init__(self, api):
        super(LevelUpToolBar, self).__init__(parent=api.main_window)

        self.setObjectName('level.up.toolbar')
        self.API = api

        input_category_property_callback = partial(self.on_clicked_action, SDPropertyCategory.Input)
        output_size_property_callback = partial(input_category_property_callback, '$outputsize')

        self.add_action(
            icon_path=os.path.join(self.API.toolbar_resources_dir, 'cycle_tiling_mode.png'),
            tooltip='Cycle through the tiling mode on the selected nodes.',
            shortcut='T',
            func=lambda: input_category_property_callback(
                '$tiling',
                cycle_behavior.LoopingPropertyCycle(self.input_tiling_values)
            )
        )
        self.add_action(
            icon_path=os.path.join(self.API.toolbar_resources_dir, 'cycle_output_format.png'),
            tooltip='Cycle through the output format modes on selected nodes.',
            shortcut='Y',
            func=lambda: input_category_property_callback(
                '$format',
                cycle_behavior.LoopingPropertyCycle(self.output_format_values)
            )
        )
        self.add_action(
            icon_path=os.path.join(self.API.toolbar_resources_dir, 'decrease_abs_output_size.png'),
            tooltip='Decrease the absolute output size mode on selected nodes.',
            shortcut='Ctrl+-',
            func=lambda: output_size_property_callback(
                cycle_behavior.StepBackwardsPropertyCycle(
                    values=self.absolute_output_size_values,
                    default_index=11
                )
            )
        )
        self.add_action(
            icon_path=os.path.join(self.API.toolbar_resources_dir, 'increase_abs_output_size.png'),
            tooltip='Increase the absolute output size mode on selected nodes.',
            shortcut='Ctrl++',
            func=lambda: output_size_property_callback(
                cycle_behavior.StepForwardPropertyCycle(
                    values=self.absolute_output_size_values,
                    default_index=11
                )
            )
        )
        self.add_action(
            icon_path=os.path.join(self.API.toolbar_resources_dir, 'decrease_rel_input_output_size.png'),
            tooltip='Decrease the relative to input output size mode on selected nodes.',
            shortcut='-',
            func=lambda: output_size_property_callback(
                cycle_behavior.StepBackwardsPropertyCycle(
                    values=self.relative_input_output_size_values,
                    default_index=12
                )
            )
        )
        self.add_action(
            icon_path=os.path.join(self.API.toolbar_resources_dir, 'increase_rel_input_output_size.png'),
            tooltip='Increase the relative to input output size mode on selected nodes.',
            shortcut='+',
            func=lambda: output_size_property_callback(
                cycle_behavior.StepForwardPropertyCycle(
                    values=self.relative_input_output_size_values,
                    default_index=12
                )
            )
        )
        self.add_action(
            icon_path=os.path.join(self.API.toolbar_resources_dir, 'decrease_rel_parent_output_size.png'),
            tooltip='Decrease the relative to parent output size mode on selected nodes.',
            shortcut='Alt+-',
            func=lambda: output_size_property_callback(
                cycle_behavior.StepBackwardsPropertyCycle(
                    values=self.relative_parent_output_size_values,
                    default_index=12
                )
            )
        )
        self.add_action(
            icon_path=os.path.join(self.API.toolbar_resources_dir, 'increase_rel_parent_output_size.png'),
            tooltip='Increase the relative to parent output size mode on selected nodes.',
            shortcut='Alt++',
            func=lambda: output_size_property_callback(
                cycle_behavior.StepForwardPropertyCycle(
                    values=self.relative_parent_output_size_values,
                    default_index=12
                )
            )
        )

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
        self.output_format_values = [
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueEnum.sFromValue('sbs::compositing::format', 0)
            ),
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueEnum.sFromValue('sbs::compositing::format', 1)
            ),
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueEnum.sFromValue('sbs::compositing::format', 2)
            ),
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueEnum.sFromValue('sbs::compositing::format', 3)
            ),
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.RelativeToInput,
                value=SDValueEnum.sFromValue('sbs::compositing::format', 0)
            )
        ]
        self.absolute_output_size_values = [
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.Absolute,
                value=SDValueInt2.sNew(int2(i, i))
            )
            for i in range(13)
        ]
        self.relative_input_output_size_values = [
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.RelativeToInput,
                value=SDValueInt2.sNew(int2(i, i))
            )
            for i in range(-12, 13)
        ]
        self.relative_parent_output_size_values = [
            property_value.PropertyValue(
                inheritance_method=SDPropertyInheritanceMethod.RelativeToParent,
                value=SDValueInt2.sNew(int2(i, i))
            )
            for i in range(-12, 13)
        ]


    def add_action(self, icon_path, tooltip, shortcut, func):
        action = self.addAction(QtGui.QIcon(os.path.normpath(icon_path)), '')
        action.setToolTip(tooltip)
        action.setShortcut(QtGui.QKeySequence(shortcut))
        action.triggered.connect(func)

    def on_clicked_action(self, category, property_id, cycle_behavior):
        graph = self.API.ui_mgr.getCurrentGraph()
        with SDHistoryUtils.UndoGroup('Cycle Property Undo Group'):
            for node in self.API.ui_mgr.getCurrentGraphSelection():
                cycler = property_cycler.PropertyCycler(
                    node=node,
                    property=graph.getPropertyFromId(property_id, category),
                    cycle_behavior=cycle_behavior
                )
                cycler.set_next_value()
