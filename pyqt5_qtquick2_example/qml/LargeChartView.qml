import QtCharts 2.2

ChartView {
  animationOptions: ChartView.SeriesAnimations
  antialiasing: true
  margins.top: 0
  margins.bottom: 0
  margins.left: 0
  margins.right: 0
  theme: ChartView[qtquickChartsThemes.currentText]
}
