
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QMainWindow, QLabel,QPushButton, QColorDialog,QCheckBox
from PyQt5.QtGui import QPainter, QColor, QPen
from PyQt5.QtCore import Qt,QEvent,pyqtSignal
from PyQt5.QtCore import pyqtSlot,QTimer
from PyQt5.QtGui import QColor

width_window = 400
color = "#ff0000"
draw_mash = [[0]*20]*20

class App(QMainWindow):


    def __init__(self):
        global width_window,height_window
        super().__init__()
        self.installEventFilter(self)
        self.title = 'PyQt paint - pythonspot.com'
        self.left = 960 - (width_window+100)/2
        self.top = 540 - width_window/2
        self.width = width_window + 100
        self.height = width_window

        self.initUI()



    def mousePressEvent(self, event):

        global draw_mash
        if event.x()> 100 and self.checkbox.checkState()!=0 :
            x_temp, y_temp = int((event.x() - 100) / width_window ** 0.5), int((event.y()) / width_window ** 0.5)
            temp_list = draw_mash[y_temp].copy()
            if temp_list[x_temp] == 0:
                temp_list[x_temp] = 1
            else:
                temp_list[x_temp] = 0

            draw_mash[y_temp] = temp_list
            self.m.update()

    def mouseMoveEvent(self, event):
        global draw_mash
        if event.x()> 100 and self.checkbox.checkState()!=0 :
            x_temp, y_temp = int((event.x() - 100) / width_window ** 0.5), int((event.y()) / width_window ** 0.5)
            temp_list = draw_mash[y_temp].copy()
            temp_list[x_temp] = 1
            draw_mash[y_temp] = temp_list
            self.m.update()


    def eventFilter(self, obj, event):
        global width_window,height_window

        if (event.type() == QEvent.Resize):
            delta_width =  width_window - self.size().width()
            width_window = self.size().height()
            # self.left += delta_width
            # self.top += delta_width
            self.setGeometry(self.left, self.top, width_window+100, width_window)

        return super().eventFilter(obj, event)


    def initUI(self):

        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)

        self.checkbox = QCheckBox("Draw", self)
        self.checkbox.move(5,90)

        button = QPushButton('Open color dialog', self)
        button_2 = QPushButton('Clear drowing', self)

        button.setToolTip('Opens color dialog')
        button.move(0, 10)
        button_2.move(0,50)
        button.clicked.connect(self.on_click)

        self.setAutoFillBackground(True)
        p = self.palette()
        p.setColor(self.backgroundRole(), Qt.white)
        self.setPalette(p)

        self.m = PaintWidget(self)
        self.m.move(100,0)
        self.m.resize(1920,1080)
        button_2.clicked.connect(self.on_click_drow)
        self.show()

    @pyqtSlot()
    def on_click_drow(self):
        global draw_mash
        for i in range(20):
            for j in range(20):
                draw_mash[i][j]=0
        self.m.update()


    @pyqtSlot()
    def on_click(self):
        global color
        color_temp = QColorDialog.getColor()

        if color_temp.isValid():
            color = color_temp




class PaintWidget(QWidget):




    def paintEvent(self, event):
        global width_window,draw_mash


        self.size_canvas = int(width_window**0.5)


        d_rectangle = (self.size_canvas/2) * (3**0.5)
        self.draw_line(0,0,0,self.size_canvas,2)
        self.draw_line(self.size_canvas/2, 0 , d_rectangle ,self.size_canvas/4, self.size_canvas/2)
        self.draw_line(self.size_canvas/2, 0, self.size_canvas - d_rectangle,self.size_canvas/4, self.size_canvas/2)

        self.draw_line(self.size_canvas - d_rectangle, self.size_canvas/4, self.size_canvas - d_rectangle, self.size_canvas - self.size_canvas/4,self.size_canvas/2)
        self.draw_line(d_rectangle, self.size_canvas/4, d_rectangle, self.size_canvas - self.size_canvas/4,self.size_canvas/2)

        self.draw_line(d_rectangle, self.size_canvas*0.75, self.size_canvas/2,self.size_canvas, self.size_canvas)
        self.draw_line(self.size_canvas/2, self.size_canvas, self.size_canvas - d_rectangle, self.size_canvas*0.75, self.size_canvas)

        self.draw_line(self.size_canvas/2, self.size_canvas, self.size_canvas/2, self.size_canvas/2, self.size_canvas)
        self.draw_line(self.size_canvas/2, self.size_canvas/2, d_rectangle, self.size_canvas/4, self.size_canvas)
        self.draw_line(self.size_canvas/2, self.size_canvas/2, self.size_canvas - d_rectangle, self.size_canvas/4, self.size_canvas)





    def draw_line(self, x1=0, y1=0, x2=0, y2=0,size_pixel = 1):
        global color
        k = self.size_canvas / size_pixel
        x1,y1,x2,y2 = int(k*x1),int(k*y1),int(k*x2),int(k*y2)
        size_pixel = int(size_pixel)

        qp = QPainter(self)

        qp.setPen(QColor(color))
        size = self.size()
        qp.setBrush(QColor(color))
        for i in range(20):
            for j in range(20):
                if(draw_mash[i][j]==1):
                    qp.drawRect(self.size_canvas*j+1, self.size_canvas*i+1, self.size_canvas, self.size_canvas)


        dx = x2 - x1
        dy = y2 - y1

        sign_x = 1 if dx > 0 else -1 if dx < 0 else 0
        sign_y = 1 if dy > 0 else -1 if dy < 0 else 0

        if dx < 0: dx = -dx
        if dy < 0: dy = -dy

        if dx > dy:
            pdx, pdy = sign_x, 0
            es, el = dy, dx
        else:
            pdx, pdy = 0, sign_y
            es, el = dx, dy

        x, y = x1, y1

        error, t = el / 2, 0

        qp.setBrush(QColor(color))
        qp.drawRect(x*size_pixel, y*size_pixel, size_pixel, size_pixel)

        while t < el:
            error -= es
            if error < 0:
                error += el
                x += sign_x
                y += sign_y
            else:
                x += pdx
                y += pdy
            t += 1
            qp.setBrush(QColor(color))
            qp.drawRect(x * size_pixel, y * size_pixel, size_pixel, size_pixel)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    sys.exit(app.exec_())




