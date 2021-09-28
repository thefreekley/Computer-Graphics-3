import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1

Item {
    width: 250
    height: 250
    Rectangle{
        width: 250
        height: 250
        color: "black"
        Rectangle{
            id: internalRound
            width: 0
            height: 0
            radius: width/2
            color: "white"
              anchors.centerIn: parent
            NumberAnimation on width {
                   id:animationRoundInWidth
                   running: false
                   from: 250; to: 0
               }

            NumberAnimation on width {
                   id:animationRoundOutWidth
                   running: false
                   from: 0; to: 250
               }




            NumberAnimation on height {
                   id:animationRoundOutHeight
                   running: false
                   from: 0; to: 250
               }

            NumberAnimation on height {
                   id:animationRoundInHeight
                   running: false
                   from: 250; to: 0
               }
        }



        MouseArea {
            id: myMouse
            anchors.fill: parent
            hoverEnabled: true
            onPressed: {
                if(internalRound.width == 0){
                    animationRoundOutWidth.running = true
                    animationRoundOutHeight.running = true
                }
                else {
                    animationRoundInWidth.running = true
                    animationRoundInHeight.running = true
                }
            }
            }

    }
}
