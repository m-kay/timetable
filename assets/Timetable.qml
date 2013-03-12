import bb.cascades 1.0

Page {
    Container {
        Label {
            text: "your connections"
        }
        ListView {
            objectName: "timetableList"
            id: timetableList
            listItemComponents: [
                ListItemComponent {
                    StandardListItem {
                        status: {
                            ListItemData.duration
                        }
                        description: {
                            ListItemData.transfers
                        }
                    }
                }
            ]
        }
    }
}
