import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.XmlListModel 2.0
import QtQml 2.2

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


    function convertCurrency(n) {
        n = textInput.value
        var ans = 0
        if(xmllist.xml0.name === combo2.currentText) {
            ans = n* xmllist.xml0.rate
        }
        return ans
    }

    Rectangle {
        id: dispbox
        width: 1000
        height: 800
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
        text: "Convert Distance"
        width: 200
        height: 40
        anchors.centerIn: dispbox
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
            } else {
                textOutput.text = convertCurrency()
            }
        }
    }

    Button {
        id:button2
        text: "Convert Currency"
        width: 200
        height: 10
        anchors {
            top: button.bottom
            topMargin:10
            bottom: textOutput.top
            bottomMargin: 10
            horizontalCenter: parent.horizontalCenter
        }

        onClicked: {
            if(combo2.currentIndex === xmllist.xml0.name)
                textOutput.text = convert(textInput.value)
        }
    }

    TextField {
        id: textOutput
        color: "Grey"
        width: 400
        height: 40
        anchors {
            top: button.bottom
            topMargin: 60
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
            topMargin: 100
            bottomMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
    }

    ComboBox {
        id: combo
        width: 200
        height: 40
        model: ["NauticalMiles","Feet","Metre","Centimetre","Yard"]
        anchors {
            bottom: button.top
            bottomMargin: 10
            top: textInput.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }

        onCurrentTextChanged: console.log(textInput.value)
    }

    ComboBox {
        id: combo2
        width: 200
        height:40
        model: ["USA","GBP","JPY","EUR","AUD","CAD","DKK","NOK","ZAR","SEK","CHF","JOD","LBP","EGP"]
        anchors {
             top: textInput.bottom
             topMargin: 10
             right: combo.left
             leftMargin: 10
             rightMargin: 10

        }
    }

    XmlListModel {
        id: xmllist
        source: "https://www.boi.org.il/currency.xml"
        namespaceDeclarations: "declare namespace CURRENCIES='http://www.boi.org/currency.xml/CURRENCYCODE/UNIT/RATE/CHANGE';"
        query: "/CURRENCIES/CURRENCY/CURRENCY/CURRENCY"

        onStatusChanged: {
            if(status === XmlListModel.ready) {
                for(var i =0 ;i < count; i++) {
                    currencies.append({"currency": get(i).currency, "rate": parseFloat(get(i).rate)})
                }
            }
        }
        XmlRole {
            id:xml0
            name: "CURRENCYCODE";
            query: "@CURRENCYCODE/string()"
        }
        XmlRole {
            id: xml1
            name: "RATE";
            query: "@RATE/string()"
        }

    }


    ListModel {
            id: currencies
            ListElement {
                currency: "EUR"
                rete: 1.0
            }
            function getCurr(curr) {
                return (curr >= 0)?get(curr).currency: ""
            }

            function getRate(curr) {
                return (curr >= 0)? get(curr).rate: 0.0
            }
        }

    TextField {
        id: inputTo
        width: 400
        height: 40
        text: '0.0'
        anchors {
            top: textOutput.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }

    }
}
