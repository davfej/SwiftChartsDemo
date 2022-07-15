//
//  EnergyConsumption.swift
//  SwiftChartsDemo
//
//  Created by Dávid Fejes on 2022. 07. 12..
//

import Foundation

struct EnergyConsumption: Identifiable {
    let id: ObjectIdentifier
    let date: Date
    let monthlyMaxMegawatt: Double
    let monthlyMinMegawatt: Double
}


