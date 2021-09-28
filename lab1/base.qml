import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1

Window {
    id: aplicationWindow
    width: 800
    height: 800
    visible: true
    color: "white"
    title: qsTr("lab1")
    Rectangle{
        width: 800
        height: 800
        color: "white"

        MouseArea {
            id: myMouse
            anchors.fill: parent
            hoverEnabled: true



            onPressed: {
             if(grid.rowSpacing==0){
                 columnMoveOut.running = true
                 rowMoveOut.running = true

             }
             else{
                 columnMoveIn.running = true
                 rowMoveIn.running = true

             }
            }
            }

    }

    Rectangle{
        id:mainRectangle
        width: 500
        height: 500
         anchors.centerIn: parent




        GridLayout {
            id: grid
            anchors.fill: parent
            rows: 2
            columns: 2
            rowSpacing:0
            columnSpacing: 0
             anchors.centerIn: parent
            NumberAnimation on columnSpacing {
                   id: columnMoveIn
                   running: false
                   from: 10; to: 0
               }
            NumberAnimation on rowSpacing {
                   id: rowMoveIn
                   running: false
                   from: 10; to: 0
               }
            NumberAnimation on columnSpacing {
                   id: columnMoveOut
                   running: false
                   from: 0; to: 10
               }
            NumberAnimation on rowSpacing {
                   id: rowMoveOut
                   running: false
                   from: 0; to: 10
               }


            InternalRectangle {
            }
            InternalRectangle {
            }
            InternalRectangle {
            }
            InternalRectangle {
            }
        }


    }
}



