// Default empty project template
import bb.cascades 1.0

TabbedPane {
    showTabsOnActionBar: true
    Tab {
        title: "Timetable"
        SearchPage {
        }
    }
    Tab {
        title: "Favourites"
        Page {
            Label {
                text: "recently searched connections"
            }
        }
    }
    Tab {
        title: "Stationboard"
        Page {
            Label {
                text: "shows connections from a specified station"
            }
        }
    }
}
