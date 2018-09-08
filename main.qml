import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0

Window {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Unit_Convertor")
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
        var msg = "%1 kilometers is %2 yards "
        return msg.arg(n).arg(s)
    }
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
            if(combo1.currentText == "Distances") {
                if(combo.currentText == "Metre") {
                    textOutput.text = convertM(textInput.value)
                } else if(combo.currentText == "NauticalMiles") {
                    textOutput.text = convertN(textInput.value)
                } else if(combo.currentText == "Feet") {
                    textOutput.text = convertF(textInput.value)
                } else if(combo.currentText == "Yard") {
                    textOutput.text = convertY(textInput.value)
                } else if(combo.currentText == "Centimetre"){
                    textOutput.text = convertC(textInput.value)
                }
            }
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
    }
    ComboBox{
        id: combo1
        width: 400
        height: 50
        model: ["Currencies","Distances"]
        anchors {
            bottom: textInput.top
            bottomMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
    }
    ComboBox {
        id: combo
        width: 200
        model: ["NauticalMiles","Feet","Metre","Centimetre","Yard"]
        anchors.centerIn: dispbox
        onCurrentTextChanged: console.log(textInput.value)
    }
    XmlListModel {
        id: xmllist
        source: "https://www.boi.org.il/currency.xml"
    }
}
