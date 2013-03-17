import bb.cascades 1.0

Container {
    horizontalAlignment: HorizontalAlignment.Fill
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    background: background.imagePaint
    minHeight: 80
    leftPadding: 10
    Label {
        text: "Ab"
        textStyle {
            base: SystemDefaults.TextStyles.BodyText
            color: Color.White
        }
        verticalAlignment: VerticalAlignment.Center
        preferredWidth: 120
        rightMargin: 0
        leftMargin: 0
    }
    Label {
        text: "An"
        textStyle {
            base: SystemDefaults.TextStyles.BodyText
            color: Color.White
        }
        verticalAlignment: VerticalAlignment.Center
        preferredWidth: 120
        rightMargin: 0
        leftMargin: 0
    }
    Label {
        bottomMargin: 0
        text: "Dauer"
        textStyle {
            base: SystemDefaults.TextStyles.BodyText
            color: Color.White
        }
        verticalAlignment: VerticalAlignment.Center
        preferredWidth: 120
        rightMargin: 0
        leftMargin: 0
    }
    Label {
        bottomMargin: 0
        text: "Umst."
        textStyle {
            base: SystemDefaults.TextStyles.BodyText
            color: Color.White
        }
        verticalAlignment: VerticalAlignment.Center
        preferredWidth: 120
        rightMargin: 0
        leftMargin: 0
    }
    Label {
        bottomMargin: 0
        text: "Gleis"
        textStyle {
            base: SystemDefaults.TextStyles.BodyText
            color: Color.White
        }
        verticalAlignment: VerticalAlignment.Center
        preferredWidth: 120
        rightMargin: 0
        leftMargin: 0
    }
    Label {
        bottomMargin: 0
        text: "Info"
        textStyle {
            base: SystemDefaults.TextStyles.BodyText
            color: Color.White
        }
        verticalAlignment: VerticalAlignment.Center
        preferredWidth: 120
        rightMargin: 0
        leftMargin: 0
    }
    attachedObjects: [
        ImagePaintDefinition {
            id: background
            imageSource: "asset:///images/header.amd"
        }
    ]
        
}
