/**
  Application Window
  GUI elements: Rectangle, Button, Text
 */

import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Unit_Convertor")


    Rectangle {
        id: dispbox
        width: 1024
        height: 900
        color: "Green"
        anchors.centerIn: parent
        }

    SpinBox {
        id: textInput
        value: 50
        width: 400
        x: 750
        y: 400
    }

    TextField {
        id: textOutput
        color: "Grey"
        width: 400
        x: 750
        y: 600
        text: value.convert(textInput.value)
    }

    Button {
        text: "Convert"
        width: 400
        x: 750
        y: 200
        anchors {
            top: dispbox.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCentre
        }
        onClicked: {
            value.convert(textInput.value)
        }
    }

   ListModel {
       id: value
       function convert(n) {
            n = textInput.value
            var s = n*1000
            return out(s)
        }
       function out(s) {
           var msg = "The converted value is %1"
           console.log(msg.arg(s))
           return msg
       }
   }
}
