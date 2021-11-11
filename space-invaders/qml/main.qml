import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Templates 2.0 as T
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.1
import QtWinExtras 1.15




Window {
    id: aplicationWindow
    width: 850
    height: 900
    visible: true
    color: "black"
    title: qsTr("space invarder")
    property ListModel resultTable: ListModel{}
    property int shiftInvaderH: 50
    property int shiftInvaderV: 50
    property int startCountLives: 6
    property int firstTypePoint: 10
    property int secondTypePoint: 20
    property int thierdTypePoint: 30
    property int scoreAddLifeGeneral: 1500
    property int shiftAfterDead: 100



//    flags: Qt.Window  | Qt.FramelessWindowHint // Отключаем обрамление окна

    // Qt.WindowStaysOnTopHint - завжди додаток на передньому фоні

    Rectangle{
        id: startPage
        anchors.fill: parent
        color: "black"
        Column{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 200
            width: 400
            spacing: 20
            Text{
                width: 400
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: "red"
                text: " Space Invaders "
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 20
            }

            Rectangle{
                width: 400
                height: 50
                color: "#181a26"
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("New game")
                    font.pointSize: 20
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.opacity = 0.7
                    onExited: parent.opacity = 1
                    onClicked: {
                        canvas.visible = true
                        startPage.visible = false
                        canvas.startNewGame()
                    }
                }
            }
            Rectangle{
                width: 400
                height: 50
                color: "#181a26"
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Setting")
                    font.pointSize: 20
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.opacity = 0.7
                    onExited: parent.opacity = 1

                    onClicked: {
                         settingPage.visible = true
                        startPage.visible = false
                    }
                }
            }

            Rectangle{
                width: 400
                height: 50
                color: "#181a26"
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Result")
                    font.pointSize: 20
                    color: "white"
                }
                MouseArea{
                    hoverEnabled: true
                    onEntered: parent.opacity = 0.7
                    onExited: parent.opacity = 1

                    anchors.fill: parent
                    onClicked: {
                        startPage.visible = false
                        resultPage.visible = true
                    }
                }
            }

            Rectangle{
                width: 400
                height: 50
                color: "#181a26"
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Exit")
                    font.pointSize: 20
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.opacity = 0.7
                    onExited: parent.opacity = 1
                    onClicked: {
                           aplicationWindow.close()
                    }
                }
            }

            Text{
                width: 400
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: "grey"
                text: "TFK 2021 "
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 9
            }
        }
    }


    Rectangle{
        id: settingPage
        color: "black"
        anchors.fill: parent
        visible: false
        Column{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 600
            width: 400
            spacing: 20

            Column{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                height: 200
                width: 400
                spacing: 20


                Row{
                   width: 400
                   height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Speed horizontal (1-100): " )
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                TextInput{
                    text: String(shiftInvaderH)
                  font.pointSize: 13
                id: speedHorisontal
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                width: 300
                height: 30

                color: "white"
            }
                }


                Row{
                   width: 400
                   height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Speed vertical (1-100): " )
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                TextInput{
                    text: String(shiftInvaderV)
                  font.pointSize: 13
                id: speedVertical
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                width: 300
                height: 30

                color: "white"
            }
                }


                Row{
                   width: 400
                   height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Shifting after destroying wave (1-100): " )
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                TextInput{
                    text: String(shiftAfterDead)
                  font.pointSize: 13
                id: shiftAfterDestoy
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                width: 300
                height: 30

                color: "white"
            }
                }




                Row{
                   width: 400
                   height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Start count lives: " )
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                TextInput{
                    text: String(startCountLives)
                  font.pointSize: 13
                id: startCountLive
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                width: 300
                height: 30

                color: "white"
            }
                }

                Row{
                   width: 400
                   height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Score for +1 life: " )
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                TextInput{
                    text: String(scoreAddLifeGeneral)
                  font.pointSize: 13
                id: pointAddLive
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                width: 300
                height: 30

                color: "white"
            }
                }

                Row{
                   width: 400
                   height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("-_-:  " )
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                TextInput{
                    text: String(firstTypePoint)
                  font.pointSize: 13
                id: firstTipeCountPoint
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                width: 300
                height: 30

                color: "white"
            }
                }

                Row{
                   width: 400
                   height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("^_^:  " )
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                TextInput{
                    text: String(secondTypePoint)
                  font.pointSize: 13
                id: secondTipeCountPoint
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                width: 300
                height: 30

                color: "white"
            }
                }
                Row{
                   width: 400
                   height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("o_o:  " )
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                    }
                TextInput{
                    text: String(thierdTypePoint)
                  font.pointSize: 13
                id: thierdTipeCountPoint
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                width: 300
                height: 30

                color: "white"
            }
                }

                Rectangle{
                    width: 400
                    height: 30
                    color: "#181a26"
                    Text {
                        text: qsTr("OK")
                        font.pointSize: 13
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.opacity = 0.7
                        onExited: parent.opacity = 1
                        onClicked: {

                            shiftInvaderH = Number(speedHorisontal.text)
                            shiftInvaderV = Number( speedVertical.text)
                            startCountLives = Number( startCountLive.text )
                            firstTypePoint = Number( firstTipeCountPoint.text)
                            secondTypePoint = Number( secondTipeCountPoint.text)
                            thierdTypePoint = Number( thierdTipeCountPoint.text)
                            scoreAddLifeGeneral= Number (pointAddLive.text)
                            shiftAfterDead = Number( shiftAfterDestoy.text )

                            speedHorisontal.cursorVisible = false
                            speedVertical.cursorVisible = false
                            startCountLive.cursorVisible = false
                            firstTipeCountPoint.cursorVisible = false
                            secondTipeCountPoint.cursorVisible = false
                            thierdTipeCountPoint.cursorVisible = false
                            pointAddLive.cursorVisible = false
                            shiftAfterDestoy.cursorVisible = false

                            settingPage.visible = false
                            startPage.visible = true
                        }
                    }
                }


                Rectangle{
                    width: 400
                    height: 30
                    color: "#181a26"
                    Text {
                        text: qsTr("Exit")
                        font.pointSize: 13
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.opacity = 0.7
                        onExited: parent.opacity = 1
                        onClicked: {
                            settingPage.visible = false
                            startPage.visible = true
                            speedHorisontal.cursorVisible = false
                            speedVertical.cursorVisible = false
                            startCountLive.cursorVisible = false
                            firstTipeCountPoint.cursorVisible = false
                            secondTipeCountPoint.cursorVisible = false
                            thierdTipeCountPoint.cursorVisible = false
                            pointAddLive.cursorVisible = false
                            shiftAfterDestoy.cursorVisible = false
                        }
                    }
                }


            }



        }


        }

    Column{
         id: resultPage
         visible: false
         spacing: 30
         anchors.fill: parent
    Canvas {
       width: parent.width
       height: parent.height - 200
       id: canvasTableResult

       Timer {
           interval: 20; running: canvas.visible; repeat: true
           onTriggered: {
               canvasTableResult.requestPaint()
           }
       }

       onPaint: {
           var ctx = getContext("2d")

           ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
           ctx.fillRect(0, 0, width, height);

           ctx.fillStyle = "white"
           ctx.font = String(15) +'px "%1"'.arg("Arial")
           ctx.textAlign = "left";

           ctx.fillText("№",280,300)
           ctx.fillText("Score",380,300)
           ctx.fillText("LVL",480,300)

           for(var i =0; i< resultTable.count; i++){


               ctx.fillText(String(i+1),280,330 + i*30)
               ctx.fillText(String(resultTable.get(i).score),380,330 + i*30)
               ctx.fillText(String(resultTable.get(i).lvl),480,330 + i*30)
           }
       }
       Rectangle{
           width: 400
           height: 30
           color: "#181a26"
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 20
           anchors.horizontalCenter: parent.horizontalCenter
           Text {
               text: qsTr("OK")
               font.pointSize: 13
               color: "white"
               anchors.verticalCenter: parent.verticalCenter
               anchors.horizontalCenter: parent.horizontalCenter
           }
           MouseArea{
               anchors.fill: parent
               hoverEnabled: true
               onEntered: parent.opacity = 0.7
               onExited: parent.opacity = 1
               onClicked: {
                   resultPage.visible = false
                   startPage.visible = true
               }
           }
       }

}
    }

    Canvas {
        visible: false

       id: canvas
       width: parent.width
       height: parent.height

      property ListModel invaders: ListModel{}
      property ListModel protector: ListModel{}
      property ListModel bulletInvade: ListModel{}
        property ListModel bulletPlayer: ListModel{}


       property int widthInvarder: 60
       property int heightInvarder: 45
       property int spaceBetweenX: 20
       property int spaceBetweenY: 30
       property int rowTime: 0
       property int rightDirection: 1
       property int distanceToEnd: 0

       property int shiftInvader: 0
       property int shiftInvaderDirection: 1
       property int xPlayer: width/2
       property int livePlayer: startCountLives
       property int countDeadInvades: 0

        property int xFlyPlate: 0
        property int nextTimeFlyPlate: 15000
        property bool liveFlyPlate: false
        property int countPoint: 0

        property int countLive: startCountLives
        property int scoreAddLife: scoreAddLifeGeneral
        property int lvl: 1
        property int shiftAfterWin: shiftAfterDead

     function startNewGame(){
         canvas.widthInvarder= 60
         canvas.rowTime= 0
         canvas.rightDirection= 1
         canvas.distanceToEnd= 0

         canvas.shiftInvader= 0
         canvas.shiftInvaderDirection= 1
         canvas.xPlayer= width/2
         canvas.countDeadInvades= 0

         canvas.xFlyPlate= 0

         canvas.liveFlyPlate= false
         canvas.countPoint= 0

         canvas.countLive= startCountLives
         canvas.scoreAddLife= scoreAddLifeGeneral
         canvas.lvl= 1
         shiftAfterWin = shiftAfterDead
         livePlayer = startCountLives

         canvas.protector.clear()
         canvas.invaders.clear()
         canvas.bulletInvade.clear()
         canvas.bulletPlayer.clear()
         canvas.focus =  true

         for(var i =0; i<5; i++){
             if(i!=0) canvas.protector.append({countProtect: 100})
             for(var j=0; j<11; j++){
              canvas.invaders.append({x:j* canvas.widthInvarder, y:i* canvas.heightInvarder + 100 + canvas.lvl*canvas.shiftAfterWin, live: true })
             }
         }

     }



       focus: true
           Keys.onPressed: {
               if (event.key == Qt.Key_Left) {
                   if (canvas.xPlayer > 0) canvas.xPlayer-=10
                   event.accepted = true;
               }
               if (event.key == Qt.Key_Right) {
                   if (canvas.xPlayer < canvas.width) canvas.xPlayer+=10
                   event.accepted = true;
               }
               if (event.key == Qt.Key_Space) {
                   bulletPlayer.append({x: canvas.xPlayer + 25, y: canvas.height - 10 })
                   event.accepted = true;
               }
           }


           Timer {
               interval: canvas.nextTimeFlyPlate; running: canvas.visible; repeat: true
               onTriggered: {
                   canvas.nextTimeFlyPlate = Math.random() * (30000 - 10000) + 10000;
                   canvas.xFlyPlate = canvas.width
                   canvas.liveFlyPlate = true
               }
           }


           Timer {
               interval: 2; running: canvas.visible; repeat: true
               onTriggered: {
                    canvas.requestPaint();
               }
           }

       Timer {
           interval: 800 - canvas.countDeadInvades*6; running: canvas.visible; repeat: true
           onTriggered: {


               var lastRowInvader = 0
               var itWork = true
               while(itWork){
                 var randomNumber = Math.floor(Math.random() * 11)
               for (var i = 54 - randomNumber; i > randomNumber ;i-= 11){
                    if (canvas.invaders.get(i).live == true){
                        lastRowInvader = i
                        itWork = false
                        break;
                    }
               }
               }


               canvas.bulletInvade.append({x: canvas.invaders.get(lastRowInvader).x + canvas.spaceBetweenX/2 + canvas.shiftInvader + canvas.widthInvarder/2
                                        , y: canvas.invaders.get(lastRowInvader).y + canvas.heightInvarder})



           }

       }


       Timer {
           interval: 20; running: canvas.visible; repeat: true
           onTriggered: {
               var finishbulletInvade = []
               var finishbulletPlayer = []
              for ( var i = 0; i<canvas.bulletInvade.count; i++){
                  var temp_x = canvas.bulletInvade.get(i).x
                  var temp_y = canvas.bulletInvade.get(i).y + 7
                  if(temp_y > height) finishbulletInvade.push(i)

                  canvas.bulletInvade.set(i, {x:temp_x, y:temp_y} )


                  if( canvas.bulletInvade.get(i).y > height- 100){

                      for(var j=0; j<4; j++){
                            if( canvas.protector.get(j).countProtect == 0 ) continue
                            var temp_x = j*canvas.width*0.25 + canvas.width*0.125/2



                          if (canvas.bulletInvade.get(i).x > temp_x && canvas.bulletInvade.get(i).x < temp_x + 100){
                               finishbulletInvade.push(i)
                               var temp_countProtect = canvas.protector.get(j).countProtect
                               if(temp_countProtect>0) temp_countProtect = temp_countProtect - 5
                               canvas.protector.set(j, {countProtect:temp_countProtect} )
                          }
                      }
                  }

                if(canvas.bulletInvade.get(i).y > canvas.height - 10 && canvas.bulletInvade.get(i).x > canvas.xPlayer
                        && canvas.bulletInvade.get(i).x < canvas.xPlayer + 50){
                        finishbulletInvade.push(i)
                        if(canvas.countLive>0) canvas.countLive-=1
                        for(var j =0; j<55; j++){
                           var temp_x = canvas.invaders.get(j).x
                           var temp_y = canvas.invaders.get(j).y + 10
                           var temp_live = canvas.invaders.get(j).live
                           canvas.invaders.set(j, {x:temp_x, y:temp_y, live:temp_live})
                        }
                }

              }

              for( var i =0; i < finishbulletInvade.length; i++ ){
                    canvas.bulletInvade.remove(finishbulletInvade[i])
              }

              for ( var i = 0; i<canvas.bulletPlayer.count; i++){
                  var temp_x = canvas.bulletPlayer.get(i).x
                  var temp_y = canvas.bulletPlayer.get(i).y - 7
                  if(temp_y < 0 ) finishbulletPlayer.push(i)
                  canvas.bulletPlayer.set(i,{x:temp_x, y:temp_y} )

                  if(canvas.bulletPlayer.get(i).y < 30 && canvas.bulletPlayer.get(i).x >= canvas.xFlyPlate && canvas.bulletPlayer.get(i).x <= canvas.xFlyPlate + 50
                     && canvas.liveFlyPlate==true){
                      canvas.liveFlyPlate = false
                      var arrAddPoint = [50,100,150,300]
                      var oldScore = canvas.countPoint
                      canvas.countPoint += arrAddPoint[ Math.floor(Math.random() * 3)]
                      var coefPeriodAddLife = Math.floor(canvas.countPoint/canvas.scoreAddLife) + 1


                      if(oldScore <= canvas.scoreAddLife*coefPeriodAddLife && canvas.countPoint > canvas.scoreAddLife*coefPeriodAddLife && coefPeriodAddLife!=0){
                          canvas.countLive+=1
                      }

                  }

                  if( canvas.bulletPlayer.get(i).y < height- 50){

                      for(var j=0; j<4; j++){
                            if( canvas.protector.get(j).countProtect == 0 ) continue
                            var temp_x = j*canvas.width*0.25 + canvas.width*0.125/2




                          if (canvas.bulletPlayer.get(i).x > temp_x && canvas.bulletPlayer.get(i).x < temp_x + 100){
                               finishbulletPlayer.push(i)
                               var temp_countProtect = canvas.protector.get(j).countProtect
                               if(temp_countProtect>0) temp_countProtect = temp_countProtect - 5
                               canvas.protector.set(j, {countProtect:temp_countProtect} )
                          }
                      }
                  }

                  for(var j=54; j>=0; j-=1){

                      var xInvarder = canvas.invaders.get(j).x + canvas.spaceBetweenX + canvas.shiftInvader
                      var yInvarder = canvas.invaders.get(j).y
                      if( canvas.bulletPlayer.get(i).x > xInvarder  &&   canvas.bulletPlayer.get(i).x < xInvarder + canvas.widthInvarder- canvas.spaceBetweenX ){

                          if(yInvarder - (canvas.heightInvarder - canvas.spaceBetweenY) < canvas.bulletPlayer.get(i).y && yInvarder > canvas.bulletPlayer.get(i).y){

                            if(canvas.invaders.get(j).live == true) {
                                finishbulletPlayer.push(i)
                                var temp_x = canvas.invaders.get(j).x
                                var temp_y = canvas.invaders.get(j).y
                                canvas.invaders.set(j, {x:temp_x, y: temp_y, live:false })
                                canvas.countDeadInvades+=1
                                var rowNumber = [thierdTypePoint,thierdTypePoint,secondTypePoint,firstTypePoint,firstTypePoint]
                                var oldScore = canvas.countPoint
                                canvas.countPoint += rowNumber[Math.floor(j/11)]
                                var coefPeriodAddLife = Math.floor(canvas.countPoint/canvas.scoreAddLife)

                                if(oldScore <= canvas.scoreAddLife*coefPeriodAddLife && canvas.countPoint > canvas.scoreAddLife*coefPeriodAddLife && coefPeriodAddLife!=0){
                                    canvas.countLive+=1


                                }


                            }

                          }
                      }
                  }
              }

              for( var i =0; i < finishbulletPlayer.length; i++ ){
                    canvas.bulletPlayer.remove(finishbulletPlayer[i])

              }

            if (canvas.xFlyPlate>0) canvas.xFlyPlate-=3
            else canvas.liveFlyPlate = false
           }


       }

       Timer {
            interval: 170 - canvas.countDeadInvades*6* (shiftInvaderV/100)  ; running: canvas.visible; repeat: true
            onTriggered: {

                for(var i =0; i<11; i++){


                    var temp_x = canvas.invaders.get(i + canvas.rowTime*11).x + canvas.rightDirection*20
                    if(i!=10 && canvas.invaders.get(i + canvas.rowTime*11 +1).x - temp_x>80) temp_x = canvas.invaders.get(i + canvas.rowTime*11 +1).x - 80
                    var temp_y = canvas.invaders.get(i + canvas.rowTime*11).y



                     var temp_live = canvas.invaders.get(i + canvas.rowTime*11).live

                     canvas.invaders.set(i + canvas.rowTime*11, {x:temp_x, y:temp_y, live:temp_live})


                    if (temp_x + canvas.rightDirection*20<= 0 || temp_x + canvas.rightDirection*20 + canvas.spaceBetweenX + canvas.widthInvarder >= width - 50) {

                        if(canvas.rowTime != 4){
                            canvas.rowTime+=1


                        }
                        else {
                            for(var j =0; j<55; j++){
                               var temp_x = canvas.invaders.get(j).x

                                   var temp_y = canvas.invaders.get(j).y + 10



                               var temp_live = canvas.invaders.get(j).live
                               canvas.invaders.set(j, {x:temp_x, y:temp_y, live:temp_live})
                            }

                            canvas.distanceToEnd += canvas.heightInvarder
                            canvas.rowTime = 0
                            canvas.rightDirection = canvas.rightDirection*(-1)


                            if( canvas.shiftInvader < 1){

                                canvas.shiftInvader = 0
                                canvas.rightDirection = 1
                            }

                            canvas.shiftInvaderDirection = canvas.shiftInvaderDirection*(-1)
                        }

                        break;

                    }


                }

                if(canvas.countDeadInvades == 55){
                    canvas.protector.clear()
                    canvas.invaders.clear()
                    canvas.bulletInvade.clear()
                    canvas.bulletPlayer.clear()
                    canvas.lvl+=1

                    for(var i =0; i<5; i++){
                        if(i!=0) canvas.protector.append({countProtect: 100})
                        for(var j=0; j<11; j++){
                         canvas.invaders.append({x:j* canvas.widthInvarder, y:i* canvas.heightInvarder + 100 + canvas.lvl*canvas.shiftAfterWin, live: true })
                        }
                    }

                    canvas.countDeadInvades = 0

                }

                if(canvas.countLive == 0 || canvas.invaders.get(54).y == 870) {

                    canvas.visible = false
                    startPage.visible = true
                    resultTable.append({lvl:canvas.lvl, score: canvas.countPoint})

                }


            }
        }

       Timer {
            interval: 120 - shiftInvaderH; running: canvas.visible; repeat: true
            onTriggered: {
                if(canvas.shiftInvader <= 55 && canvas.shiftInvader >= 0) canvas.shiftInvader += canvas.shiftInvaderDirection



            }
        }


       Component.onCompleted: {

           for(var i =0; i<5; i++){
               if(i!=0) protector.append({countProtect: 100})
               for(var j=0; j<11; j++){
                canvas.invaders.append({x:j*widthInvarder, y:i*heightInvarder + 100, live: true })
               }
           }
       }

       onPaint: {
           var ctx = getContext("2d")

           ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
           ctx.fillRect(0, 0, width, height);

            ctx.fillStyle = "white"
           ctx.font = String(12) +'px "%1"'.arg("Arial")
            ctx.textAlign = "center";

           for(var i=0; i<4;i++){

                  ctx.fillStyle = Qt.rgba(0, 1, 0, canvas.protector.get(i).countProtect/100 );
                 ctx.fillRect(i*canvas.width*0.25 + canvas.width*0.125/2 ,height- 100, 100, 50)
           }

           ctx.fillStyle = "white"
           var textEmotion = [ "-_-","-_-","^_^","o_o","o_o" ]


           for(var i =0; i<55; i++){
                if(canvas.invaders.get(i).live){

                    ctx.fillStyle = "white"
                    ctx.fillRect(canvas.invaders.get(i).x + spaceBetweenX + canvas.shiftInvader,canvas.invaders.get(i).y  + spaceBetweenY, widthInvarder-spaceBetweenX,heightInvarder- spaceBetweenY)
                    ctx.fillStyle = "black"

                    ctx.fillText(textEmotion[Math.floor(i/11)],canvas.invaders.get(i).x + spaceBetweenX + canvas.shiftInvader + (widthInvarder-spaceBetweenX)/2,canvas.invaders.get(i).y  + spaceBetweenY + (heightInvarder- spaceBetweenY)/2)
                }
           }
               ctx.fillStyle = "white"
           ctx.fillRect(canvas.xPlayer,canvas.height - 10,50,10)

           ctx.fillStyle = "red"
           for(var i=0; i< canvas.bulletInvade.count; i++){
               ctx.fillRect(canvas.bulletInvade.get(i).x, canvas.bulletInvade.get(i).y, 5, 10)
           }


           for(var i=0; i< canvas.bulletPlayer.count; i++){
               ctx.fillRect(canvas.bulletPlayer.get(i).x, canvas.bulletPlayer.get(i).y, 5, 10)
           }

           if(canvas.liveFlyPlate){
                ctx.fillRect(canvas.xFlyPlate,20,50,10)
           }
            ctx.textAlign = "left";
            ctx.fillText("Score: " + String(canvas.countPoint), 5,50)
           ctx.fillText("Lvl: " + String(canvas.lvl), 5,70)
            ctx.fillText("❤".repeat(canvas.countLive) , 5,90)





       }


               }




    Connections{
        target:backend
    }


}








