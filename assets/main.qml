// Default empty project template
import bb.cascades 1.0

NavigationPane {
    id: navigation
    property variant timetable;
    
    SearchPage {
        actions: [
            ActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: "search"
                onTriggered: {
                    timetable = timetableDefinition.createObject();
                    navigation.push(timetable);
                    timetable.back.connect(navigation.pop);
                }
            }
        ]
    }
    attachedObjects: [
        ComponentDefinition {
            id: timetableDefinition
            source: "Timetable.qml"
        }
    ]
}
