//
//  ContentView.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import SwiftUI
import Charts

enum BasicChartType: Int {
    case area = 0
    case bar = 1
    case line = 2
    case point = 3
    case mixed = 4
}

enum InteractiveChartType: Int {
    case singleLine = 0
    case soundBar = 1
    case linePlot = 2
    case gradientLine = 3
    case vectorField = 4
    case heatMap = 5
}

enum OtherChartType: Int {
    case others = 0
}

// MARK: - View -

struct DashboardView: View {
    
    // MARK: - Properties -
    
    @State private var selectedChartType: BasicChartType = .area
    @State private var basicChartList = [
        "Area Chart",
        "Bar Chart",
        "Line Chart",
        "Point Chart",
        "Mixed Chart"
    ]
    @State private var interactiveChartList = [
        "Single Line Chart",
        "Sound Bar Chart",
        "Line Plot Chart",
        "Gradient Line Chart",
        "Vector Field Chart",
        "Heat Map Chart"
    ]
    @State private var otherChartList = [
        "Other Charts"
    ]
    
    // MARK: - Body -
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Basic Chart Types")) {
                        ForEach(basicChartList.indices) { index in
                            NavigationLink {
                                if let chartType = BasicChartType(rawValue: index) {
                                    switch chartType {
                                    case .area:
                                        AreaChartView()
                                    case .bar:
                                        BarChartView()
                                    case .line:
                                        LineChartView()
                                    case .point:
                                        PointChartView()
                                    case .mixed:
                                        MixedChartView()
                                    }
                                }
                            } label: {
                                Text(basicChartList[index])
                            }
                        }
                    }
                    
                    Section(header: Text("Interactive Chart Types")) {
                        ForEach(interactiveChartList.indices) { index in
                            NavigationLink {
                                if let chartType = InteractiveChartType(rawValue: index) {
                                    switch chartType {
                                    case .singleLine:
                                        SingleLine(isOverview: false)
                                    case .soundBar:
                                        SoundBars(isOverview: false)
                                    case .linePlot:
                                        LinePlot(isOverview: false)
                                    case .gradientLine:
                                        GradientLine(isOverview: false)
                                    case .vectorField:
                                        VectorField(isOverview: false)
                                    case .heatMap:
                                        HeatMap(isOverview: false)
                                    }
                                }
                            } label: {
                                Text(interactiveChartList[index])
                            }
                        }
                    }
                    
                    Section(header: Text("Other Chart Types")) {
                        ForEach(otherChartList.indices) { index in
                            NavigationLink {
                                if let chartType = OtherChartType(rawValue: index) {
                                    switch chartType {
                                    case .others:
                                        OthersChartView()
                                    }
                                }
                            } label: {
                                Text(otherChartList[index])
                            }
                        }
                    }
                    
                }
                .foregroundColor(.black)
                .navigationTitle("InfoDays 📊")
                .listStyle(.insetGrouped)
            }
        }
    }
}

struct Dashboardiew_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
