class PropertyCycler(object):
    def __init__(self, node, property, cycle_behavior):
        self.node = node
        self.property = property
        self.cycle_behavior = cycle_behavior

    def set_next_value(self):
        value = self.cycle_behavior.get_next_value()
        value.set(self.node, self.property)
