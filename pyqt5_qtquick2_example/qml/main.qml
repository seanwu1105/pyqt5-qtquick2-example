import QtQuick 2.13
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Universal 2.4
import QtCharts 2.2

ApplicationWindow {
  visible: true
  minimumHeight: 700
  minimumWidth: 1600
  Material.theme: Material[subTheme.currentText]
  Material.accent: Material[accentColor.currentText]
  Material.primary: Material[primaryColor.currentText]
  Universal.theme: Universal[subTheme.currentText]
  Universal.accent: Universal[accentColor.currentText]
  menuBar: MenuBar {
    Menu {
      title: '&File'
      Action { text: '&New...' }
      Action { text: '&Open...' }
      Action { text: '&Save' }
      Action { text: 'Save &As...' }
      MenuSeparator {}
      Action { text: '&Quit' }
    }
    Menu {
      title: '&Edit'
      Action { text: 'Cu&t' }
      Action { text: '&Copy' }
      Action { text: '&Paste' }
    }
    Menu {
      title: '&Help'
      Action { text: '&About' }
    }
  }
  header: ToolBar {
    RowLayout {
      anchors.fill: parent
      ToolButton {
        icon.source: '../images/baseline-menu-24px.svg'
        onClicked: sideNav.open()
      }
      Label {
        text: 'PyQt5 QtQuick2 Example'
        elide: Label.ElideRight
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        Layout.fillWidth: true
      }
      ToolButton { text: 'Action 1' }
      ToolButton { text: 'Action 2' }
      ToolSeparator {}
      ToolButton { text: 'Action 3' }
      ToolButton { text: 'Action 4' }
      ToolButton {
        icon.source: '../images/baseline-more_vert-24px.svg'
        onClicked: menu.open()
        Menu {
          id: menu
          y: parent.height
          MenuItem { text: 'New...' }
          MenuItem { text: 'Open...' }
          MenuItem { text: 'Save' }
        }
      }
    }
  }
  Drawer {
    id: sideNav
    width: 200
    height: parent.height
    ColumnLayout {
      width: parent.width
      Label {
          text: 'Drawer'
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          font.pixelSize: 20
          Layout.fillWidth: true
      }
      Repeater {
        model: 5
        SideNavButton {
          icon.source: '../images/baseline-category-24px.svg'
          text: 'List ' + index
          Layout.fillWidth: true
        }
      }
    }
  }
  Pane {
    padding: 10
    anchors.fill: parent
    GridLayout {
      anchors.fill: parent
      flow: GridLayout.TopToBottom
      rows: 2
      CellBox {
        title: 'Buttons'
        ColumnLayout {
          anchors.fill: parent
          Button {
            text: 'Button'
            Layout.fillWidth: true
            onClicked: normalPopup.open()
          }
          Button {
            text: 'Flat'
            Layout.fillWidth: true
            flat: true
            onClicked: modalPopup.open()
          }
          Button {
            text: 'Highlighted'
            Layout.fillWidth: true
            highlighted: true
            onClicked: dialog.open()
          }
          RoundButton {
            text: '+'
            Layout.alignment: Qt.AlignHCenter
          }
        }
      }
      CellBox {
        title: 'Radio Buttons'
        ColumnLayout {
          anchors.fill: parent
          RadioButton { text: 'Radio Button 1'; checked: true }
          RadioButton { text: 'Radio Button 2' }
          RadioButton { text: 'Radio Button 3' }
          RadioButton { text: 'Radio Button 4' }
        }
      }
      CellBox {
        title: 'Check Boxes'
        ColumnLayout {
          anchors.fill: parent
          Switch { Layout.alignment: Qt.AlignHCenter }
          ButtonGroup {
            id: childGroup
            exclusive: false
            checkState: parentBox.checkState
          }
          CheckBox {
            id: parentBox
            text: 'Parent'
            checkState: childGroup.checkState
          }
          CheckBox {
            checked: true
            text: 'Child 1'
            leftPadding: indicator.width
            ButtonGroup.group: childGroup
          }
          CheckBox {
            text: 'Child 2'
            leftPadding: indicator.width
            ButtonGroup.group: childGroup
          }
        }
      }
      CellBox {
        title: 'Progress Indicators'
        ColumnLayout {
          anchors.fill: parent
          BusyIndicator {
            running: true
            Layout.alignment: Qt.AlignHCenter
            ToolTip.visible: hovered
            ToolTip.text: 'Busy Indicator'
          }
          DelayButton {
            text: 'Delay Button'
            delay: 3000
            Layout.fillWidth: true
          }
          ProgressBar { value: 0.6; Layout.fillWidth: true }
          ProgressBar { indeterminate: true; Layout.fillWidth: true }
        }
      }
      CellBox {
          title: 'ComboBoxes'
          ColumnLayout {
              anchors.fill: parent
              ComboBox {
                model: ['Normal', 'Second', 'Third']
                Layout.fillWidth: true
              }
              ComboBox {
                model: ['Flat', 'Second', 'Third']
                Layout.fillWidth: true
                flat: true
              }
              ComboBox {
                model: ['Editable', 'Second', 'Third']
                Layout.fillWidth: true
                editable: true
              }
              ComboBox {
                  model: 10
                  editable: true
                  validator: IntValidator { top: 9; bottom: 0 }
                  Layout.fillWidth: true
              }
          }
      }
      CellBox {
        title: 'Range Controllers'
        ColumnLayout {
          anchors.fill: parent
          Dial {
            id: dial
            scale: 0.8
            Layout.alignment: Qt.AlignHCenter
            ToolTip {
              parent: dial.handle
              visible: dial.pressed
              text: dial.value.toFixed(2)
            }
          }
          RangeSlider {
            first.value: 0.25; second.value: 0.75; Layout.fillWidth: true
            ToolTip.visible: hovered
            ToolTip.text: 'Range Slider'
          }
          Slider {
            id: slider
            Layout.fillWidth: true
            ToolTip {
              parent: slider.handle
              visible: slider.pressed
              text: slider.value.toFixed(2)
            }
          }
        }
      }
      CellBox {
        title: 'Spin Boxes'
        ColumnLayout {
          anchors.fill: parent
          SpinBox { value: 50; editable: true; Layout.fillWidth: true }
          SpinBox {
            from: 0
            to: items.length - 1
            value: 1 // 'Medium'
            property var items: ['Small', 'Medium', 'Large']
            validator: RegExpValidator {
              regExp: new RegExp('(Small|Medium|Large)', 'i')
            }
            textFromValue: function(value) {
              return items[value];
            }
            valueFromText: function(text) {
              for (var i = 0; i < items.length; ++i)
                if (items[i].toLowerCase().indexOf(text.toLowerCase()) === 0)
                  return i
              return sb.value
            }
            Layout.fillWidth: true
          }
          SpinBox {
            id: doubleSpinbox
            editable: true
            from: 0
            value: 110
            to: 100 * 100
            stepSize: 100
            property int decimals: 2
            property real realValue: value / 100
            validator: DoubleValidator {
              bottom: Math.min(doubleSpinbox.from, doubleSpinbox.to)
              top:  Math.max(doubleSpinbox.from, doubleSpinbox.to)
            }
            textFromValue: function(value, locale) {
              return Number(value / 100).toLocaleString(locale, 'f', doubleSpinbox.decimals)
            }
            valueFromText: function(text, locale) {
              return Number.fromLocaleString(locale, text) * 100
            }
            Layout.fillWidth: true
          }
        }
      }
      CellBox {
        title: 'Text Inputs'
        Column {
          // ScrollView will not work if we use ColumnLayout as
          // ColumnLayout always measures its size depending on its
          // contents.
          anchors.fill: parent
          spacing: 10
          TextField {
            width: parent.width
            placeholderText: 'Enter something here...'
            selectByMouse: true
          }
          TextField {
            width: parent.width
            text: 'read only'
            readOnly: true
          }
          ScrollView {
            width: parent.width
            height: parent.height - y
            TextArea {
              placeholderText: 'Multi-line text editor...'
              selectByMouse: true
              persistentSelection: true
            }
          }
        }
      }
      CellBox {
        Layout.rowSpan: 2; Layout.minimumWidth: 700
        title: 'Tabs'
        Layout.preferredWidth: height // Keep the ratio right!
        TabBar {
          id: bar
          width: parent.width
          TabButton { text: 'Area' }
          TabButton { text: 'Bar' }
          TabButton { text: 'Box' }
          TabButton { text: 'Candlestick' }
          TabButton { text: 'Polar' }
          TabButton { text: 'Scatter' }
          TabButton { text: 'Spine' }
          TabButton { text: 'Pie' }
        }
        StackLayout {
          width: parent.width
          height: parent.height - y
          anchors.top: bar.bottom
          currentIndex: bar.currentIndex
          LargeChartView {
            // Define x-axis to be used with the series instead of default one
            ValueAxis {
              id: valueAxisAreaSeries
              min: 2000
              max: 2011
              tickCount: 12
              labelFormat: '%.0f'
            }
            AreaSeries {
              name: 'The U.S.'
              axisX: valueAxisAreaSeries
              upperSeries: LineSeries {
                XYPoint { x: 2000; y: 3 }
                XYPoint { x: 2001; y: 2 }
                XYPoint { x: 2002; y: 1 }
                XYPoint { x: 2003; y: 2 }
                XYPoint { x: 2004; y: 1 }
                XYPoint { x: 2005; y: 1 }
                XYPoint { x: 2006; y: 0 }
                XYPoint { x: 2007; y: 3 }
                XYPoint { x: 2008; y: 4 }
                XYPoint { x: 2009; y: 1 }
                XYPoint { x: 2010; y: 0 }
                XYPoint { x: 2011; y: 1 }
              }
            }
            AreaSeries {
              name: 'Russian'
              axisX: valueAxisAreaSeries
              upperSeries: LineSeries {
                XYPoint { x: 2000; y: 1 }
                XYPoint { x: 2001; y: 1 }
                XYPoint { x: 2002; y: 1 }
                XYPoint { x: 2003; y: 1 }
                XYPoint { x: 2004; y: 1 }
                XYPoint { x: 2005; y: 0 }
                XYPoint { x: 2006; y: 1 }
                XYPoint { x: 2007; y: 1 }
                XYPoint { x: 2008; y: 4 }
                XYPoint { x: 2009; y: 3 }
                XYPoint { x: 2010; y: 2 }
                XYPoint { x: 2011; y: 1 }
              }
            }
            AreaSeries {
              name: 'Taiwan'
              axisX: valueAxisAreaSeries
              upperSeries: LineSeries {
                XYPoint { x: 2000; y: 2 }
                XYPoint { x: 2001; y: 1 }
                XYPoint { x: 2002; y: 0 }
                XYPoint { x: 2003; y: 3 }
                XYPoint { x: 2004; y: 0 }
                XYPoint { x: 2005; y: 0 }
                XYPoint { x: 2006; y: 1 }
                XYPoint { x: 2007; y: 1 }
                XYPoint { x: 2008; y: 0 }
                XYPoint { x: 2009; y: 2 }
                XYPoint { x: 2010; y: 2 }
                XYPoint { x: 2011; y: 1 }
              }
            }
          }
          LargeChartView {
            BarSeries {
              axisX: BarCategoryAxis {
                categories: ['2007', '2008', '2009', '2010', '2011', '2012' ]
              }
              BarSet { label: 'Bob'; values: [2, 2, 3, 4, 5, 6] }
              BarSet { label: 'Susan'; values: [5, 1, 2, 4, 1, 7] }
              BarSet { label: 'James'; values: [3, 5, 8, 13, 5, 8] }
            }
          }
          LargeChartView {
            BoxPlotSeries {
              name: 'Income'
              BoxSet { label: 'Jan'; values: [3, 4, 5.1, 6.2, 8.5] }
              BoxSet { label: 'Feb'; values: [5, 6, 7.5, 8.6, 11.8] }
              BoxSet { label: 'Mar'; values: [3.2, 5, 5.7, 8, 9.2] }
              BoxSet { label: 'Apr'; values: [3.8, 5, 6.4, 7, 8] }
              BoxSet { label: 'May'; values: [4, 5, 5.2, 6, 7] }
            }
            BoxPlotSeries {
              name: 'Tax'
              BoxSet { label: 'Jan'; values: [1.2, 2.1, 3.2, 3.4, 5.5] }
              BoxSet { label: 'Feb'; values: [2, 2.2, 2.9, 3.6, 6.8] }
              BoxSet { label: 'Mar'; values: [1.2, 2.2, 2.7, 3.9, 5.2] }
              BoxSet { label: 'Apr'; values: [1.8, 2, 2.2, 3, 3.2] }
              BoxSet { label: 'May'; values: [2, 1.9, 2.2, 3, 4] }
            }
          }
          LargeChartView {
            CandlestickSeries {
              name: 'Acme Ltd.'
              increasingColor: 'green'
              decreasingColor: 'red'
              CandlestickSet { timestamp: 1435708800000; open: 690; high: 694; low: 599; close: 660 }
              CandlestickSet { timestamp: 1435795200000; open: 669; high: 669; low: 669; close: 669 }
              CandlestickSet { timestamp: 1436140800000; open: 485; high: 623; low: 485; close: 600 }
              CandlestickSet { timestamp: 1436227200000; open: 589; high: 615; low: 377; close: 569 }
              CandlestickSet { timestamp: 1436313600000; open: 464; high: 464; low: 254; close: 254 }
            }
          }
          PolarChartView {
            animationOptions: ChartView.SeriesAnimations
            legend.visible: false
            antialiasing: true
            theme: ChartView[qtquickChartsThemes.currentText]
            ValueAxis {
              id: axisAngular
              min: 0
              max: 20
              tickCount: 9
            }
            ValueAxis {
              id: axisRadial
              min: -0.5
              max: 1.5
            }
            SplineSeries {
              id: series1
              axisAngular: axisAngular
              axisRadial: axisRadial
              pointsVisible: true
            }
            ScatterSeries {
              id: series2
              axisAngular: axisAngular
              axisRadial: axisRadial
              markerSize: 10
            }
          }
          // Add data dynamically to the series
          Component.onCompleted: {
            for (var i = 0; i <= 20; i++) {
              series1.append(i, Math.random());
              series2.append(i, Math.random());
            }
          }
          LargeChartView {
            ScatterSeries {
              name: 'Scatter1'
              XYPoint { x: 0.51; y: 1.5 }
              XYPoint { x: 0.56; y: 1.6 }
              XYPoint { x: 0.57; y: 1.55 }
              XYPoint { x: 0.85; y: 1.8 }
              XYPoint { x: 0.96; y: 1.6 }
              XYPoint { x: 0.12; y: 1.3 }
              XYPoint { x: 0.52; y: 2.1 }
            }
            ScatterSeries {
              name: 'Scatter2'
              XYPoint { x: 0.4; y: 1.5 }
              XYPoint { x: 0.9; y: 1.6 }
              XYPoint { x: 0.7; y: 1.55 }
              XYPoint { x: 0.8; y: 1.8 }
              XYPoint { x: 0.5; y: 1.6 }
              XYPoint { x: 0.1; y: 1.3 }
              XYPoint { x: 0.6; y: 2.1 }
            }
          }
          LargeChartView {
            SplineSeries {
              name: 'BPM'
              XYPoint { x: 0; y: 0.0 }
              XYPoint { x: 1.1; y: 5.2 }
              XYPoint { x: 1.9; y: 2.4 }
              XYPoint { x: 2.1; y: 2.1 }
              XYPoint { x: 2.9; y: 2.6 }
              XYPoint { x: 3.4; y: 2.3 }
              XYPoint { x: 4.1; y: 3.1 }
            }
          }
          LargeChartView {
            PieSeries {
              PieSlice { label: 'eaten'; value: 74.7 }
              PieSlice { label: 'not yet eaten'; value: 5.1 }
              PieSlice { label: 'wut?'; value: 20.2; exploded: true }
            }
          }
        }
      }
      Popup {
        id: normalPopup
        ColumnLayout {
          anchors.fill: parent
          Label { text: 'Normal Popup' }
          CheckBox { text: 'E-mail' }
          CheckBox { text: 'Calendar' }
          CheckBox { text: 'Contacts' }
        }
      }
      Popup {
        id: modalPopup
        modal: true
        ColumnLayout {
          anchors.fill: parent
          Label { text: 'Modal Popup' }
          CheckBox { text: 'E-mail' }
          CheckBox { text: 'Calendar' }
          CheckBox { text: 'Contacts' }
        }
      }
      Dialog {
        id: dialog
        title: 'Dialog'
        Label { text: 'The standard dialog.' }
        footer: DialogButtonBox {
          standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
        }
      }
    }
  }
  footer: RowLayout {
    width: parent.width
    RowLayout {
      Layout.margins: 10
      Layout.alignment: Qt.AlignHCenter
      Label { text: 'QtQuick Charts Themes: ' }
      ComboBox {
        id: qtquickChartsThemes
        model: [
          'ChartThemeLight', 'ChartThemeBlueCerulean',
          'ChartThemeDark', 'ChartThemeBrownSand',
          'ChartThemeBlueNcs', 'ChartThemeHighContrast',
          'ChartThemeBlueIcy', 'ChartThemeQt'
        ]
        Layout.fillWidth: true
      }
    }
    RowLayout {
      Layout.margins: 10
      Layout.alignment: Qt.AlignHCenter
      Label { text: 'QtQuick 2 Themes: ' }
      Label {
        id: qtquick2Themes
        objectName: 'qtquick2Themes'
        Layout.fillWidth: true
      }
    }
    RowLayout {
      Layout.margins: 10
      Layout.alignment: Qt.AlignHCenter
      Label { text: 'Sub-Theme: ' }
      ComboBox {
        id: subTheme
        model: ['Light', 'Dark']
        Layout.fillWidth: true
        enabled: qtquick2Themes.text == 'Material' || qtquick2Themes.text == 'Universal'
      }
    }
    RowLayout {
      property var materialColors: [
        'Red', 'Pink', 'Purple', 'DeepPurple', 'Indigo', 'Blue',
        'LightBlue', 'Cyan', 'Teal', 'Green', 'LightGreen', 'Lime',
        'Yello', 'Amber', 'Orange', 'DeepOrange', 'Brown', 'Grey',
        'BlueGrey'
      ]
      property var universalColors: [
        'Lime', 'Green', 'Emerald', 'Teal', 'Cyan', 'Cobalt',
        'Indigo', 'Violet', 'Pink', 'Magenta', 'Crimson', 'Red',
        'Orange', 'Amber', 'Yellow', 'Brown', 'Olive', 'Steel', 'Mauve',
        'Taupe'
      ]
      Layout.margins: 10
      Layout.alignment: Qt.AlignHCenter
      Label { text: 'Colors: ' }
      Label { text: 'Accent' }
      ComboBox {
        id: accentColor
        Layout.fillWidth: true
        enabled: qtquick2Themes.text == 'Material' || qtquick2Themes.text == 'Universal'
        model: {
          if (qtquick2Themes.text == 'Universal') return parent.universalColors
          return parent.materialColors
        }
      }
      Label { text: 'Primary' }
      ComboBox {
        id: primaryColor
        Layout.fillWidth: true
        enabled: qtquick2Themes.text == 'Material'
        model: parent.materialColors
      }
    }
  }
}