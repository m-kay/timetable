import bb.cascades 1.0

NavigationPane {
    id: navigation
    property variant timetable
    firstPage: Page {
        Container {
            SbbHeader {
            }
            Container {
                leftPadding: 10
                rightPadding: 10
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                TextField {
                    id: from
                    hintText: "von"
                    text: "Amriswil"
                }
                TextField {
                    id: to
                    hintText: "bis"
                    text: "Zürich"
                }
                DateTimePicker {
                    id: time
                    mode: DateTimePickerMode.DateTime
                    horizontalAlignment: HorizontalAlignment.Fill
                }
                Button {
                    horizontalAlignment: HorizontalAlignment.Fill
                    text: "gegenrichtung"
                    onClicked: {
                        var temp = from.text;
                        from.text = to.text;
                        to.text = temp;
                    }
                }
                Button {
                    horizontalAlignment: HorizontalAlignment.Fill
                    text: "search"
                    onClicked: {
                        tt.getConnections(from.text, to.text, time.value);
                        if (timetable != undefined) {
                            timetable.destroy();
                        }
                        timetable = timetableDefinition.createObject();
                        navigation.push(timetable);
                    }
                }
            }
        }
        attachedObjects: [
            ComponentDefinition {
                id: timetableDefinition
                source: "timetable/Timetable.qml"
                
            }
        ]
    }
}
