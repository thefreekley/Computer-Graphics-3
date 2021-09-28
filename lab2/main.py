import math
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QMainWindow
from PyQt5.QtGui import QPainter,QPainterPath,QBrush
from PyQt5.QtCore import Qt,QRectF
from PyQt5.QtGui import QColor

width_window = 800
color = "#ff0000"
draw_mash = [[0]*20]*20
koef = 2

canvas_size_x = 600
canvas_size_y = 600

x_function = list()
y_function = list()
x_max,x_min = 0,0
y_max,y_min = 0,0
t = 1
while t<=18:
    t+=0.1
    temp_x = 10*(math.cos(t) - t*math.sin(t)) + 5* (math.cos(t))**3 - 50*math.cos(t/5)
    temp_y = 10*(math.sin(t) + t*math.cos(t)) + 5* (math.sin(t))**3 - 50*math.sin(t/5)

    if x_max < temp_x:
        x_max = temp_x
    if x_min>temp_x:
        x_min = temp_x

    if y_max < temp_y:
        y_max = temp_y
    if y_min > temp_y:
        y_min = temp_y

    x_function.append(temp_x)
    y_function.append(temp_y)




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
        self.m.move(int(width_window/2 - canvas_size_x/2) - 20 ,int(width_window/2 - canvas_size_x/2)   - 20)

        self.m.resize(canvas_size_x*koef*1.1,canvas_size_y*koef*1.1)
        self.m.update()
        self.show()




class PaintWidget(QWidget):
    def paintEvent(self, event):
        global width_window,draw_mash,koef,x_min,y_min
        qp = QPainter(self)

        qp.setPen(QColor(0, 0, 0))
        qp.drawRect(0, 0, int(canvas_size_x*1.1), int(canvas_size_y*1.1))
        margin_right = 20
        margin_bottom = 20


        qp.drawLine(int(canvas_size_x/2) + margin_right,0,int(canvas_size_x/2) + margin_right - 10,10)
        qp.drawLine(canvas_size_x / 2 + margin_right, 0, canvas_size_x / 2 + margin_right + 10, 10)
        qp.drawLine(int(canvas_size_x/2) + margin_right + 10, 10, int(canvas_size_x/2) + margin_right - 10, 10)

        qp.drawLine(int(canvas_size_x*1.1),int(canvas_size_y/2) + margin_bottom,int(canvas_size_x*1.1)-10,int(canvas_size_y/2) + margin_bottom + 10)
        qp.drawLine(int(canvas_size_x * 1.1), int(canvas_size_y / 2) + margin_bottom, int(canvas_size_x * 1.1) - 10,int(canvas_size_y / 2) + margin_bottom - 10)
        qp.drawLine(int(canvas_size_x*1.1)-10,int(canvas_size_y/2) + margin_bottom + 10,int(canvas_size_x * 1.1) - 10,int(canvas_size_y / 2) + margin_bottom - 10)
        koef_y = y_max/canvas_size_y*1.1
        for i in range(20,int(canvas_size_y*1.1),20):
            qp.drawLine(int(canvas_size_x/2) + margin_right - 3, i,int(canvas_size_x/2) + margin_right + 3,i)
            qp.drawText(int(canvas_size_x/2) + margin_right - 20, i + 3, str( int(i*koef_y)))

            qp.drawLine(i, int(canvas_size_y/2) + margin_bottom -3, i, int(canvas_size_y/2) + margin_bottom + 3)
            qp.drawText(i-5, int(canvas_size_y/2) + margin_bottom + 15, str(int(i * koef_y)))

        qp.setPen(QColor(0,0,0))
        qp.setBrush(QColor(0,0,0))



        qp.drawLine(int(canvas_size_x/2) + margin_right,0,int(canvas_size_x/2) + margin_right,int(canvas_size_y*1.1))
        qp.drawLine(0, int(canvas_size_y/2) + margin_bottom, int(canvas_size_x*1.1), int(canvas_size_y/2) + margin_bottom)



        qp.setPen(QColor(color))
        qp.setBrush(QColor(0, 0, 0))

        for i in range(1,len(x_function)):
            x_from = int( (x_function[i - 1] + abs(x_min)) * koef) + margin_right
            y_from = int( (y_function[i-1]+ abs(y_min)) *koef) + margin_bottom
            x_to = int( (x_function[i]+ abs(x_min)) *koef) + margin_right
            y_to = int( (y_function[i]+ abs(y_min)) * koef ) + margin_bottom

            qp.drawLine( x_from,y_from ,x_to ,y_to )




if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    sys.exit(app.exec_())




