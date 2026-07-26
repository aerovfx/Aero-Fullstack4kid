import os


class API(object):
    def __init__(self, context):
        self.application = context.getSDApplication()
        self.ui_mgr = self.application.getQtForPythonUIMgr()
        self.on_graph_view_created_callback_id = -1
        self.main_window = self.ui_mgr.getMainWindow()
        self.toolbar_resources_dir = os.path.normpath(f'{os.path.dirname(__file__)}\\..\\resources\\')
