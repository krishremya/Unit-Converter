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
            bottomMargin: 60
            horizontalCenter: parent.horizontalCenter
        }
    }

    Button {
        id:button
        text: "Convert"
        width: 200
        height: 40
        anchors {
            top: combo.bottom
            topMargin:10
            horizontalCenter: parent.horizontalCenter
        }
        onClicked: {
            if(combo.model === "Meter") {
            textOutput.text = console.log(button.convertM(textInput.value))
            } else if(combo.model === "Nautical Miles") {
                textOutput.text = console.log(button.convertN(textInput.value))
                } else if(combo.model === "Feet") {
                    textOutput.text = console.log(button.convertF(textInput.value))
                    } else if(combo.model === "Yard") {
                        textOutput.text = console.log(button.convertY(textInput.value))
                        } else if(combo.model === "Centimetre"){
                            textOutput.text = console.log(button.convertC(textInput.value))
                            }
        }
        function convertM(n) {
             n = textInput.value
             var s = n*1000
             var msg  = "%1 kilometers is %2 meters"
             return msg.arg(n).arg(s)

        }
        function convertN(n) {
            n = textInput.value
            var s = n*0.54
            var msg = "%1 kilometers is %2 Nautical Miles "
            return msg.arg(n).arg(s)
        }
        function convertF(n) {
            n = textInput.value
            var s = n * 3280.8
            var msg = "%1 kilometers is %2 feets "
            return msg.arg(n).arg(s)
        }
        function convertC(n) {
            n = textInput.value
            var s = n * 100000
            var msg = "%1 kilometers is %2 centimeters "
            return msg.arg(n).arg(s)
        }
        function convertY(n) {
            n = textInput.value
            var s = n * 1093.6
            var msg = "%1 kilometers is %2 centimeters "
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
        text: {
                if(combo.model === "Feet") {
                   var msg = button.convertF(textInput.value)
                   print(msg)
                }else if(combo.model === "Metre") {
                   var msge = buttonc.convertM(textInput.value)
                    print(msge)
                } else if(combo.model === "Nautical Miles") {
                    var msges = button.convertN(textInput.value)
                    print(msges)
                } else if(combo.model === "Yard") {
                    var mesges = button.convertY(textInput.value)
                    print(mesges)
                } else if(combo.model === "Centimetre") {
                    var message =  button.convertC(textInput.value)
                    print(message)
                }
        }

    }

    ComboBox {
        id: combo
        width: 200
        model: ["Nautical Miles","Feet","Metre","Centimetre","Yard"]
        anchors {
            centerIn: dispbox
        }

    }
}
