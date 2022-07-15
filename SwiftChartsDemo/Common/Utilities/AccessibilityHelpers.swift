//
//  AccessibilityHelpers.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 13..
//

import SwiftUI

enum AccessibilityHelpers {
    // TODO: This should be a protocol but since the data objects are in flux this will suffice
    static func chartDescriptor(forSalesSeries data: [SingleLineSale],
                                saleThreshold: Double? = nil,
                                isContinuous: Bool = false) -> AXChartDescriptor {
        
        // Since we're measuring a tangible quantity,
        // keeping an independant minimum prevents visual scaling in the Rotor Chart Details View
        let min = 0 // data.map(\.sales).min() ??
        let max = data.map(\.sales).max() ?? 0
        
        // A closure that takes a date and converts it to a label for axes
        let dateTupleStringConverter: ((SingleLineSale) -> (String)) = { dataPoint in
            
            let dateDescription = dataPoint.day.formatted(date: .complete, time: .omitted)
            
            if let threshold = saleThreshold {
                let isAbove = dataPoint.isAbove(threshold: threshold)
                
                return "\(dateDescription): \(isAbove ? "Above" : "Below") threshold"
            }
            
            return dateDescription
        }
        
        let xAxis = AXNumericDataAxisDescriptor(
            title: "Date index",
            range: Double(0)...Double(data.count),
            gridlinePositions: []
        ) { "Day \(Int($0) + 1)" }
        
        let yAxis = AXNumericDataAxisDescriptor(
            title: "Sales",
            range: Double(min)...Double(max),
            gridlinePositions: []
        ) { value in "\(Int(value)) sold" }
        
        let series = AXDataSeriesDescriptor(
            name: "Daily sale quantity",
            isContinuous: isContinuous,
            dataPoints: data.enumerated().map { (idx, point) in
                    .init(x: Double(idx),
                          y: Double(point.sales),
                          label: dateTupleStringConverter(point))
            }
        )
        
        return AXChartDescriptor(
            title: "Sales per day",
            summary: nil,
            xAxis: xAxis,
            yAxis: yAxis,
            additionalAxes: [],
            series: [series]
        )
    }
}

extension SingleLineSale {
    func isAbove(threshold: Double) -> Bool {
        self.sales > Int(threshold)
    }
}
