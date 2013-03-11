import bb.cascades 1.0

Page {
    Container {
        Label {
            text: "your connections"
        }
        ActivityIndicator {
            running: true
        }
        ListView {
            id: connectionsList
            visible: false
            onDataModelChanged: {
                
            }
        }
    }
}
