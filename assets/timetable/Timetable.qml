import bb.cascades 1.0

Page {
    Container {
        SbbHeader {
            
        }
        Container {
            leftPadding: 20
            rightPadding: 20
            Label {
                id: headInfo
                objectName: "headInfo"
                text: ""
            }
            TimetableListHeader {
            }
            ActivityIndicator {
                id: loader
                visible: true
                running: true
                horizontalAlignment: HorizontalAlignment.Fill
            }
            ListView {
                visible: false
                objectName: "timetableList"
                id: timetableList
                listItemComponents: [
                    TimetableIListItem {
                    }
                ]
                onVisibleChanged: {
                    if (timetableList.visible) {
                        loader.visible = false;
                    }
                }
            }
        }
    }
}
