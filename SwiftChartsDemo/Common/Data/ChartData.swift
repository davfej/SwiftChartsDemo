//
//  ChartData.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI

struct ChartData {
    private static let minute: TimeInterval = 60
    private static let hour = minute * 60
    private static let day = hour * 24
    private static let week = day * 7
    private static let month = week * 4
    private static let sixMonth = week * 26
    private static let year = sixMonth * 2
    
    static var pointChartData: [Person] {
        var data: [Person] = []
        var time = Date.now
        
        for _ in 1..<50 {
            data.append(.init(
                id: .init(Person.self),
                heartBeat: .init(beat: Int.random(in: 45...135), time: time))
            )
            
            time = time + day
        }
        
        return data
    }
    
    static var lineChartData: [Sale] {
        var sales: [Sale] = []
        
        for i in 1..<20 {
            sales.append(
                .init(id: .init(Sale.self), date: .now.addingTimeInterval(Double(i) * day), count: Int.random(in: 0...100))
            )
        }
        
        return sales
    }
    
    static var barChartData: [Production] {
        var productions: [Production] = []
        
        for i in 1..<13 {
            productions.append(
                .init(id: .init(Production.self), date: .now.addingTimeInterval(Double(i) * month), count: i * Int.random(in: 20...100))
            )
        }
        
        return productions
    }
    
    static var areaChartData: [EnergyConsumption] {
        var consumptions: [EnergyConsumption] = []
        
        for i in 1..<8 {
            consumptions.append(
                .init(
                    id: .init(EnergyConsumption.self),
                    date: .now.addingTimeInterval(Double(i) * month),
                    monthlyMaxMegawatt: Double.random(in: 1...5),
                    monthlyMinMegawatt: Double(i) * Double.random(in: 15...20)
                )
            )
        }
        
        return consumptions
    }
}

func date(year: Int, month: Int, day: Int = 1, hour: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day, hour: hour, minute: minutes, second: seconds)) ?? Date()
}

enum SalesData {
    static let last30Days = [
        (day: date(year: 2022, month: 5, day: 8), sales: 168),
        (day: date(year: 2022, month: 5, day: 9), sales: 117),
        (day: date(year: 2022, month: 5, day: 10), sales: 106),
        (day: date(year: 2022, month: 5, day: 11), sales: 119),
        (day: date(year: 2022, month: 5, day: 12), sales: 109),
        (day: date(year: 2022, month: 5, day: 13), sales: 104),
        (day: date(year: 2022, month: 5, day: 14), sales: 196),
        (day: date(year: 2022, month: 5, day: 15), sales: 172),
        (day: date(year: 2022, month: 5, day: 16), sales: 122),
        (day: date(year: 2022, month: 5, day: 17), sales: 115),
        (day: date(year: 2022, month: 5, day: 18), sales: 138),
        (day: date(year: 2022, month: 5, day: 19), sales: 110),
        (day: date(year: 2022, month: 5, day: 20), sales: 106),
        (day: date(year: 2022, month: 5, day: 21), sales: 187),
        (day: date(year: 2022, month: 5, day: 22), sales: 187),
        (day: date(year: 2022, month: 5, day: 23), sales: 119),
        (day: date(year: 2022, month: 5, day: 24), sales: 160),
        (day: date(year: 2022, month: 5, day: 25), sales: 144),
        (day: date(year: 2022, month: 5, day: 26), sales: 152),
        (day: date(year: 2022, month: 5, day: 27), sales: 148),
        (day: date(year: 2022, month: 5, day: 28), sales: 240),
        (day: date(year: 2022, month: 5, day: 29), sales: 242),
        (day: date(year: 2022, month: 5, day: 30), sales: 173),
        (day: date(year: 2022, month: 5, day: 31), sales: 143),
        (day: date(year: 2022, month: 6, day: 1), sales: 137),
        (day: date(year: 2022, month: 6, day: 2), sales: 123),
        (day: date(year: 2022, month: 6, day: 3), sales: 146),
        (day: date(year: 2022, month: 6, day: 4), sales: 214),
        (day: date(year: 2022, month: 6, day: 5), sales: 250),
        (day: date(year: 2022, month: 6, day: 6), sales: 146)
    ].map { SingleLineSale(day: $0.day, sales: $0.sales) }

    static var last30DaysTotal: Int {
        last30Days.map { $0.sales }.reduce(0, +)
    }

    static var last30DaysAverage: Double {
        Double(last30DaysTotal / last30Days.count)
    }

    static let last12Months = [
        (month: date(year: 2021, month: 7), sales: 3952, dailyAverage: 127, dailyMin: 95, dailyMax: 194),
        (month: date(year: 2021, month: 8), sales: 4044, dailyAverage: 130, dailyMin: 96, dailyMax: 189),
        (month: date(year: 2021, month: 9), sales: 3930, dailyAverage: 131, dailyMin: 101, dailyMax: 184),
        (month: date(year: 2021, month: 10), sales: 4217, dailyAverage: 136, dailyMin: 96, dailyMax: 193),
        (month: date(year: 2021, month: 11), sales: 4006, dailyAverage: 134, dailyMin: 104, dailyMax: 202),
        (month: date(year: 2021, month: 12), sales: 3994, dailyAverage: 129, dailyMin: 96, dailyMax: 190),
        (month: date(year: 2022, month: 1), sales: 4202, dailyAverage: 136, dailyMin: 96, dailyMax: 203),
        (month: date(year: 2022, month: 2), sales: 3749, dailyAverage: 134, dailyMin: 98, dailyMax: 200),
        (month: date(year: 2022, month: 3), sales: 4329, dailyAverage: 140, dailyMin: 104, dailyMax: 218),
        (month: date(year: 2022, month: 4), sales: 4084, dailyAverage: 136, dailyMin: 93, dailyMax: 221),
        (month: date(year: 2022, month: 5), sales: 4559, dailyAverage: 147, dailyMin: 104, dailyMax: 242),
        (month: date(year: 2022, month: 6), sales: 1023, dailyAverage: 170, dailyMin: 120, dailyMax: 250)
    ]

    static var last12MonthsTotal: Int {
        last12Months.map { $0.sales }.reduce(0, +)
    }

    static var last12MonthsDailyAverage: Int {
        last12Months.map { $0.dailyAverage }.reduce(0, +) / last12Months.count
    }
}

enum Constants {
    static let previewChartHeight: CGFloat = 100
    static let detailChartHeight: CGFloat = 300
}

struct Point: Hashable, Identifiable {
    let id = UUID()
    let x: Double
    let y: Double
    let val: Double

    func angle(degreeOffset: Double, inRadians: Bool = true) -> Double {
        // around 180-360 range
        let degrees = (val / 100.0) * 180.0 + 180 + degreeOffset
        let radians = (degrees * .pi) / 180.0
        return inRadians ? radians : degrees
    }

    func angleColor(hueOffset: Double) -> Color {
        Color(hue: ((val / 100.0) * 360.0 + hueOffset)/360.0, saturation: 1, brightness: 1)
    }
}

extension Array where Element == Point {
    static func createLineSinPoints(xRange: Range<Int> = 0..<100, randomRange: ClosedRange<Int> = -5...5) -> [Point] {
        stride(from: xRange.lowerBound, through: xRange.upperBound, by: 1).map {
            Point(x: Double($0),
                  y: sin(Double($0) * 0.2) * 100 + Double(Int.random(in: randomRange)),
                  val: 1)
        }
    }

    static func createPlotSinPoints(xRange: Range<Int> = 0..<100, yRange: Range<Int> = 0..<10, randomRange: ClosedRange<Int> = -25...25) -> [Point] {
        var points = [Point]()
        for x in xRange {
            for _ in yRange {
                points.append(Point(x: Double(x),
                                    y: sin(Double(x) * 0.2) * 100 + Double(Int.random(in: randomRange)),
                                    val: 0.2))
            }
        }
        return points
    }
}

enum WeatherData {
    static let hourlyUVIndex: [(date: Date, uvIndex: Int)] = [
        (.startOfDay.addingTimeInterval(3600*0), 0),
        (.startOfDay.addingTimeInterval(3600*1), 0),
        (.startOfDay.addingTimeInterval(3600*2), 0),
        (.startOfDay.addingTimeInterval(3600*3), 0),
        (.startOfDay.addingTimeInterval(3600*4), 0),
        (.startOfDay.addingTimeInterval(3600*5), 0),
        (.startOfDay.addingTimeInterval(3600*6), 0),
        (.startOfDay.addingTimeInterval(3600*7), 1),
        (.startOfDay.addingTimeInterval(3600*8), 4),
        (.startOfDay.addingTimeInterval(3600*9), 6),
        (.startOfDay.addingTimeInterval(3600*10), 9),
        (.startOfDay.addingTimeInterval(3600*11), 12),
        (.startOfDay.addingTimeInterval(3600*12), 12),
        (.startOfDay.addingTimeInterval(3600*13), 11),
        (.startOfDay.addingTimeInterval(3600*14), 9),
        (.startOfDay.addingTimeInterval(3600*15), 6),
        (.startOfDay.addingTimeInterval(3600*16), 3),
        (.startOfDay.addingTimeInterval(3600*17), 1),
        (.startOfDay.addingTimeInterval(3600*18), 0),
        (.startOfDay.addingTimeInterval(3600*19), 0),
        (.startOfDay.addingTimeInterval(3600*20), 0),
        (.startOfDay.addingTimeInterval(3600*21), 0),
        (.startOfDay.addingTimeInterval(3600*22), 0),
        (.startOfDay.addingTimeInterval(3600*23), 0)
    ]
}

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: .now)
    }
}

extension Date {
    func nearestHour() -> Date? {
        var components = NSCalendar.current.dateComponents([.minute, .second, .nanosecond], from: self)
        let minute = components.minute ?? 0
        let second = components.second ?? 0
        let nanosecond = components.nanosecond ?? 0
        components.minute = minute >= 30 ? 60 - minute : -minute
        components.second = -second
        components.nanosecond = -nanosecond
        return Calendar.current.date(byAdding: components, to: self)
    }
}
