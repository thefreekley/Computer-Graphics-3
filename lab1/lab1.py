import math
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QMainWindow
from PyQt5.QtGui import QPainter,QPainterPath,QBrush
from PyQt5.QtCore import Qt,QRectF
from PyQt5.QtGui import QColor



width_window = 600


class App(QMainWindow):


    def __init__(self):
        global width_window,height_window
        super().__init__()
        self.installEventFilter(self)
        self.title = 'lab2'
        self.left = 960 - int((width_window+100)/2)
        self.top = 540 - int(width_window/2)
        self.width = width_window
        self.height = width_window

        self.initUI()


    def initUI(self):

        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)

        self.setAutoFillBackground(True)
        p = self.palette()
        p.setColor(self.backgroundRole(), Qt.white)
        self.setPalette(p)

        self.m = PaintWidget(self)
        self.m.move(20,20)

        self.m.resize(580,580)
        self.m.update()
        self.show()




class PaintWidget(QWidget):
    def paintEvent(self, event):
        global width_window,draw_mash,koef,x_min,y_min
        qp = QPainter(self)

        qp.setPen(QColor(0, 0, 0))
        qp.drawRect(0 ,0 ,500 ,500 )

        qp.drawRect(0 ,0,250 ,250 )
        qp.drawRect(250 ,250 ,250,250 )

        qp.drawEllipse(0, 0, 250, 250)
        qp.drawEllipse(250, 0, 250, 250)
        qp.drawEllipse(0, 250, 250, 250)
        qp.drawEllipse(250, 250, 250, 250)







if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    sys.exit(app.exec_())




