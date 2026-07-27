import os
import sd
import importlib
from lib import api, level_up_toolbar
from PySide2 import QtGui


importlib.reload(api)
importlib.reload(level_up_toolbar)

API = api.API(sd.getContext())


def add_toolbar_to_graph_view(graph_view_id):
    API.ui_mgr.addToolbarToGraphView(
        graph_view_id,
        level_up_toolbar.LevelUpToolBar(API),
        icon=QtGui.QIcon(os.path.join(API.toolbar_resources_dir, 'level_up.png')),
        tooltip='Level Up Toolbar'
    )


def initializeSDPlugin():
    API.on_graph_view_created_callback_id = API.ui_mgr.registerGraphViewCreatedCallback(add_toolbar_to_graph_view)


def uninitializeSDPlugin():
    API.ui_mgr.unregisterCallback(API.on_graph_view_created_callback_id)
