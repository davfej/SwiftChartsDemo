//
//  BarChartView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI
import Charts

// MARK: - View
struct BarChartView: View {
    // MARK: Properties
    private let chartData = ChartData.barChartData
    
    // MARK: Body
    var body: some View {
        VStack {
            GroupBox("") {
                Chart(chartData) { data in
                    BarMark(
                        x: .value("A", data.count),
                        y: .value("B", data.date, unit: .month)
                    )
                    .foregroundStyle(by: .value("BarMark", data.count))
                }.padding(.horizontal, 15)
            }
            .backgroundStyle(Color.white)
        }
        .navigationTitle("Bar Chart")
    }
}

// MARK: - Preview
struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}

