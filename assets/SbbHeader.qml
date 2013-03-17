import bb.cascades 1.0

Container {
    preferredHeight: 120
    maxHeight: 120
    leftPadding: 140
    topPadding: 20
    bottomMargin: 20
    background: background.imagePaint
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    Container {
        layoutProperties: StackLayoutProperties {
            spaceQuota: 1
        }
        Label {
            text: "SBB Mobile"
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
                fontWeight: FontWeight.Bold
                color: Color.White
            }
        }
        attachedObjects: [
            ImagePaintDefinition {
                id: background
                imageSource: "asset:///images/pageHead.amd"
            }
        ]
    }
}
