//
//  AreaChartDoubleView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI
import Charts


struct AreaChart: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
    var type: String
}

struct AreaChartDoubleView: View {
    let data: [AreaChart] = [
        AreaChart(mount: "jan/22", value: 5, type: "A"),
        AreaChart(mount: "feb/22", value: 4, type: "A"),
        AreaChart(mount: "mar/22", value: 7, type: "A"),
        AreaChart(mount: "apr/22", value: 15, type: "A"),
        AreaChart(mount: "may/22", value: 14, type: "A"),
        AreaChart(mount: "jun/22", value: 27, type: "A"),
        AreaChart(mount: "jul/22", value: 27, type: "A"),
        
        AreaChart(mount: "jan/22", value: 15, type: "B"),
        AreaChart(mount: "feb/22", value: 14, type: "B"),
        AreaChart(mount: "mar/22", value: 88, type: "B"),
        AreaChart(mount: "apr/22", value: 77, type: "B"),
        AreaChart(mount: "may/22", value: 3, type: "B"),
        AreaChart(mount: "jun/22", value: 37, type: "B"),
        AreaChart(mount: "jul/22", value: 49, type: "B")
    ]
        
    var body: some View {
        List {
            Chart {
                ForEach(data) {
                    AreaMark(
                        x: .value("Mount", $0.mount),
                        y: .value("Value", $0.value)
                    )
                    .foregroundStyle(by: .value("Type", "Series \($0.type)"))
                }
            }
            .frame(height: 250)
        }
    }
}
