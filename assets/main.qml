// Default empty project template
import bb.cascades 1.0

NavigationPane {
    id: navigation
    property variant timetable
    
    firstPage: Page {
        Container {
            leftPadding: 10
            rightPadding: 10
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            Label {
                text: tt.testInvoke();
            }
            TextField {
                id: from
                hintText: "von"
            }
            TextField {
                id: to
                hintText: "bis"
            }
            DateTimePicker {
                id: time
                mode: DateTimePickerMode.DateTime
            }
            Button {
                text: "search"
                onClicked: {
                    tt.getConnections("Amriswil", "Oberaach");
                    timetable = timetableDefinition.createObject();
                    navigation.push(timetable);
                    timetable.back.connect(navigation.pop);
                }
            }
        }
    }
    attachedObjects: [
        ComponentDefinition {
            id: timetableDefinition
            source: "Timetable.qml"
        }
    ]
}
