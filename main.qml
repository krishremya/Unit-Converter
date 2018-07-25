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
        width: 900
        height: 750
        color: "Green"
        anchors.centerIn: parent
        }

    SpinBox {
        id: textInput
        from: 0
        value: 0
        to: 100*100
        width: 400
        height: 40
        anchors.centerIn: dispbox
    }

    Button {
        id:button
        text: "Convert"
        width: 400
        anchors {
            top: dispbox.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        onClicked: {
            textOutput.text = button.convert(textInput.value)
        }
        function convert(n) {
             n = textInput.value
             var s = n*1000
             var msg  = "The converted kilometers to meters is %1"
             return msg.arg(s)
        }
    }
    TextField {
        id: textOutput
        color: "Grey"
        width: 400
        anchors {
            top: textInput.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        text:button.convert(textInput.value)

    }
}
