//
//  LineChartView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI
import Charts

// MARK: - View -

struct LineChartView: View {
    
    // MARK: - Properties -
    
    private let chartData = ChartData.lineChartData
    
    // MARK: - Body -
    
    var body: some View {
        VStack {
            GroupBox("") {
                Chart(chartData) { sale in
                    LineMark(
                        x: .value("Weekday", sale.date, unit: .hour),
                        y: .value("Count", sale.count)
                    )
                    .interpolationMethod(.cardinal(tension: 1))
                    .symbol(Circle().strokeBorder(lineWidth: 2))
                }
                .padding(.horizontal, 16)
            }
            .backgroundStyle(Color.white)
        }
        .navigationTitle("Line Chart")
    }
}

// MARK: - Preview
struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}

