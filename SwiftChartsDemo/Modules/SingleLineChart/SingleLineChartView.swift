//
//  SingleLineChartView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 13..
//

import SwiftUI
import Charts

struct SingleLineSale {
    let day: Date
    var sales: Int
}

struct SingleLine: View {
    var isOverview: Bool

    @State var data: [SingleLineSale]
    @State private var lineWidth = 2.0
    @State private var interpolationMethod: ChartInterpolationMethod = .cardinal
    @State private var chartColor: Color = .blue
    @State private var showSymbols = false

    init(isOverview: Bool) {
        self.isOverview = isOverview
        self.data = SalesData.last30Days
    }

    var body: some View {
        if isOverview {
            chart
                .allowsHitTesting(false)
        } else {
            List {
                Section {
                    chart
                }

                customisation
            }
            .navigationBarTitle("Single Line Chart", displayMode: .inline)
        }
    }

    private var chart: some View {
        Chart(data, id: \.day) {
            LineMark(
                x: .value("Date", $0.day),
                y: .value("Sales", $0.sales)
            )
            .lineStyle(StrokeStyle(lineWidth: lineWidth))
            .foregroundStyle(chartColor.gradient)
            .interpolationMethod(interpolationMethod.mode)
            .symbol(Circle().strokeBorder(lineWidth: lineWidth))
            .symbolSize(showSymbols ? 60 : 0)
        }
        // LineMarks do not seem to verbalize accessibilityLabel/Value as of Beta 2
        // Using a representation fixes the above, keeping screen coordinates
        .accessibilityRepresentation {
            Chart(data, id: \.day) { dataPoint in
                Plot {
                    PointMark(
                        x: .value("Date", dataPoint.day),
                        y: .value("Sales", dataPoint.sales)
                    )
                }
                .accessibilityLabel(dataPoint.day.formatted(date: .complete, time: .omitted))
                .accessibilityValue("\(dataPoint.sales) sold")
                .accessibilityHidden(isOverview)
            }
        }
        .accessibilityChartDescriptor(self)
        .chartYAxis(isOverview ? .hidden : .automatic)
        .chartXAxis(isOverview ? .hidden : .automatic)
        .frame(height: isOverview ? Constants.previewChartHeight : Constants.detailChartHeight)
        .onAppear {
            for index in data.indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.02) {
                    withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)) {
                        data[index].sales = SalesData.last30Days[index].sales
                    }
                }
            }
        }
    }

    private var customisation: some View {
        Section {
            VStack(alignment: .leading) {
                Text("Line Width: \(lineWidth, specifier: "%.1f")")
                Slider(value: $lineWidth, in: 1...20) {
                    Text("Line Width")
                } minimumValueLabel: {
                    Text("1")
                } maximumValueLabel: {
                    Text("20")
                }
            }

            Picker("Interpolation Method", selection: $interpolationMethod) {
                ForEach(ChartInterpolationMethod.allCases) { Text($0.mode.description).tag($0) }
            }

            ColorPicker("Color Picker", selection: $chartColor)

            Toggle("Show Symbols", isOn: $showSymbols)
        }
    }
}

// MARK: - Accessibility

extension SingleLine: AXChartDescriptorRepresentable {
    func makeChartDescriptor() -> AXChartDescriptor {
        AccessibilityHelpers.chartDescriptor(forSalesSeries: data, isContinuous: true)
    }
}

// MARK: - Preview

struct SingleLine_Previews: PreviewProvider {
    static var previews: some View {
        SingleLine(isOverview: true)
        SingleLine(isOverview: false)
    }
}

