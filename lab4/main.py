
import math
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QMainWindow
from PyQt5.QtGui import QPainter,QPainterPath,QBrush
from PyQt5.QtCore import Qt,QTimer
from PyQt5.QtGui import QColor

width_window = 800
point_list = list()

class App(QMainWindow):


    def __init__(self):
        global width_window,height_window
        super().__init__()
        self.installEventFilter(self)
        self.title = 'lab4'
        self.left = 960 - int((width_window+100)/2)
        self.top = 540 - int(width_window/2)
        self.width = width_window
        self.height = width_window

        self.initUI()

        self.timer = QTimer()
        self.timer.timeout.connect(self.m.update)
        self.timer.start(100)






    def initUI(self):

        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)

        self.setAutoFillBackground(True)
        p = self.palette()
        p.setColor(self.backgroundRole(), Qt.white)
        self.setPalette(p)

        self.m = PaintWidget(self)
        self.m.move(width_window - 500 - 20,width_window - 500 - 40)

        self.m.resize(520,520)
        self.m.x = -130
        self.m.y = 0
        self.m.direction_rotate = 1

        self.show()




class PaintWidget(QWidget):
    def paintEvent(self, event):
        global point_list
        r_circum = 20
        r_right = 130
        a_centr = 40
        koef_scale = 1
        add = 0
        speed = 0.09

        qp = QPainter(self)
        qp.setPen(QColor(1, 1, 1))



        qp.drawEllipse(r_circum,r_circum, r_right*2 + a_centr,r_right*2)
        qp.drawEllipse(a_centr*2 + r_circum, r_circum, r_right*2, r_right*2)

        if math.ceil(self.y) == 130:
            self.direction_rotate = 1
        elif math.floor(self.y) == -130:
            self.direction_rotate = 0



        if self.direction_rotate == 1:
            rotate = [[math.cos(speed),math.sin(speed)],[(-1)*math.sin(speed),math.cos(speed)]]
            koef_scale = (r_right * 2 + a_centr) / (r_right * 2)
            add = 0
        else:
            rotate = [[math.cos(speed), (-1) * math.sin(speed)], [math.sin(speed), math.cos(speed)]]
            koef_scale = 1
            add = a_centr*2


        scale = [[koef_scale, 0], [0, 1]]

        point = [self.x,self.y]


        result = multiply(point, rotate)

        self.x = result[0]
        self.y = result[1]


        scale_value  = multiply([self.x,self.y], scale)

        qp.drawText(0, r_right * 2 + r_circum * 2 + 20, "x:" + str(self.x) + " y:" + str(self.y))
        qp.drawText(0, r_right * 2 + r_circum * 2 + 40, "rotation:")
        qp.drawText(0, r_right * 2 + r_circum * 2 + 60, str(rotate[0]))
        qp.drawText(0, r_right * 2 + r_circum * 2 + 80, str(rotate[1]))
        qp.drawText(0, r_right * 2 + r_circum * 2 + 100, "scale:")
        qp.drawText(0, r_right * 2 + r_circum * 2 + 120, str(scale[0]))
        qp.drawText(0, r_right * 2 + r_circum * 2 + 140, str(scale[1]))

        qp.setPen(QColor(255, 255, 255))
        qp.setBrush(QColor(255, 255, 255))
        qp.drawRect(r_right*1.1 +a_centr+r_circum,r_circum, (a_centr*2 +r_circum)*2,r_right*2  )

        qp.setPen(QColor(255, 0, 0))
        qp.setBrush(QColor(255, 0, 0))
        qp.drawEllipse(scale_value[0] + r_right * koef_scale + add, scale_value[1] + r_right, r_circum * 2,r_circum * 2)

        qp.setPen(QColor(0, 0, 0))
        qp.setBrush(QColor("#00000000"))
        qp.drawRect(0, 0, (a_centr * 2 + r_circum) * 2 + r_circum * 2, r_right * 2 + r_circum * 2)






def multiply(v, G):
    result = []
    for i in range(len(G[0])): #this loops through columns of the matrix
        total = 0
        for j in range(len(v)): #this loops through vector coordinates & rows of matrix
            total += v[j] * G[j][i]
        result.append(total)
    return result


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    sys.exit(app.exec_())












