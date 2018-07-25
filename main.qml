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
    function convert(n) {
         n = textInput.value
         var s = n*1000
         var msg = "The converted value is %1"
         console.log(msg.arg(s))
         return msg.arg(s)
   }


    Rectangle {
        id: dispbox
        width: 900
        height: 750
        color: "Green"
        anchors.centerIn: parent
        }

    SpinBox {
        id: textInput
        value: 50
        width: 400
        height: 40
        anchors.centerIn: dispbox;
    }

    TextField {
        id: textOutput
        color: "Grey"
        width: 400
        verticalAlignment: Text.AlignVCenter
        text: appWindow.convert(textInput.value)
    }

    Button {
        text: "Convert"
        width: 400
        anchors {
            top: dispbox.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        onClicked: {
            appWindow.convert(textInput.value)
        }
    }
}
