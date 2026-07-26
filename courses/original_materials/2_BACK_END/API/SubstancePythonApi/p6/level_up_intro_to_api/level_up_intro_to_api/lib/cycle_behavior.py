class CycleBehavior(object):
    def __init__(self, values):
        self.values = values

    def get_next_value(self):
        return self.values[0]
