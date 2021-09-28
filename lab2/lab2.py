
from pyqtgraph.Qt import QtGui, QtCore
import pyqtgraph as pg
import math
plot = pg.plot()
plot.setAspectLocked()

plot.addLine(x=0, pen=0.5)
plot.addLine(y=0, pen=0.5)



x = list()
y = list()
t = 1
while t<=18:
    t+=0.1
    temp_x = 10*(math.cos(t) - t*math.sin(t)) + 5* (math.cos(t))**3 - 50*math.cos(t/5)
    temp_y = 10*(math.sin(t) + t*math.cos(t)) + 5* (math.sin(t))**3 - 50*math.sin(t/5)
    x.append(temp_x)
    y.append(temp_y)



plot.plot(x, y)

if __name__ == "__main__":
    import sys

    if (sys.flags.interactive != 1) or not hasattr(QtCore, "PYQT_VERSION"):
        QtGui.QApplication.instance().exec_()