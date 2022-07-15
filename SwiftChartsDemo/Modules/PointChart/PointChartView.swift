//
//  PointChartView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI
import Charts

// MARK: - View
struct PointChartView: View {
    
    // MARK: Properties
    private let chartData = ChartData.pointChartData
    
    // MARK: Body
    var body: some View {
        VStack {
            GroupBox("") {
                Chart(chartData) { person in
                    PointMark(
                        x: .value("Time", person.heartBeat.time, unit: .minute),
                        y: .value("Beat", person.heartBeat.beat)
                    )
                    .foregroundStyle(by: .value("Beat", person.heartBeat.beat))
                }
                .padding(.horizontal, 16)
            }
            .backgroundStyle(Color.white)
        }
        .navigationTitle("Point Chart")
    }
}

// MARK: - Preview
struct PointChartView_Previews: PreviewProvider {
    static var previews: some View {
        PointChartView()
    }
}

