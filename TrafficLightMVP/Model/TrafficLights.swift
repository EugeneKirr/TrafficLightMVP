//
//  TrafficLights.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

enum TrafficLights: Int, CaseIterable {
    
    case green
    case yellow
    case red
    
    init(_ index: Int) {
        guard let caseValue = TrafficLights(rawValue: index) else { fatalError() }
        self = caseValue
    }
}

extension TrafficLights {
    
    var color: UIColor {
        switch self {
        case .green: return .systemGreen
        case .yellow: return .systemYellow
        case .red: return .systemRed
        }
    }
    
    var description: String {
        switch self {
        case .green: return "Go Ahead"
        case .yellow: return "Warning"
        case .red: return "Stop"
        }
    }
    
}
