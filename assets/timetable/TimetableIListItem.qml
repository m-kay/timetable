import bb.cascades 1.0

ListItemComponent {
    type: "item"
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        background: {
            ListItem.indexInSection % 2 == 0 ? Color.create("#dddddd") : Color.White;
        }
        minHeight: 60
        leftPadding: 10
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }
            minHeight: 60
            Label {
                text: ListItemData.dep
                preferredWidth: 120
                rightMargin: 0
                leftMargin: 0
                verticalAlignment: VerticalAlignment.Center
                opacity: 1.0
            }
            Label {
                text: ListItemData.arr
                preferredWidth: 120
                rightMargin: 0
                leftMargin: 0
                verticalAlignment: VerticalAlignment.Center
            }
            Label {
                text: ListItemData.duration
                preferredWidth: 120
                rightMargin: 0
                leftMargin: 0
                verticalAlignment: VerticalAlignment.Center
            }
            Label {
                text: ListItemData.transfers
                preferredWidth: 120
                rightMargin: 0
                leftMargin: 0
                verticalAlignment: VerticalAlignment.Center
            }
            Label {
                text: ListItemData.platform
                preferredWidth: 120
                rightMargin: 0
                leftMargin: 0
                verticalAlignment: VerticalAlignment.Center
            }
        }
    }
}
