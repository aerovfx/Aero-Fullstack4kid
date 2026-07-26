class PropertyValue(object):
    def __init__(self, inheritance_method, value):
        self.inheritance_method = inheritance_method
        self.value = value

    def set(self, node, prop):
        node.setPropertyInheritanceMethod(prop, self.inheritance_method)
        node.setPropertyValue(prop, self.value)
