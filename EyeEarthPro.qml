import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.1

import ArcGIS.AppFramework 1.0
import Esri.ArcGISRuntime 100.2

import "controls" as Controls

App{
    id: app
    width: 414
    height: 736
    function units(value) {
        return AppFramework.displayScaleFactor * value
    }
    property real scaleFactor: AppFramework.displayScaleFactor
    property int  baseFontSize : app.info.propertyValue("baseFontSize", 15 * scaleFactor) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(400)
    property url  qmlfile
    property string sampleName
    property string descriptionText

    Page{
        anchors.fill: parent
        header: ToolBar{
            id:header
            width: parent.width
            height: 50 * scaleFactor
            contentWidth: 2
            Material.background: "black"
            Controls.HeaderBar{}
        }

        // Add a Loader to load different samples.
        contentItem: Rectangle{
            id: loader
            anchors.top:header.bottom
            Loader{
                height: app.height - header.height
                width: app.width
                source: "MainActivity.qml"
            }
        }
    }

    Controls.FloatActionButton{
        id:switchBtn
    }

    Controls.PopUpPage{
        id:popUp
        visible:false
    }

    Controls.DescriptionPage{
        id:descPage
        visible: false
    }
}

