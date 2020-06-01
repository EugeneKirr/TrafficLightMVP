//
//  TrafficLightManager.swift
//  TrafficLightMVP
//
//  Created by Eugene Kireichev on 01/06/2020.
//  Copyright © 2020 Eugene Kireichev. All rights reserved.
//

import Foundation

class TrafficLightManager {
    
    func getTrafficLight(for index: Int) -> TrafficLights{
        return TrafficLights(index)
    }
    
}
