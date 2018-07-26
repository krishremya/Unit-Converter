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
        color: "Orange"
        anchors.centerIn: parent
        }

    SpinBox {
        id: textInput
        from: 0
        value: 0
        to: 100*100
        width: 400
        height: 40
        anchors {
            bottom: button.top
            bottomMargin: 40
            horizontalCenter: parent.horizontalCenter
        }
    }

    Button {
        id:button
        text: "Convert"
        width: 400
        height: 40
        anchors.centerIn: dispbox


        onClicked: {
            textOutput.text = button.convert(textInput.value)
        }
        function convert(n) {
             n = textInput.value
             var s = n*1000
             var msg  = "%1 kilometers is %2 meters"
             return msg.arg(n).arg(s)
        }
    }

    TextField {
        id: textOutput
        color: "Grey"
        width: 400
        height: 40
        anchors {
            top: button.bottom
            topMargin: 40
            horizontalCenter: parent.horizontalCenter
        }
        text: button.convert(textInput.value)
    }
}
