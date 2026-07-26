from sd.api.apiexception import APIException
from abc import ABC, abstractmethod


class AbstractCycleBehavior(ABC):
    def __init__(self, values, default_index=0):
        super(AbstractCycleBehavior, self).__init__()
        self.values = values
        self.default_index = default_index

    def get_next_value(self, node, prop):
        try:
            current_inheritance_method = node.getPropertyInheritanceMethod(prop)
            current_value = node.getPropertyValue(prop)
        except APIException:    # This will error if the property does not exist on the node
            return

        next_value = self.values[self.default_index]
        for i, value_in_list in enumerate(self.values):
            if self.values_match(current_inheritance_method, current_value, value_in_list):
                try:
                    next_value = self.next(i)
                except IndexError:
                    next_value = self.end(i)
                finally:
                    break

        return next_value

    @staticmethod
    def values_match(im, v, other):
        return im == other.inheritance_method and str(v.get()) == str(other.value.get())

    @abstractmethod
    def next(self, index):
        """Returns the next item in the property list, given the index of the current one selected"""
        pass

    @abstractmethod
    def end(self, index):
        """"Returns the property to use when at the end of the list"""
        pass

class LoopingPropertyCycle(AbstractCycleBehavior):
    def next(self, index):
        return self.values[index + 1]

    def end(self, index):
        return self.values[self.default_index]

class StepForwardPropertyCycle(AbstractCycleBehavior):
    def next(self, index):
        return self.values[index + 1]

    def end(self, index):
        return self.values[index]

class StepBackwardsPropertyCycle(AbstractCycleBehavior):
    def next(self, index):
        if index - 1 < 0:
            raise IndexError
        else:
            return self.values[index - 1]

    def end(self, index):
        return self.values[index]
