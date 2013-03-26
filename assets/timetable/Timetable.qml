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
            Label {
                id: error
                objectName: "error"
                visible: false
                multiline: true
                text: "Error occured while loading data"
                onVisibleChanged: {
                     if(error.visible){
                          loader.visible = false;   
                     }   
                }
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
                onTriggered: {
                    console.log("clicked item " + indexPath); 
                    console.log(timetableList.dataModel.data(indexPath).sections);
                }
            }
        }
    }
}
