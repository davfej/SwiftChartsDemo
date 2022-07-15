//
//  AreaChartView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI
import Charts

// MARK: - View
struct AreaChartView: View {
    // MARK: Properties
    private let chartData = ChartData.areaChartData
    
    // MARK: Body
    var body: some View {
        VStack {
            GroupBox("") {
                Chart(chartData) { consumption in
                    AreaMark(
                        x: .value("", consumption.date, unit: .second),
                        y: .value("Value", consumption.monthlyMaxMegawatt)
                    )
                }
                .padding(.horizontal)
            }
            .backgroundStyle(Color.white)
        }
        .navigationTitle("Area Chart")
    }
}

// MARK: - Preview
struct AreaChartView_Previews: PreviewProvider {
    static var previews: some View {
        AreaChartView()
    }
}
