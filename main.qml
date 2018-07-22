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
        text: print(value.convert(textInput.value))
    }
    Button {
        text: "Convert"
        anchors {
            top: dispbox.bottom
            horizontalCenter: parent.horizontalCentre
        }
        onClicked: {
            value.getValue(textInput.value)
            value.convert(textInput.value)
        }
    }

   ListModel {
       id: value
       function getValue(input) {
         input = textInput.value
       }
       function convert(n) {
         n = getValue(x)
         console.log(n*1000)
       }
   }
}
