//
//  MixedChartView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI
import Charts

// MARK: - View
struct MixedChartView: View {
    
    // MARK: Properties
    private let lineChartData = ChartData.lineChartData
    private let pointChartData = ChartData.pointChartData
    
    // MARK: Body
    var body: some View {
        VStack {
            GroupBox("") {
                Chart {
                    ForEach(lineChartData) { sale in
                        LineMark(
                            x: .value("Weekday", sale.date, unit: .minute),
                            y: .value("Count", sale.count)
                        )
                        .interpolationMethod(.cardinal)
                    }
                    .foregroundStyle(.red)
                    
                    ForEach(pointChartData) { person in
                        PointMark(
                            x: .value("Time", person.heartBeat.time, unit: .minute),
                            y: .value("Heart Beat", person.heartBeat.beat)
                        )
                        .foregroundStyle(by: .value("Heart Beat", person.heartBeat.beat))
                    }
                    
                }
                .padding(.horizontal, 16)
            }
            .backgroundStyle(Color.white)
        }
        .navigationTitle("Bar Chart")
    }
}

// MARK: - Preview
struct MixedChartView_Previews: PreviewProvider {
    static var previews: some View {
        MixedChartView()
    }
}
