from typing import List

import numpy as np
from PySide2.QtCore import QPointF

from easyTemplateLib.interface import Interface, calculators_list


class QTInterface(Interface):
    def __init__(self, model, generator):
        super().__init__(model)
        self.generator = generator
        self.x = np.linspace(0, 10, 100)
        self.y = self.generator(self.x)
        self.calculator = 'scipy'
        self.calculatorList = [calc.name for calc in calculators_list]

    def get_XY(self) -> List[QPointF]:
        return [QPointF(x, y) for x, y in zip(self.x, self.y)]

    def get_fit_XY(self):
        return [QPointF(x, y) for x, y in zip(self.x, self.y_opt)]

    def new_model(self):
        self.y = self.generator(self.x)
