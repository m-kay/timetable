import bb.cascades 1.0

Page {
    Container {
        leftPadding: 20
        rightPadding: 20
        Label {
            id:headInfo
            objectName: "headInfo"
            text: ""
        }
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            layout: AbsoluteLayout {
            }
            background: Color.Blue
            Label {
                text: "Ab"
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                    color: Color.White
                }
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 0
                    positionY: 0
                }
            }
            Label {
                text: "An"
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                    color: Color.White
                }
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 120
                    positionY: 0
                }
            }
            Label {
                bottomMargin: 0
                text: "Dauer"
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                    color: Color.White
                }
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 240
                    positionY: 0
                }
            }
            Label {
                bottomMargin: 0
                text: "Umst."
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                    color: Color.White
                }
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 360
                    positionY: 0
                }
            }
            Label {
                bottomMargin: 0
                text: "Gleis"
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                    color: Color.White
                }
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 480
                    positionY: 0
                }
            }
            Label {
                bottomMargin: 0
                text: "Info"
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                    color: Color.White
                }
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 600
                    positionY: 0
                }
            }
        }
        ActivityIndicator {
            id: loader
            visible: true
            running: true
            horizontalAlignment: HorizontalAlignment.Fill
        }
        ListView {
            visible: false
            objectName: "timetableList"
            id: timetableList
            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    Container {
                        bottomMargin: 30
                        layout: AbsoluteLayout {
                        }
                        Label {
                            text: ListItemData.dep
                            textStyle {
                                base: SystemDefaults.TextStyles.BodyText
                                color: Color.Gray
                            }
                            layoutProperties: AbsoluteLayoutProperties {
                                positionX: 0
                                positionY: 0
                            }
                        }
                        Label {
                            text: ListItemData.arr
                            textStyle {
                                base: SystemDefaults.TextStyles.BodyText
                                color: Color.Gray
                            }
                            layoutProperties: AbsoluteLayoutProperties {
                                positionX: 120
                                positionY: 0
                            }
                        }
                        Label {
                            bottomMargin: 0
                            text: ListItemData.duration
                            textStyle {
                                base: SystemDefaults.TextStyles.BodyText
                                color: Color.Gray
                            }
                            layoutProperties: AbsoluteLayoutProperties {
                                positionX: 240
                                positionY: 0
                            }
                        }
                        Label {
                            bottomMargin: 0
                            text: ListItemData.transfers
                            textStyle {
                                base: SystemDefaults.TextStyles.BodyText
                                color: Color.Gray
                            }
                            layoutProperties: AbsoluteLayoutProperties {
                                positionX: 360
                                positionY: 0
                            }
                        }
                        Label {
                            bottomMargin: 0
                            text: ListItemData.platform
                            textStyle {
                                base: SystemDefaults.TextStyles.BodyText
                                color: Color.Gray
                            }
                            layoutProperties: AbsoluteLayoutProperties {
                                positionX: 480
                                positionY: 0
                            }
                        }
                    }
                }
            ]
            onVisibleChanged: {
                if (timetableList.visible) {
                    loader.visible = false;
                }
            }
        }
    }
}
