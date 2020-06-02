//
//  PedestrianLights.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 02/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import UIKit

enum PedestrianLights: Int, CaseIterable {
    
    case green
    case red
    
    init(_ index: Int) {
        guard let caseValue = PedestrianLights(rawValue: index) else { fatalError() }
        self = caseValue
    }
    
}

extension PedestrianLights: LightViewUsable {
    
    var color: UIColor {
        switch self {
        case .green: return .systemGreen
        case .red: return .systemRed
        }
    }
    
    var description: String {
        switch self {
        case .green: return "Walk"
        case .red: return "Don't walk"
        }
    }
    
}
