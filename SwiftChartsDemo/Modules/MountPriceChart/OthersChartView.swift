//
//  MountPriceChartView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI
import Charts

struct MountPrice: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
}

struct Amount: Identifiable {
    var month: String
    var amount: Double
    var id = UUID()
    var color: String
}

struct OthersChartView: View {
    let data: [MountPrice] = [
        MountPrice(mount: "jan", value: 5),
        MountPrice(mount: "feb", value: 4),
        MountPrice(mount: "mar", value: 7),
        MountPrice(mount: "apr", value: 15),
        MountPrice(mount: "may", value: 23),
        MountPrice(mount: "jun", value: 6),
        MountPrice(mount: "jul", value: 27)
    ]
    
    let data2: [AreaChart] = [
        AreaChart(mount: "jan/22", value: 5, type: "A"),
        AreaChart(mount: "feb/22", value: 4, type: "A"),
        AreaChart(mount: "mar/22", value: 7, type: "A"),
        AreaChart(mount: "apr/22", value: 15, type: "A"),
        AreaChart(mount: "may/22", value: 14, type: "A"),
        AreaChart(mount: "jun/22", value: 27, type: "A"),
        AreaChart(mount: "jul/22", value: 27, type: "A"),
        
        AreaChart(mount: "jan/22", value: 15, type: "B"),
        AreaChart(mount: "feb/22", value: 14, type: "B"),
        AreaChart(mount: "mar/22", value: 17, type: "B"),
        AreaChart(mount: "apr/22", value: 25, type: "B"),
        AreaChart(mount: "may/22", value: 24, type: "B"),
        AreaChart(mount: "jun/22", value: 37, type: "B"),
        AreaChart(mount: "jul/22", value: 49, type: "B"),
        
        AreaChart(mount: "jan/22", value: 2, type: "C"),
        AreaChart(mount: "feb/22", value: 3, type: "C"),
        AreaChart(mount: "mar/22", value: 4, type: "C"),
        AreaChart(mount: "apr/22", value: 64, type: "C"),
        AreaChart(mount: "may/22", value: 43, type: "C"),
        AreaChart(mount: "jun/22", value: 37, type: "C"),
        AreaChart(mount: "jul/22", value: 29, type: "C")
    ]
    
    var data3: [Amount] = [
        .init(month: "March", amount: 55.00, color: "Kék"),
        .init(month: "April", amount: 170.00, color: "Zöld"),
        .init(month: "May", amount: 120.00, color: "Sárga")
    ]
    
    var body: some View {
        List {
            Chart(data) {
                LineMark(
                    x: .value("Mount", $0.mount),
                    y: .value("Value", $0.value)
                )
                PointMark(
                    x: .value("Mount", $0.mount),
                    y: .value("Value", $0.value)
                )
            }
            .frame(height: 250)
            
            Chart {
                ForEach(data2) {
                    AreaMark(
                        x: .value("Mount", $0.mount),
                        y: .value("Value", $0.value)
                    )
                    .foregroundStyle(by: .value("Type", "Series \($0.type)"))
                }
            }
            .frame(height: 250)
            
            Chart {
                RectangleMark(
                    x: .value("Mount", "01"),
                    y: .value("Value", 1)
                )
                RectangleMark(
                    x: .value("Mount", "02"),
                    y: .value("Value", 3)
                )
                RectangleMark(
                    x: .value("Mount", "03"),
                    y: .value("Value", 7)
                )
                RectangleMark(
                    x: .value("Mount", "04"),
                    y: .value("Value", 2)
                )
                RectangleMark(
                    x: .value("Mount", "04"),
                    y: .value("Value", 4)
                )
                RectangleMark(
                    x: .value("Mount", "04"),
                    y: .value("Value", 9)
                )
                RectangleMark(
                    x: .value("Mount", "05"),
                    y: .value("Value", 9)
                )
            }
            .frame(height: 250)
            
            Chart {
                BarMark(
                    x: .value("Mount", "Január"),
                    y: .value("Value", 2)
                )
                .cornerRadius(10.0)
                
                BarMark(
                    x: .value("Mount", "Február"),
                    y: .value("Value", 9)
                )
                .cornerRadius(10.0)
                
                BarMark(
                    x: .value("Mount", "Március"),
                    y: .value("Value", 7)
                )
                .cornerRadius(10.0)
                
                BarMark(
                    x: .value("Mount", "Április"),
                    y: .value("Value", 3)
                )
                .cornerRadius(10.0)
                
                BarMark(
                    x: .value("Mount", "Május"),
                    y: .value("Value", 4)
                )
                .cornerRadius(10.0)
                
                BarMark(
                    x: .value("Mount", "Június"),
                    y: .value("Value", 7)
                )
                .cornerRadius(10.0)
                
                BarMark(
                    x: .value("Mount", "Július"),
                    y: .value("Value", 9.5)
                )
                .cornerRadius(10.0)
            }
            .frame(height: 250)
            
            Chart {
                ForEach(data3) { item in
                    BarMark(
                        x: .value("Month", item.month),
                        y: .value("Total", item.amount)
                    )
                    .foregroundStyle(by: .value("Month Color", item.color))
                }
            }
            .frame(height: 250)
            
            Chart {
                RuleMark(
                    xStart: .value("Start", 1),
                    xEnd: .value("End", 3),
                    y: .value("Value", 5)
                )
                RuleMark(
                    xStart: .value("Start", 1),
                    xEnd: .value("End", 15),
                    y: .value("Value", 5.5)
                )
                RuleMark(
                    xStart: .value("Start", 1),
                    xEnd: .value("End", 7),
                    y: .value("Value", 5.5)
                )
                RuleMark(
                    xStart: .value("Start", 9),
                    xEnd: .value("End", 22),
                    y: .value("Value", 1.5)
                )
                RuleMark(
                    xStart: .value("Start", 9),
                    xEnd: .value("End", 12),
                    y: .value("Value", 7)
                )
                RuleMark(
                    xStart: .value("Start", 3),
                    xEnd: .value("End", 10),
                    y: .value("Value", 4)
                )
                RuleMark(
                    xStart: .value("Start", 3.5),
                    xEnd: .value("End", 19),
                    y: .value("Value", 0.5)
                )
            }
            .frame(height: 250)
            .cornerRadius(35.0)
        }
    }
}

// MARK: - Preview -

struct MultipleChartsView_Previews: PreviewProvider {
    static var previews: some View {
        OthersChartView()
    }
}
