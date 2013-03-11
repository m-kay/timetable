import bb.cascades 1.0

Page {
    Container {
        leftPadding: 10
        rightPadding: 10
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
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
                timetable = timetableDefinition.createObject();
                navigation.push(timetable);
                timetable.back.connect(navigation.pop);
            }
        }
    }
}
